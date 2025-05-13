---
title: "Delete a task"
description: "API endpoint to remove a task from the system."
tags: ["tasks", "endpoint", "DELETE"]
categories: ["api-reference"]
importance: 7
api_endpoints: ["/tasks/{taskId}"]
related_pages: ["task-resource"]
parent: "api-reference"
hasChildren: false
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "2025-05-13"
navOrder: "11"
layout: "default"
version: "v1.0.0"
lastUpdated: "2025-05-13"
---

# Delete a Task

## Endpoint

```
DELETE /tasks/{taskId}
```

This endpoint deletes a specific task from the system. Once deleted, the task cannot be recovered.

## Path Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `taskId` | String | Unique identifier of the task to delete |

## Request Example

```http
DELETE /tasks/task123
Authorization: Bearer YOUR_API_KEY
```

## Response

### Success Response (204 No Content)

A successful deletion returns a `204 No Content` status code with no response body, indicating that the task has been successfully deleted.

### Error Responses

| Status Code | Description |
|-------------|-------------|
| 401 | Unauthorized (missing or invalid authentication) |
| 403 | Forbidden (insufficient permissions to delete this task) |
| 404 | Not Found (task with the specified ID does not exist) |

#### Example Error Response (403 Forbidden)

```json
{
  "error": {
    "code": "permission_denied",
    "message": "You don't have permission to delete this task"
  }
}
```

For details on error responses, see [Error Responses](/api-reference/error-responses.md).

## Authentication

This endpoint requires authentication using a bearer token. Include your API key in the `Authorization` header:

```
Authorization: Bearer YOUR_API_KEY
```

The authenticated user must have appropriate permissions to delete the requested task:
- `admin` users can delete any task
- `manager` users can delete any task
- `member` users can only delete tasks they created (and possibly tasks assigned to them, depending on system configuration)

## Important Considerations

- **Permanent Operation**: Deletion is permanent and cannot be undone. Consider updating the task status to "CANCELED" instead if you might need to reference the task later.

- **Related Records**: When a task is deleted, any records that directly reference it may also be affected. For example, if you have a comments system linked to tasks, comments on the deleted task might be deleted as well.

- **Alternative to Deletion**: If you need to keep a record of all tasks for audit or reporting purposes, consider implementing a "soft delete" in your application by changing the task status to "CANCELED" instead of using this endpoint.

- **Bulk Operations**: This endpoint only deletes a single task. For bulk deletions, you'll need to make multiple API calls.

## Best Practices

- Confirm deletion with the user before making the API request
- Consider using status updates instead of deletion for maintaining historical records
- Implement proper error handling in your application
- Keep track of deleted tasks in your application if needed for audit purposes
- Check task ownership and permissions in your application before attempting deletion

## Code Examples

### JavaScript

```javascript
async function deleteTask(taskId) {
  try {
    const response = await fetch(`https://api.taskmanagement.example.com/v1/tasks/${taskId}`, {
      method: 'DELETE',
      headers: {
        'Authorization': `Bearer ${API_KEY}`
      }
    });
    
    if (response.status === 204) {
      return true; // Successfully deleted
    }
    
    if (response.status === 404) {
      console.warn(`Task with ID ${taskId} not found`);
      return false;
    }
    
    if (!response.ok) {
      const errorData = await response.json();
      throw new Error(`Failed to delete task: ${errorData.error.message}`);
    }
    
    return false; // Should not reach here if properly handled above
  } catch (error) {
    console.error(`Error deleting task ${taskId}:`, error);
    throw error;
  }
}

// Example usage
try {
  // Confirm with the user before deletion
  const confirmDelete = confirm(`Are you sure you want to delete this task? This action cannot be undone.`);
  
  if (confirmDelete) {
    const result = await deleteTask('task123');
    
    if (result) {
      console.log('Task successfully deleted');
      // Update your UI to remove the task
      document.getElementById('task-123').remove();
    } else {
      console.log('Task was not deleted');
    }
  } else {
    console.log('Deletion canceled by user');
  }
} catch (error) {
  console.error('Failed to delete task:', error);
  // Show error message to the user
  displayErrorMessage(`Failed to delete task: ${error.message}`);
}
```

### Python

```python
import requests

def delete_task(api_key, task_id):
    """
    Delete a task from the system.
    
    Args:
        api_key (str): API key for authentication
        task_id (str): The unique identifier of the task to delete
    
    Returns:
        bool: True if task was successfully deleted
        
    Raises:
        Exception: If the API request fails
    """
    url = f'https://api.taskmanagement.example.com/v1/tasks/{task_id}'
    headers = {
        'Authorization': f'Bearer {api_key}'
    }
    
    response = requests.delete(url, headers=headers)
    
    if response.status_code == 204:
        return True
    elif response.status_code == 404:
        print(f"Task with ID {task_id} not found")
        return False
    elif response.status_code == 403:
        raise Exception(f"You don't have permission to delete this task")
    else:
        error_data = response.json()
        raise Exception(f"API error: {error_data['error']['message']}")

# Example usage
try:
    # Prompt for confirmation
    task_id = 'task123'
    confirm = input(f"Are you sure you want to delete task {task_id}? (yes/no): ")
    
    if confirm.lower() == 'yes':
        success = delete_task('YOUR_API_KEY', task_id)
        
        if success:
            print(f"Task {task_id} was successfully deleted")
            # Update your application state
        else:
            print(f"Task was not deleted")
    else:
        print("Deletion cancelled")
        
except Exception as e:
    print(f"Error deleting task: {e}")
```

### cURL

```bash
# Delete a task
curl -X DELETE "https://api.taskmanagement.example.com/v1/tasks/task123" \
  -H "Authorization: Bearer YOUR_API_KEY"
```

## Related Resources

- [Task Resource](/resources/task-resource.md) - Detailed information about the Task resource
- [Get All Tasks](/api-reference/get-all-tasks.md) - Retrieve a list of all tasks
- [Get Task by ID](/api-reference/get-task-by-id.md) - Retrieve a specific task by ID
- [Update a Task](/api-reference/update-task.md) - Update an existing task's information

## See Also

- [Data Model](/core-concepts/data-model.md) - Overview of the core resources and their relationships
- [Task Status Lifecycle](/core-concepts/task-status-lifecycle.md) - Understanding task statuses and transitions
- [Task Management Workflow](/tutorials/task-management-workflow.md) - Guide to implementing a task management workflow


