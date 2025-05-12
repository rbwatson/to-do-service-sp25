# Delete a Task

Removes the specified task from the system.

**Endpoint:** `DELETE /tasks/{taskId}`

## Authentication

This endpoint requires authentication using a Bearer token.

```
Authorization: Bearer {token}
```

## Request

### Headers

| Header | Value | Description |
|--------|-------|-------------|
| Authorization | Bearer {token} | Authentication token |

### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `taskId` | integer | Yes | The unique ID of the task to delete |

> **Note:** Deleting a task is permanent and cannot be undone. Consider marking tasks as `COMPLETED` or `CANCELLED` instead if you need to maintain a history of tasks.

## Response

### Success Response (204 No Content)

When the task is successfully deleted, the API returns HTTP status code `204 No Content` with no response body.

> **Note:** The `204 No Content` response indicates successful deletion even if the task had no associated data.

### Error Responses

This endpoint may return the following error responses:

- `400 Bad Request` - Invalid task ID format
- `401 Unauthorized` - Missing or invalid authentication
- `403 Forbidden` - Insufficient permissions
- `404 Not Found` - Task not found
- `429 Too Many Requests` - Rate limit exceeded
- `500 Server Error` - Unexpected server error

For detailed information about these errors, refer to the [API Error Responses](error-responses.md) documentation.

## Example

### cURL

```bash
curl -X DELETE https://localhost:3000/tasks/1 \
  -H "Authorization: Bearer your-token-here"
```

### JavaScript

```javascript
const deleteTask = async (taskId) => {
  try {
    const response = await fetch(`https://localhost:3000/tasks/${taskId}`, {
      method: 'DELETE',
      headers: {
        'Authorization': 'Bearer your-token-here'
      }
    });
    
    if (response.status === 204) {
      console.log(`Task ${taskId} successfully deleted`);
      return true;
    } else {
      const errorData = await response.json();
      throw new Error(`Error ${response.status}: ${errorData.message}`);
    }
  } catch (error) {
    console.error('Failed to delete task:', error);
    return false;
  }
};
```

### Python

```python
import requests

def delete_task(task_id):
    url = f"https://localhost:3000/tasks/{task_id}"
    headers = {
        "Authorization": "Bearer your-token-here"
    }
    
    response = requests.delete(url, headers=headers)
    
    if response.status_code == 204:
        print(f"Task {task_id} successfully deleted")
        return True
    else:
        print(f"Error {response.status_code}: {response.json()}")
        return False
```

## Common Issues

1. **Task Not Found**: If you attempt to delete a task that doesn't exist, you'll receive a `404 Not Found` error. Double-check the `taskId`.

2. **Permission Issues**: Depending on the system's permission model, users might only be able to delete tasks they created or tasks assigned to them. If you attempt to delete a task you don't have permission to remove, you'll receive a `403 Forbidden` error.

3. **Task References**: If other resources in the system reference this task, deletion might be prevented or those references might be left orphaned. Check the API documentation for any specific behavior related to dependencies.

4. **Batch Deletion**: This endpoint only supports deleting one task at a time. If you need to delete multiple tasks, you'll need to make multiple API calls.

5. **Data Recovery**: Once a task is deleted, it cannot be recovered through the API. Implement appropriate confirmation steps in your client application before allowing users to delete tasks.

6. **Caching Considerations**: If you're caching task data in your application, remember to invalidate or update your cache after deleting a task to prevent showing stale data to users.

7. **Audit Trail**: The API doesn't provide built-in auditing for task deletions. If you need to maintain an audit trail of who deleted tasks and when, you'll need to implement this in your application.

8. **Confirmation Flow**: Consider implementing a confirmation flow in your user interface before sending the delete request, as this operation cannot be undone.

9. **Bulk Operations**: If you need to delete many tasks, be mindful of rate limits. Space out your requests or use batch deletion if supported by future API versions.