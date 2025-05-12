---
title: "Create a task"
description: "API endpoint to create a new task in the system."
tags: ["tasks", "endpoint", "POST"]
categories: ["api-reference"]
importance: 7
api_endpoints: ["/tasks"]
related_pages: ["task-resource", "task-status-lifecycle"]
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 12, 2025"
navOrder: 8
---

# Create a task

The `POST /tasks` endpoint creates a new task in the system. This endpoint allows you to add a task that belongs to a specific user with details such as title, description, due date, and warning offset.

## Endpoint

```
POST /tasks
```

## Authentication

This endpoint requires authentication. Include the bearer token in the request header:

```
Authorization: Bearer YOUR_TOKEN
```

## Request body

The request body must be a JSON object with the following properties:

| Property | Type | Required | Description | Constraints |
|----------|------|----------|-------------|-------------|
| `userId` | integer | Yes | ID of the user who owns the task | Must reference existing user |
| `taskTitle` | string | Yes | Short description of the task | 1-80 characters |
| `taskDescription` | string | No | Detailed description of the task | 1-255 characters |
| `taskStatus` | string | No | Current status of the task | One of predefined values |
| `dueDate` | string (date-time) | Yes | When the task should be completed | ISO 8601 format |
| `warningOffset` | integer | Yes | Minutes before due date to send reminder | 0-64000 |

### Default values

- `taskStatus`: If not provided, defaults to `NOT_STARTED`

### Example request body

```json
{
  "userId": 1,
  "taskTitle": "Complete API documentation",
  "taskDescription": "Finish the task management API documentation for the developer portal",
  "dueDate": "2025-05-15T17:00:00-05:00",
  "warningOffset": 60
}
```

## Request example

```http
POST /tasks HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
Content-Type: application/json

{
  "userId": 1,
  "taskTitle": "Complete API documentation",
  "taskDescription": "Finish the task management API documentation for the developer portal",
  "dueDate": "2025-05-15T17:00:00-05:00",
  "warningOffset": 60
}
```

## Response

### Success response (201 Created)

If the task is created successfully, the API returns a `201 Created` status code and the complete task object, including the system-generated `taskId` and default values for any omitted fields:

```json
{
  "taskId": 5,
  "userId": 1,
  "taskTitle": "Complete API documentation",
  "taskDescription": "Finish the task management API documentation for the developer portal",
  "taskStatus": "NOT_STARTED",
  "dueDate": "2025-05-15T17:00:00-05:00",
  "warningOffset": 60
}
```

### Error responses

| Status | Code | Description |
|--------|------|-------------|
| 400 | `INVALID_FIELD` | One or more fields have invalid values |
| 400 | `MISSING_REQUIRED_FIELD` | A required field is missing |
| 400 | `INVALID_USER_ID` | The specified user doesn't exist |
| 401 | `UNAUTHORIZED` | Authentication required |
| 403 | `FORBIDDEN` | Access denied |
| 429 | `RATE_LIMIT_EXCEEDED` | Too many requests |
| 500 | `SERVER_ERROR` | Server error |

For more information on error responses, see the [Error responses](error-responses.html) document.

## Response fields

The response contains the newly created task object with the following fields:

| Field | Type | Description |
|-------|------|-------------|
| `taskId` | integer | System-generated unique identifier for the task |
| `userId` | integer | ID of the user who owns the task |
| `taskTitle` | string | Short description of the task |
| `taskDescription` | string | Detailed description of the task |
| `taskStatus` | string | Current status of the task |
| `dueDate` | string (date-time) | When the task should be completed |
| `warningOffset` | integer | Minutes before due date to send reminder |

For more information about the task resource, see the [Task resource](../resources/task-resource.html) document.

## Validation rules

The API applies the following validation rules when creating a task:

- `userId` must reference an existing user
- `taskTitle` must be between 1 and 80 characters
- `taskDescription` must be between 1 and 255 characters, if provided
- `taskStatus` must be one of the valid status values, if provided
- `dueDate` must be in ISO 8601 format
- `warningOffset` must be between 0 and 64000
- All required fields must be provided

If validation fails, the API returns a `400 Bad Request` response with details about the validation errors:

```json
{
  "code": "INVALID_FIELD",
  "message": "The field `warningOffset` must be between 0 and 64000",
  "details": [
    {
      "field": "warningOffset",
      "reason": "Invalid range",
      "location": "body"
    }
  ],
  "requestId": "req-f8d31a62-e789-4856-9452-5efa50223c7a"
}
```

## Code examples

### cURL

```bash
curl -X POST \
  http://localhost:3000/tasks \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Content-Type: application/json' \
  -d '{
    "userId": 1,
    "taskTitle": "Complete API documentation",
    "taskDescription": "Finish the task management API documentation for the developer portal",
    "dueDate": "2025-05-15T17:00:00-05:00",
    "warningOffset": 60
  }'
```

### JavaScript

```javascript
async function createTask(taskData) {
  const response = await fetch('http://localhost:3000/tasks', {
    method: 'POST',
    headers: {
      'Authorization': 'Bearer YOUR_TOKEN',
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(taskData)
  });
  
  if (!response.ok) {
    const error = await response.json();
    throw new Error(error.message);
  }
  
  return await response.json();
}

// Example usage
const newTask = {
  userId: 1,
  taskTitle: "Complete API documentation",
  taskDescription: "Finish the task management API documentation for the developer portal",
  dueDate: "2025-05-15T17:00:00-05:00",
  warningOffset: 60
};

createTask(newTask)
  .then(task => console.log('Task created:', task))
  .catch(error => console.error('Failed to create task:', error));
```

### Python

```python
import requests
import json

def create_task(task_data):
    url = 'http://localhost:3000/tasks'
    
    headers = {
        'Authorization': 'Bearer YOUR_TOKEN',
        'Content-Type': 'application/json'
    }
    
    response = requests.post(url, headers=headers, json=task_data)
    
    if response.status_code != 201:
        error = response.json()
        raise Exception(error['message'])
    
    return response.json()

# Example usage
new_task = {
    "userId": 1,
    "taskTitle": "Complete API documentation",
    "taskDescription": "Finish the task management API documentation for the developer portal",
    "dueDate": "2025-05-15T17:00:00-05:00",
    "warningOffset": 60
}

try:
    task = create_task(new_task)
    print('Task created:', task)
except Exception as e:
    print('Failed to create task:', str(e))
```

## Common use cases

### Basic task creation

Create a simple task with just the required fields:

```json
{
  "userId": 1,
  "taskTitle": "Buy groceries",
  "dueDate": "2025-05-20T17:00:00-05:00",
  "warningOffset": 60
}
```

### Detailed task with specific status

Create a task with all fields and a specific initial status:

```json
{
  "userId": 1,
  "taskTitle": "Prepare quarterly report",
  "taskDescription": "Gather data, create charts, write executive summary",
  "taskStatus": "IN_PROGRESS",
  "dueDate": "2025-06-30T17:00:00-05:00",
  "warningOffset": 1440
}
```

## Next steps

After creating a task, you can:

- [Get task by ID](get-task-by-id.html) to retrieve the task
- [Update a task](update-task.html) to modify the task
- [Get all tasks](get-all-tasks.html) to view all tasks

## Related resources

- [Task resource](../resources/task-resource.html) - Detailed information about the task resource
- [Task status lifecycle](../core-concepts/task-status-lifecycle.html) - Understanding task statuses
- [User resource](../resources/user-resource.html) - Information about the user resource
- [Get all tasks](get-all-tasks.html) - Retrieve a list of all tasks
- [Get task by ID](get-task-by-id.html) - Retrieve a specific task
- [Update a task](update-task.html) - Update an existing task
- [Delete a task](delete-task.html) - Remove a task

## See also

- [Error handling](../core-concepts/error-handling.html) - How to handle API errors
- [Task management workflow](../tutorials/task-management-workflow.html) - Tutorial on task management


