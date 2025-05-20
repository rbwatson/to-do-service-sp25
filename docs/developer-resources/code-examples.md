---
title: "Code examples"
description: "Example code for common operations in various programming languages including JavaScript, Python, and more."
tags: ["code", "examples"]
categories: ["developer-resources"]
importance: 7
parent: "Developer Resources"
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 20, 2025"
nav_order: "1"
layout: "default"
version: "v1.0.0"
lastUpdated: "May 20, 2025"
---

# Code examples

This page provides reusable code examples for common operations with the Task Management API in multiple programming languages.

## JavaScript/Node.js examples

### API client

A reusable API client class for JavaScript/Node.js applications:

```javascript
class TaskManagementClient {
  constructor(baseUrl, token) {
    this.baseUrl = baseUrl;
    this.token = token;
    this.headers = {
      'Authorization': `Bearer ${token}`,
      'Content-Type': 'application/json'
    };
  }

  // User operations
  async getUsers(page = 0, perPage = 20, sort = null) {
    let url = `${this.baseUrl}/users?_page=${page}&_perPage=${perPage}`;
    
    if (sort) {
      url += `&_sort=${sort}`;
    }
    
    const response = await fetch(url, {
      headers: this.headers
    });
    
    if (!response.ok) {
      throw new Error(`Failed to get users: ${response.status}`);
    }
    
    return response.json();
  }
  
  async getUser(userId) {
    const response = await fetch(`${this.baseUrl}/users/${userId}`, {
      headers: this.headers
    });
    
    if (!response.ok) {
      throw new Error(`Failed to get user ${userId}: ${response.status}`);
    }
    
    return response.json();
  }
  
  async createUser(userData) {
    const response = await fetch(`${this.baseUrl}/users`, {
      method: 'POST',
      headers: this.headers,
      body: JSON.stringify(userData)
    });
    
    if (!response.ok) {
      throw new Error(`Failed to create user: ${response.status}`);
    }
    
    return response.json();
  }
  
  async updateUser(userId, updates) {
    const response = await fetch(`${this.baseUrl}/users/${userId}`, {
      method: 'PATCH',
      headers: this.headers,
      body: JSON.stringify(updates)
    });
    
    if (!response.ok) {
      throw new Error(`Failed to update user ${userId}: ${response.status}`);
    }
    
    return response.json();
  }
  
  async deleteUser(userId) {
    const response = await fetch(`${this.baseUrl}/users/${userId}`, {
      method: 'DELETE',
      headers: {
        'Authorization': this.headers.Authorization
      }
    });
    
    if (!response.ok) {
      throw new Error(`Failed to delete user ${userId}: ${response.status}`);
    }
    
    return response.status === 204;
  }
  
  // Task operations
  async getTasks(options = {}) {
    const {
      page = 0,
      perPage = 20,
      sort = null,
      status = null
    } = options;
    
    let url = `${this.baseUrl}/tasks?_page=${page}&_perPage=${perPage}`;
    
    if (sort) {
      url += `&_sort=${sort}`;
    }
    
    if (status) {
      url += `&taskStatus=${status}`;
    }
    
    const response = await fetch(url, {
      headers: this.headers
    });
    
    if (!response.ok) {
      throw new Error(`Failed to get tasks: ${response.status}`);
    }
    
    return response.json();
  }
  
  async getTask(taskId) {
    const response = await fetch(`${this.baseUrl}/tasks/${taskId}`, {
      headers: this.headers
    });
    
    if (!response.ok) {
      throw new Error(`Failed to get task ${taskId}: ${response.status}`);
    }
    
    return response.json();
  }
  
  async createTask(taskData) {
    const response = await fetch(`${this.baseUrl}/tasks`, {
      method: 'POST',
      headers: this.headers,
      body: JSON.stringify(taskData)
    });
    
    if (!response.ok) {
      throw new Error(`Failed to create task: ${response.status}`);
    }
    
    return response.json();
  }
  
  async updateTask(taskId, updates) {
    const response = await fetch(`${this.baseUrl}/tasks/${taskId}`, {
      method: 'PATCH',
      headers: this.headers,
      body: JSON.stringify(updates)
    });
    
    if (!response.ok) {
      throw new Error(`Failed to update task ${taskId}: ${response.status}`);
    }
    
    return response.json();
  }
  
  async deleteTask(taskId) {
    const response = await fetch(`${this.baseUrl}/tasks/${taskId}`, {
      method: 'DELETE',
      headers: {
        'Authorization': this.headers.Authorization
      }
    });
    
    if (!response.ok) {
      throw new Error(`Failed to delete task ${taskId}: ${response.status}`);
    }
    
    return response.status === 204;
  }
  
  // Task status operations
  async updateTaskStatus(taskId, status) {
    return this.updateTask(taskId, { taskStatus: status });
  }
  
  async completeTask(taskId) {
    return this.updateTaskStatus(taskId, 'COMPLETED');
  }
  
  async startTask(taskId) {
    return this.updateTaskStatus(taskId, 'IN_PROGRESS');
  }
  
  async blockTask(taskId, reason) {
    const task = await this.getTask(taskId);
    
    return this.updateTask(taskId, {
      taskStatus: 'BLOCKED',
      taskDescription: reason ? 
        `${task.taskDescription || ''} BLOCKED: ${reason}`.trim() : 
        task.taskDescription
    });
  }
}

// Usage
const apiClient = new TaskManagementClient('http://localhost:3000', 'your-token-here');

// Example: Create a user and a task
async function createUserAndTask() {
  try {
    // Create a user
    const user = await apiClient.createUser({
      firstName: 'John',
      lastName: 'Doe',
      contactEmail: 'john.doe@example.com'
    });
    
    console.log('User created:', user);
    
    // Create a task for the user
    const task = await apiClient.createTask({
      userId: user.userId,
      taskTitle: 'Complete API integration',
      taskDescription: 'Integrate the Task Management API into our application',
      dueDate: '2025-07-01T12:00:00-05:00',
      warningOffset: 120
    });
    
    console.log('Task created:', task);
    
    // Start the task
    const startedTask = await apiClient.startTask(task.taskId);
    console.log('Task started:', startedTask);
    
    return { user, task: startedTask };
  } catch (error) {
    console.error('Error:', error.message);
    throw error;
  }
}

// Run the example
createUserAndTask()
  .then(result => console.log('Operation completed successfully'))
  .catch(error => console.error('Operation failed'));
```

### Error handling

Example of comprehensive error handling:

```javascript
// Error handling utility for API responses
async function handleApiResponse(response) {
  if (response.ok) {
    return response.status === 204 ? null : await response.json();
  }
  
  // Try to parse error response
  let errorData;
  try {
    errorData = await response.json();
  } catch (e) {
    // If parsing fails, create a generic error object
    errorData = {
      code: 'UNKNOWN_ERROR',
      message: `Request failed with status: ${response.status}`
    };
  }
  
  // Create custom error object
  const error = new Error(errorData.message || 'API request failed');
  error.status = response.status;
  error.code = errorData.code;
  error.details = errorData.details;
  error.requestId = errorData.requestId;
  
  throw error;
}

// Usage example
async function fetchTask(taskId) {
  try {
    const response = await fetch(`http://localhost:3000/tasks/${taskId}`, {
      headers: {
        'Authorization': 'Bearer your-token-here'
      }
    });
    
    return await handleApiResponse(response);
  } catch (error) {
    // Handle specific error types
    if (error.status === 404) {
      console.error(`Task ${taskId} not found`);
      // Handle missing task
    } else if (error.status === 401) {
      console.error('Authentication failed, please log in again');
      // Redirect to login
    } else {
      console.error(`Error fetching task: ${error.message}`);
      // Show generic error message
    }
    
    // Rethrow or return null/default value
    throw error;
  }
}
```

### Working with dates

Helper functions for handling dates and times:

```javascript
// Date utilities for task management
const TaskDateUtils = {
  // Format date for API requests
  formatForApi(date) {
    if (!(date instanceof Date)) {
      date = new Date(date);
    }
    
    return date.toISOString();
  },
  
  // Create a due date a specific number of days in the future
  createDueDate(daysFromNow, hour = 17, minute = 0) {
    const date = new Date();
    date.setDate(date.getDate() + daysFromNow);
    date.setHours(hour, minute, 0, 0);
    
    return date;
  },
  
  // Check if a task is due soon (within the warning period)
  isTaskDueSoon(task) {
    const dueDate = new Date(task.dueDate);
    const now = new Date();
    
    // Calculate warning time (dueDate minus warningOffset minutes)
    const warningTime = new Date(dueDate);
    warningTime.setMinutes(warningTime.getMinutes() - task.warningOffset);
    
    // Task is due soon if current time is after warning time but before due date
    return now >= warningTime && now < dueDate;
  },
  
  // Check if a task is overdue
  isTaskOverdue(task) {
    const dueDate = new Date(task.dueDate);
    const now = new Date();
    
    return now > dueDate && task.taskStatus !== 'COMPLETED' && task.taskStatus !== 'CANCELLED';
  },
  
  // Format due date for display
  formatDueDateForDisplay(task) {
    const dueDate = new Date(task.dueDate);
    const now = new Date();
    const tomorrow = new Date(now);
    tomorrow.setDate(tomorrow.getDate() + 1);
    
    // Today
    if (dueDate.toDateString() === now.toDateString()) {
      return `Today at ${dueDate.toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' })}`;
    }
    
    // Tomorrow
    if (dueDate.toDateString() === tomorrow.toDateString()) {
      return `Tomorrow at ${dueDate.toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' })}`;
    }
    
    // Within 7 days
    const sevenDays = new Date(now);
    sevenDays.setDate(sevenDays.getDate() + 7);
    
    if (dueDate < sevenDays) {
      const options = { weekday: 'long', hour: '2-digit', minute: '2-digit' };
      return dueDate.toLocaleString([], options);
    }
    
    // Default format
    const options = { weekday: 'short', month: 'short', day: 'numeric', hour: '2-digit', minute: '2-digit' };
    return dueDate.toLocaleString([], options);
  }
};

// Usage examples
console.log('API Date:', TaskDateUtils.formatForApi(new Date()));
console.log('Due date (3 days from now at 5 PM):', TaskDateUtils.createDueDate(3));

const task = {
  taskId: 1,
  taskTitle: 'Example Task',
  dueDate: '2025-06-10T17:00:00-05:00',
  warningOffset: 120,
  taskStatus: 'IN_PROGRESS'
};

console.log('Is task due soon?', TaskDateUtils.isTaskDueSoon(task));
console.log('Is task overdue?', TaskDateUtils.isTaskOverdue(task));
console.log('Formatted due date:', TaskDateUtils.formatDueDateForDisplay(task));
```

## Python examples

### API client

A comprehensive API client class for Python applications:

```python
import requests
from datetime import datetime, timedelta
import json

class TaskManagementClient:
    def __init__(self, base_url, token):
        self.base_url = base_url
        self.token = token
        self.headers = {
            'Authorization': f'Bearer {token}',
            'Content-Type': 'application/json'
        }
    
    # User operations
    def get_users(self, page=0, per_page=20, sort=None):
        url = f"{self.base_url}/users?_page={page}&_perPage={per_page}"
        
        if sort:
            url += f"&_sort={sort}"
        
        response = requests.get(url, headers=self.headers)
        response.raise_for_status()
        
        return response.json()
    
    def get_user(self, user_id):
        url = f"{self.base_url}/users/{user_id}"
        response = requests.get(url, headers=self.headers)
        response.raise_for_status()
        
        return response.json()
    
    def create_user(self, user_data):
        url = f"{self.base_url}/users"
        response = requests.post(url, headers=self.headers, json=user_data)
        response.raise_for_status()
        
        return response.json()
    
    def update_user(self, user_id, updates):
        url = f"{self.base_url}/users/{user_id}"
        response = requests.patch(url, headers=self.headers, json=updates)
        response.raise_for_status()
        
        return response.json()
    
    def delete_user(self, user_id):
        url = f"{self.base_url}/users/{user_id}"
        response = requests.delete(url, headers={
            'Authorization': self.headers['Authorization']
        })
        response.raise_for_status()
        
        return response.status_code == 204
    
    # Task operations
    def get_tasks(self, page=0, per_page=20, sort=None, status=None):
        url = f"{self.base_url}/tasks?_page={page}&_perPage={per_page}"
        
        if sort:
            url += f"&_sort={sort}"
        
        if status:
            url += f"&taskStatus={status}"
        
        response = requests.get(url, headers=self.headers)
        response.raise_for_status()
        
        return response.json()
    
    def get_task(self, task_id):
        url = f"{self.base_url}/tasks/{task_id}"
        response = requests.get(url, headers=self.headers)
        response.raise_for_status()
        
        return response.json()
    
    def create_task(self, task_data):
        url = f"{self.base_url}/tasks"
        response = requests.post(url, headers=self.headers, json=task_data)
        response.raise_for_status()
        
        return response.json()
    
    def update_task(self, task_id, updates):
        url = f"{self.base_url}/tasks/{task_id}"
        response = requests.patch(url, headers=self.headers, json=updates)
        response.raise_for_status()
        
        return response.json()
    
    def delete_task(self, task_id):
        url = f"{self.base_url}/tasks/{task_id}"
        response = requests.delete(url, headers={
            'Authorization': self.headers['Authorization']
        })
        response.raise_for_status()
        
        return response.status_code == 204
    
    # Task status operations
    def update_task_status(self, task_id, status):
        return self.update_task(task_id, {'taskStatus': status})
    
    def complete_task(self, task_id):
        return self.update_task_status(task_id, 'COMPLETED')
    
    def start_task(self, task_id):
        return self.update_task_status(task_id, 'IN_PROGRESS')
    
    def block_task(self, task_id, reason=None):
        task = self.get_task(task_id)
        
        updates = {'taskStatus': 'BLOCKED'}
        
        if reason:
            description = task.get('taskDescription', '')
            updates['taskDescription'] = f"{description} BLOCKED: {reason}".strip()
        
        return self.update_task(task_id, updates)

# Usage
api_client = TaskManagementClient('http://localhost:3000', 'your-token-here')

# Example: Create a user and a task
def create_user_and_task():
    try:
        # Create a user
        user = api_client.create_user({
            'firstName': 'John',
            'lastName': 'Doe',
            'contactEmail': 'john.doe@example.com'
        })
        
        print('User created:', user)
        
        # Create a task for the user
        due_date = (datetime.now() + timedelta(days=7)).isoformat()
        
        task = api_client.create_task({
            'userId': user['userId'],
            'taskTitle': 'Complete API integration',
            'taskDescription': 'Integrate the Task Management API into our application',
            'dueDate': due_date,
            'warningOffset': 120
        })
        
        print('Task created:', task)
        
        # Start the task
        started_task = api_client.start_task(task['taskId'])
        print('Task started:', started_task)
        
        return {'user': user, 'task': started_task}
    except requests.exceptions.RequestException as e:
        print('Error:', str(e))
        raise

# Run the example
if __name__ == '__main__':
    try:
        result = create_user_and_task()
        print('Operation completed successfully')
    except Exception as e:
        print('Operation failed:', str(e))
```

### Error handling

Example of error handling with exception classes:

```python
import requests
import json

# Custom exceptions
class ApiError(Exception):
    """Base exception for API errors"""
    
    def __init__(self, message, status_code=None, error_code=None, details=None, request_id=None):
        super().__init__(message)
        self.status_code = status_code
        self.error_code = error_code
        self.details = details
        self.request_id = request_id

class ResourceNotFoundError(ApiError):
    """Raised when a resource is not found (404)"""
    pass

class ValidationError(ApiError):
    """Raised when validation fails (400 with specific error codes)"""
    pass

class AuthenticationError(ApiError):
    """Raised when authentication fails (401)"""
    pass

class AuthorizationError(ApiError):
    """Raised when authorization fails (403)"""
    pass

class RateLimitError(ApiError):
    """Raised when rate limit is exceeded (429)"""
    
    def __init__(self, message, status_code=429, error_code=None, details=None, request_id=None, retry_after=None):
        super().__init__(message, status_code, error_code, details, request_id)
        self.retry_after = retry_after

class ServerError(ApiError):
    """Raised when server error occurs (500)"""
    pass

# Error handler function
def handle_api_response(response):
    """Handle API response and raise appropriate exceptions for errors"""
    
    if response.ok:
        if response.status_code == 204:
            return None
        else:
            return response.json()
    
    # Try to parse error response
    try:
        error_data = response.json()
        error_code = error_data.get('code')
        message = error_data.get('message', f'API request failed with status: {response.status_code}')
        details = error_data.get('details')
        request_id = error_data.get('requestId')
    except (json.JSONDecodeError, ValueError):
        # If parsing fails, create generic error info
        error_code = 'UNKNOWN_ERROR'
        message = f'API request failed with status: {response.status_code}'
        details = None
        request_id = None
    
    # Raise appropriate exception based on status code
    if response.status_code == 404:
        raise ResourceNotFoundError(message, response.status_code, error_code, details, request_id)
    elif response.status_code == 400:
        if error_code in ['INVALID_FIELD', 'MISSING_REQUIRED_FIELD']:
            raise ValidationError(message, response.status_code, error_code, details, request_id)
        else:
            raise ApiError(message, response.status_code, error_code, details, request_id)
    elif response.status_code == 401:
        raise AuthenticationError(message, response.status_code, error_code, details, request_id)
    elif response.status_code == 403:
        raise AuthorizationError(message, response.status_code, error_code, details, request_id)
    elif response.status_code == 429:
        retry_after = response.headers.get('Retry-After')
        if retry_after:
            try:
                retry_after = int(retry_after)
            except ValueError:
                retry_after = None
        
        raise RateLimitError(message, response.status_code, error_code, details, request_id, retry_after)
    elif response.status_code >= 500:
        raise ServerError(message, response.status_code, error_code, details, request_id)
    else:
        raise ApiError(message, response.status_code, error_code, details, request_id)

# Usage example
def fetch_task(task_id):
    try:
        response = requests.get(
            f'http://localhost:3000/tasks/{task_id}',
            headers={'Authorization': 'Bearer your-token-here'}
        )
        
        return handle_api_response(response)
    except ResourceNotFoundError:
        print(f'Task {task_id} not found')
        # Handle missing task
    except AuthenticationError:
        print('Authentication failed, please log in again')
        # Handle authentication failure
    except RateLimitError as e:
        retry_seconds = e.retry_after or 5
        print(f'Rate limit exceeded. Retrying in {retry_seconds} seconds...')
        # Implement retry logic
    except ApiError as e:
        print(f'API error ({e.status_code}): {str(e)}')
        # Handle other API errors
    except Exception as e:
        print(f'Unexpected error: {str(e)}')
        # Handle unexpected errors
    
    # Return None or raise exception based on your error handling strategy
    return None

# Try fetching a task
task = fetch_task(1)
if task:
    print('Task found:', task)
```

### Date utilities

Helper functions for handling dates and times:

```python
from datetime import datetime, timedelta

class TaskDateUtils:
    @staticmethod
    def format_for_api(dt):
        """Format a datetime object for API requests"""
        if isinstance(dt, str):
            # Try to parse string to datetime
            dt = datetime.fromisoformat(dt.replace('Z', '+00:00'))
        
        return dt.isoformat()
    
    @staticmethod
    def create_due_date(days_from_now, hour=17, minute=0):
        """Create a due date a specific number of days in the future"""
        dt = datetime.now() + timedelta(days=days_from_now)
        dt = dt.replace(hour=hour, minute=minute, second=0, microsecond=0)
        
        return dt
    
    @staticmethod
    def is_task_due_soon(task):
        """Check if a task is due soon (within the warning period)"""
        due_date = datetime.fromisoformat(task['dueDate'].replace('Z', '+00:00'))
        now = datetime.now()
        
        # Calculate warning time (dueDate minus warningOffset minutes)
        warning_offset = task.get('warningOffset', 0)
        warning_time = due_date - timedelta(minutes=warning_offset)
        
        # Task is due soon if current time is after warning time but before due date
        return now >= warning_time and now < due_date
    
    @staticmethod
    def is_task_overdue(task):
        """Check if a task is overdue"""
        due_date = datetime.fromisoformat(task['dueDate'].replace('Z', '+00:00'))
        now = datetime.now()
        
        completed_statuses = ['COMPLETED', 'CANCELLED']
        
        return now > due_date and task.get('taskStatus') not in completed_statuses
    
    @staticmethod
    def format_due_date_for_display(task):
        """Format due date for display"""
        due_date = datetime.fromisoformat(task['dueDate'].replace('Z', '+00:00'))
        now = datetime.now()
        tomorrow = now + timedelta(days=1)
        
        # Set time components to midnight for date comparisons
        now_date = now.replace(hour=0, minute=0, second=0, microsecond=0)
        tomorrow_date = tomorrow.replace(hour=0, minute=0, second=0, microsecond=0)
        due_date_day = due_date.replace(hour=0, minute=0, second=0, microsecond=0)
        
        # Today
        if due_date_day == now_date:
            return f"Today at {due_date.strftime('%I:%M %p')}"
        
        # Tomorrow
        if due_date_day == tomorrow_date:
            return f"Tomorrow at {due_date.strftime('%I:%M %p')}"
        
        # Within 7 days
        seven_days = now + timedelta(days=7)
        seven_days_date = seven_days.replace(hour=0, minute=0, second=0, microsecond=0)
        
        if due_date_day < seven_days_date:
            return due_date.strftime('%A at %I:%M %p')
        
        # Default format
        return due_date.strftime('%a, %b %d at %I:%M %p')

# Usage examples
print('API Date:', TaskDateUtils.format_for_api(datetime.now()))
print('Due date (3 days from now at 5 PM):', TaskDateUtils.create_due_date(3))

task = {
    'taskId': 1,
    'taskTitle': 'Example Task',
    'dueDate': '2025-06-10T17:00:00-05:00',
    'warningOffset': 120,
    'taskStatus': 'IN_PROGRESS'
}

print('Is task due soon?', TaskDateUtils.is_task_due_soon(task))
print('Is task overdue?', TaskDateUtils.is_task_overdue(task))
print('Formatted due date:', TaskDateUtils.format_due_date_for_display(task))
```

## cURL examples

### User operations

#### Create a user

```bash
curl -X POST http://localhost:3000/users \
  -H "Authorization: Bearer your-token-here" \
  -H "Content-Type: application/json" \
  -d '{
    "firstName": "John",
    "lastName": "Doe",
    "contactEmail": "john.doe@example.com"
  }'
```

#### Get all users

```bash
curl -X GET "http://localhost:3000/users?_page=0&_perPage=10&_sort=lastName" \
  -H "Authorization: Bearer your-token-here"
```

#### Get a user by ID

```bash
curl -X GET http://localhost:3000/users/1 \
  -H "Authorization: Bearer your-token-here"
```

#### Update a user

```bash
curl -X PATCH http://localhost:3000/users/1 \
  -H "Authorization: Bearer your-token-here" \
  -H "Content-Type: application/json" \
  -d '{
    "contactEmail": "john.updated@example.com"
  }'
```

#### Delete a user

```bash
curl -X DELETE http://localhost:3000/users/1 \
  -H "Authorization: Bearer your-token-here"
```

### Task operations

#### Create a task

```bash
curl -X POST http://localhost:3000/tasks \
  -H "Authorization: Bearer your-token-here" \
  -H "Content-Type: application/json" \
  -d '{
    "userId": 1,
    "taskTitle": "Complete project proposal",
    "taskDescription": "Finish the proposal for the new client project",
    "dueDate": "2025-06-15T17:00:00-05:00",
    "warningOffset": 120
  }'
```

#### Get all tasks

```bash
curl -X GET "http://localhost:3000/tasks?_page=0&_perPage=10&_sort=-dueDate&taskStatus=IN_PROGRESS" \
  -H "Authorization: Bearer your-token-here"
```

#### Get a task by ID

```bash
curl -X GET http://localhost:3000/tasks/1 \
  -H "Authorization: Bearer your-token-here"
```

#### Update a task

```bash
curl -X PATCH http://localhost:3000/tasks/1 \
  -H "Authorization: Bearer your-token-here" \
  -H "Content-Type: application/json" \
  -d '{
    "taskStatus": "COMPLETED"
  }'
```

#### Delete a task

```bash
curl -X DELETE http://localhost:3000/tasks/1 \
  -H "Authorization: Bearer your-token-here"
```

### Batch operations script

A shell script to perform batch operations:

```bash
#!/bin/bash

# Configuration
API_URL="http://localhost:3000"
TOKEN="your-token-here"
AUTH_HEADER="Authorization: Bearer $TOKEN"

# Function to create a user
create_user() {
  local first_name=$1
  local last_name=$2
  local email=$3
  
  echo "Creating user: $first_name $last_name ($email)..."
  
  local response=$(curl -s -X POST "$API_URL/users" \
    -H "$AUTH_HEADER" \
    -H "Content-Type: application/json" \
    -d "{
      \"firstName\": \"$first_name\",
      \"lastName\": \"$last_name\",
      \"contactEmail\": \"$email\"
    }")
  
  local user_id=$(echo $response | jq -r '.userId')
  echo "User created with ID: $user_id"
  
  echo $user_id
}

# Function to create a task for user
create_task() {
  local user_id=$1
  local title=$2
  local description=$3
  local due_date=$4
  local warning_offset=$5
  
  echo "Creating task: $title for user $user_id..."
  
  local response=$(curl -s -X POST "$API_URL/tasks" \
    -H "$AUTH_HEADER" \
    -H "Content-Type: application/json" \
    -d "{
      \"userId\": $user_id,
      \"taskTitle\": \"$title\",
      \"taskDescription\": \"$description\",
      \"dueDate\": \"$due_date\",
      \"warningOffset\": $warning_offset
    }")
  
  local task_id=$(echo $response | jq -r '.taskId')
  echo "Task created with ID: $task_id"
  
  echo $task_id
}

# Function to update task status
update_task_status() {
  local task_id=$1
  local status=$2
  
  echo "Updating task $task_id status to $status..."
  
  curl -s -X PATCH "$API_URL/tasks/$task_id" \
    -H "$AUTH_HEADER" \
    -H "Content-Type: application/json" \
    -d "{
      \"taskStatus\": \"$status\"
    }" > /dev/null
  
  echo "Task $task_id status updated to $status"
}

# Create users
echo "=== Creating Users ==="
user1_id=$(create_user "Jane" "Smith" "jane.smith@example.com")
user2_id=$(create_user "John" "Doe" "john.doe@example.com")
echo ""

# Create tasks
echo "=== Creating Tasks ==="

# Create tasks for user 1
task1_id=$(create_task $user1_id "Complete project proposal" "Finish the proposal for the new client project" "2025-06-15T17:00:00-05:00" 120)
task2_id=$(create_task $user1_id "Schedule team meeting" "Set up weekly sync-up with the development team" "2025-06-10T10:00:00-05:00" 60)

# Create tasks for user 2
task3_id=$(create_task $user2_id "Review contract terms" "Go through the contract and identify any potential issues" "2025-06-20T12:00:00-05:00" 120)
task4_id=$(create_task $user2_id "Prepare for client presentation" "Create slides for the upcoming client presentation" "2025-06-25T15:00:00-05:00" 1440)
echo ""

# Update task statuses
echo "=== Updating Task Statuses ==="
update_task_status $task1_id "IN_PROGRESS"
update_task_status $task2_id "COMPLETED"
update_task_status $task3_id "BLOCKED"
echo ""

# Retrieve all tasks
echo "=== Retrieving All Tasks ==="
curl -s -X GET "$API_URL/tasks" \
  -H "$AUTH_HEADER" | jq '.tasks | map({id: .taskId, title: .taskTitle, status: .taskStatus})'
echo ""

echo "Batch operations completed successfully!"
```

## Next steps

After exploring these code examples, you might want to:

1. **Create a client library**: Build a reusable client library for your specific programming language
2. **Implement a UI**: Use these examples as a foundation for a user interface
3. **Integrate with your application**: Adapt these examples to fit your application's architecture
4. **Explore advanced techniques**: Check out the [Advanced topics](../advanced.md) section for more sophisticated implementation patterns

## Related resources

- [API reference](../api-reference.md)
- [Task management workflow](../tutorials/task-management-workflow.md)
- [Optimizing API usage](../advanced/optimizing-api-usage.md)--- FILE: advanced.md ---
---
title: "Advanced Topics"
description: "Advanced considerations for working with the Task Management API, including optimization, security, and data consistency."
tags: ["advanced", "optimization", "security"]
categories: ["advanced"]
importance: 6
has_toc: false
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 20, 2025"
nav_order: "7"
layout: "default"
version: "v1.0.0"
lastUpdated: "May 20, 2025"
---

# Advanced Topics

This section covers advanced considerations for working with the Task Management API. These topics are intended for developers who are already familiar with the API basics and want to optimize their implementation.

## Performance optimization

Performance optimization is critical for providing a responsive user experience. The [Optimizing API usage](advanced/optimizing-api-usage.md) guide covers techniques for reducing latency and minimizing server load:

- Implementing client-side caching
- Using pagination effectively
- Minimizing the number of API requests
- Batch operations best practices

## Security

Security is a crucial aspect of any API integration. The [Security best practices](advanced/security-best-practices.md) guide provides recommendations for keeping your implementation secure:

- Secure token handling
- Authorization best practices
- Input validation
- Handling sensitive data
- Preventing common vulnerabilities

## Data consistency

Maintaining data consistency is important for providing a reliable user experience. The [Handling data consistency](advanced/handling-data-consistency.md) guide covers strategies for dealing with concurrency issues:

- Optimistic vs. pessimistic concurrency control
- Handling race conditions
- Implementing retry logic
- Conflict resolution strategies

## Available advanced guides

| Guide | Description | Key topics |
|-------|-------------|-----------|
| [Optimizing API usage](advanced/optimizing-api-usage.md) | Best practices for efficient API usage | Caching, batching, performance |
| [Security best practices](advanced/security-best-practices.md) | Advanced security considerations | Authentication, authorization, input validation |
| [Handling data consistency](advanced/handling-data-consistency.md) | Strategies for maintaining data consistency | Concurrency, race conditions, conflict resolution |

## Further reading

After exploring these advanced topics, you might want to check out:

- [Developer resources](developer-resources.md) for additional tools and examples
- [API reference](api-reference.md) for detailed endpoint documentation
- [Support resources](support/support-resources.md) if you encounter advanced issues


