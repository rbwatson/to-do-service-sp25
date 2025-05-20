---
title: "Get task by ID"
description: "API endpoint to retrieve a specific task by its unique identifier."
tags: ["tasks", "endpoint", "GET"]
categories: ["api-reference"]
importance: 7
api_endpoints: ["/tasks/{taskId}"]
related_pages: ["task-resource"]
parent: "API Reference" 
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 20, 2025"
nav_order: "9"
layout: "default"
version: "v1.0.0"
lastUpdated: "May 20, 2025"
---

# Get task by ID

Retrieves a specific task by its unique identifier.

## Endpoint

```
GET /tasks/{taskId}
```

## Path parameters

| Parameter | Type | Description | Required |
|-----------|------|-------------|----------|
| `taskId` | integer | The unique identifier of the task to retrieve | Yes |

## Request example

```bash
# cURL example
curl -X GET http://localhost:3000/tasks/1 \
  -H "Authorization: Bearer your-token-here"
```

```python
# Python example
import requests

url = "http://localhost:3000/tasks/1"
headers = {
    "Authorization": "Bearer your-token-here"
}

response = requests.get(url, headers=headers)
print(response.json())
```

```javascript
// JavaScript example
fetch('http://localhost:3000/tasks/1', {
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
  "taskId": 1,
  "userId": 1,
  "taskTitle": "Complete project proposal",
  "taskDescription": "Finish the proposal for the new client project",
  "taskStatus": "IN_PROGRESS",
  "dueDate": "2025-06-15T17:00:00-05:00",
  "warningOffset": 120
}
```

### Error responses

| Status code | Description | Error code |
|-------------|-------------|------------|
| 400 Bad Request | Invalid task ID format | `INVALID_FIELD` |
| 401 Unauthorized | Missing or invalid authentication | `UNAUTHORIZED` |
| 403 Forbidden | Insufficient permissions | `FORBIDDEN` |
| 404 Not Found | Task not found | `RESOURCE_NOT_FOUND` |
| 429 Too Many Requests | Rate limit exceeded | `RATE_LIMIT_EXCEEDED` |
| 500 Server Error | Unexpected server error | `SERVER_ERROR` |

See [Error responses](error-responses.md) for details on error response format.

## Authentication

This endpoint requires authentication using a bearer token:

```
Authorization: Bearer your-token-here
```

## Important considerations

- The `taskId` must be a valid integer that corresponds to an existing task.
- If the specified task does not exist, the API will return a 404 Not Found response.
- This endpoint returns a single task object, not an array.

## Best practices

- Cache task details when appropriate to reduce API calls.
- Implement proper error handling to deal with cases where the task does not exist.
- Use this endpoint when you need detailed information about a specific task rather than filtering the GET /tasks endpoint.

## Code examples

### Retrieve a task by ID with error handling

```javascript
// JavaScript example: Retrieve a task by ID with error handling
async function getTaskById(taskId) {
  try {
    const response = await fetch(`http://localhost:3000/tasks/${taskId}`, {
      headers: {
        'Authorization': 'Bearer your-token-here'
      }
    });
    
    if (!response.ok) {
      const errorData = await response.json();
      
      if (response.status === 404) {
        throw new Error(`Task with ID ${taskId} not found`);
      }
      
      throw new Error(errorData.message || `Failed to retrieve task with ID ${taskId}`);
    }
    
    return await response.json();
  } catch (error) {
    console.error(`Error retrieving task with ID ${taskId}:`, error);
    throw error;
  }
}

// Usage example
try {
  const task = await getTaskById(1);
  console.log('Task details:', task);
  
  // Check if task is due soon
  const dueDate = new Date(task.dueDate);
  const now = new Date();
  const timeUntilDue = dueDate - now;
  const hoursUntilDue = timeUntilDue / (1000 * 60 * 60);
  
  if (hoursUntilDue < 24) {
    console.log(`Task "${task.taskTitle}" is due in less than 24 hours!`);
  }
} catch (error) {
  console.error('Failed to retrieve task:', error.message);
}
```

```python
# Python example: Retrieve a task by ID with error handling
from datetime import datetime
import requests

def get_task_by_id(token, task_id):
    try:
        url = f"http://localhost:3000/tasks/{task_id}"
        headers = {
            "Authorization": f"Bearer {token}"
        }
        
        response = requests.get(url, headers=headers)
        
        if response.status_code == 404:
            print(f"Task with ID {task_id} not found")
            return None
            
        response.raise_for_status()  # Raise exception for other 4XX/5XX status codes
        
        return response.json()
    except requests.exceptions.HTTPError as e:
        # Handle API errors
        try:
            error_data = e.response.json()
            print(f"API error: {error_data.get('message', str(e))}")
        except ValueError:
            # Could not parse error response as JSON
            print(f"Error retrieving task: {str(e)}")
        return None
    except Exception as e:
        print(f"Error retrieving task: {str(e)}")
        return None

# Usage example
task = get_task_by_id("your-token-here", 1)

if task:
    print(f"Task details: {task}")
    
    # Check if task is due soon
    due_date = datetime.fromisoformat(task["dueDate"].replace("Z", "+00:00"))
    now = datetime.now()
    time_until_due = due_date - now
    hours_until_due = time_until_due.total_seconds() / 3600
    
    if hours_until_due < 24:
        print(f"Task \"{task['taskTitle']}\" is due in less than 24 hours!")
else:
    print("Failed to retrieve task")
```

## Related resources

- [Task resource](../resources/task-resource.md)

## See also

- [Get all tasks](get-all-tasks.md)
- [Create a task](create-task.md)
- [Update a task](update-task.md)
- [Delete a task](delete-task.md)


