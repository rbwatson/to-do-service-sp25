# Create a New User

Creates a new user in the Task Management system.

**Endpoint:** `POST /users`

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

### Request Body

The request body must be a JSON object with the following properties:

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `firstName` | string | Yes | The user's first name (1-100 characters) |
| `lastName` | string | Yes | The user's last name (1-100 characters) |
| `contactEmail` | string | Yes | The user's email address (3-255 characters) |

> **Note:** The `contactEmail` value must be unique in the system. If you attempt to create a user with an email address that is already in use, you will receive a `400 Bad Request` response.

```json
{
  "firstName": "John",
  "lastName": "Doe",
  "contactEmail": "j.doe@example.com"
}
```

## Response

### Success Response (201 Created)

When the user is successfully created, the API returns HTTP status code `201 Created` with the created user object, including the system-assigned `userId`.

> **Note:** The system automatically generates a unique `userId` for each new user.

#### Response Body

```json
{
  "userId": 5,
  "firstName": "John",
  "lastName": "Doe",
  "contactEmail": "j.doe@example.com"
}
```

### Error Responses

This endpoint may return the following error responses:

- `400 Bad Request` - Invalid or missing required fields
- `401 Unauthorized` - Missing or invalid authentication
- `403 Forbidden` - Insufficient permissions
- `429 Too Many Requests` - Rate limit exceeded
- `500 Server Error` - Unexpected server error

For detailed information about these errors, refer to the [API Error Responses](error-responses.md) documentation.

## Example

### cURL

```bash
curl -X POST https://localhost:3000/users \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer your-token-here" \
  -d '{
    "firstName": "John",
    "lastName": "Doe",
    "contactEmail": "j.doe@example.com"
  }'
```

### JavaScript

```javascript
const createUser = async () => {
  try {
    const response = await fetch('https://localhost:3000/users', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer your-token-here'
      },
      body: JSON.stringify({
        firstName: 'John',
        lastName: 'Doe',
        contactEmail: 'j.doe@example.com'
      })
    });
    
    if (!response.ok) {
      const errorData = await response.json();
      throw new Error(`Error ${response.status}: ${errorData.message}`);
    }
    
    const userData = await response.json();
    console.log('User created:', userData);
    return userData;
  } catch (error) {
    console.error('Failed to create user:', error);
  }
};
```

### Python

```python
import requests

def create_user():
    url = "https://localhost:3000/users"
    headers = {
        "Content-Type": "application/json",
        "Authorization": "Bearer your-token-here"
    }
    payload = {
        "firstName": "John",
        "lastName": "Doe",
        "contactEmail": "j.doe@example.com"
    }
    
    response = requests.post(url, json=payload, headers=headers)
    
    if response.status_code == 201:
        user_data = response.json()
        print(f"User created: {user_data}")
        return user_data
    else:
        print(f"Error {response.status_code}: {response.json()}")
        return None
```

## Common Issues

1. **Duplicate Email**: Attempting to create a user with an email address that already exists in the system will result in a `400 Bad Request` error. Always check if the email is already in use before creating a new user.

2. **Validation Errors**: Make sure all field values meet the validation requirements:
   - `firstName` and `lastName` must be between 1 and 100 characters
   - `contactEmail` must be a valid email format and between 3 and 255 characters

3. **Missing Fields**: All fields (`firstName`, `lastName`, and `contactEmail`) are required. Omitting any of these will result in a `400 Bad Request` error.

4. **Authentication Failures**: Ensure your bearer token is valid and properly formatted in the Authorization header.

5. **Permission Issues**: The authenticated user must have permissions to create new users. If you receive a `403 Forbidden` error, check your account permissions.

6. **Rate Limiting**: If you're creating many users in quick succession, you may encounter rate limiting. Implement back-off logic using the `Retry-After` header.
