---
title: "Optimizing API usage"
description: "Best practices for efficient API usage, including caching, batch operations, and performance considerations."
tags: ["optimization", "performance"]
categories: ["advanced"]
importance: 5
parent: "Advanced Topics" 
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 20, 2025"
nav_order: "1"
layout: "default"
version: "v1.0.0"
lastUpdated: "May 20, 2025"
---

# Optimizing API usage

This guide covers best practices for optimizing your use of the Task Management API, helping you create responsive, efficient applications while minimizing server load.

## Understanding API performance factors

Several factors can affect API performance:

1. **Network latency**: The time it takes for data to travel between the client and server
2. **Server processing time**: How long the server takes to process the request
3. **Payload size**: The amount of data transferred in requests and responses
4. **Request frequency**: How often your application makes API calls
5. **Concurrency**: How many simultaneous requests your application makes

Optimization strategies target one or more of these factors.

## Client-side caching

Implementing client-side caching can significantly reduce the number of API requests and improve application responsiveness.

### What to cache

- User data that changes infrequently
- Task lists that don't need real-time updates
- Reference data (e.g., task status values)

### Caching implementation

Here's a simple example of implementing a basic cache in JavaScript:

```javascript
// Simple cache implementation
class ApiCache {
  constructor(ttlInSeconds = 300) {
    this.cache = {};
    this.ttl = ttlInSeconds * 1000; // Convert to milliseconds
  }
  
  set(key, value) {
    this.cache[key] = {
      value,
      timestamp: Date.now()
    };
  }
  
  get(key) {
    const item = this.cache[key];
    if (!item) return null;
    
    // Check if item has expired
    if (Date.now() - item.timestamp > this.ttl) {
      delete this.cache[key];
      return null;
    }
    
    return item.value;
  }
  
  invalidate(key) {
    delete this.cache[key];
  }
  
  clear() {
    this.cache = {};
  }
}

// Usage with the API
const apiCache = new ApiCache(300); // 5-minute cache

async function getUser(userId) {
  const cacheKey = `user-${userId}`;
  
  // Check cache first
  const cachedUser = apiCache.get(cacheKey);
  if (cachedUser) {
    console.log('User data retrieved from cache');
    return cachedUser;
  }
  
  // If not in cache, fetch from API
  const response = await fetch(`http://localhost:3000/users/${userId}`, {
    headers: {
      'Authorization': 'Bearer your-token-here'
    }
  });
  
  if (!response.ok) {
    throw new Error(`Failed to fetch user: ${response.status}`);
  }
  
  const userData = await response.json();
  
  // Store in cache
  apiCache.set(cacheKey, userData);
  
  return userData;
}

// Invalidate cache when user is updated
async function updateUser(userId, updates) {
  const response = await fetch(`http://localhost:3000/users/${userId}`, {
    method: 'PATCH',
    headers: {
      'Authorization': 'Bearer your-token-here',
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(updates)
  });
  
  if (!response.ok) {
    throw new Error(`Failed to update user: ${response.status}`);
  }
  
  const updatedUser = await response.json();
  
  // Invalidate cache after update
  apiCache.invalidate(`user-${userId}`);
  
  return updatedUser;
}
```

### Cache invalidation strategies

To ensure users see the most current data, implement these cache invalidation strategies:

1. **Time-based expiration**: Set an appropriate TTL (time to live) for cached items
2. **Write-through invalidation**: Invalidate cached items when they are modified
3. **Bulk invalidation**: Clear related cache entries when performing batch operations

## Efficient pagination

Proper use of pagination is essential for handling large datasets efficiently.

### Pagination best practices

1. **Use reasonable page sizes**: Request 10-50 items per page for most use cases
2. **Implement cursor-based pagination in UIs**: Only load the next page when needed (e.g., "Load more" button or infinite scroll)
3. **Pre-fetch next page**: For better perceived performance, fetch the next page before the user requests it
4. **Cache paginated results**: Store previous pages to reduce redundant requests

### Implementation example

```javascript
// Paginated task list with caching
class TaskList {
  constructor(pageSize = 20, token) {
    this.pageSize = pageSize;
    this.token = token;
    this.currentPage = 0;
    this.cache = {};
    this.hasMorePages = true;
  }
  
  async getPage(page) {
    // Check cache first
    if (this.cache[page]) {
      return this.cache[page];
    }
    
    const url = `http://localhost:3000/tasks?_page=${page}&_perPage=${this.pageSize}`;
    const response = await fetch(url, {
      headers: {
        'Authorization': `Bearer ${this.token}`
      }
    });
    
    if (!response.ok) {
      throw new Error(`Failed to fetch tasks: ${response.status}`);
    }
    
    const data = await response.json();
    const tasks = data.tasks;
    
    // Update hasMorePages flag
    this.hasMorePages = tasks.length === this.pageSize;
    
    // Cache the result
    this.cache[page] = tasks;
    
    return tasks;
  }
  
  async getNextPage() {
    if (!this.hasMorePages) {
      return [];
    }
    
    const tasks = await this.getPage(this.currentPage);
    this.currentPage++;
    
    // Pre-fetch next page if there might be more
    if (this.hasMorePages) {
      this.prefetchNextPage();
    }
    
    return tasks;
  }
  
  async prefetchNextPage() {
    try {
      await this.getPage(this.currentPage);
    } catch (error) {
      console.error('Error pre-fetching next page:', error);
    }
  }
  
  invalidateCache() {
    this.cache = {};
    this.currentPage = 0;
    this.hasMorePages = true;
  }
}

// Usage
const taskList = new TaskList(20, 'your-token-here');

// Display first page
async function displayTasks() {
  const tasks = await taskList.getNextPage();
  
  if (tasks.length === 0) {
    console.log('No more tasks to display');
    return;
  }
  
  console.log(`Displaying ${tasks.length} tasks`);
  
  // Render tasks in UI
  tasks.forEach(task => {
    console.log(`Task: ${task.taskTitle} (${task.taskStatus})`);
  });
}

// Call when user clicks "Load More" button
async function loadMoreTasks() {
  await displayTasks();
}
```

## Minimizing request frequency

Reducing the number of API requests can significantly improve application performance.

### Strategies to reduce request frequency

1. **Batch related operations**: Combine multiple operations into a single request when possible
2. **Implement debouncing**: Delay API calls when input is rapidly changing (e.g., search fields)
3. **Use optimistic updates**: Update UI immediately before API confirmation for better perceived performance
4. **Poll efficiently**: For real-time updates, use appropriate polling intervals or consider WebSockets if supported

### Debouncing example

```javascript
// Debouncing function for search input
function debounce(func, wait) {
  let timeout;
  
  return function(...args) {
    const context = this;
    clearTimeout(timeout);
    
    timeout = setTimeout(() => {
      func.apply(context, args);
    }, wait);
  };
}

// Usage with search
const searchInput = document.getElementById('search-input');
const searchResults = document.getElementById('search-results');

const searchTasks = async (query) => {
  if (!query || query.length < 2) {
    searchResults.innerHTML = '';
    return;
  }
  
  try {
    // Note: This is a simulated search since the API doesn't have a search endpoint
    // In a real implementation, you would use a search endpoint
    const response = await fetch(`http://localhost:3000/tasks?_sort=dueDate`, {
      headers: {
        'Authorization': 'Bearer your-token-here'
      }
    });
    
    const data = await response.json();
    
    // Client-side filtering (in a real app, the server would handle this)
    const filteredTasks = data.tasks.filter(task => 
      task.taskTitle.toLowerCase().includes(query.toLowerCase()) ||
      task.taskDescription.toLowerCase().includes(query.toLowerCase())
    );
    
    // Update UI with results
    searchResults.innerHTML = filteredTasks.length > 0
      ? filteredTasks.map(task => `<div>${task.taskTitle}</div>`).join('')
      : '<div>No results found</div>';
  } catch (error) {
    console.error('Search failed:', error);
    searchResults.innerHTML = '<div>Search failed. Please try again.</div>';
  }
};

// Debounce the search function with a 300ms delay
const debouncedSearch = debounce(searchTasks, 300);

// Add event listener
searchInput.addEventListener('input', (e) => {
  debouncedSearch(e.target.value);
});
```

## Optimistic updates

Implementing optimistic updates can improve perceived performance by updating the UI immediately before API confirmation.

### Implementation example

```javascript
// Optimistic update for completing a task
async function completeTask(taskId, taskData) {
  // Store original state for rollback
  const originalState = { ...taskData };
  
  try {
    // Update UI immediately (optimistically)
    updateTaskInUI(taskId, {
      ...taskData,
      taskStatus: 'COMPLETED'
    });
    
    // Make API call
    const response = await fetch(`http://localhost:3000/tasks/${taskId}`, {
      method: 'PATCH',
      headers: {
        'Authorization': 'Bearer your-token-here',
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        taskStatus: 'COMPLETED'
      })
    });
    
    if (!response.ok) {
      throw new Error(`Failed to complete task: ${response.status}`);
    }
    
    // Update with actual server response
    const updatedTask = await response.json();
    updateTaskInUI(taskId, updatedTask);
    
    return updatedTask;
  } catch (error) {
    console.error('Error completing task:', error);
    
    // Rollback UI to original state on error
    updateTaskInUI(taskId, originalState);
    
    // Re-throw for caller to handle
    throw error;
  }
}

// Helper function to update task in UI
function updateTaskInUI(taskId, taskData) {
  // This would be implemented based on your UI framework
  console.log(`Updating UI for task ${taskId}:`, taskData);
  
  // Example: Update DOM directly
  const taskElement = document.getElementById(`task-${taskId}`);
  if (taskElement) {
    taskElement.querySelector('.task-status').textContent = taskData.taskStatus;
    taskElement.classList.remove('status-not-started', 'status-in-progress', 'status-completed');
    taskElement.classList.add(`status-${taskData.taskStatus.toLowerCase().replace('_', '-')}`);
  }
}
```

## Handling rate limits

The API implements rate limiting to prevent abuse. Understanding how to handle rate limits is important for optimizing your implementation.

### Best practices for rate limit handling

1. **Implement backoff**: When rate limited, wait before retrying
2. **Distribute requests**: Space out non-urgent requests
3. **Prioritize important operations**: Ensure critical operations succeed even when near rate limits
4. **Monitor usage**: Track your API usage to stay within limits

### Implementation example

```javascript
// API client with rate limit handling
class ApiClient {
  constructor(baseUrl, token) {
    this.baseUrl = baseUrl;
    this.token = token;
    this.retryDelay = 1000; // Start with 1 second delay
    this.maxRetries = 3;
  }
  
  async request(endpoint, options = {}) {
    const url = `${this.baseUrl}${endpoint}`;
    const headers = {
      'Authorization': `Bearer ${this.token}`,
      ...options.headers
    };
    
    if (options.body && typeof options.body === 'object') {
      headers['Content-Type'] = 'application/json';
      options.body = JSON.stringify(options.body);
    }
    
    let retries = 0;
    
    while (retries <= this.maxRetries) {
      try {
        const response = await fetch(url, {
          ...options,
          headers
        });
        
        // Handle rate limiting
        if (response.status === 429) {
          retries++;
          
          // Get retry-after header or use exponential backoff
          const retryAfter = response.headers.get('Retry-After');
          const delay = retryAfter ? parseInt(retryAfter, 10) * 1000 : this.retryDelay * Math.pow(2, retries - 1);
          
          console.log(`Rate limited. Retrying in ${delay / 1000} seconds...`);
          
          // Wait before retrying
          await new Promise(resolve => setTimeout(resolve, delay));
          continue;
        }
        
        // Reset retry delay on success
        this.retryDelay = 1000;
        
        // For successful responses, return JSON or null for 204
        if (response.ok) {
          return response.status === 204 ? null : await response.json();
        }
        
        // Handle other errors
        const error = await response.json();
        throw new Error(error.message || `Request failed with status ${response.status}`);
      } catch (error) {
        if (retries >= this.maxRetries) {
          throw error;
        }
        
        retries++;
        const delay = this.retryDelay * Math.pow(2, retries - 1);
        console.log(`Request failed. Retrying in ${delay / 1000} seconds...`);
        
        await new Promise(resolve => setTimeout(resolve, delay));
      }
    }
  }
  
  // Convenience methods for common operations
  async get(endpoint) {
    return this.request(endpoint);
  }
  
  async post(endpoint, data) {
    return this.request(endpoint, {
      method: 'POST',
      body: data
    });
  }
  
  async patch(endpoint, data) {
    return this.request(endpoint, {
      method: 'PATCH',
      body: data
    });
  }
  
  async delete(endpoint) {
    return this.request(endpoint, {
      method: 'DELETE'
    });
  }
}

// Usage
const api = new ApiClient('http://localhost:3000', 'your-token-here');

async function fetchUser(userId) {
  try {
    return await api.get(`/users/${userId}`);
  } catch (error) {
    console.error(`Failed to fetch user ${userId}:`, error);
    throw error;
  }
}

async function createTask(taskData) {
  try {
    return await api.post('/tasks', taskData);
  } catch (error) {
    console.error('Failed to create task:', error);
    throw error;
  }
}
```

## Performance monitoring

Implementing performance monitoring helps identify bottlenecks and opportunities for optimization.

### What to monitor

1. **Response times**: Track how long API requests take
2. **Error rates**: Monitor failed requests
3. **Cache hit rates**: Measure how effective your caching is
4. **API usage patterns**: Identify frequently used endpoints

### Simple monitoring implementation

```javascript
// API client with performance monitoring
class MonitoredApiClient {
  constructor(baseUrl, token) {
    this.baseUrl = baseUrl;
    this.token = token;
    this.metrics = {
      requests: 0,
      errors: 0,
      totalResponseTime: 0
    };
    
    // Initialize performance data by endpoint
    this.endpointMetrics = {};
  }
  
  async request(endpoint, options = {}) {
    this.metrics.requests++;
    
    // Initialize endpoint metrics if not exists
    if (!this.endpointMetrics[endpoint]) {
      this.endpointMetrics[endpoint] = {
        requests: 0,
        errors: 0,
        totalResponseTime: 0
      };
    }
    
    this.endpointMetrics[endpoint].requests++;
    
    const url = `${this.baseUrl}${endpoint}`;
    const headers = {
      'Authorization': `Bearer ${this.token}`,
      ...options.headers
    };
    
    if (options.body && typeof options.body === 'object') {
      headers['Content-Type'] = 'application/json';
      options.body = JSON.stringify(options.body);
    }
    
    const startTime = performance.now();
    
    try {
      const response = await fetch(url, {
        ...options,
        headers
      });
      
      const responseTime = performance.now() - startTime;
      this.metrics.totalResponseTime += responseTime;
      this.endpointMetrics[endpoint].totalResponseTime += responseTime;
      
      if (!response.ok) {
        this.metrics.errors++;
        this.endpointMetrics[endpoint].errors++;
        
        const error = await response.json();
        throw new Error(error.message || `Request failed with status ${response.status}`);
      }
      
      return response.status === 204 ? null : await response.json();
    } catch (error) {
      this.metrics.errors++;
      this.endpointMetrics[endpoint].errors++;
      throw error;
    }
  }
  
  // Calculate average response time
  getAverageResponseTime() {
    return this.metrics.requests > 0
      ? this.metrics.totalResponseTime / this.metrics.requests
      : 0;
  }
  
  // Calculate error rate
  getErrorRate() {
    return this.metrics.requests > 0
      ? (this.metrics.errors / this.metrics.requests) * 100
      : 0;
  }
  
  // Get metrics for a specific endpoint
  getEndpointMetrics(endpoint) {
    const metrics = this.endpointMetrics[endpoint];
    
    if (!metrics) {
      return null;
    }
    
    return {
      requests: metrics.requests,
      errors: metrics.errors,
      averageResponseTime: metrics.requests > 0
        ? metrics.totalResponseTime / metrics.requests
        : 0,
      errorRate: metrics.requests > 0
        ? (metrics.errors / metrics.requests) * 100
        : 0
    };
  }
  
  // Get all metrics
  getAllMetrics() {
    const endpointStats = {};
    
    for (const [endpoint, metrics] of Object.entries(this.endpointMetrics)) {
      endpointStats[endpoint] = {
        requests: metrics.requests,
        errors: metrics.errors,
        averageResponseTime: metrics.requests > 0
          ? metrics.totalResponseTime / metrics.requests
          : 0,
        errorRate: metrics.requests > 0
          ? (metrics.errors / metrics.requests) * 100
          : 0
      };
    }
    
    return {
      overall: {
        requests: this.metrics.requests,
        errors: this.metrics.errors,
        averageResponseTime: this.getAverageResponseTime(),
        errorRate: this.getErrorRate()
      },
      endpoints: endpointStats
    };
  }
  
  // Convenience methods
  async get(endpoint) {
    return this.request(endpoint);
  }
  
  async post(endpoint, data) {
    return this.request(endpoint, {
      method: 'POST',
      body: data
    });
  }
  
  async patch(endpoint, data) {
    return this.request(endpoint, {
      method: 'PATCH',
      body: data
    });
  }
  
  async delete(endpoint) {
    return this.request(endpoint, {
      method: 'DELETE'
    });
  }
}

// Usage
const api = new MonitoredApiClient('http://localhost:3000', 'your-token-here');

// After making several API calls, get performance metrics
function logPerformanceMetrics() {
  const metrics = api.getAllMetrics();
  console.log('API Performance Metrics:');
  console.log(`Total Requests: ${metrics.overall.requests}`);
  console.log(`Error Rate: ${metrics.overall.errorRate.toFixed(2)}%`);
  console.log(`Average Response Time: ${metrics.overall.averageResponseTime.toFixed(2)}ms`);
  
  console.log('\nEndpoint Performance:');
  for (const [endpoint, stats] of Object.entries(metrics.endpoints)) {
    console.log(`\n${endpoint}:`);
    console.log(`  Requests: ${stats.requests}`);
    console.log(`  Error Rate: ${stats.errorRate.toFixed(2)}%`);
    console.log(`  Average Response Time: ${stats.averageResponseTime.toFixed(2)}ms`);
  }
}
```

## Summary of optimization strategies

| Strategy | Benefits | Implementation complexity |
|----------|----------|---------------------------|
| Client-side caching | Reduces requests, improves responsiveness | Medium |
| Efficient pagination | Handles large datasets, improves load times | Low |
| Request minimization | Reduces server load, improves responsiveness | Medium |
| Optimistic updates | Improves perceived performance | Medium |
| Rate limit handling | Ensures reliability under load | Medium |
| Performance monitoring | Identifies optimization opportunities | Medium |

## Next steps

After implementing these optimization strategies, consider:

1. **Load testing**: Measure your application's performance under heavy load
2. **User experience testing**: Gather feedback on perceived performance
3. **Advanced caching**: Implement more sophisticated caching strategies like LRU (Least Recently Used) caching
4. **Offline capabilities**: Add offline support for critical functionality

## Related resources

- [Task management workflow](../tutorials/task-management-workflow.md)
- [Pagination](../core-concepts/pagination.md)
- [Sorting](../core-concepts/sorting.md)
- [API reference](../api-reference.md)--- FILE: tutorials/task-management-workflow.md ---
---
title: "Task management workflow"
description: "A guide to implementing a complete task management workflow using the API, from creation to completion."
tags: ["tutorial", "tasks", "workflow"]
categories: ["tutorials"]
importance: 6
parent: "Tutorials & Guides" 
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 20, 2025"
nav_order: "2"
layout: "default"
version: "v1.0.0"
lastUpdated: "May 20, 2025"
---

# Task management workflow

This tutorial walks you through implementing a complete task management workflow using the Task Management API. You'll learn how to create, track, update, and complete tasks.

## Prerequisites

Before you begin, make sure you have:

1. A bearer token for authentication
2. Access to the API endpoint (default: `http://localhost:3000`)
3. At least one user in the system (see [Getting started with users](getting-started-with-users.md))
4. A tool for making HTTP requests (cURL, Postman, or code in your preferred language)

## Understanding the task lifecycle

Tasks in the system follow a lifecycle represented by their `taskStatus` value:

1. **NOT_STARTED**: Initial state for new tasks
2. **IN_PROGRESS**: The task is actively being worked on
3. **BLOCKED**: The task cannot proceed due to an external factor
4. **DEFERRED**: The task has been postponed to a later time
5. **COMPLETED**: The task has been finished
6. **CANCELLED**: The task has been cancelled and will not be completed

This tutorial will guide you through moving a task through various stages of this lifecycle.

## Step 1: Create a task

Let's start by creating a new task for a user.

### Request

```javascript
// JavaScript example
const userId = 1; // Replace with an actual user ID

fetch('http://localhost:3000/tasks', {
  method: 'POST',
  headers: {
    'Authorization': 'Bearer your-token-here',
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({
    userId: userId,
    taskTitle: 'Complete project proposal',
    taskDescription: 'Finish the proposal for the new client project',
    dueDate: '2025-06-15T17:00:00-05:00',
    warningOffset: 120 // 2 hours before due date
  })
})
.then(response => response.json())
.then(data => {
  console.log('Task created:', data);
  // Store the taskId for later use
  const taskId = data.taskId;
});
```

```python
# Python example
import requests
from datetime import datetime, timedelta

user_id = 1  # Replace with an actual user ID

# Create a due date 2 weeks from now
due_date = datetime.now() + timedelta(days=14)
due_date_str = due_date.strftime("%Y-%m-%dT%H:%M:%S-05:00")

url = "http://localhost:3000/tasks"
headers = {
    "Authorization": "Bearer your-token-here",
    "Content-Type": "application/json"
}
data = {
    "userId": user_id,
    "taskTitle": "Complete project proposal",
    "taskDescription": "Finish the proposal for the new client project",
    "dueDate": due_date_str,
    "warningOffset": 120  # 2 hours before due date
}

response = requests.post(url, headers=headers, json=data)
task_data = response.json()
print("Task created:", task_data)
# Store the taskId for later use
task_id = task_data["taskId"]
```

### Response

```json
{
  "taskId": 1,
  "userId": 1,
  "taskTitle": "Complete project proposal",
  "taskDescription": "Finish the proposal for the new client project",
  "taskStatus": "NOT_STARTED",
  "dueDate": "2025-06-15T17:00:00-05:00",
  "warningOffset": 120
}
```

Notice that the `taskStatus` is automatically set to `NOT_STARTED` since we didn't specify it in the request.

## Step 2: Start working on the task

Now let's update the task status to indicate that work has begun.

### Request

```javascript
// JavaScript example
const taskId = 1; // Use the ID from the created task

fetch(`http://localhost:3000/tasks/${taskId}`, {
  method: 'PATCH',
  headers: {
    'Authorization': 'Bearer your-token-here',
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({
    taskStatus: 'IN_PROGRESS'
  })
})
.then(response => response.json())
.then(data => {
  console.log('Task updated:', data);
});
```

```python
# Python example
import requests

task_id = 1  # Use the ID from the created task
url = f"http://localhost:3000/tasks/{task_id}"
headers = {
    "Authorization": "Bearer your-token-here",
    "Content-Type": "application/json"
}
data = {
    "taskStatus": "IN_PROGRESS"
}

response = requests.patch(url, headers=headers, json=data)
updated_task = response.json()
print("Task updated:", updated_task)
```

### Response

```json
{
  "taskId": 1,
  "userId": 1,
  "taskTitle": "Complete project proposal",
  "taskDescription": "Finish the proposal for the new client project",
  "taskStatus": "IN_PROGRESS",
  "dueDate": "2025-06-15T17:00:00-05:00",
  "warningOffset": 120
}
```

## Step 3: Encounter a blocker

Let's simulate encountering a blocker that prevents progress on the task.

### Request

```javascript
// JavaScript example
const taskId = 1;

fetch(`http://localhost:3000/tasks/${taskId}`, {
  method: 'PATCH',
  headers: {
    'Authorization': 'Bearer your-token-here',
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({
    taskStatus: 'BLOCKED',
    taskDescription: 'Finish the proposal for the new client project. BLOCKED: Waiting for client requirements.'
  })
})
.then(response => response.json())
.then(data => {
  console.log('Task blocked:', data);
});
```

```python
# Python example
import requests

task_id = 1
url = f"http://localhost:3000/tasks/{task_id}"
headers = {
    "Authorization": "Bearer your-token-here",
    "Content-Type": "application/json"
}
data = {
    "taskStatus": "BLOCKED",
    "taskDescription": "Finish the proposal for the new client project. BLOCKED: Waiting for client requirements."
}

response = requests.patch(url, headers=headers, json=data)
blocked_task = response.json()
print("Task blocked:", blocked_task)
```

### Response

```json
{
  "taskId": 1,
  "userId": 1,
  "taskTitle": "Complete project proposal",
  "taskDescription": "Finish the proposal for the new client project. BLOCKED: Waiting for client requirements.",
  "taskStatus": "BLOCKED",
  "dueDate": "2025-06-15T17:00:00-05:00",
  "warningOffset": 120
}
```

Notice that we've updated both the `taskStatus` and the `taskDescription` to add information about why the task is blocked.

## Step 4: Resume work on the task

Let's assume the blocker has been resolved, and we can resume work on the task.

### Request

```javascript
// JavaScript example
const taskId = 1;

fetch(`http://localhost:3000/tasks/${taskId}`, {
  method: 'PATCH',
  headers: {
    'Authorization': 'Bearer your-token-here',
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({
    taskStatus: 'IN_PROGRESS',
    taskDescription: 'Finish the proposal for the new client project. Client requirements received.'
  })
})
.then(response => response.json())
.then(data => {
  console.log('Task resumed:', data);
});
```

```python
# Python example
import requests

task_id = 1
url = f"http://localhost:3000/tasks/{task_id}"
headers = {
    "Authorization": "Bearer your-token-here",
    "Content-Type": "application/json"
}
data = {
    "taskStatus": "IN_PROGRESS",
    "taskDescription": "Finish the proposal for the new client project. Client requirements received."
}

response = requests.patch(url, headers=headers, json=data)
resumed_task = response.json()
print("Task resumed:", resumed_task)
```

### Response

```json
{
  "taskId": 1,
  "userId": 1,
  "taskTitle": "Complete project proposal",
  "taskDescription": "Finish the proposal for the new client project. Client requirements received.",
  "taskStatus": "IN_PROGRESS",
  "dueDate": "2025-06-15T17:00:00-05:00",
  "warningOffset": 120
}
```

## Step 5: Complete the task

Now that the work is done, let's mark the task as completed.

### Request

```javascript
// JavaScript example
const taskId = 1;

fetch(`http://localhost:3000/tasks/${taskId}`, {
  method: 'PATCH',
  headers: {
    'Authorization': 'Bearer your-token-here',
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({
    taskStatus: 'COMPLETED'
  })
})
.then(response => response.json())
.then(data => {
  console.log('Task completed:', data);
});
```

```python
# Python example
import requests

task_id = 1
url = f"http://localhost:3000/tasks/{task_id}"
headers = {
    "Authorization": "Bearer your-token-here",
    "Content-Type": "application/json"
}
data = {
    "taskStatus": "COMPLETED"
}

response = requests.patch(url, headers=headers, json=data)
completed_task = response.json()
print("Task completed:", completed_task)
```

### Response

```json
{
  "taskId": 1,
  "userId": 1,
  "taskTitle": "Complete project proposal",
  "taskDescription": "Finish the proposal for the new client project. Client requirements received.",
  "taskStatus": "COMPLETED",
  "dueDate": "2025-06-15T17:00:00-05:00",
  "warningOffset": 120
}
```

## Step 6: View task history

Let's retrieve the task to verify its final state.

### Request

```javascript
// JavaScript example
const taskId = 1;

fetch(`http://localhost:3000/tasks/${taskId}`, {
  headers: {
    'Authorization': 'Bearer your-token-here'
  }
})
.then(response => response.json())
.then(data => {
  console.log('Task details:', data);
});
```

```python
# Python example
import requests

task_id = 1
url = f"http://localhost:3000/tasks/{task_id}"
headers = {
    "Authorization": "Bearer your-token-here"
}

response = requests.get(url, headers=headers)
task_details = response.json()
print("Task details:", task_details)
```

### Response

```json
{
  "taskId": 1,
  "userId": 1,
  "taskTitle": "Complete project proposal",
  "taskDescription": "Finish the proposal for the new client project. Client requirements received.",
  "taskStatus": "COMPLETED",
  "dueDate": "2025-06-15T17:00:00-05:00",
  "warningOffset": 120
}
```

## Step 7: Create multiple tasks

In a real-world scenario, you'll likely have multiple tasks at different stages of the workflow. Let's create a few more tasks for our user.

### Request

```javascript
// JavaScript example
async function createMultipleTasks(userId, tasks) {
  const createdTasks = [];
  
  for (const task of tasks) {
    try {
      // Add userId to each task
      const taskWithUserId = {
        ...task,
        userId: userId
      };
      
      const response = await fetch('http://localhost:3000/tasks', {
        method: 'POST',
        headers: {
          'Authorization': 'Bearer your-token-here',
          'Content-Type': 'application/json'
        },
        body: JSON.stringify(taskWithUserId)
      });
      
      if (!response.ok) {
        throw new Error(`Failed to create task: ${task.taskTitle}`);
      }
      
      const taskData = await response.json();
      createdTasks.push(taskData);
      console.log(`Task created: ${taskData.taskTitle} (ID: ${taskData.taskId})`);
    } catch (error) {
      console.error(error);
    }
  }
  
  return createdTasks;
}

// Create multiple tasks with different statuses
const userId = 1;
const tasksToCreate = [
  {
    taskTitle: 'Prepare for client meeting',
    taskDescription: 'Create slides and talking points for the upcoming client presentation',
    taskStatus: 'NOT_STARTED',
    dueDate: '2025-06-20T10:00:00-05:00',
    warningOffset: 60 // 1 hour before
  },
  {
    taskTitle: 'Review contract terms',
    taskDescription: 'Go through the contract and identify any potential issues',
    taskStatus: 'IN_PROGRESS',
    dueDate: '2025-06-10T12:00:00-05:00',
    warningOffset: 120 // 2 hours before
  },
  {
    taskTitle: 'Schedule team retrospective',
    taskDescription: 'Set up a meeting for the team to discuss the project outcomes',
    taskStatus: 'DEFERRED',
    dueDate: '2025-06-30T15:00:00-05:00',
    warningOffset: 1440 // 24 hours before
  }
];

createMultipleTasks(userId, tasksToCreate)
  .then(tasks => {
    console.log(`Created ${tasks.length} tasks successfully`);
  });
```

```python
# Python example
import requests
from datetime import datetime, timedelta

def create_multiple_tasks(token, user_id, tasks):
    created_tasks = []
    
    for task in tasks:
        try:
            # Add userId to each task
            task_with_user_id = task.copy()
            task_with_user_id["userId"] = user_id
            
            url = "http://localhost:3000/tasks"
            headers = {
                "Authorization": f"Bearer {token}",
                "Content-Type": "application/json"
            }
            
            response = requests.post(url, headers=headers, json=task_with_user_id)
            response.raise_for_status()
            
            task_data = response.json()
            created_tasks.append(task_data)
            print(f"Task created: {task_data['taskTitle']} (ID: {task_data['taskId']})")
        except Exception as e:
            print(f"Failed to create task: {task['taskTitle']}")
            print(f"Error: {str(e)}")
    
    return created_tasks

# Helper function to create a future date string
def future_date_str(days_from_now, hour=12, minute=0):
    future_date = datetime.now() + timedelta(days=days_from_now)
    future_date = future_date.replace(hour=hour, minute=minute)
    return future_date.strftime("%Y-%m-%dT%H:%M:%S-05:00")

# Create multiple tasks with different statuses
user_id = 1
tasks_to_create = [
    {
        "taskTitle": "Prepare for client meeting",
        "taskDescription": "Create slides and talking points for the upcoming client presentation",
        "taskStatus": "NOT_STARTED",
        "dueDate": future_date_str(10, 10, 0),  # 10 days from now at 10:00 AM
        "warningOffset": 60  # 1 hour before
    },
    {
        "taskTitle": "Review contract terms",
        "taskDescription": "Go through the contract and identify any potential issues",
        "taskStatus": "IN_PROGRESS",
        "dueDate": future_date_str(5, 12, 0),  # 5 days from now at 12:00 PM
        "warningOffset": 120  # 2 hours before
    },
    {
        "taskTitle": "Schedule team retrospective",
        "taskDescription": "Set up a meeting for the team to discuss the project outcomes",
        "taskStatus": "DEFERRED",
        "dueDate": future_date_str(20, 15, 0),  # 20 days from now at 3:00 PM
        "warningOffset": 1440  # 24 hours before
    }
]

created_tasks = create_multiple_tasks("your-token-here", user_id, tasks_to_create)
print(f"Created {len(created_tasks)} tasks successfully")
```

## Step 8: View all tasks by status

Let's retrieve all tasks for a specific status to see what needs attention.

### Request

```javascript
// JavaScript example
const status = 'IN_PROGRESS';

fetch(`http://localhost:3000/tasks?taskStatus=${status}`, {
  headers: {
    'Authorization': 'Bearer your-token-here'
  }
})
.then(response => response.json())
.then(data => {
  console.log(`Tasks with status ${status}:`, data.tasks);
  console.log(`Found ${data.tasks.length} tasks with status ${status}`);
});
```

```python
# Python example
import requests

status = "IN_PROGRESS"
url = "http://localhost:3000/tasks"
headers = {
    "Authorization": "Bearer your-token-here"
}
params = {
    "taskStatus": status
}

response = requests.get(url, headers=headers, params=params)
data = response.json()
print(f"Tasks with status {status}:", data["tasks"])
print(f"Found {len(data['tasks'])} tasks with status {status}")
```

### Response

```json
{
  "tasks": [
    {
      "taskId": 3,
      "userId": 1,
      "taskTitle": "Review contract terms",
      "taskDescription": "Go through the contract and identify any potential issues",
      "taskStatus": "IN_PROGRESS",
      "dueDate": "2025-06-10T12:00:00-05:00",
      "warningOffset": 120
    }
  ]
}
```

## Step 9: Cancel a task

Sometimes tasks need to be cancelled. Let's cancel one of our tasks.

### Request

```javascript
// JavaScript example
const taskId = 4; // Task "Schedule team retrospective"

fetch(`http://localhost:3000/tasks/${taskId}`, {
  method: 'PATCH',
  headers: {
    'Authorization': 'Bearer your-token-here',
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({
    taskStatus: 'CANCELLED',
    taskDescription: 'Set up a meeting for the team to discuss the project outcomes. CANCELLED: No longer needed as feedback gathered during the project.'
  })
})
.then(response => response.json())
.then(data => {
  console.log('Task cancelled:', data);
});
```

```python
# Python example
import requests

task_id = 4  # Task "Schedule team retrospective"
url = f"http://localhost:3000/tasks/{task_id}"
headers = {
    "Authorization": "Bearer your-token-here",
    "Content-Type": "application/json"
}
data = {
    "taskStatus": "CANCELLED",
    "taskDescription": "Set up a meeting for the team to discuss the project outcomes. CANCELLED: No longer needed as feedback gathered during the project."
}

response = requests.patch(url, headers=headers, json=data)
cancelled_task = response.json()
print("Task cancelled:", cancelled_task)
```

### Response

```json
{
  "taskId": 4,
  "userId": 1,
  "taskTitle": "Schedule team retrospective",
  "taskDescription": "Set up a meeting for the team to discuss the project outcomes. CANCELLED: No longer needed as feedback gathered during the project.",
  "taskStatus": "CANCELLED",
  "dueDate": "2025-06-30T15:00:00-05:00",
  "warningOffset": 1440
}
```

## Step 10: Get tasks sorted by due date

To prioritize work effectively, let's retrieve all tasks sorted by due date (ascending).

### Request

```javascript
// JavaScript example
fetch('http://localhost:3000/tasks?_sort=dueDate', {
  headers: {
    'Authorization': 'Bearer your-token-here'
  }
})
.then(response => response.json())
.then(data => {
  console.log('Tasks sorted by due date:', data.tasks);
  
  // Display tasks in a user-friendly format
  data.tasks.forEach(task => {
    const dueDate = new Date(task.dueDate).toLocaleDateString();
    console.log(`[${task.taskStatus}] ${task.taskTitle} - Due: ${dueDate}`);
  });
});
```

```python
# Python example
import requests
from datetime import datetime

url = "http://localhost:3000/tasks"
headers = {
    "Authorization": "Bearer your-token-here"
}
params = {
    "_sort": "dueDate"
}

response = requests.get(url, headers=headers, params=params)
data = response.json()
print("Tasks sorted by due date:", data["tasks"])

# Display tasks in a user-friendly format
for task in data["tasks"]:
    due_date = datetime.fromisoformat(task["dueDate"].replace("Z", "+00:00"))
    due_date_str = due_date.strftime("%Y-%m-%d")
    print(f"[{task['taskStatus']}] {task['taskTitle']} - Due: {due_date_str}")
```

### Response

```json
{
  "tasks": [
    {
      "taskId": 3,
      "userId": 1,
      "taskTitle": "Review contract terms",
      "taskDescription": "Go through the contract and identify any potential issues",
      "taskStatus": "IN_PROGRESS",
      "dueDate": "2025-06-10T12:00:00-05:00",
      "warningOffset": 120
    },
    {
      "taskId": 1,
      "userId": 1,
      "taskTitle": "Complete project proposal",
      "taskDescription": "Finish the proposal for the new client project. Client requirements received.",
      "taskStatus": "COMPLETED",
      "dueDate": "2025-06-15T17:00:00-05:00",
      "warningOffset": 120
    },
    {
      "taskId": 2,
      "userId": 1,
      "taskTitle": "Prepare for client meeting",
      "taskDescription": "Create slides and talking points for the upcoming client presentation",
      "taskStatus": "NOT_STARTED",
      "dueDate": "2025-06-20T10:00:00-05:00",
      "warningOffset": 60
    },
    {
      "taskId": 4,
      "userId": 1,
      "taskTitle": "Schedule team retrospective",
      "taskDescription": "Set up a meeting for the team to discuss the project outcomes. CANCELLED: No longer needed as feedback gathered during the project.",
      "taskStatus": "CANCELLED",
      "dueDate": "2025-06-30T15:00:00-05:00",
      "warningOffset": 1440
    }
  ]
}
```

## Complete code example

Here's a complete JavaScript example that performs the entire task management workflow:

```javascript
// Complete JavaScript example for task management workflow
async function taskManagementWorkflow() {
  const baseUrl = 'http://localhost:3000';
  const token = 'your-token-here';
  const headers = {
    'Authorization': `Bearer ${token}`,
    'Content-Type': 'application/json'
  };
  const userId = 1; // Replace with an actual user ID
  
  try {
    // Step 1: Create a task
    console.log('Step 1: Creating a task');
    const createResponse = await fetch(`${baseUrl}/tasks`, {
      method: 'POST',
      headers,
      body: JSON.stringify({
        userId: userId,
        taskTitle: 'Complete project proposal',
        taskDescription: 'Finish the proposal for the new client project',
        dueDate: '2025-06-15T17:00:00-05:00',
        warningOffset: 120
      })
    });
    
    if (!createResponse.ok) {
      throw new Error('Failed to create task');
    }
    
    const task = await createResponse.json();
    console.log('Task created:', task);
    const taskId = task.taskId;
    
    // Step 2: Start working on the task
    console.log('\nStep 2: Starting work on the task');
    const startResponse = await fetch(`${baseUrl}/tasks/${taskId}`, {
      method: 'PATCH',
      headers,
      body: JSON.stringify({
        taskStatus: 'IN_PROGRESS'
      })
    });
    
    if (!startResponse.ok) {
      throw new Error(`Failed to update task status to IN_PROGRESS`);
    }
    
    const startedTask = await startResponse.json();
    console.log('Task started:', startedTask);
    
    // Step 3: Encounter a blocker
    console.log('\nStep 3: Encountering a blocker');
    const blockResponse = await fetch(`${baseUrl}/tasks/${taskId}`, {
      method: 'PATCH',
      headers,
      body: JSON.stringify({
        taskStatus: 'BLOCKED',
        taskDescription: 'Finish the proposal for the new client project. BLOCKED: Waiting for client requirements.'
      })
    });
    
    if (!blockResponse.ok) {
      throw new Error(`Failed to update task status to BLOCKED`);
    }
    
    const blockedTask = await blockResponse.json();
    console.log('Task blocked:', blockedTask);
    
    // Step 4: Resume work on the task
    console.log('\nStep 4: Resuming work on the task');
    const resumeResponse = await fetch(`${baseUrl}/tasks/${taskId}`, {
      method: 'PATCH',
      headers,
      body: JSON.stringify({
        taskStatus: 'IN_PROGRESS',
        taskDescription: 'Finish the proposal for the new client project. Client requirements received.'
      })
    });
    
    if (!resumeResponse.ok) {
      throw new Error(`Failed to update task status back to IN_PROGRESS`);
    }
    
    const resumedTask = await resumeResponse.json();
    console.log('Task resumed:', resumedTask);
    
    // Step 5: Complete the task
    console.log('\nStep 5: Completing the task');
    const completeResponse = await fetch(`${baseUrl}/tasks/${taskId}`, {
      method: 'PATCH',
      headers,
      body: JSON.stringify({
        taskStatus: 'COMPLETED'
      })
    });
    
    if (!completeResponse.ok) {
      throw new Error(`Failed to update task status to COMPLETED`);
    }
    
    const completedTask = await completeResponse.json();
    console.log('Task completed:', completedTask);
    
    // Step 6: View task history
    console.log('\nStep 6: Viewing task history');
    const historyResponse = await fetch(`${baseUrl}/tasks/${taskId}`, {
      headers: { 'Authorization': headers.Authorization }
    });
    
    if (!historyResponse.ok) {
      throw new Error(`Failed to get task history`);
    }
    
    const taskHistory = await historyResponse.json();
    console.log('Task history:', taskHistory);
    
    // Step 7: Create multiple tasks
    console.log('\nStep 7: Creating multiple tasks');
    const tasksToCreate = [
      {
        taskTitle: 'Prepare for client meeting',
        taskDescription: 'Create slides and talking points for the upcoming client presentation',
        taskStatus: 'NOT_STARTED',
        dueDate: '2025-06-20T10:00:00-05:00',
        warningOffset: 60
      },
      {
        taskTitle: 'Review contract terms',
        taskDescription: 'Go through the contract and identify any potential issues',
        taskStatus: 'IN_PROGRESS',
        dueDate: '2025-06-10T12:00:00-05:00',
        warningOffset: 120
      },
      {
        taskTitle: 'Schedule team retrospective',
        taskDescription: 'Set up a meeting for the team to discuss the project outcomes',
        taskStatus: 'DEFERRED',
        dueDate: '2025-06-30T15:00:00-05:00',
        warningOffset: 1440
      }
    ];
    
    const createdTasks = [];
    for (const task of tasksToCreate) {
      const response = await fetch(`${baseUrl}/tasks`, {
        method: 'POST',
        headers,
        body: JSON.stringify({
          ...task,
          userId: userId
        })
      });
      
      if (response.ok) {
        const taskData = await response.json();
        createdTasks.push(taskData);
        console.log(`Task created: ${taskData.taskTitle} (ID: ${taskData.taskId})`);
      } else {
        console.error(`Failed to create task: ${task.taskTitle}`);
      }
    }
    
    // Step 8: View all tasks by status
    console.log('\nStep 8: Viewing all tasks by status');
    const status = 'IN_PROGRESS';
    const statusResponse = await fetch(`${baseUrl}/tasks?taskStatus=${status}`, {
      headers: { 'Authorization': headers.Authorization }
    });
    
    if (!statusResponse.ok) {
      throw new Error(`Failed to get tasks by status`);
    }
    
    const statusTasks = await statusResponse.json();
    console.log(`Tasks with status ${status}:`, statusTasks.tasks);
    console.log(`Found ${statusTasks.tasks.length} tasks with status ${status}`);
    
    // Step 9: Cancel a task
    console.log('\nStep 9: Cancelling a task');
    const taskToCancel = createdTasks[2].taskId; // "Schedule team retrospective"
    const cancelResponse = await fetch(`${baseUrl}/tasks/${taskToCancel}`, {
      method: 'PATCH',
      headers,
      body: JSON.stringify({
        taskStatus: 'CANCELLED',
        taskDescription: 'Set up a meeting for the team to discuss the project outcomes. CANCELLED: No longer needed as feedback gathered during the project.'
      })
    });
    
    if (!cancelResponse.ok) {
      throw new Error(`Failed to cancel task`);
    }
    
    const cancelledTask = await cancelResponse.json();
    console.log('Task cancelled:', cancelledTask);
    
    // Step 10: Get tasks sorted by due date
    console.log('\nStep 10: Getting tasks sorted by due date');
    const sortResponse = await fetch(`${baseUrl}/tasks?_sort=dueDate`, {
      headers: { 'Authorization': headers.Authorization }
    });
    
    if (!sortResponse.ok) {
      throw new Error(`Failed to get sorted tasks`);
    }
    
    const sortedTasks = await sortResponse.json();
    console.log('Tasks sorted by due date:');
    
    // Display tasks in a user-friendly format
    sortedTasks.tasks.forEach(task => {
      const dueDate = new Date(task.dueDate).toLocaleDateString();
      console.log(`[${task.taskStatus}] ${task.taskTitle} - Due: ${dueDate}`);
    });
    
    console.log('\nTask management workflow tutorial completed successfully!');
  } catch (error) {
    console.error('Error during tutorial:', error);
  }
}

// Run the workflow
taskManagementWorkflow();
```

## Best practices for task management

1. **Clear task titles**: Create task titles that are concise but descriptive.
2. **Detailed descriptions**: Include enough detail in the description for someone to understand what needs to be done.
3. **Realistic due dates**: Set due dates that allow enough time for completion.
4. **Appropriate warning offsets**: Set warning offsets based on the task's importance and complexity.
5. **Regular status updates**: Update task statuses as they change to keep the system current.
6. **Document blockers**: When a task is blocked, update the description to include why it's blocked.
7. **Prioritize by due date**: Use sorting by due date to focus on the most urgent tasks.
8. **Filter by status**: Use status filtering to create views for different workflow stages.

## Next steps

Now that you've learned the core task management workflow, you can:

1. Build a user interface to visualize and manage tasks
2. Implement reminder notifications using the `warningOffset` field
3. Create custom views for different task statuses
4. Add task prioritization to your workflow
5. Explore the [Implementing reminders](implementing-reminders.md) tutorial to create a reminder system

## Related resources

- [Task resource](../resources/task-resource.md)
- [Task status lifecycle](../core-concepts/task-status-lifecycle.md)
- [API reference: Task endpoints](../api-reference.md#task-endpoints)
- [Getting started with users](getting-started-with-users.md)--- FILE: tutorials.md ---
---
title: "Tutorials & Guides"
description: "Step-by-step tutorials and practical guides for working with the Task Management API."
tags: ["tutorials", "guides", "how-to"]
categories: ["tutorials"]
importance: 7
has_toc: false
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 20, 2025"
nav_order: "6"
layout: "default"
version: "v1.0.0"
lastUpdated: "May 20, 2025"
---

# Tutorials & Guides

This section provides step-by-step tutorials and practical guides to help you quickly start using the Task Management API in common scenarios.

## Getting started tutorials

These tutorials guide you through basic operations with the API:

- [Getting started with users](tutorials/getting-started-with-users.md): Learn how to create, list, update, and delete users
- [Task management workflow](tutorials/task-management-workflow.md): Implement a complete task management workflow from creation to completion

## Implementation guides

These guides help you implement specific features using the API:

- [Implementing reminders](tutorials/implementing-reminders.md): Use the `warningOffset` property to implement a reminder system
- [Integration patterns](tutorials/integration-patterns.md): Common patterns for integrating the API with other systems

## Available tutorials

| Tutorial | Description | Level |
|----------|-------------|-------|
| [Getting started with users](tutorials/getting-started-with-users.md) | Create, list, update, and delete users | Beginner |
| [Task management workflow](tutorials/task-management-workflow.md) | Implement a complete task management workflow | Beginner |
| [Implementing reminders](tutorials/implementing-reminders.md) | Create a reminder system using warningOffset | Intermediate |
| [Integration patterns](tutorials/integration-patterns.md) | Integrate the API with other systems | Advanced |

## Tips for success

- Start with the [Getting started guide](getting-started.md) before diving into specific tutorials
- Understand the [core concepts](core-concepts.md) to make the most of the API
- Reference the [API documentation](api-reference.md) for detailed endpoint information
- Check the [Support & FAQ](support.md) section if you encounter any issues

## Next steps

After working through these tutorials, you might want to explore:

- [Advanced topics](advanced.md): Learn about optimization, security, and data consistency
- [Developer resources](developer-resources.md): Find additional resources like changelogs and tools


