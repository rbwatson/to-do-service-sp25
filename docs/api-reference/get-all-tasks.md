---
title: "Get all tasks"
description: "API endpoint to retrieve a list of all tasks with pagination, sorting, and filtering options."
tags: ["tasks", "endpoint", "GET"]
categories: ["api-reference"]
importance: 7
api_endpoints: ["/tasks"]
related_pages: ["task-resource", "pagination", "sorting", "task-status-lifecycle"]
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 12, 2025"
navOrder: 7
---

# Get all tasks

The `GET /tasks` endpoint retrieves a list of all tasks in the system. This endpoint supports pagination, sorting, and filtering by task status to help manage large collections of tasks.

## Endpoint

```
GET /tasks
```

## Authentication

This endpoint requires authentication. Include the bearer token in the request header:

```
Authorization: Bearer YOUR_TOKEN
```

## Request parameters

The following query parameters are supported:

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `_page` | integer | No | Page number (zero-indexed). Default: 0 |
| `_perPage` | integer | No | Number of items per page (1-100). Default: 20 |
| `_sort` | string | No | Field to sort by. Prefix with `-` for descending order |
| `taskStatus` | string | No | Filter tasks by status (e.g., `NOT_STARTED`, `IN_PROGRESS`) |

### Pagination parameters

- `_page`: Zero-indexed page number to retrieve
- `_perPage`: Number of tasks to return per page (maximum 100)

For more information on pagination, see the [Pagination](../core-concepts/pagination.html) document.

### Sorting parameters

- `_sort`: Field name to sort by
  - Available fields: `taskId`, `userId`, `taskTitle`, `taskStatus`, `dueDate`, `warningOffset`
  - Prefix with `-` for descending order (e.g., `-dueDate`)

For more information on sorting, see the [Sorting](../core-concepts/sorting.html) document.

### Filtering parameters

- `taskStatus`: Filter tasks by their status
  - Possible values: `NOT_STARTED`, `IN_PROGRESS`, `BLOCKED`, `DEFERRED`, `COMPLETED`, `CANCELLED`

For more information on task statuses, see the [Task status lifecycle](../core-concepts/task-status-lifecycle.html) document.

## Request examples

### Basic request

```http
GET /tasks HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
```

### With pagination

```http
GET /tasks?_page=0&_perPage=10 HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
```

### With sorting

```http
GET /tasks?_sort=dueDate HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
```

### With status filtering

```http
GET /tasks?taskStatus=IN_PROGRESS HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
```

### Combined parameters

```http
GET /tasks?_page=0&_perPage=10&_sort=-dueDate&taskStatus=NOT_STARTED HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
```

## Response

### Success response (200 OK)

```json
{
  "tasks": [
    {
      "taskId": 1,
      "userId": 1,
      "taskTitle": "Grocery shopping",
      "taskDescription": "eggs, bacon, gummy bears",
      "taskStatus": "NOT_STARTED",
      "dueDate": "2025-05-20T17:00:00-05:00",
      "warningOffset": 60
    },
    {
      "taskId": 2,
      "userId": 1,
      "taskTitle": "Piano recital",
      "taskDescription": "Daughter's first concert appearance",
      "taskStatus": "IN_PROGRESS",
      "dueDate": "2025-04-02T15:00:00-05:00",
      "warningOffset": 30
    },
    {
      "taskId": 3,
      "userId": 2,
      "taskTitle": "Oil change",
      "taskDescription": "5K auto service",
      "taskStatus": "COMPLETED",
      "dueDate": "2025-03-10T09:00:00-05:00",
      "warningOffset": 60
    },
    {
      "taskId": 4,
      "userId": 3,
      "taskTitle": "Get shots for dog",
      "taskDescription": "Annual vaccinations for poochy",
      "taskStatus": "DEFERRED",
      "dueDate": "2025-05-11T14:00:00-05:00",
      "warningOffset": 20
    }
  ]
}
```

### Error responses

| Status | Code | Description |
|--------|------|-------------|
| 400 | `INVALID_FIELD` | Invalid query parameter |
| 401 | `UNAUTHORIZED` | Authentication required |
| 403 | `FORBIDDEN` | Access denied |
| 429 | `RATE_LIMIT_EXCEEDED` | Too many requests |
| 500 | `SERVER_ERROR` | Server error |

For more information on error responses, see the [Error responses](error-responses.html) document.

## Response fields

The response contains an array of task objects, each with the following fields:

| Field | Type | Description |
|-------|------|-------------|
| `taskId` | integer | Unique identifier for the task |
| `userId` | integer | ID of the user who owns the task |
| `taskTitle` | string | Short description (1-80 characters) |
| `taskDescription` | string | Detailed description (1-255 characters) |
| `taskStatus` | string | Current status of the task |
| `dueDate` | string (date-time) | When the task should be completed |
| `warningOffset` | integer | Minutes before due date to send reminder |

For more information about the task resource, see the [Task resource](../resources/task-resource.html) document.

## Empty results

If no tasks match the criteria or if the page is beyond available data, the API returns an empty array:

```json
{
  "tasks": []
}
```

## Code examples

### cURL

```bash
curl -X GET \
  'http://localhost:3000/tasks?_page=0&_perPage=10&_sort=-dueDate&taskStatus=NOT_STARTED' \
  -H 'Authorization: Bearer YOUR_TOKEN'
```

### JavaScript

```javascript
async function getAllTasks(page = 0, perPage = 20, sort = null, status = null) {
  const url = new URL('http://localhost:3000/tasks');
  
  url.searchParams.append('_page', page);
  url.searchParams.append('_perPage', perPage);
  
  if (sort) {
    url.searchParams.append('_sort', sort);
  }
  
  if (status) {
    url.searchParams.append('taskStatus', status);
  }
  
  const response = await fetch(url, {
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
getAllTasks(0, 10, '-dueDate', 'NOT_STARTED')
  .then(data => console.log('Tasks:', data.tasks))
  .catch(error => console.error('Failed to fetch tasks:', error));
```

### Python

```python
import requests

def get_all_tasks(page=0, per_page=20, sort=None, status=None):
    url = 'http://localhost:3000/tasks'
    
    params = {
        '_page': page,
        '_perPage': per_page
    }
    
    if sort:
        params['_sort'] = sort
    
    if status:
        params['taskStatus'] = status
    
    headers = {
        'Authorization': 'Bearer YOUR_TOKEN',
        'Content-Type': 'application/json'
    }
    
    response = requests.get(url, params=params, headers=headers)
    
    if response.status_code != 200:
        error = response.json()
        raise Exception(error['message'])
    
    return response.json()

# Example usage
try:
    result = get_all_tasks(page=0, per_page=10, sort='-dueDate', status='NOT_STARTED')
    print('Tasks:', result['tasks'])
except Exception as e:
    print('Failed to fetch tasks:', str(e))
```

## Common use cases

### Task list view

Retrieve all tasks for display in a list view, sorted by due date:

```http
GET /tasks?_sort=dueDate HTTP/1.1
```

### Filtering by status

Retrieve only tasks with a specific status, such as those in progress:

```http
GET /tasks?taskStatus=IN_PROGRESS HTTP/1.1
```

### Finding urgent tasks

Retrieve tasks sorted by due date to identify those that need attention soon:

```http
GET /tasks?_sort=dueDate&_perPage=5 HTTP/1.1
```

## Related resources

- [Task resource](../resources/task-resource.html) - Detailed information about the task resource
- [Create a task](create-task.html) - Create a new task
- [Get task by ID](get-task-by-id.html) - Retrieve a specific task
- [Update a task](update-task.html) - Update an existing task
- [Delete a task](delete-task.html) - Remove a task

## See also

- [Pagination](../core-concepts/pagination.html) - Detailed information about pagination
- [Sorting](../core-concepts/sorting.html) - Detailed information about sorting
- [Task status lifecycle](../core-concepts/task-status-lifecycle.html) - Understanding task statuses
- [Error handling](../core-concepts/error-handling.html) - How to handle API errors


