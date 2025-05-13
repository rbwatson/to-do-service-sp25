---
title: "Delete a user"
description: "API endpoint to remove a user from the system."
tags: ["users", "endpoint", "DELETE"]
categories: ["api-reference"]
importance: 7
api_endpoints: ["/users/{userId}"]
related_pages: ["user-resource"]
parent: "api-reference"
hasChildren: false
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "2025-05-13"
navOrder: "6"
layout: "default"
version: "v1.0.0"
lastUpdated: "2025-05-13"
---

# Delete a User

## Endpoint

```
DELETE /users/{userId}
```

This endpoint deletes a specific user from the system. Once deleted, the user can no longer log in, be assigned tasks, or be referenced in new API calls.

## Path Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `userId` | String | Unique identifier of the user to delete |

## Request Example

```http
DELETE /users/user123
Authorization: Bearer YOUR_API_KEY
```

## Response

### Success Response (204 No Content)

A successful deletion returns a `204 No Content` status code with no response body, indicating that the user has been successfully deleted.

### Error Responses

| Status Code | Description |
|-------------|-------------|
| 401 | Unauthorized (missing or invalid authentication) |
| 403 | Forbidden (insufficient permissions to delete this user) |
| 404 | Not Found (user with the specified ID does not exist) |
| 409 | Conflict (e.g., user has assigned tasks) |

#### Example Error Response (409 Conflict)

```json
{
  "error": {
    "code": "resource_conflict",
    "message": "Cannot delete user with assigned tasks",
    "details": {
      "assignedTaskCount": 5
    }
  }
}
```

For details on error responses, see [Error Responses](/api-reference/error-responses.md).

## Authentication

This endpoint requires authentication using a bearer token. Include your API key in the `Authorization` header:

```
Authorization: Bearer YOUR_API_KEY
```

The authenticated user must have appropriate permissions to delete the requested user:
- `admin` users can delete any user except themselves
- `manager` users can delete users with "member" role
- `member` users cannot delete any users

## Important Considerations

- **Permanent Operation**: Deletion is permanent and cannot be undone. Consider deactivating users instead of deleting them if you may need to restore access later.

- **Assigned Tasks**: By default, you cannot delete a user who has assigned tasks. You have two options:
  1. First reassign all tasks to other users
  2. Use the `force=true` query parameter to delete the user and unassign their tasks

- **Created Tasks**: Tasks created by the deleted user will remain in the system, but the `createdBy` field will be set to null.

- **Last Admin**: The system prevents deletion of the last admin user to ensure there's always at least one user with administrative privileges.

## Best Practices

- Before deleting a user, retrieve and reassign any tasks assigned to them
- Confirm the deletion with the user or administrator to prevent accidental data loss
- Consider implementing a "soft delete" in your application by deactivating users instead of deleting them
- Maintain an audit log of user deletions for security and compliance purposes
- Handle deletion errors gracefully in your application UI

## Code Examples

### JavaScript

```javascript
async function deleteUser(userId, forceDelete = false) {
  try {
    const url = forceDelete
      ? `https://api.taskmanagement.example.com/v1/users/${userId}?force=true`
      : `https://api.taskmanagement.example.com/v1/users/${userId}`;
    
    const response = await fetch(url, {
      method: 'DELETE',
      headers: {
        'Authorization': `Bearer ${API_KEY}`
      }
    });
    
    if (response.status === 204) {
      return true; // Successful deletion
    }
    
    if (response.status === 409) {
      // Conflict - user has assigned tasks
      const errorData = await response.json();
      const taskCount = errorData.error.details?.assignedTaskCount || 'unknown';
      throw new Error(`User has ${taskCount} assigned tasks. Use forceDelete=true to delete anyway.`);
    }
    
    if (!response.ok) {
      const errorData = await response.json();
      throw new Error(`Failed to delete user: ${errorData.error.message}`);
    }
    
    return false; // Should not reach here if properly handled above
  } catch (error) {
    console.error(`Error deleting user ${userId}:`, error);
    throw error;
  }
}

// Example usage
try {
  // Try to delete without force first
  await deleteUser('user123');
  console.log('User successfully deleted');
} catch (error) {
  if (error.message.includes('assigned tasks')) {
    console.warn(error.message);
    
    // Ask for confirmation before force deletion
    const confirmForce = confirm('User has assigned tasks. Delete anyway and unassign tasks?');
    
    if (confirmForce) {
      try {
        await deleteUser('user123', true);
        console.log('User successfully deleted with force option');
      } catch (forceError) {
        console.error('Force deletion failed:', forceError);
      }
    }
  } else {
    console.error('Failed to delete user:', error);
  }
}
```

### Python

```python
import requests

def delete_user(api_key, user_id, force=False):
    """
    Delete a user from the system.
    
    Args:
        api_key (str): API key for authentication
        user_id (str): The unique identifier of the user to delete
        force (bool, optional): Whether to force deletion even if user has assigned tasks. Defaults to False.
    
    Returns:
        bool: True if user was successfully deleted
        
    Raises:
        Exception: If the API request fails
    """
    url = f'https://api.taskmanagement.example.com/v1/users/{user_id}'
    
    if force:
        url += '?force=true'
        
    headers = {
        'Authorization': f'Bearer {api_key}'
    }
    
    response = requests.delete(url, headers=headers)
    
    if response.status_code == 204:
        return True
    elif response.status_code == 409:
        error_data = response.json()
        task_count = error_data['error']['details'].get('assignedTaskCount', 'unknown')
        raise Exception(f"User has {task_count} assigned tasks. Set force=True to delete anyway.")
    elif response.status_code == 404:
        raise Exception(f"User with ID {user_id} not found")
    elif response.status_code == 403:
        raise Exception("You don't have permission to delete this user")
    else:
        error_data = response.json()
        raise Exception(f"API error: {error_data['error']['message']}")

# Example usage
try:
    # First try without force
    success = delete_user('YOUR_API_KEY', 'user123')
    
    if success:
        print("User successfully deleted")
        
except Exception as e:
    if "assigned tasks" in str(e):
        print(str(e))
        
        # Ask for confirmation
        force_delete = input("User has assigned tasks. Type 'yes' to delete anyway: ")
        
        if force_delete.lower() == 'yes':
            try:
                success = delete_user('YOUR_API_KEY', 'user123', force=True)
                print("User successfully deleted with force option")
            except Exception as force_error:
                print(f"Force deletion failed: {force_error}")
    else:
        print(f"Error deleting user: {e}")
```

### cURL

```bash
# Delete a user
curl -X DELETE "https://api.taskmanagement.example.com/v1/users/user123" \
  -H "Authorization: Bearer YOUR_API_KEY"

# Force delete a user with assigned tasks
curl -X DELETE "https://api.taskmanagement.example.com/v1/users/user123?force=true" \
  -H "Authorization: Bearer YOUR_API_KEY"
```

## Related Resources

- [User Resource](/resources/user-resource.md) - Detailed information about the User resource
- [Get All Users](/api-reference/get-all-users.md) - Retrieve a list of all users
- [Create a User](/api-reference/create-user.md) - Create a new user
- [Get User by ID](/api-reference/get-user-by-id.md) - Retrieve a specific user by ID

## See Also

- [Data Model](/core-concepts/data-model.md) - Overview of the core resources and their relationships
- [Update a Task](/api-reference/update-task.md) - Reassign tasks to another user
- [Getting Started with Users](/tutorials/getting-started-with-users.md) - Guide to working with users


