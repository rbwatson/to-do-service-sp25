---
title: "Get task by ID"
description: "API endpoint to retrieve a specific task by its unique identifier."
tags: ["tasks", "endpoint", "GET"]
categories: ["api-reference"]
importance: 7
api_endpoints: ["/tasks/{taskId}"]
related_pages: ["task-resource"]
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 12, 2025"
navOrder: 9
---

# Get task by ID

The `GET /tasks/{taskId}` endpoint retrieves a specific task by its unique identifier. This endpoint allows you to fetch detailed information about a single task.

## Endpoint

```
GET /tasks/{taskId}
```

## Authentication

This endpoint requires authentication. Include the bearer token in the request header:

```
Authorization: Bearer YOUR_TOKEN
```

## Path parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `taskId` | integer | Yes | The unique identifier of the task to retrieve |

## Request example

```http
GET /tasks/1 HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
```

## Response

### Success response (200 OK)

If the task exists, the API returns a `200 OK` status code and the task object:

```json
{
  "taskId": 1,
  "userId": 1,
  "taskTitle": "Grocery shopping",
  "taskDescription": "eggs, bacon, gummy bears",
  "taskStatus": "NOT_STARTED",
  "dueDate": "2025-05-20T17:00:00-05:00",
  "warningOffset": 60
}
```

### Error responses

| Status | Code | Description |
|--------|------|-------------|
| 400 | `INVALID_FIELD` | Invalid `taskId` format |
| 401 | `UNAUTHORIZED` | Authentication required |
| 403 | `FORBIDDEN` | Access denied |
| 404 | `RESOURCE_NOT_FOUND` | Task not found |
| 429 | `RATE_LIMIT_EXCEEDED` | Too many requests |
| 500 | `SERVER_ERROR` | Server error |

For more information on error responses, see the [Error responses](error-responses.html) document.

#### Not found response example (404)

```json
{
  "code": "RESOURCE_NOT_FOUND",
  "message": "Task with ID 999 could not be found",
  "requestId": "req-f8d31a62-e789-4856-9452-5efa50223c7a"
}
```

## Response fields

The response contains the task object with the following fields:

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

## Common use cases

### Task detail view

Retrieve a task's details to display in a detail view or edit form in your application.

### Task verification

Verify if a task exists before performing operations that require a valid task.

### Task status check

Check the current status of a specific task.

## Code examples

### cURL

```bash
curl -X GET \
  http://localhost:3000/tasks/1 \
  -H 'Authorization: Bearer YOUR_TOKEN'
```

### JavaScript

```javascript
async function getTaskById(taskId) {
  const response = await fetch(`http://localhost:3000/tasks/${taskId}`, {
    method: 'GET',
    headers: {
      'Authorization': 'Bearer YOUR_TOKEN',
      'Content-Type': 'application/json'
    }
  });
  
  if (!response.ok) {
    const error = await response.json();
    throw new Error(error.message);
  }
  
  return await response.json();
}

// Example usage
getTaskById(1)
  .then(task => console.log('Task:', task))
  .catch(error => console.error('Failed to get task:', error));
```

### Python

```python
import requests

def get_task_by_id(task_id):
    url = f'http://localhost:3000/tasks/{task_id}'
    
    headers = {
        'Authorization': 'Bearer YOUR_TOKEN',
        'Content-Type': 'application/json'
    }
    
    response = requests.get(url, headers=headers)
    
    if response.status_code != 200:
        error = response.json()
        raise Exception(error['message'])
    
    return response.json()

# Example usage
try:
    task = get_task_by_id(1)
    print('Task:', task)
except Exception as e:
    print('Failed to get task:', str(e))
```

## Error handling

When calling this endpoint, be prepared to handle the following common errors:

### Task not found

If the specified `taskId` does not exist, the API returns a `404 Not Found` response. Your application should handle this gracefully, for example by displaying a "Task not found" message to the user.

### Invalid task ID format

If the `taskId` is not a valid integer, the API returns a `400 Bad Request` response. Your application should validate the task ID before making the request.

## Related resources

- [Task resource](../resources/task-resource.html) - Detailed information about the task resource
- [Get all tasks](get-all-tasks.html) - Retrieve a list of all tasks
- [Create a task](create-task.html) - Create a new task
- [Update a task](update-task.html) - Update an existing task
- [Delete a task](delete-task.html) - Remove a task

## See also

- [Error handling](../core-concepts/error-handling.html) - How to handle API errors
- [Task management workflow](../tutorials/task-management-workflow.html) - Tutorial on task management
- [Task status lifecycle](../core-concepts/task-status-lifecycle.html) - Understanding task statuses


