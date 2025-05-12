# Delete a User

Removes the specified user from the system.

**Endpoint:** `DELETE /users/{userId}`

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
| `userId` | integer | Yes | The unique ID of the user to delete |

> **Note:** Deleting a user is permanent and cannot be undone. All associated tasks will remain in the system, but they will be orphaned without a valid user reference.

## Response

### Success Response (204 No Content)

When the user is successfully deleted, the API returns HTTP status code `204 No Content` with no response body.

> **Note:** The `204 No Content` response indicates successful deletion even if the user had no associated tasks or data.

### Error Responses

This endpoint may return the following error responses:

- `400 Bad Request` - Invalid user ID format
- `401 Unauthorized` - Missing or invalid authentication
- `403 Forbidden` - Insufficient permissions
- `404 Not Found` - User not found
- `429 Too Many Requests` - Rate limit exceeded
- `500 Server Error` - Unexpected server error

For detailed information about these errors, refer to the [API Error Responses](error-responses.md) documentation.

## Example

### cURL

```bash
curl -X DELETE https://localhost:3000/users/1 \
  -H "Authorization: Bearer your-token-here"
```

### JavaScript

```javascript
const deleteUser = async (userId) => {
  try {
    const response = await fetch(`https://localhost:3000/users/${userId}`, {
      method: 'DELETE',
      headers: {
        'Authorization': 'Bearer your-token-here'
      }
    });
    
    if (response.status === 204) {
      console.log(`User ${userId} successfully deleted`);
      return true;
    } else {
      const errorData = await response.json();
      throw new Error(`Error ${response.status}: ${errorData.message}`);
    }
  } catch (error) {
    console.error('Failed to delete user:', error);
    return false;
  }
};
```

### Python

```python
import requests

def delete_user(user_id):
    url = f"https://localhost:3000/users/{user_id}"
    headers = {
        "Authorization": "Bearer your-token-here"
    }
    
    response = requests.delete(url, headers=headers)
    
    if response.status_code == 204:
        print(f"User {user_id} successfully deleted")
        return True
    else:
        print(f"Error {response.status_code}: {response.json()}")
        return False
```

## Common Issues

1. **User Not Found**: If you attempt to delete a user that doesn't exist, you'll receive a `404 Not Found` error. Double-check the `userId`.

2. **Permission Issues**: The authenticated user must have permissions to delete users. If you receive a `403 Forbidden` error, check your account permissions.

3. **Orphaned Tasks**: When a user is deleted, their tasks remain in the system. Consider handling orphaned tasks in your application logic, either by reassigning them to another user or deleting them separately.

4. **Cascading Failures**: If your application has dependencies on user data, deleting a user may cause issues in other parts of your system. Ensure you update any references to the deleted user appropriately.

5. **Authorization Expiry**: If your authentication token expires during a deletion operation, you'll receive a `401 Unauthorized` error. Always check for authentication failures and refresh tokens as needed.

6. **Rate Limiting**: If you're deleting many users in quick succession, you may encounter rate limiting. Implement backoff logic using the `Retry-After` header.

7. **Race Conditions**: Be aware of potential race conditions if you're making parallel requests that involve the same user. For example, attempting to update a user while simultaneously deleting them could lead to unexpected results.