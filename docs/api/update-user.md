# Update a User

Updates one or more properties of an existing user. The API supports partial updates, allowing you to modify only the fields you specify.

**Endpoint:** `PATCH /users/{userId}`

## Authentication

This endpoint requires authentication using a Bearer token.

```
Authorization: Bearer {token}
```

## Request

### Headers

| Header | Value | Description |
|--------|-------|-------------|
| Content-Type | application/json | Specifies the format of the request body |
| Authorization | Bearer {token} | Authentication token |

### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `userId` | integer | Yes | The unique ID of the user to update |

### Request Body

The request body should be a JSON object containing the fields you want to update. You can include any combination of the following fields:

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `firstName` | string | No | The user's first name (1-100 characters) |
| `lastName` | string | No | The user's last name (1-100 characters) |
| `contactEmail` | string | No | The user's email address (3-255 characters) |

> **Note:** You must include at least one property in the request body. The `userId` cannot be modified.

> **Note:** If you include `contactEmail`, it must be unique in the system. Attempting to update to an email that already exists for another user will result in a `400 Bad Request` error.

```json
{
  "contactEmail": "new.email@example.com"
}
```

## Response

### Success Response (200 OK)

When the user is successfully updated, the API returns HTTP status code `200 OK` with the updated user object.

#### Response Body

```json
{
  "userId": 1,
  "firstName": "Ferdinand",
  "lastName": "Smith",
  "contactEmail": "new.email@example.com"
}
```

### Error Responses

This endpoint may return the following error responses:

- `400 Bad Request` - Invalid or missing fields
- `401 Unauthorized` - Missing or invalid authentication
- `403 Forbidden` - Insufficient permissions
- `404 Not Found` - User not found
- `429 Too Many Requests` - Rate limit exceeded
- `500 Server Error` - Unexpected server error

For detailed information about these errors, refer to the [API Error Responses](error-responses.md) documentation.

## Example

### cURL

```bash
curl -X PATCH https://localhost:3000/users/1 \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer your-token-here" \
  -d '{
    "contactEmail": "new.email@example.com"
  }'
```

### JavaScript

```javascript
const updateUser = async (userId, updates) => {
  try {
    const response = await fetch(`https://localhost:3000/users/${userId}`, {
      method: 'PATCH',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer your-token-here'
      },
      body: JSON.stringify(updates)
    });
    
    if (!response.ok) {
      const errorData = await response.json();
      throw new Error(`Error ${response.status}: ${errorData.message}`);
    }
    
    const userData = await response.json();
    console.log('User updated:', userData);
    return userData;
  } catch (error) {
    console.error('Failed to update user:', error);
  }
};

// Example usage
updateUser(1, { contactEmail: "new.email@example.com" });
```

### Python

```python
import requests

def update_user(user_id, updates):
    url = f"https://localhost:3000/users/{user_id}"
    headers = {
        "Content-Type": "application/json",
        "Authorization": "Bearer your-token-here"
    }
    
    response = requests.patch(url, json=updates, headers=headers)
    
    if response.status_code == 200:
        user_data = response.json()
        print(f"User updated: {user_data}")
        return user_data
    else:
        print(f"Error {response.status_code}: {response.json()}")
        return None

# Example usage
update_user(1, {"contactEmail": "new.email@example.com"})
```

## Common Issues

1. **Empty Request Body**: You must include at least one valid field in the request body. An empty request body will result in a `400 Bad Request` error.

2. **User Not Found**: If you attempt to update a user that doesn't exist, you'll receive a `404 Not Found` error. Verify the `userId` is correct.

3. **Duplicate Email**: When updating the `contactEmail`, ensure the new email is not already in use by another user. This will cause a `400 Bad Request` error.

4. **Validation Errors**: Make sure all field values meet the validation requirements:
   - `firstName` and `lastName` must be between 1 and 100 characters
   - `contactEmail` must be a valid email format and between 3 and 255 characters

5. **Permission Issues**: The authenticated user must have permissions to update user data. If you receive a `403 Forbidden` error, check your account permissions.

6. **Immutable Fields**: The `userId` cannot be changed. If you include it in the request body, it will be ignored, but this won't cause an error.

7. **Concurrent Updates**: If multiple updates are made to the same user simultaneously, the last one processed will take precedence. There is no built-in optimistic concurrency control in this API.
