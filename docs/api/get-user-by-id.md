# Get User by ID

Retrieves a single user based on their unique user ID.

**Endpoint:** `GET /users/{userId}`

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
| `userId` | integer | Yes | The unique ID of the user to retrieve |

> **Note:** The `userId` must be a valid integer value corresponding to an existing user in the system.

## Response

### Success Response (200 OK)

When the request is successful, the API returns HTTP status code `200 OK` with the user object.

#### Response Body

```json
{
  "userId": 1,
  "firstName": "Ferdinand",
  "lastName": "Smith",
  "contactEmail": "f.smith@example.com"
}
```

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
curl -X GET https://localhost:3000/users/1 \
  -H "Authorization: Bearer your-token-here"
```

### JavaScript

```javascript
const getUser = async (userId) => {
  try {
    const response = await fetch(`https://localhost:3000/users/${userId}`, {
      method: 'GET',
      headers: {
        'Authorization': 'Bearer your-token-here'
      }
    });
    
    if (!response.ok) {
      const errorData = await response.json();
      throw new Error(`Error ${response.status}: ${errorData.message}`);
    }
    
    const userData = await response.json();
    console.log('User:', userData);
    return userData;
  } catch (error) {
    console.error('Failed to fetch user:', error);
  }
};
```

### Python

```python
import requests

def get_user(user_id):
    url = f"https://localhost:3000/users/{user_id}"
    headers = {
        "Authorization": "Bearer your-token-here"
    }
    
    response = requests.get(url, headers=headers)
    
    if response.status_code == 200:
        user_data = response.json()
        print(f"User retrieved: {user_data}")
        return user_data
    else:
        print(f"Error {response.status_code}: {response.json()}")
        return None
```

## Common Issues

1. **User Not Found**: If you request a user with an ID that doesn't exist, you'll receive a `404 Not Found` error. Double-check the `userId` value.

2. **Invalid User ID Format**: The `userId` must be a valid integer. If you provide a non-integer value, you'll receive a `400 Bad Request` error.

3. **Permission Issues**: The authenticated user must have permissions to view user details. If you receive a `403 Forbidden` error, check your account permissions.

4. **Authentication Failures**: Ensure your bearer token is valid and properly formatted in the Authorization header.

5. **Rate Limiting**: This endpoint is subject to rate limiting. If you're making many requests in quick succession, implement backoff logic using the `Retry-After` header.

6. **Caching Considerations**: For frequently accessed user data, consider implementing client-side caching to reduce API calls. The response doesn't include cache control headers, so you'll need to implement your own caching strategy.
