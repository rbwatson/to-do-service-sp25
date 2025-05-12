---
title: "Delete a task"
description: "API endpoint to remove a task from the system."
tags: ["tasks", "endpoint", "DELETE"]
categories: ["api-reference"]
importance: 7
api_endpoints: ["/tasks/{taskId}"]
related_pages: ["task-resource"]
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 12, 2025"
navOrder: 11
---

# Delete a task

The `DELETE /tasks/{taskId}` endpoint removes a specific task from the system. This endpoint permanently deletes the task.

## Endpoint

```
DELETE /tasks/{taskId}
```

## Authentication

This endpoint requires authentication. Include the bearer token in the request header:

```
Authorization: Bearer YOUR_TOKEN
```

## Path parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `taskId` | integer | Yes | The unique identifier of the task to delete |

## Request example

```http
DELETE /tasks/1 HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
```

## Response

### Success response (204 No Content)

If the task is deleted successfully, the API returns a `204 No Content` status code with no response body.

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

#### Task not found example (404)

```json
{
  "code": "RESOURCE_NOT_FOUND",
  "message": "Task with ID 999 could not be found",
  "requestId": "req-f8d31a62-e789-4856-9452-5efa50223c7a"
}
```

## Important considerations

- This operation cannot be undone
- The task will be permanently deleted
- The `taskId` cannot be reused for new tasks
- Consider using the `CANCELLED` or `COMPLETED` status instead of deletion for tasks that need to be preserved for historical purposes

## Code examples

### cURL

```bash
curl -X DELETE \
  http://localhost:3000/tasks/1 \
  -H 'Authorization: Bearer YOUR_TOKEN'
```

### JavaScript

```javascript
async function deleteTask(taskId) {
  const response = await fetch(`http://localhost:3000/tasks/${taskId}`, {
    method: 'DELETE',
    headers: {
      'Authorization': 'Bearer YOUR_TOKEN'
    }
  });
  
  if (!response.ok) {
    const error = await response.json();
    throw new Error(error.message);
  }
  
  // Success response has no content
  return true;
}

// Example usage
deleteTask(1)
  .then(() => console.log('Task deleted successfully'))
  .catch(error => console.error('Failed to delete task:', error));
```

### Python

```python
import requests

def delete_task(task_id):
    url = f'http://localhost:3000/tasks/{task_id}'
    
    headers = {
        'Authorization': 'Bearer YOUR_TOKEN'
    }
    
    response = requests.delete(url, headers=headers)
    
    if response.status_code != 204:
        error = response.json()
        raise Exception(error['message'])
    
    # Success response has no content
    return True

# Example usage
try:
    delete_task(1)
    print('Task deleted successfully')
except Exception as e:
    print('Failed to delete task:', str(e))
```

## Common use cases

### Task cleanup

Remove completed or cancelled tasks that are no longer needed.

### Error correction

Delete tasks that were created by mistake.

### Privacy compliance

Remove tasks containing sensitive or personal information when no longer needed.

## Alternatives to deletion

Instead of deleting tasks, consider these alternatives:

1. **Update the status**: Mark tasks as `COMPLETED` or `CANCELLED` to preserve the history
   ```http
   PATCH /tasks/1 HTTP/1.1
   Content-Type: application/json
   
   {
     "taskStatus": "COMPLETED"
   }
   ```

2. **Archive functionality**: Implement client-side archiving to hide tasks without deleting them

## Best practices

- Confirm the deletion with the user before making this request, as it cannot be undone
- Consider implementing a "soft delete" in your application logic if you need to preserve task history
- Handle the 404 error gracefully if the task has already been deleted

## Related resources

- [Task resource](../resources/task-resource.html) - Detailed information about the task resource
- [Get all tasks](get-all-tasks.html) - Retrieve a list of all tasks
- [Get task by ID](get-task-by-id.html) - Retrieve a specific task
- [Create a task](create-task.html) - Create a new task
- [Update a task](update-task.html) - Update an existing task

## See also

- [Error handling](../core-concepts/error-handling.html) - How to handle API errors
- [Task management workflow](../tutorials/task-management-workflow.html) - Tutorial on task management
- [Task status lifecycle](../core-concepts/task-status-lifecycle.html) - Understanding task statuses


