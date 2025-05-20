---
title: "Get all tasks"
description: "API endpoint to retrieve a list of all tasks with pagination, sorting, and filtering options."
tags: ["tasks", "endpoint", "GET"]
categories: ["api-reference"]
importance: 7
api_endpoints: ["/tasks"]
related_pages: ["task-resource", "pagination", "sorting", "task-status-lifecycle"]
parent: "API Reference" 
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 20, 2025"
nav_order: "7"
layout: "default"
version: "v1.0.0"
lastUpdated: "May 20, 2025"
---

# Get all tasks

Retrieves a list of all tasks in the system. This endpoint supports pagination, sorting, and filtering options to help manage large result sets.

## Endpoint

```
GET /tasks
```

## Path parameters

None.

## Query parameters

| Parameter | Type | Description | Required | Default | Constraints |
|-----------|------|-------------|----------|---------|------------|
| `_page` | integer | Page number (zero-indexed) | No | 0 | Minimum: 0 |
| `_perPage` | integer | Number of items per page | No | 20 | Minimum: 1, Maximum: 100 |
| `_sort` | string | Field to sort by | No | None | Valid fields: `taskId`, `userId`, `taskTitle`, `taskStatus`, `dueDate`, `warningOffset` |
| `taskStatus` | string | Filter tasks by status | No | None | Must be one of the predefined status values |

### Sorting

To sort results in ascending order, specify the field name:
```
GET /tasks?_sort=dueDate
```

To sort results in descending order, prefix the field name with a hyphen:
```
GET /tasks?_sort=-dueDate
```

### Filtering by status

To filter tasks by their status:
```
GET /tasks?taskStatus=IN_PROGRESS
```

Valid status values:
- `NOT_STARTED`
- `IN_PROGRESS`
- `BLOCKED`
- `DEFERRED`
- `COMPLETED`
- `CANCELLED`

## Request example

```bash
# cURL example
curl -X GET "http://localhost:3000/tasks?_page=0&_perPage=10&_sort=-dueDate&taskStatus=IN_PROGRESS" \
  -H "Authorization: Bearer your-token-here"
```

```python
# Python example
import requests

url = "http://localhost:3000/tasks"
headers = {
    "Authorization": "Bearer your-token-here"
}
params = {
    "_page": 0,
    "_perPage": 10,
    "_sort": "-dueDate",
    "taskStatus": "IN_PROGRESS"
}

response = requests.get(url, headers=headers, params=params)
print(response.json())
```

```javascript
// JavaScript example
fetch('http://localhost:3000/tasks?_page=0&_perPage=10&_sort=-dueDate&taskStatus=IN_PROGRESS', {
  headers: {
    'Authorization': 'Bearer your-token-here'
  }
})
.then(response => response.json())
.then(data => console.log(data));
```

## Response

### Success response (200 OK)

```json
{
  "tasks": [
    {
      "taskId": 1,
      "userId": 1,
      "taskTitle": "Complete project proposal",
      "taskDescription": "Finish the proposal for the new client project",
      "taskStatus": "IN_PROGRESS",
      "dueDate": "2025-06-15T17:00:00-05:00",
      "warningOffset": 120
    },
    {
      "taskId": 2,
      "userId": 1,
      "taskTitle": "Schedule team meeting",
      "taskDescription": "Set up weekly sync-up with the development team",
      "taskStatus": "IN_PROGRESS",
      "dueDate": "2025-06-10T10:00:00-05:00",
      "warningOffset": 60
    }
    // Additional tasks...
  ]
}
```

### Error responses

| Status code | Description | Error code |
|-------------|-------------|------------|
| 400 Bad Request | Invalid query parameters | `INVALID_FIELD` |
| 401 Unauthorized | Missing or invalid authentication | `UNAUTHORIZED` |
| 403 Forbidden | Insufficient permissions | `FORBIDDEN` |
| 429 Too Many Requests | Rate limit exceeded | `RATE_LIMIT_EXCEEDED` |
| 500 Server Error | Unexpected server error | `SERVER_ERROR` |

See [Error responses](error-responses.md) for details on error response format.

## Authentication

This endpoint requires authentication using a bearer token:

```
Authorization: Bearer your-token-here
```

## Important considerations

- The response does not include information about the total number of tasks or pages. Your application should check if the number of returned tasks is less than `_perPage` to determine if you've reached the last page.
- Sorting is case-sensitive. For example, when sorting by `taskTitle`, titles starting with uppercase letters will appear before those starting with lowercase letters.
- When retrieving large sets of tasks, use pagination to improve performance and reduce response payload size.
- The `taskStatus` filter is a strict equality filter. It will only return tasks that exactly match the specified status.

## Best practices

- Use reasonable page sizes (10-50 tasks per page) to balance between number of requests and payload size.
- Implement caching for paginated responses to reduce server load and improve application performance.
- Use the sorting feature to create useful views, such as sorting by due date to show most urgent tasks first.
- Use status filtering to create focused views for different workflow stages.
- Combine sorting and filtering to create highly customized views, such as "Most urgent IN_PROGRESS tasks."

## Code examples

### Fetch all tasks with pagination and filtering

```javascript
// JavaScript example: Fetch all tasks with pagination and filtering
async function getAllTasks(taskStatus) {
  const pageSize = 20;
  let currentPage = 0;
  let allTasks = [];
  let hasMoreTasks = true;
  
  // Build query parameters
  const queryParams = new URLSearchParams({
    _perPage: pageSize
  });
  
  // Add taskStatus filter if provided
  if (taskStatus) {
    queryParams.append('taskStatus', taskStatus);
  }
  
  while (hasMoreTasks) {
    try {
      // Update page for each request
      queryParams.set('_page', currentPage);
      
      const response = await fetch(`http://localhost:3000/tasks?${queryParams.toString()}`, {
        headers: {
          'Authorization': 'Bearer your-token-here'
        }
      });
      
      if (!response.ok) {
        throw new Error(`API error: ${response.status}`);
      }
      
      const data = await response.json();
      const tasks = data.tasks;
      
      if (tasks.length === 0) {
        hasMoreTasks = false;
      } else {
        allTasks = allTasks.concat(tasks);
        currentPage++;
        
        // Check if we received fewer tasks than requested (last page)
        if (tasks.length < pageSize) {
          hasMoreTasks = false;
        }
      }
    } catch (error) {
      console.error('Error fetching tasks:', error);
      hasMoreTasks = false;
    }
  }
  
  return allTasks;
}

// Usage example: Get all in-progress tasks
getAllTasks('IN_PROGRESS')
  .then(tasks => {
    console.log(`Found ${tasks.length} in-progress tasks`);
    console.log(tasks);
  })
  .catch(error => {
    console.error('Failed to retrieve tasks:', error);
  });
```

```python
# Python example: Fetch all tasks with pagination and filtering
def get_all_tasks(token, task_status=None):
    page_size = 20
    current_page = 0
    all_tasks = []
    has_more_tasks = True
    
    # Build query parameters
    params = {
        "_perPage": page_size
    }
    
    # Add taskStatus filter if provided
    if task_status:
        params["taskStatus"] = task_status
    
    while has_more_tasks:
        try:
            # Update page for each request
            params["_page"] = current_page
            
            url = "http://localhost:3000/tasks"
            headers = {"Authorization": f"Bearer {token}"}
            
            response = requests.get(url, headers=headers, params=params)
            response.raise_for_status()
            
            data = response.json()
            tasks = data.get("tasks", [])
            
            if not tasks:
                has_more_tasks = False
            else:
                all_tasks.extend(tasks)
                current_page += 1
                
                # Check if we received fewer tasks than requested (last page)
                if len(tasks) < page_size:
                    has_more_tasks = False
                    
        except Exception as e:
            print(f"Error fetching tasks: {e}")
            has_more_tasks = False
    
    return all_tasks

# Usage example: Get all completed tasks
completed_tasks = get_all_tasks("your-token-here", "COMPLETED")
print(f"Found {len(completed_tasks)} completed tasks")
print(completed_tasks)
```

## Related resources

- [Task resource](../resources/task-resource.md)
- [Pagination](../core-concepts/pagination.md)
- [Sorting](../core-concepts/sorting.md)
- [Task status lifecycle](../core-concepts/task-status-lifecycle.md)

## See also

- [Create a task](create-task.md)
- [Get task by ID](get-task-by-id.md)
- [Update a task](update-task.md)
- [Delete a task](delete-task.md)


