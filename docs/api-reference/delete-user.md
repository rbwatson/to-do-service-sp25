---
title: "Delete a user"
description: "API endpoint to remove a user from the system."
tags: ["users", "endpoint", "DELETE"]
categories: ["api-reference"]
importance: 7
api_endpoints: ["/users/{userId}"]
related_pages: ["user-resource"]
parent: "API Reference" 
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 20, 2025"
nav_order: "6"
layout: "default"
version: "v1.0.0"
lastUpdated: "May 20, 2025"
---

# Delete a user

Removes a user from the system. This operation is irreversible.

## Endpoint

```
DELETE /users/{userId}
```

## Path parameters

| Parameter | Type | Description | Required |
|-----------|------|-------------|----------|
| `userId` | integer | The unique identifier of the user to delete | Yes |

## Request example

```bash
# cURL example
curl -X DELETE http://localhost:3000/users/1 \
  -H "Authorization: Bearer your-token-here"
```

```python
# Python example
import requests

url = "http://localhost:3000/users/1"
headers = {
    "Authorization": "Bearer your-token-here"
}

response = requests.delete(url, headers=headers)
print(response.status_code)
```

```javascript
// JavaScript example
fetch('http://localhost:3000/users/1', {
  method: 'DELETE',
  headers: {
    'Authorization': 'Bearer your-token-here'
  }
})
.then(response => {
  if (response.ok) {
    console.log('User deleted successfully');
  } else {
    throw new Error('Failed to delete user');
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
| 400 Bad Request | Invalid user ID format | `INVALID_FIELD` |
| 401 Unauthorized | Missing or invalid authentication | `UNAUTHORIZED` |
| 403 Forbidden | Insufficient permissions | `FORBIDDEN` |
| 404 Not Found | User not found | `RESOURCE_NOT_FOUND` |
| 429 Too Many Requests | Rate limit exceeded | `RATE_LIMIT_EXCEEDED` |
| 500 Server Error | Unexpected server error | `SERVER_ERROR` |

See [Error responses](error-responses.md) for details on error response format.

## Authentication

This endpoint requires authentication using a bearer token:

```
Authorization: Bearer your-token-here
```

## Important considerations

- This operation is irreversible. Once a user is deleted, it cannot be recovered.
- When a user is deleted, all tasks associated with that user are also deleted (cascade delete).
- The `userId` must be a valid integer that corresponds to an existing user. If the specified user does not exist, the API will return a 404 Not Found response.
- The API will not return a response body on success, only an HTTP 204 status code.

## Best practices

- Implement a confirmation step in your application before sending the delete request to prevent accidental deletions.
- Consider implementing a soft delete mechanism in your application if you need the ability to recover deleted users.
- Update your application's state after a successful deletion to reflect the change.
- Handle the 404 Not Found response gracefully if the user has already been deleted.

## Code examples

### Delete a user with error handling

```javascript
// JavaScript example: Delete a user with error handling
async function deleteUser(userId) {
  try {
    const response = await fetch(`http://localhost:3000/users/${userId}`, {
      method: 'DELETE',
      headers: {
        'Authorization': 'Bearer your-token-here'
      }
    });
    
    if (!response.ok) {
      const errorData = await response.json();
      
      if (response.status === 404) {
        throw new Error(`User with ID ${userId} not found`);
      }
      
      throw new Error(errorData.message || `Failed to delete user with ID ${userId}`);
    }
    
    return true; // Successful deletion
  } catch (error) {
    console.error(`Error deleting user with ID ${userId}:`, error);
    throw error;
  }
}

// Usage example
try {
  const success = await deleteUser(1);
  if (success) {
    console.log('User deleted successfully');
    // Update application state to reflect deletion
  }
} catch (error) {
  console.error('Failed to delete user:', error.message);
}
```

```python
# Python example: Delete a user with error handling
def delete_user(token, user_id):
    try:
        url = f"http://localhost:3000/users/{user_id}"
        headers = {
            "Authorization": f"Bearer {token}"
        }
        
        response = requests.delete(url, headers=headers)
        
        if response.status_code == 204:
            return True  # Successful deletion
        
        if response.status_code == 404:
            print(f"User with ID {user_id} not found")
            return False
            
        # Handle other error responses
        try:
            error_data = response.json()
            print(f"API error: {error_data.get('message', f'Status code: {response.status_code}')}")
        except ValueError:
            # Could not parse error response as JSON
            print(f"Error deleting user. Status code: {response.status_code}")
        
        return False
    except Exception as e:
        print(f"Error deleting user: {str(e)}")
        return False

# Usage example
success = delete_user("your-token-here", 1)

if success:
    print("User deleted successfully")
    # Update application state to reflect deletion
else:
    print("Failed to delete user")
```

## Related resources

- [User resource](../resources/user-resource.md)

## See also

- [Get all users](get-all-users.md)
- [Create a user](create-user.md)
- [Get user by ID](get-user-by-id.md)
- [Update a user](update-user.md)


