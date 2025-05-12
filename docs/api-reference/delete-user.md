---
title: "Delete a user"
description: "API endpoint to remove a user from the system."
tags: ["users", "endpoint", "DELETE"]
categories: ["api-reference"]
importance: 7
api_endpoints: ["/users/{userId}"]
related_pages: ["user-resource"]
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 12, 2025"
navOrder: 6
---

# Delete a user

The `DELETE /users/{userId}` endpoint removes a specific user from the system. This endpoint permanently deletes the user and all associated tasks.

## Endpoint

```
DELETE /users/{userId}
```

## Authentication

This endpoint requires authentication. Include the bearer token in the request header:

```
Authorization: Bearer YOUR_TOKEN
```

## Path parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `userId` | integer | Yes | The unique identifier of the user to delete |

## Request example

```http
DELETE /users/1 HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
```

## Response

### Success response (204 No Content)

If the user is deleted successfully, the API returns a `204 No Content` status code with no response body.

### Error responses

| Status | Code | Description |
|--------|------|-------------|
| 400 | `INVALID_FIELD` | Invalid `userId` format |
| 401 | `UNAUTHORIZED` | Authentication required |
| 403 | `FORBIDDEN` | Access denied |
| 404 | `RESOURCE_NOT_FOUND` | User not found |
| 429 | `RATE_LIMIT_EXCEEDED` | Too many requests |
| 500 | `SERVER_ERROR` | Server error |

For more information on error responses, see the [Error responses](error-responses.html) document.

#### User not found example (404)

```json
{
  "code": "RESOURCE_NOT_FOUND",
  "message": "User with ID 999 could not be found",
  "requestId": "req-f8d31a62-e789-4856-9452-5efa50223c7a"
}
```

## Cascade delete behavior

When a user is deleted, all tasks associated with that user are also deleted. This cascade delete behavior ensures that no orphaned tasks remain in the system.

## Important considerations

- This operation cannot be undone
- All tasks owned by the user will be permanently deleted
- The `userId` cannot be reused for new users

## Code examples

### cURL

```bash
curl -X DELETE \
  http://localhost:3000/users/1 \
  -H 'Authorization: Bearer YOUR_TOKEN'
```

### JavaScript

```javascript
async function deleteUser(userId) {
  const response = await fetch(`http://localhost:3000/users/${userId}`, {
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
deleteUser(1)
  .then(() => console.log('User deleted successfully'))
  .catch(error => console.error('Failed to delete user:', error));
```

### Python

```python
import requests

def delete_user(user_id):
    url = f'http://localhost:3000/users/{user_id}'
    
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
    delete_user(1)
    print('User deleted successfully')
except Exception as e:
    print('Failed to delete user:', str(e))
```

## Common use cases

### Account removal

When a user wants to remove their account from the system, along with all their tasks.

### Administrative cleanup

When administrators need to remove inactive or problematic user accounts.

## Best practices

- Confirm the deletion with the user before making this request, as it cannot be undone
- Consider implementing a "soft delete" in your application logic if you need to preserve user data
- Handle the 404 error gracefully if the user has already been deleted

## Related resources

- [User resource](../resources/user-resource.html) - Detailed information about the user resource
- [Get all users](get-all-users.html) - Retrieve a list of all users
- [Get user by ID](get-user-by-id.html) - Retrieve a specific user
- [Create a user](create-user.html) - Create a new user
- [Update a user](update-user.html) - Update an existing user

## See also

- [Error handling](../core-concepts/error-handling.html) - How to handle API errors
- [Getting started with users](../tutorials/getting-started-with-users.html) - Tutorial on user management


