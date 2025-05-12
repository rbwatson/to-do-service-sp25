---
title: "Code examples"
description: "Example code for common operations in various programming languages including JavaScript, Python, and more."
tags: ["code", "examples"]
categories: ["developer-resources"]
importance: 7
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 12, 2025"
navOrder: 3
---

# Code examples

This document provides ready-to-use code examples for common operations with the Task Management API in various programming languages. You can use these examples as a starting point for your own implementation.

## JavaScript/TypeScript examples

### Authentication and setup

```javascript
// API client setup with authentication
class TaskApiClient {
  constructor(baseUrl, token) {
    this.baseUrl = baseUrl;
    this.token = token;
  }

  async request(endpoint, method = 'GET', data = null) {
    const url = `${this.baseUrl}${endpoint}`;
    
    const options = {
      method,
      headers: {
        'Authorization': `Bearer ${this.token}`,
        'Content-Type': 'application/json'
      }
    };
    
    if (data && (method === 'POST' || method === 'PATCH')) {
      options.body = JSON.stringify(data);
    }
    
    try {
      const response = await fetch(url, options);
      
      if (response.status === 204) {
        return true; // No content but successful
      }
      
      if (!response.ok) {
        const errorData = await response.json();
        throw new Error(`API Error (${response.status}): ${errorData.message}`);
      }
      
      return await response.json();
    } catch (error) {
      console.error('API Request Failed:', error);
      throw error;
    }
  }
  
  // User endpoints
  async getUsers(page = 0, perPage = 20, sort = null) {
    let endpoint = `/users?_page=${page}&_perPage=${perPage}`;
    if (sort) endpoint += `&_sort=${sort}`;
    const result = await this.request(endpoint);
    return result.users;
  }
  
  async getUserById(userId) {
    return this.request(`/users/${userId}`);
  }
  
  async createUser(userData) {
    return this.request('/users', 'POST', userData);
  }
  
  async updateUser(userId, userData) {
    return this.request(`/users/${userId}`, 'PATCH', userData);
  }
  
  async deleteUser(userId) {
    return this.request(`/users/${userId}`, 'DELETE');
  }
  
  // Task endpoints
  async getTasks(page = 0, perPage = 20, sort = null, status = null) {
    let endpoint = `/tasks?_page=${page}&_perPage=${perPage}`;
    if (sort) endpoint += `&_sort=${sort}`;
    if (status) endpoint += `&taskStatus=${status}`;
    const result = await this.request(endpoint);
    return result.tasks;
  }
  
  async getTaskById(taskId) {
    return this.request(`/tasks/${taskId}`);
  }
  
  async createTask(taskData) {
    return this.request('/tasks', 'POST', taskData);
  }
  
  async updateTask(taskId, taskData) {
    return this.request(`/tasks/${taskId}`, 'PATCH', taskData);
  }
  
  async deleteTask(taskId) {
    return this.request(`/tasks/${taskId}`, 'DELETE');
  }
}

// Usage example
const apiClient = new TaskApiClient('http://localhost:3000', 'YOUR_TOKEN');
```

### User management example

```javascript
// User management examples
async function userManagementExample() {
  try {
    // Create a user
    const newUser = await apiClient.createUser({
      firstName: "Jane",
      lastName: "Smith",
      contactEmail: "jane.smith@example.com"
    });
    console.log('User created:', newUser);
    
    // Get all users
    const users = await apiClient.getUsers();
    console.log('All users:', users);
    
    // Update user
    const updatedUser = await apiClient.updateUser(newUser.userId, {
      contactEmail: "jane.updated@example.com"
    });
    console.log('Updated user:', updatedUser);
    
    // Get specific user
    const user = await apiClient.getUserById(newUser.userId);
    console.log('User details:', user);
    
    // Delete user
    await apiClient.deleteUser(newUser.userId);
    console.log('User deleted successfully');
    
  } catch (error) {
    console.error('Error in user management example:', error);
  }
}
```

### Task management example

```javascript
// Task management examples
async function taskManagementExample() {
  try {
    // First, ensure we have a user
    const user = await apiClient.createUser({
      firstName: "Task",
      lastName: "Owner",
      contactEmail: "task.owner@example.com"
    });
    
    // Create a new task
    const newTask = await apiClient.createTask({
      userId: user.userId,
      taskTitle: "Example Task",
      taskDescription: "This is an example task for the code example",
      dueDate: "2025-12-31T23:59:59Z",
      warningOffset: 1440 // 24 hours before due date
    });
    console.log('Task created:', newTask);
    
    // Get all tasks
    const tasks = await apiClient.getTasks();
    console.log('All tasks:', tasks);
    
    // Get tasks by status
    const inProgressTasks = await apiClient.getTasks(0, 20, 'dueDate', 'IN_PROGRESS');
    console.log('In-progress tasks:', inProgressTasks);
    
    // Update task status
    const updatedTask = await apiClient.updateTask(newTask.taskId, {
      taskStatus: "IN_PROGRESS"
    });
    console.log('Task updated:', updatedTask);
    
    // Complete task
    const completedTask = await apiClient.updateTask(newTask.taskId, {
      taskStatus: "COMPLETED"
    });
    console.log('Task completed:', completedTask);
    
    // Delete task
    await apiClient.deleteTask(newTask.taskId);
    console.log('Task deleted successfully');
    
    // Clean up - delete user
    await apiClient.deleteUser(user.userId);
    
  } catch (error) {
    console.error('Error in task management example:', error);
  }
}
```

### React component example

```jsx
// React component example
import React, { useState, useEffect } from 'react';

// Task List Component
function TaskList() {
  const [tasks, setTasks] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  
  useEffect(() => {
    async function fetchTasks() {
      try {
        setLoading(true);
        // Assuming apiClient is available in the context or imported
        const taskData = await apiClient.getTasks(0, 50, 'dueDate');
        setTasks(taskData);
        setError(null);
      } catch (err) {
        setError('Failed to load tasks: ' + err.message);
      } finally {
        setLoading(false);
      }
    }
    
    fetchTasks();
  }, []);
  
  const updateTaskStatus = async (taskId, newStatus) => {
    try {
      setLoading(true);
      await apiClient.updateTask(taskId, { taskStatus: newStatus });
      
      // Update local state with the new status
      setTasks(prevTasks => 
        prevTasks.map(task => 
          task.taskId === taskId ? { ...task, taskStatus: newStatus } : task
        )
      );
      
    } catch (err) {
      setError('Failed to update task: ' + err.message);
    } finally {
      setLoading(false);
    }
  };
  
  if (loading && tasks.length === 0) return <div>Loading tasks...</div>;
  if (error) return <div className="error">{error}</div>;
  if (tasks.length === 0) return <div>No tasks found</div>;
  
  return (
    <div className="task-list">
      <h2>Tasks</h2>
      {loading && <div className="loading-overlay">Updating...</div>}
      
      <ul>
        {tasks.map(task => (
          <li key={task.taskId} className={`task-item status-${task.taskStatus.toLowerCase()}`}>
            <h3>{task.taskTitle}</h3>
            <p>{task.taskDescription}</p>
            <div className="task-meta">
              <span>Due: {new Date(task.dueDate).toLocaleString()}</span>
              <span>Status: {task.taskStatus}</span>
            </div>
            
            <div className="task-actions">
              {task.taskStatus === 'NOT_STARTED' && (
                <button 
                  onClick={() => updateTaskStatus(task.taskId, 'IN_PROGRESS')}
                >
                  Start Task
                </button>
              )}
              
              {task.taskStatus === 'IN_PROGRESS' && (
                <button 
                  onClick={() => updateTaskStatus(task.taskId, 'COMPLETED')}
                >
                  Complete Task
                </button>
              )}
              
              {task.taskStatus === 'IN_PROGRESS' && (
                <button 
                  onClick={() => updateTaskStatus(task.taskId, 'BLOCKED')}
                >
                  Block Task
                </button>
              )}
            </div>
          </li>
        ))}
      </ul>
    </div>
  );
}

export default TaskList;
```

## Python examples

### Client setup

```python
import requests
import json
from datetime import datetime

class TaskApiClient:
    def __init__(self, base_url, token):
        self.base_url = base_url
        self.token = token
        self.headers = {
            'Authorization': f'Bearer {token}',
            'Content-Type': 'application/json'
        }
    
    def request(self, endpoint, method='GET', data=None, params=None):
        url = f"{self.base_url}{endpoint}"
        
        try:
            if method == 'GET':
                response = requests.get(url, headers=self.headers, params=params)
            elif method == 'POST':
                response = requests.post(url, headers=self.headers, json=data)
            elif method == 'PATCH':
                response = requests.patch(url, headers=self.headers, json=data)
            elif method == 'DELETE':
                response = requests.delete(url, headers=self.headers)
            else:
                raise ValueError(f"Unsupported HTTP method: {method}")
            
            if response.status_code == 204:
                return True  # No content but successful
            
            if not response.ok:
                error_data = response.json()
                raise Exception(f"API Error ({response.status_code}): {error_data.get('message', 'Unknown error')}")
            
            return response.json()
        
        except requests.exceptions.RequestException as e:
            print(f"Request failed: {e}")
            raise
    
    # User endpoints
    def get_users(self, page=0, per_page=20, sort=None):
        params = {
            '_page': page,
            '_perPage': per_page
        }
        
        if sort:
            params['_sort'] = sort
        
        result = self.request('/users', params=params)
        return result.get('users', [])
    
    def get_user_by_id(self, user_id):
        return self.request(f'/users/{user_id}')
    
    def create_user(self, user_data):
        return self.request('/users', method='POST', data=user_data)
    
    def update_user(self, user_id, user_data):
        return self.request(f'/users/{user_id}', method='PATCH', data=user_data)
    
    def delete_user(self, user_id):
        return self.request(f'/users/{user_id}', method='DELETE')
    
    # Task endpoints
    def get_tasks(self, page=0, per_page=20, sort=None, status=None):
        params = {
            '_page': page,
            '_perPage': per_page
        }
        
        if sort:
            params['_sort'] = sort
        
        if status:
            params['taskStatus'] = status
        
        result = self.request('/tasks', params=params)
        return result.get('tasks', [])
    
    def get_task_by_id(self, task_id):
        return self.request(f'/tasks/{task_id}')
    
    def create_task(self, task_data):
        return self.request('/tasks', method='POST', data=task_data)
    
    def update_task(self, task_id, task_data):
        return self.request(f'/tasks/{task_id}', method='PATCH', data=task_data)
    
    def delete_task(self, task_id):
        return self.request(f'/tasks/{task_id}', method='DELETE')

# Usage example
api_client = TaskApiClient('http://localhost:3000', 'YOUR_TOKEN')
```

### User management example

```python
# User management example
def user_management_example():
    try:
        # Create a user
        new_user = api_client.create_user({
            "firstName": "John",
            "lastName": "Python",
            "contactEmail": "john.python@example.com"
        })
        print("User created:", new_user)
        
        # Get all users
        users = api_client.get_users()
        print(f"Found {len(users)} users:")
        for user in users:
            print(f"- {user['firstName']} {user['lastName']} ({user['contactEmail']})")
        
        # Update user
        updated_user = api_client.update_user(new_user['userId'], {
            "contactEmail": "john.updated@example.com"
        })
        print("User updated:", updated_user)
        
        # Get specific user
        user = api_client.get_user_by_id(new_user['userId'])
        print("User details:", user)
        
        # Delete user
        api_client.delete_user(new_user['userId'])
        print("User deleted successfully")
        
    except Exception as e:
        print(f"Error in user management example: {e}")

# Run the example
if __name__ == "__main__":
    user_management_example()
```

### Task management example

```python
# Task management example
def task_management_example():
    try:
        # First, ensure we have a user
        user = api_client.create_user({
            "firstName": "Task",
            "lastName": "Owner",
            "contactEmail": "task.python@example.com"
        })
        
        # Create a new task
        new_task = api_client.create_task({
            "userId": user['userId'],
            "taskTitle": "Python Example Task",
            "taskDescription": "This is an example task created with Python",
            "dueDate": "2025-12-31T23:59:59Z",
            "warningOffset": 1440  # 24 hours before due date
        })
        print("Task created:", new_task)
        
        # Get all tasks
        tasks = api_client.get_tasks()
        print(f"Found {len(tasks)} tasks")
        
        # Update task status
        updated_task = api_client.update_task(new_task['taskId'], {
            "taskStatus": "IN_PROGRESS"
        })
        print("Task updated:", updated_task)
        
        # Get tasks by status
        in_progress_tasks = api_client.get_tasks(status="IN_PROGRESS")
        print(f"Found {len(in_progress_tasks)} tasks in progress")
        
        # Complete task
        completed_task = api_client.update_task(new_task['taskId'], {
            "taskStatus": "COMPLETED"
        })
        print("Task completed:", completed_task)
        
        # Delete task
        api_client.delete_task(new_task['taskId'])
        print("Task deleted successfully")
        
        # Clean up - delete user
        api_client.delete_user(user['userId'])
        
    except Exception as e:
        print(f"Error in task management example: {e}")

# Run the example
if __name__ == "__main__":
    task_management_example()
```

### CLI tool example

```python
import argparse
import json
from datetime import datetime, timedelta

def create_cli():
    parser = argparse.ArgumentParser(description='Task Management CLI')
    subparsers = parser.add_subparsers(dest='command', help='Commands')
    
    # User commands
    user_parser = subparsers.add_parser('user', help='User management')
    user_subparsers = user_parser.add_subparsers(dest='subcommand', help='User commands')
    
    # User list
    user_list = user_subparsers.add_parser('list', help='List users')
    user_list.add_argument('--page', type=int, default=0, help='Page number')
    user_list.add_argument('--per-page', type=int, default=20, help='Items per page')
    user_list.add_argument('--sort', help='Sort field')
    
    # User get
    user_get = user_subparsers.add_parser('get', help='Get user by ID')
    user_get.add_argument('id', type=int, help='User ID')
    
    # User create
    user_create = user_subparsers.add_parser('create', help='Create user')
    user_create.add_argument('--first-name', required=True, help='First name')
    user_create.add_argument('--last-name', required=True, help='Last name')
    user_create.add_argument('--email', required=True, help='Email address')
    
    # User update
    user_update = user_subparsers.add_parser('update', help='Update user')
    user_update.add_argument('id', type=int, help='User ID')
    user_update.add_argument('--first-name', help='First name')
    user_update.add_argument('--last-name', help='Last name')
    user_update.add_argument('--email', help='Email address')
    
    # User delete
    user_delete = user_subparsers.add_parser('delete', help='Delete user')
    user_delete.add_argument('id', type=int, help='User ID')
    
    # Task commands
    task_parser = subparsers.add_parser('task', help='Task management')
    task_subparsers = task_parser.add_subparsers(dest='subcommand', help='Task commands')
    
    # Task list
    task_list = task_subparsers.add_parser('list', help='List tasks')
    task_list.add_argument('--page', type=int, default=0, help='Page number')
    task_list.add_argument('--per-page', type=int, default=20, help='Items per page')
    task_list.add_argument('--sort', help='Sort field')
    task_list.add_argument('--status', help='Filter by status')
    
    # Task get
    task_get = task_subparsers.add_parser('get', help='Get task by ID')
    task_get.add_argument('id', type=int, help='Task ID')
    
    # Task create
    task_create = task_subparsers.add_parser('create', help='Create task')
    task_create.add_argument('--user-id', type=int, required=True, help='User ID')
    task_create.add_argument('--title', required=True, help='Task title')
    task_create.add_argument('--description', help='Task description')
    task_create.add_argument('--status', default='NOT_STARTED', help='Task status')
    task_create.add_argument('--due-days', type=int, default=7, help='Days until due')
    task_create.add_argument('--warning-offset', type=int, default=60, help='Warning offset in minutes')
    
    # Task update
    task_update = task_subparsers.add_parser('update', help='Update task')
    task_update.add_argument('id', type=int, help='Task ID')
    task_update.add_argument('--title', help='Task title')
    task_update.add_argument('--description', help='Task description')
    task_update.add_argument('--status', help='Task status')
    task_update.add_argument('--due-days', type=int, help='Days until due')
    task_update.add_argument('--warning-offset', type=int, help='Warning offset in minutes')
    
    # Task delete
    task_delete = task_subparsers.add_parser('delete', help='Delete task')
    task_delete.add_argument('id', type=int, help='Task ID')
    
    return parser

def handle_command(args):
    # Initialize the API client
    api_client = TaskApiClient('http://localhost:3000', 'YOUR_TOKEN')
    
    if args.command == 'user':
        handle_user_command(args, api_client)
    elif args.command == 'task':
        handle_task_command(args, api_client)
    else:
        print("Invalid command. Use --help for usage information.")

def handle_user_command(args, api_client):
    if args.subcommand == 'list':
        users = api_client.get_users(page=args.page, per_page=args.per_page, sort=args.sort)
        print(json.dumps(users, indent=2))
    
    elif args.subcommand == 'get':
        user = api_client.get_user_by_id(args.id)
        print(json.dumps(user, indent=2))
    
    elif args.subcommand == 'create':
        user_data = {
            "firstName": args.first_name,
            "lastName": args.last_name,
            "contactEmail": args.email
        }
        user = api_client.create_user(user_data)
        print(json.dumps(user, indent=2))
    
    elif args.subcommand == 'update':
        user_data = {}
        if args.first_name:
            user_data["firstName"] = args.first_name
        if args.last_name:
            user_data["lastName"] = args.last_name
        if args.email:
            user_data["contactEmail"] = args.email
        
        if user_data:
            user = api_client.update_user(args.id, user_data)
            print(json.dumps(user, indent=2))
        else:
            print("No update data provided")
    
    elif args.subcommand == 'delete':
        result = api_client.delete_user(args.id)
        print("User deleted successfully" if result else "Failed to delete user")
    
    else:
        print("Invalid user subcommand. Use 'user --help' for usage information.")

def handle_task_command(args, api_client):
    if args.subcommand == 'list':
        tasks = api_client.get_tasks(page=args.page, per_page=args.per_page, 
                                     sort=args.sort, status=args.status)
        print(json.dumps(tasks, indent=2))
    
    elif args.subcommand == 'get':
        task = api_client.get_task_by_id(args.id)
        print(json.dumps(task, indent=2))
    
    elif args.subcommand == 'create':
        # Calculate due date
        due_date = (datetime.now() + timedelta(days=args.due_days)).isoformat()
        
        task_data = {
            "userId": args.user_id,
            "taskTitle": args.title,
            "taskStatus": args.status,
            "dueDate": due_date,
            "warningOffset": args.warning_offset
        }
        
        if args.description:
            task_data["taskDescription"] = args.description
        
        task = api_client.create_task(task_data)
        print(json.dumps(task, indent=2))
    
    elif args.subcommand == 'update':
        task_data = {}
        
        if args.title:
            task_data["taskTitle"] = args.title
        
        if args.description:
            task_data["taskDescription"] = args.description
        
        if args.status:
            task_data["taskStatus"] = args.status
        
        if args.due_days is not None:
            due_date = (datetime.now() + timedelta(days=args.due_days)).isoformat()
            task_data["dueDate"] = due_date
        
        if args.warning_offset is not None:
            task_data["warningOffset"] = args.warning_offset
        
        if task_data:
            task = api_client.update_task(args.id, task_data)
            print(json.dumps(task, indent=2))
        else:
            print("No update data provided")
    
    elif args.subcommand == 'delete':
        result = api_client.delete_task(args.id)
        print("Task deleted successfully" if result else "Failed to delete task")
    
    else:
        print("Invalid task subcommand. Use 'task --help' for usage information.")

# Run the CLI
if __name__ == "__main__":
    parser = create_cli()
    args = parser.parse_args()
    
    if args.command:
        handle_command(args)
    else:
        parser.print_help()
```

## Java examples

### Client setup

```java
import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.time.Duration;
import java.util.HashMap;
import java.util.Map;
import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.node.ObjectNode;

public class TaskApiClient {
    private final String baseUrl;
    private final String token;
    private final HttpClient httpClient;
    private final ObjectMapper objectMapper;
    
    public TaskApiClient(String baseUrl, String token) {
        this.baseUrl = baseUrl;
        this.token = token;
        this.httpClient = HttpClient.newBuilder()
                .version(HttpClient.Version.HTTP_2)
                .connectTimeout(Duration.ofSeconds(10))
                .build();
        this.objectMapper = new ObjectMapper();
    }
    
    private HttpResponse<String> request(String endpoint, String method, String jsonBody) 
            throws IOException, InterruptedException {
        String url = baseUrl + endpoint;
        
        HttpRequest.Builder requestBuilder = HttpRequest.newBuilder()
                .uri(URI.create(url))
                .header("Authorization", "Bearer " + token)
                .header("Content-Type", "application/json");
        
        if (method.equals("GET")) {
            requestBuilder.GET();
        } else if (method.equals("DELETE")) {
            requestBuilder.DELETE();
        } else if (method.equals("POST") || method.equals("PATCH")) {
            requestBuilder.method(method, HttpRequest.BodyPublishers.ofString(
                    jsonBody != null ? jsonBody : "{}"));
        }
        
        HttpRequest request = requestBuilder.build();
        
        return httpClient.send(request, HttpResponse.BodyHandlers.ofString());
    }
    
    // Helper method to handle responses
    private JsonNode handleResponse(HttpResponse<String> response) throws IOException {
        if (response.statusCode() == 204) {
            // No content - success
            return null;
        }
        
        if (response.statusCode() < 200 || response.statusCode() >= 300) {
            JsonNode errorNode = objectMapper.readTree(response.body());
            String errorMessage = errorNode.has("message") 
                ? errorNode.get("message").asText() 
                : "Unknown error";
            throw new IOException("API Error (" + response.statusCode() + "): " + errorMessage);
        }
        
        if (response.body() == null || response.body().isEmpty()) {
            return null;
        }
        
        return objectMapper.readTree(response.body());
    }
    
    // User endpoints
    public List<JsonNode> getUsers(int page, int perPage, String sort) 
            throws IOException, InterruptedException {
        String endpoint = String.format("/users?_page=%d&_perPage=%d", page, perPage);
        if (sort != null && !sort.isEmpty()) {
            endpoint += "&_sort=" + sort;
        }
        
        HttpResponse<String> response = request(endpoint, "GET", null);
        JsonNode rootNode = handleResponse(response);
        
        List<JsonNode> users = new ArrayList<>();
        if (rootNode != null && rootNode.has("users")) {
            JsonNode usersNode = rootNode.get("users");
            if (usersNode.isArray()) {
                for (JsonNode user : usersNode) {
                    users.add(user);
                }
            }
        }
        
        return users;
    }
    
    public JsonNode getUserById(int userId) throws IOException, InterruptedException {
        String endpoint = "/users/" + userId;
        HttpResponse<String> response = request(endpoint, "GET", null);
        return handleResponse(response);
    }
    
    public JsonNode createUser(String firstName, String lastName, String contactEmail) 
            throws IOException, InterruptedException {
        ObjectNode userNode = objectMapper.createObjectNode();
        userNode.put("firstName", firstName);
        userNode.put("lastName", lastName);
        userNode.put("contactEmail", contactEmail);
        
        String jsonBody = objectMapper.writeValueAsString(userNode);
        HttpResponse<String> response = request("/users", "POST", jsonBody);
        return handleResponse(response);
    }
    
    public JsonNode updateUser(int userId, Map<String, String> updates) 
            throws IOException, InterruptedException {
        ObjectNode updateNode = objectMapper.createObjectNode();
        for (Map.Entry<String, String> entry : updates.entrySet()) {
            updateNode.put(entry.getKey(), entry.getValue());
        }
        
        String jsonBody = objectMapper.writeValueAsString(updateNode);
        HttpResponse<String> response = request("/users/" + userId, "PATCH", jsonBody);
        return handleResponse(response);
    }
    
    public boolean deleteUser(int userId) throws IOException, InterruptedException {
        HttpResponse<String> response = request("/users/" + userId, "DELETE", null);
        return response.statusCode() == 204;
    }
    
    // Task endpoints
    public List<JsonNode> getTasks(int page, int perPage, String sort, String status) 
            throws IOException, InterruptedException {
        String endpoint = String.format("/tasks?_page=%d&_perPage=%d", page, perPage);
        if (sort != null && !sort.isEmpty()) {
            endpoint += "&_sort=" + sort;
        }
        if (status != null && !status.isEmpty()) {
            endpoint += "&taskStatus=" + status;
        }
        
        HttpResponse<String> response = request(endpoint, "GET", null);
        JsonNode rootNode = handleResponse(response);
        
        List<JsonNode> tasks = new ArrayList<>();
        if (rootNode != null && rootNode.has("tasks")) {
            JsonNode tasksNode = rootNode.get("tasks");
            if (tasksNode.isArray()) {
                for (JsonNode task : tasksNode) {
                    tasks.add(task);
                }
            }
        }
        
        return tasks;
    }
    
    public JsonNode getTaskById(int taskId) throws IOException, InterruptedException {
        String endpoint = "/tasks/" + taskId;
        HttpResponse<String> response = request(endpoint, "GET", null);
        return handleResponse(response);
    }
    
    public JsonNode createTask(int userId, String title, String description, 
                              String status, String dueDate, int warningOffset) 
            throws IOException, InterruptedException {
        ObjectNode taskNode = objectMapper.createObjectNode();
        taskNode.put("userId", userId);
        taskNode.put("taskTitle", title);
        
        if (description != null && !description.isEmpty()) {
            taskNode.put("taskDescription", description);
        }
        
        if (status != null && !status.isEmpty()) {
            taskNode.put("taskStatus", status);
        }
        
        taskNode.put("dueDate", dueDate);
        taskNode.put("warningOffset", warningOffset);
        
        String jsonBody = objectMapper.writeValueAsString(taskNode);
        HttpResponse<String> response = request("/tasks", "POST", jsonBody);
        return handleResponse(response);
    }
    
    public JsonNode updateTask(int taskId, Map<String, Object> updates) 
            throws IOException, InterruptedException {
        ObjectNode updateNode = objectMapper.createObjectNode();
        for (Map.Entry<String, Object> entry : updates.entrySet()) {
            String key = entry.getKey();
            Object value = entry.getValue();
            
            if (value instanceof String) {
                updateNode.put(key, (String) value);
            } else if (value instanceof Integer) {
                updateNode.put(key, (Integer) value);
            } else if (value instanceof Boolean) {
                updateNode.put(key, (Boolean) value);
            }
        }
        
        String jsonBody = objectMapper.writeValueAsString(updateNode);
        HttpResponse<String> response = request("/tasks/" + taskId, "PATCH", jsonBody);
        return handleResponse(response);
    }
    
    public boolean deleteTask(int taskId) throws IOException, InterruptedException {
        HttpResponse<String> response = request("/tasks/" + taskId, "DELETE", null);
        return response.statusCode() == 204;
    }
}
```

### Usage example

```java
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.fasterxml.jackson.databind.JsonNode;

public class TaskApiExample {
    public static void main(String[] args) {
        TaskApiClient apiClient = new TaskApiClient("http://localhost:3000", "YOUR_TOKEN");
        
        try {
            // User example
            userExample(apiClient);
            
            // Task example
            taskExample(apiClient);
            
        } catch (Exception e) {
            System.err.println("Error: " + e.getMessage());
            e.printStackTrace();
        }
    }
    
    private static void userExample(TaskApiClient apiClient) throws IOException, InterruptedException {
        System.out.println("===== User Management Example =====");
        
        // Create a user
        System.out.println("\nCreating a user...");
        JsonNode newUser = apiClient.createUser("John", "Java", "john.java@example.com");
        System.out.println("User created: " + newUser);
        
        int userId = newUser.get("userId").asInt();
        
        // Get all users
        System.out.println("\nGetting all users...");
        List<JsonNode> users = apiClient.getUsers(0, 10, null);
        System.out.println("Found " + users.size() + " users");
        
        // Update user
        System.out.println("\nUpdating user...");
        Map<String, String> updates = new HashMap<>();
        updates.put("contactEmail", "john.updated@example.com");
        
        JsonNode updatedUser = apiClient.updateUser(userId, updates);
        System.out.println("User updated: " + updatedUser);
        
        // Get user by ID
        System.out.println("\nGetting user by ID...");
        JsonNode user = apiClient.getUserById(userId);
        System.out.println("User details: " + user);
        
        // We'll delete the user after the task example
    }
    
    private static void taskExample(TaskApiClient apiClient) throws IOException, InterruptedException {
        System.out.println("\n===== Task Management Example =====");
        
        // Create a user for tasks
        JsonNode user = apiClient.createUser("Task", "Owner", "task.java@example.com");
        int userId = user.get("userId").asInt();
        
        // Calculate due date (7 days from now)
        LocalDateTime dueDate = LocalDateTime.now().plusDays(7);
        String dueDateStr = dueDate.format(DateTimeFormatter.ISO_DATE_TIME);
        
        // Create a task
        System.out.println("\nCreating a task...");
        JsonNode newTask = apiClient.createTask(
            userId,
            "Java Example Task",
            "This is an example task created with Java",
            "NOT_STARTED",
            dueDateStr,
            60 // 1 hour warning
        );
        System.out.println("Task created: " + newTask);
        
        int taskId = newTask.get("taskId").asInt();
        
        // Get all tasks
        System.out.println("\nGetting all tasks...");
        List<JsonNode> tasks = apiClient.getTasks(0, 10, null, null);
        System.out.println("Found " + tasks.size() + " tasks");
        
        // Update task status
        System.out.println("\nUpdating task status...");
        Map<String, Object> taskUpdates = new HashMap<>();
        taskUpdates.put("taskStatus", "IN_PROGRESS");
        
        JsonNode updatedTask = apiClient.updateTask(taskId, taskUpdates);
        System.out.println("Task updated: " + updatedTask);
        
        // Get tasks by status
        System.out.println("\nGetting tasks by status...");
        List<JsonNode> inProgressTasks = apiClient.getTasks(0, 10, null, "IN_PROGRESS");
        System.out.println("Found " + inProgressTasks.size() + " in-progress tasks");
        
        // Complete the task
        System.out.println("\nCompleting the task...");
        taskUpdates.clear();
        taskUpdates.put("taskStatus", "COMPLETED");
        
        JsonNode completedTask = apiClient.updateTask(taskId, taskUpdates);
        System.out.println("Task completed: " + completedTask);
        
        // Delete the task
        System.out.println("\nDeleting the task...");
        boolean taskDeleted = apiClient.deleteTask(taskId);
        System.out.println("Task deleted: " + taskDeleted);
        
        // Delete the user
        System.out.println("\nDeleting the user...");
        boolean userDeleted = apiClient.deleteUser(userId);
        System.out.println("User deleted: " + userDeleted);
    }
}
```

## Additional examples and resources

For more examples and language implementations, refer to:

- [Getting started with users](../tutorials/getting-started-with-users.html)
- [Task management workflow](../tutorials/task-management-workflow.html)
- [GitHub repository](https://github.com/example/task-management-api-examples) with additional examples

### Testing examples

The examples provided are for illustration purposes. In a production environment, consider implementing:

- Proper error handling
- Logging
- Test coverage
- Configuration management
- Security best practices

For guidance on these topics, see the following documentation:

- [Error handling](../core-concepts/error-handling.html)
- [Security best practices](../advanced/security-best-practices.html)
- [Optimizing API usage](../advanced/optimizing-api-usage.html)


