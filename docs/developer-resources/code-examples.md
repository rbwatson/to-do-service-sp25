---
title: "Code examples"
description: "Example code for common operations in various programming languages including JavaScript, Python, and more."
tags: ["code", "examples"]
categories: ["developer-resources"]
importance: 7
parent: "Developer Resources"
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "2025-05-13"
nav_order: "3"
layout: "default"
version: "v1.0.0"
lastUpdated: "2025-05-13"
---

# Code Examples

This page provides code examples for common operations with the Task Management API in different programming languages. Use these examples as a starting point for integrating the API into your applications.

## Authentication

First, you'll need to authenticate your requests. All examples assume you have an API key stored in a variable called `API_KEY`.

### JavaScript

```javascript
const API_KEY = 'your_api_key';
const headers = {
  'Authorization': `Bearer ${API_KEY}`,
  'Content-Type': 'application/json'
};
```

### Python

```python
API_KEY = 'your_api_key'
headers = {
    'Authorization': f'Bearer {API_KEY}',
    'Content-Type': 'application/json'
}
```

### cURL

```bash
# You can store your API key in a variable for reuse
API_KEY="your_api_key"
```

## User Operations

### Get All Users

#### JavaScript

```javascript
// Using Fetch API
async function getAllUsers() {
  try {
    const response = await fetch('https://api.taskmanagement.example.com/v1/users', {
      headers: {
        'Authorization': `Bearer ${API_KEY}`
      }
    });
    
    if (!response.ok) {
      throw new Error(`HTTP error! Status: ${response.status}`);
    }
    
    const data = await response.json();
    return data;
  } catch (error) {
    console.error('Error fetching users:', error);
    throw error;
  }
}

// Usage
getAllUsers()
  .then(result => {
    console.log(`Found ${result.data.length} users`);
    console.log(result.data);
  })
  .catch(error => console.error(error));
```

#### Python

```python
import requests

def get_all_users():
    url = 'https://api.taskmanagement.example.com/v1/users'
    headers = {
        'Authorization': f'Bearer {API_KEY}'
    }
    
    response = requests.get(url, headers=headers)
    
    # Raise exception for error status codes
    response.raise_for_status()
    
    return response.json()

# Usage
try:
    result = get_all_users()
    print(f"Found {len(result['data'])} users")
    print(result['data'])
except requests.exceptions.RequestException as e:
    print(f"Error fetching users: {e}")
```

#### cURL

```bash
curl -X GET "https://api.taskmanagement.example.com/v1/users" \
  -H "Authorization: Bearer $API_KEY"
```

### Create a User

#### JavaScript

```javascript
// Using Fetch API
async function createUser(userData) {
  try {
    const response = await fetch('https://api.taskmanagement.example.com/v1/users', {
      method: 'POST',
      headers: {
        'Authorization': `Bearer ${API_KEY}`,
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(userData)
    });
    
    if (!response.ok) {
      throw new Error(`HTTP error! Status: ${response.status}`);
    }
    
    const data = await response.json();
    return data;
  } catch (error) {
    console.error('Error creating user:', error);
    throw error;
  }
}

// Usage
const userData = {
  name: 'John Doe',
  email: 'john.doe@example.com',
  role: 'member'
};

createUser(userData)
  .then(user => console.log('User created:', user))
  .catch(error => console.error(error));
```

#### Python

```python
import requests

def create_user(user_data):
    url = 'https://api.taskmanagement.example.com/v1/users'
    headers = {
        'Authorization': f'Bearer {API_KEY}',
        'Content-Type': 'application/json'
    }
    
    response = requests.post(url, json=user_data, headers=headers)
    
    # Raise exception for error status codes
    response.raise_for_status()
    
    return response.json()

# Usage
try:
    user_data = {
        'name': 'John Doe',
        'email': 'john.doe@example.com',
        'role': 'member'
    }
    user = create_user(user_data)
    print('User created:', user)
except requests.exceptions.RequestException as e:
    print(f"Error creating user: {e}")
```

#### cURL

```bash
curl -X POST "https://api.taskmanagement.example.com/v1/users" \
  -H "Authorization: Bearer $API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "John Doe",
    "email": "john.doe@example.com",
    "role": "member"
  }'
```

### Get a User by ID

#### JavaScript

```javascript
// Using Fetch API
async function getUserById(userId) {
  try {
    const response = await fetch(`https://api.taskmanagement.example.com/v1/users/${userId}`, {
      headers: {
        'Authorization': `Bearer ${API_KEY}`
      }
    });
    
    if (response.status === 404) {
      return null; // User not found
    }
    
    if (!response.ok) {
      throw new Error(`HTTP error! Status: ${response.status}`);
    }
    
    const data = await response.json();
    return data;
  } catch (error) {
    console.error('Error fetching user:', error);
    throw error;
  }
}

// Usage
const userId = 'user123';
getUserById(userId)
  .then(user => {
    if (user) {
      console.log('User found:', user);
    } else {
      console.log(`User with ID ${userId} not found`);
    }
  })
  .catch(error => console.error(error));
```

#### Python

```python
import requests

def get_user_by_id(user_id):
    url = f'https://api.taskmanagement.example.com/v1/users/{user_id}'
    headers = {
        'Authorization': f'Bearer {API_KEY}'
    }
    
    response = requests.get(url, headers=headers)
    
    if response.status_code == 404:
        return None  # User not found
    
    # Raise exception for other error status codes
    response.raise_for_status()
    
    return response.json()

# Usage
try:
    user_id = 'user123'
    user = get_user_by_id(user_id)
    if user:
        print('User found:', user)
    else:
        print(f"User with ID {user_id} not found")
except requests.exceptions.RequestException as e:
    print(f"Error fetching user: {e}")
```

#### cURL

```bash
curl -X GET "https://api.taskmanagement.example.com/v1/users/user123" \
  -H "Authorization: Bearer $API_KEY"
```

## Task Operations

### Get All Tasks

#### JavaScript

```javascript
// Using Fetch API
async function getAllTasks(queryParams = {}) {
  try {
    // Convert query parameters to URL search params
    const params = new URLSearchParams();
    Object.entries(queryParams).forEach(([key, value]) => {
      params.append(key, value);
    });
    
    const url = `https://api.taskmanagement.example.com/v1/tasks${params.toString() ? '?' + params.toString() : ''}`;
    
    const response = await fetch(url, {
      headers: {
        'Authorization': `Bearer ${API_KEY}`
      }
    });
    
    if (!response.ok) {
      throw new Error(`HTTP error! Status: ${response.status}`);
    }
    
    const data = await response.json();
    return data;
  } catch (error) {
    console.error('Error fetching tasks:', error);
    throw error;
  }
}

// Usage - get all tasks
getAllTasks()
  .then(result => {
    console.log(`Found ${result.data.length} tasks`);
    console.log(result.data);
  })
  .catch(error => console.error(error));

// Usage - get filtered tasks
getAllTasks({
  status: 'TODO,IN_PROGRESS',
  assigneeId: 'user123',
  limit: 10,
  offset: 0
})
  .then(result => {
    console.log(`Found ${result.data.length} tasks`);
    console.log(result.data);
  })
  .catch(error => console.error(error));
```

#### Python

```python
import requests

def get_all_tasks(query_params=None):
    url = 'https://api.taskmanagement.example.com/v1/tasks'
    headers = {
        'Authorization': f'Bearer {API_KEY}'
    }
    
    response = requests.get(url, params=query_params, headers=headers)
    
    # Raise exception for error status codes
    response.raise_for_status()
    
    return response.json()

# Usage - get all tasks
try:
    result = get_all_tasks()
    print(f"Found {len(result['data'])} tasks")
    print(result['data'])
except requests.exceptions.RequestException as e:
    print(f"Error fetching tasks: {e}")

# Usage - get filtered tasks
try:
    params = {
        'status': 'TODO,IN_PROGRESS',
        'assigneeId': 'user123',
        'limit': 10,
        'offset': 0
    }
    result = get_all_tasks(params)
    print(f"Found {len(result['data'])} tasks")
    print(result['data'])
except requests.exceptions.RequestException as e:
    print(f"Error fetching tasks: {e}")
```

#### cURL

```bash
# Get all tasks
curl -X GET "https://api.taskmanagement.example.com/v1/tasks" \
  -H "Authorization: Bearer $API_KEY"

# Get filtered tasks
curl -X GET "https://api.taskmanagement.example.com/v1/tasks?status=TODO,IN_PROGRESS&assigneeId=user123&limit=10&offset=0" \
  -H "Authorization: Bearer $API_KEY"
```

### Create a Task

#### JavaScript

```javascript
// Using Fetch API
async function createTask(taskData) {
  try {
    const response = await fetch('https://api.taskmanagement.example.com/v1/tasks', {
      method: 'POST',
      headers: {
        'Authorization': `Bearer ${API_KEY}`,
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(taskData)
    });
    
    if (!response.ok) {
      throw new Error(`HTTP error! Status: ${response.status}`);
    }
    
    const data = await response.json();
    return data;
  } catch (error) {
    console.error('Error creating task:', error);
    throw error;
  }
}

// Usage
const taskData = {
  title: 'Implement API integration',
  description: 'Connect our app to the Task Management API',
  status: 'TODO',
  priority: 'HIGH',
  assigneeId: 'user123',
  dueDate: '2025-06-15T10:00:00Z'
};

createTask(taskData)
  .then(task => console.log('Task created:', task))
  .catch(error => console.error(error));
```

#### Python

```python
import requests

def create_task(task_data):
    url = 'https://api.taskmanagement.example.com/v1/tasks'
    headers = {
        'Authorization': f'Bearer {API_KEY}',
        'Content-Type': 'application/json'
    }
    
    response = requests.post(url, json=task_data, headers=headers)
    
    # Raise exception for error status codes
    response.raise_for_status()
    
    return response.json()

# Usage
try:
    task_data = {
        'title': 'Implement API integration',
        'description': 'Connect our app to the Task Management API',
        'status': 'TODO',
        'priority': 'HIGH',
        'assigneeId': 'user123',
        'dueDate': '2025-06-15T10:00:00Z'
    }
    task = create_task(task_data)
    print('Task created:', task)
except requests.exceptions.RequestException as e:
    print(f"Error creating task: {e}")
```

#### cURL

```bash
curl -X POST "https://api.taskmanagement.example.com/v1/tasks" \
  -H "Authorization: Bearer $API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "title": "Implement API integration",
    "description": "Connect our app to the Task Management API",
    "status": "TODO",
    "priority": "HIGH",
    "assigneeId": "user123",
    "dueDate": "2025-06-15T10:00:00Z"
  }'
```

### Update a Task Status

#### JavaScript

```javascript
// Using Fetch API
async function updateTaskStatus(taskId, newStatus) {
  try {
    const response = await fetch(`https://api.taskmanagement.example.com/v1/tasks/${taskId}`, {
      method: 'PATCH',
      headers: {
        'Authorization': `Bearer ${API_KEY}`,
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({ status: newStatus })
    });
    
    if (!response.ok) {
      throw new Error(`HTTP error! Status: ${response.status}`);
    }
    
    const data = await response.json();
    return data;
  } catch (error) {
    console.error('Error updating task status:', error);
    throw error;
  }
}

// Usage
const taskId = 'task123';
updateTaskStatus(taskId, 'IN_PROGRESS')
  .then(task => console.log(`Task ${taskId} status updated to:`, task.status))
  .catch(error => console.error(error));
```

#### Python

```python
import requests

def update_task_status(task_id, new_status):
    url = f'https://api.taskmanagement.example.com/v1/tasks/{task_id}'
    headers = {
        'Authorization': f'Bearer {API_KEY}',
        'Content-Type': 'application/json'
    }
    
    data = {'status': new_status}
    
    response = requests.patch(url, json=data, headers=headers)
    
    # Raise exception for error status codes
    response.raise_for_status()
    
    return response.json()

# Usage
try:
    task_id = 'task123'
    task = update_task_status(task_id, 'IN_PROGRESS')
    print(f"Task {task_id} status updated to: {task['status']}")
except requests.exceptions.RequestException as e:
    print(f"Error updating task status: {e}")
```

#### cURL

```bash
curl -X PATCH "https://api.taskmanagement.example.com/v1/tasks/task123" \
  -H "Authorization: Bearer $API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "status": "IN_PROGRESS"
  }'
```

## Complete Application Example

### JavaScript

Here's a more complete example that demonstrates error handling and a basic task workflow:

```javascript
// API Client for Task Management API
class TaskManagementClient {
  constructor(apiKey, baseUrl = 'https://api.taskmanagement.example.com/v1') {
    this.apiKey = apiKey;
    this.baseUrl = baseUrl;
    this.headers = {
      'Authorization': `Bearer ${this.apiKey}`,
      'Content-Type': 'application/json'
    };
  }
  
  // Error handler
  async handleResponse(response) {
    if (response.status === 204) {
      return null; // No content
    }
    
    if (!response.ok) {
      const errorData = await response.json();
      throw new Error(`API Error (${response.status}): ${errorData.error?.message || 'Unknown error'}`);
    }
    
    return response.json();
  }
  
  // User operations
  async getUsers(queryParams = {}) {
    const params = new URLSearchParams();
    Object.entries(queryParams).forEach(([key, value]) => {
      params.append(key, value);
    });
    
    const url = `${this.baseUrl}/users${params.toString() ? '?' + params.toString() : ''}`;
    const response = await fetch(url, { headers: this.headers });
    return this.handleResponse(response);
  }
  
  async createUser(userData) {
    const response = await fetch(`${this.baseUrl}/users`, {
      method: 'POST',
      headers: this.headers,
      body: JSON.stringify(userData)
    });
    return this.handleResponse(response);
  }
  
  // Task operations
  async getTasks(queryParams = {}) {
    const params = new URLSearchParams();
    Object.entries(queryParams).forEach(([key, value]) => {
      params.append(key, value);
    });
    
    const url = `${this.baseUrl}/tasks${params.toString() ? '?' + params.toString() : ''}`;
    const response = await fetch(url, { headers: this.headers });
    return this.handleResponse(response);
  }
  
  async createTask(taskData) {
    const response = await fetch(`${this.baseUrl}/tasks`, {
      method: 'POST',
      headers: this.headers,
      body: JSON.stringify(taskData)
    });
    return this.handleResponse(response);
  }
  
  async updateTask(taskId, taskData) {
    const response = await fetch(`${this.baseUrl}/tasks/${taskId}`, {
      method: 'PATCH',
      headers: this.headers,
      body: JSON.stringify(taskData)
    });
    return this.handleResponse(response);
  }
  
  async deleteTask(taskId) {
    const response = await fetch(`${this.baseUrl}/tasks/${taskId}`, {
      method: 'DELETE',
      headers: this.headers
    });
    
    if (response.status === 204) {
      return true; // Successfully deleted
    }
    
    await this.handleResponse(response);
    return true;
  }
}

// Usage example
async function taskWorkflowExample() {
  const client = new TaskManagementClient('your_api_key');
  
  try {
    // 1. Create a user
    console.log('Creating a user...');
    const user = await client.createUser({
      name: 'Alice Smith',
      email: 'alice.smith@example.com',
      role: 'member'
    });
    console.log('User created:', user);
    
    // 2. Create a task assigned to the user
    console.log('\nCreating a task...');
    const task = await client.createTask({
      title: 'Complete documentation',
      description: 'Finish the API documentation with examples',
      priority: 'HIGH',
      assigneeId: user.id,
      dueDate: '2025-06-01T17:00:00Z'
    });
    console.log('Task created:', task);
    
    // 3. Update the task status to IN_PROGRESS
    console.log('\nUpdating task status...');
    const updatedTask = await client.updateTask(task.id, {
      status: 'IN_PROGRESS'
    });
    console.log('Task updated:', updatedTask);
    
    // 4. Get all tasks for the user
    console.log('\nFetching user tasks...');
    const tasksResult = await client.getTasks({
      assigneeId: user.id
    });
    console.log(`User has ${tasksResult.data.length} task(s):`);
    console.log(tasksResult.data);
    
  } catch (error) {
    console.error('Workflow failed:', error.message);
  }
}

// Run the example
taskWorkflowExample();
```

### Python

Here's a more complete example with a similar workflow:

```python
import requests
import json

class TaskManagementClient:
    def __init__(self, api_key, base_url='https://api.taskmanagement.example.com/v1'):
        self.api_key = api_key
        self.base_url = base_url
        self.headers = {
            'Authorization': f'Bearer {self.api_key}',
            'Content-Type': 'application/json'
        }
    
    def _handle_response(self, response):
        if response.status_code == 204:
            return None  # No content
        
        # Raise exception for error status codes
        if not response.ok:
            error_data = response.json()
            error_message = error_data.get('error', {}).get('message', 'Unknown error')
            raise Exception(f"API Error ({response.status_code}): {error_message}")
        
        return response.json()
    
    # User operations
    def get_users(self, **query_params):
        url = f"{self.base_url}/users"
        response = requests.get(url, params=query_params, headers=self.headers)
        return self._handle_response(response)
    
    def create_user(self, user_data):
        url = f"{self.base_url}/users"
        response = requests.post(url, json=user_data, headers=self.headers)
        return self._handle_response(response)
    
    # Task operations
    def get_tasks(self, **query_params):
        url = f"{self.base_url}/tasks"
        response = requests.get(url, params=query_params, headers=self.headers)
        return self._handle_response(response)
    
    def create_task(self, task_data):
        url = f"{self.base_url}/tasks"
        response = requests.post(url, json=task_data, headers=self.headers)
        return self._handle_response(response)
    
    def update_task(self, task_id, task_data):
        url = f"{self.base_url}/tasks/{task_id}"
        response = requests.patch(url, json=task_data, headers=self.headers)
        return self._handle_response(response)
    
    def delete_task(self, task_id):
        url = f"{self.base_url}/tasks/{task_id}"
        response = requests.delete(url, headers=self.headers)
        
        if response.status_code == 204:
            return True  # Successfully deleted
        
        self._handle_response(response)
        return True

# Usage example
def task_workflow_example():
    client = TaskManagementClient('your_api_key')
    
    try:
        # 1. Create a user
        print('Creating a user...')
        user = client.create_user({
            'name': 'Alice Smith',
            'email': 'alice.smith@example.com',
            'role': 'member'
        })
        print('User created:', user)
        
        # 2. Create a task assigned to the user
        print('\nCreating a task...')
        task = client.create_task({
            'title': 'Complete documentation',
            'description': 'Finish the API documentation with examples',
            'priority': 'HIGH',
            'assigneeId': user['id'],
            'dueDate': '2025-06-01T17:00:00Z'
        })
        print('Task created:', task)
        
        # 3. Update the task status to IN_PROGRESS
        print('\nUpdating task status...')
        updated_task = client.update_task(task['id'], {
            'status': 'IN_PROGRESS'
        })
        print('Task updated:', updated_task)
        
        # 4. Get all tasks for the user
        print('\nFetching user tasks...')
        tasks_result = client.get_tasks(assigneeId=user['id'])
        print(f"User has {len(tasks_result['data'])} task(s):")
        print(json.dumps(tasks_result['data'], indent=2))
        
    except Exception as e:
        print(f"Workflow failed: {e}")

# Run the example
if __name__ == "__main__":
    task_workflow_example()
```

## See Also

- [Getting Started with the Task Management API](/getting-started.md)
- [API Reference](/api-reference.md)
- [User Resource](/resources/user-resource.md)
- [Task Resource](/resources/task-resource.md)


