---
title: "Update a task"
description: "API endpoint to update an existing task's information, including changing its status."
tags: ["tasks", "endpoint", "PATCH"]
categories: ["api-reference"]
importance: 7
api_endpoints: ["/tasks/{taskId}"]
related_pages: ["task-resource", "task-status-lifecycle"]
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 12, 2025"
navOrder: 10
---

# Update a task

The `PATCH /tasks/{taskId}` endpoint updates one or more properties of an existing task. This endpoint supports partial updates, allowing you to modify specific fields without affecting the others.

## Endpoint

```
PATCH /tasks/{taskId}
```

## Authentication

This endpoint requires authentication. Include the bearer token in the request header:

```
Authorization: Bearer YOUR_TOKEN
```

## Path parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `taskId` | integer | Yes | The unique identifier of the task to update |

## Request body

The request body should be a JSON object containing one or more task properties to update:

| Property | Type | Required | Description | Constraints |
|----------|------|----------|-------------|-------------|
| `userId` | integer | No | ID of the user who owns the task | Must reference existing user |
| `taskTitle` | string | No | Short description of the task | 1-80 characters |
| `taskDescription` | string | No | Detailed description of the task | 1-255 characters |
| `taskStatus` | string | No | Current status of the task | One of predefined values |
| `dueDate` | string (date-time) | No | When the task should be completed | ISO 8601 format |
| `warningOffset` | integer | No | Minutes before due date to send reminder | 0-64000 |

At least one property must be included in the request.

### Example request body

```json
{
  "taskStatus": "IN_PROGRESS"
}
```

## Request example

```http
PATCH /tasks/1 HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
Content-Type: application/json

{
  "taskStatus": "IN_PROGRESS"
}
```

## Response

### Success response (200 OK)

If the task is updated successfully, the API returns a `200 OK` status code and the complete updated task object:

```json
{
  "taskId": 1,
  "userId": 1,
  "taskTitle": "Grocery shopping",
  "taskDescription": "eggs, bacon, gummy bears",
  "taskStatus": "IN_PROGRESS",
  "dueDate": "2025-05-20T17:00:00-05:00",
  "warningOffset": 60
}
```

### Error responses

| Status | Code | Description |
|--------|------|-------------|
| 400 | `INVALID_FIELD` | One or more fields have invalid values |
| 400 | `MISSING_REQUIRED_FIELD` | No fields provided for update |
| 400 | `INVALID_USER_ID` | The specified user doesn't exist |
| 400 | `INVALID_STATUS` | The specified status is not valid |
| 401 | `UNAUTHORIZED` | Authentication required |
| 403 | `FORBIDDEN` | Access denied |
| 404 | `RESOURCE_NOT_FOUND` | Task not found |
| 429 | `RATE_LIMIT_EXCEEDED` | Too many requests |
| 500 | `SERVER_ERROR` | Server error |

For more information on error responses, see the [Error responses](error-responses.html) document.

#### Invalid status example (400)

```json
{
  "code": "INVALID_STATUS",
  "message": "The `taskStatus` value 'DONE' is not valid",
  "details": [
    {
      "field": "taskStatus",
      "reason": "Invalid value",
      "location": "body"
    }
  ],
  "requestId": "req-f8d31a62-e789-4856-9452-5efa50223c7a"
}
```

#### Task not found example (404)

```json
{
  "code": "RESOURCE_NOT_FOUND",
  "message": "Task with ID 999 could not be found",
  "requestId": "req-f8d31a62-e789-4856-9452-5efa50223c7a"
}
```

## Response fields

The response contains the updated task object with the following fields:

| Field | Type | Description |
|-------|------|-------------|
| `taskId` | integer | Unique identifier for the task |
| `userId` | integer | ID of the user who owns the task |
| `taskTitle` | string | Short description of the task |
| `taskDescription` | string | Detailed description of the task |
| `taskStatus` | string | Current status of the task |
| `dueDate` | string (date-time) | When the task should be completed |
| `warningOffset` | integer | Minutes before due date to send reminder |

For more information about the task resource, see the [Task resource](../resources/task-resource.html) document.

## Validation rules

The API applies the following validation rules when updating a task:

- At least one field must be provided for update
- `userId` must reference an existing user, if provided
- `taskTitle` must be between 1 and 80 characters, if provided
- `taskDescription` must be between 1 and 255 characters, if provided
- `taskStatus` must be one of the valid status values, if provided
- `dueDate` must be in ISO 8601 format, if provided
- `warningOffset` must be between 0 and 64000, if provided

If validation fails, the API returns a `400 Bad Request` response with details about the validation errors.

## Update behavior

- The update is partial, meaning only the fields included in the request will be modified
- Omitted fields retain their current values
- The `taskId` cannot be modified
- The response includes the complete task object with all fields, including those not modified

## Code examples

### cURL

```bash
curl -X PATCH \
  http://localhost:3000/tasks/1 \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Content-Type: application/json' \
  -d '{
    "taskStatus": "IN_PROGRESS"
  }'
```

### JavaScript

```javascript
async function updateTask(taskId, taskData) {
  const response = await fetch(`http://localhost:3000/tasks/${taskId}`, {
    method: 'PATCH',
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
const taskUpdates = {
  taskStatus: "IN_PROGRESS"
};

updateTask(1, taskUpdates)
  .then(task => console.log('Task updated:', task))
  .catch(error => console.error('Failed to update task:', error));
```

### Python

```python
import requests

def update_task(task_id, task_data):
    url = f'http://localhost:3000/tasks/{task_id}'
    
    headers = {
        'Authorization': 'Bearer YOUR_TOKEN',
        'Content-Type': 'application/json'
    }
    
    response = requests.patch(url, headers=headers, json=task_data)
    
    if response.status_code != 200:
        error = response.json()
        raise Exception(error['message'])
    
    return response.json()

# Example usage
task_updates = {
    "taskStatus": "IN_PROGRESS"
}

try:
    task = update_task(1, task_updates)
    print('Task updated:', task)
except Exception as e:
    print('Failed to update task:', str(e))
```

## Common use cases

### Update task status

The most common use case is updating a task's status as it progresses through its lifecycle:

```json
{
  "taskStatus": "COMPLETED"
}
```

For more information about task status values and transitions, see the [Task status lifecycle](../core-concepts/task-status-lifecycle.html) document.

### Update due date

Adjust a task's due date when a deadline changes:

```json
{
  "dueDate": "2025-06-01T17:00:00-05:00"
}
```

### Update task description

Add or modify details in a task's description:

```json
{
  "taskDescription": "Updated task description with more details"
}
```

### Transfer task to another user

Change the user who owns the task:

```json
{
  "userId": 2
}
```

## Related resources

- [Task resource](../resources/task-resource.html) - Detailed information about the task resource
- [Task status lifecycle](../core-concepts/task-status-lifecycle.html) - Understanding task statuses
- [Get all tasks](get-all-tasks.html) - Retrieve a list of all tasks
- [Get task by ID](get-task-by-id.html) - Retrieve a specific task
- [Create a task](create-task.html) - Create a new task
- [Delete a task](delete-task.html) - Remove a task

## See also

- [Error handling](../core-concepts/error-handling.html) - How to handle API errors
- [Task management workflow](../tutorials/task-management-workflow.html) - Tutorial on task management


