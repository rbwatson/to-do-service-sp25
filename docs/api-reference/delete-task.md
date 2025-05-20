---
title: "Delete a task"
description: "API endpoint to remove a task from the system."
tags: ["tasks", "endpoint", "DELETE"]
categories: ["api-reference"]
importance: 7
api_endpoints: ["/tasks/{taskId}"]
related_pages: ["task-resource"]
parent: "API Reference" 
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 20, 2025"
nav_order: "11"
layout: "default"
version: "v1.0.0"
lastUpdated: "May 20, 2025"
---

# Delete a task

Removes a task from the system. This operation is irreversible.

## Endpoint

```
DELETE /tasks/{taskId}
```

## Path parameters

| Parameter | Type | Description | Required |
|-----------|------|-------------|----------|
| `taskId` | integer | The unique identifier of the task to delete | Yes |

## Request example

```bash
# cURL example
curl -X DELETE http://localhost:3000/tasks/1 \
  -H "Authorization: Bearer your-token-here"
```

```python
# Python example
import requests

url = "http://localhost:3000/tasks/1"
headers = {
    "Authorization": "Bearer your-token-here"
}

response = requests.delete(url, headers=headers)
print(response.status_code)
```

```javascript
// JavaScript example
fetch('http://localhost:3000/tasks/1', {
  method: 'DELETE',
  headers: {
    'Authorization': 'Bearer your-token-here'
  }
})
.then(response => {
  if (response.ok) {
    console.log('Task deleted successfully');
  } else {
    throw new Error('Failed to delete task');
  }
})
.catch(error => console.error(error));
```

## Response

### Success response (204 No Content)

A successful response returns an HTTP 204 status code with no content in the response body.

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

- This operation is irreversible. Once a task is deleted, it cannot be recovered.
- The `taskId` must be a valid integer that corresponds to an existing task. If the specified task does not exist, the API will return a 404 Not Found response.
- The API will not return a response body on success, only an HTTP 204 status code.
- Only the user who owns the task or a user with appropriate permissions can delete a task.

## Best practices

- Implement a confirmation step in your application before sending the delete request to prevent accidental deletions.
- Consider implementing a soft delete mechanism in your application if you need the ability to recover deleted tasks.
- As an alternative to deletion, you might want to update the task status to `CANCELLED` to maintain a history of tasks.
- Update your application's state after a successful deletion to reflect the change.
- Handle the 404 Not Found response gracefully if the task has already been deleted.

## Code examples

### Delete a task with error handling

```javascript
// JavaScript example: Delete a task with error handling
async function deleteTask(taskId) {
  try {
    const response = await fetch(`http://localhost:3000/tasks/${taskId}`, {
      method: 'DELETE',
      headers: {
        'Authorization': 'Bearer your-token-here'
      }
    });
    
    if (!response.ok) {
      let errorMessage = `Failed to delete task with ID ${taskId}`;
      
      if (response.status === 404) {
        errorMessage = `Task with ID ${taskId} not found`;
      }
      
      // Try to get more detailed error information if available
      try {
        const errorData = await response.json();
        errorMessage = errorData.message || errorMessage;
      } catch (parseError) {
        // Unable to parse error response as JSON, use default message
      }
      
      throw new Error(errorMessage);
    }
    
    return true; // Successful deletion
  } catch (error) {
    console.error(`Error deleting task with ID ${taskId}:`, error);
    throw error;
  }
}

// Usage example
try {
  const success = await deleteTask(1);
  if (success) {
    console.log('Task deleted successfully');
    // Update application state to reflect deletion
    // E.g., remove the task from the tasks list in the UI
  }
} catch (error) {
  console.error('Failed to delete task:', error.message);
  // Show error message to the user
}
```

```python
# Python example: Delete a task with error handling
def delete_task(token, task_id):
    try:
        url = f"http://localhost:3000/tasks/{task_id}"
        headers = {
            "Authorization": f"Bearer {token}"
        }
        
        response = requests.delete(url, headers=headers)
        
        if response.status_code == 204:
            return True  # Successful deletion
        
        if response.status_code == 404:
            print(f"Task with ID {task_id} not found")
            return False
            
        # Handle other error responses
        try:
            error_data = response.json()
            print(f"API error: {error_data.get('message', f'Status code: {response.status_code}')}")
        except ValueError:
            # Could not parse error response as JSON
            print(f"Error deleting task. Status code: {response.status_code}")
        
        return False
    except Exception as e:
        print(f"Error deleting task: {str(e)}")
        return False

# Usage example
success = delete_task("your-token-here", 1)

if success:
    print("Task deleted successfully")
    # Update application state to reflect deletion
    # E.g., remove the task from the tasks list in the UI
else:
    print("Failed to delete task")
    # Show error message to the user
```

## Alternative approach: Cancel instead of delete

In some cases, you might want to maintain a history of tasks rather than deleting them. Here's an example of marking a task as cancelled instead of deleting it:

```javascript
// JavaScript example: Mark a task as cancelled instead of deleting
async function cancelTask(taskId) {
  try {
    const response = await fetch(`http://localhost:3000/tasks/${taskId}`, {
      method: 'PATCH',
      headers: {
        'Authorization': 'Bearer your-token-here',
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        taskStatus: 'CANCELLED'
      })
    });
    
    if (!response.ok) {
      const errorData = await response.json();
      throw new Error(errorData.message || `Failed to cancel task with ID ${taskId}`);
    }
    
    return await response.json();
  } catch (error) {
    console.error(`Error cancelling task with ID ${taskId}:`, error);
    throw error;
  }
}

// Usage example
try {
  const cancelledTask = await cancelTask(1);
  console.log(`Task "${cancelledTask.taskTitle}" cancelled successfully`);
} catch (error) {
  console.error('Failed to cancel task:', error.message);
}
```

## Related resources

- [Task resource](../resources/task-resource.md)

## See also

- [Get all tasks](get-all-tasks.md)
- [Create a task](create-task.md)
- [Get task by ID](get-task-by-id.md)
- [Update a task](update-task.md)


