---
title: "Create a user"
description: "API endpoint to create a new user in the system."
tags: ["users", "endpoint", "POST"]
categories: ["api-reference"]
importance: 7
api_endpoints: ["/users"]
related_pages: ["user-resource"]
parent: "API Reference"
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "2025-05-13"
nav_order: "3"
layout: "default"
version: "v1.0.0"
lastUpdated: "2025-05-13"
---

# Create a User

## Endpoint

```
POST /users
```

This endpoint creates a new user in the system. The new user can be assigned tasks and will have permissions based on their assigned role.

## Path Parameters

None.

## Request Body

The request body should be a JSON object with the following properties:

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `name` | String | Yes | Full name of the user |
| `email` | String | Yes | Email address of the user (must be unique) |
| `role` | String | No | Role of the user: "admin", "manager", or "member" (default: "member") |

### Example Request Body

```json
{
  "name": "John Doe",
  "email": "john.doe@example.com",
  "role": "manager"
}
```

## Request Example

```http
POST /users
Content-Type: application/json
Authorization: Bearer YOUR_API_KEY

{
  "name": "John Doe",
  "email": "john.doe@example.com",
  "role": "manager"
}
```

## Response

### Success Response (201 Created)

```json
{
  "id": "user123",
  "name": "John Doe",
  "email": "john.doe@example.com",
  "role": "manager",
  "createdAt": "2025-05-13T10:30:00Z",
  "updatedAt": "2025-05-13T10:30:00Z"
}
```

### Error Responses

| Status Code | Description |
|-------------|-------------|
| 400 | Bad request (e.g., malformed request body) |
| 401 | Unauthorized (missing or invalid authentication) |
| 403 | Forbidden (insufficient permissions to create users) |
| 409 | Conflict (e.g., email already exists) |
| 422 | Unprocessable entity (e.g., validation errors) |

#### Example Error Response

```json
{
  "error": {
    "code": "validation_error",
    "message": "The request contains invalid data",
    "details": {
      "email": "Email address is already in use"
    }
  }
}
```

For details on error responses, see [Error Responses](../api-reference/error-responses.md).

## Authentication

This endpoint requires authentication using a bearer token. Include your API key in the `Authorization` header:

```
Authorization: Bearer YOUR_API_KEY
```

The authenticated user must have appropriate permissions to create users:
- `admin` users can create users with any role
- `manager` users can create users with "member" role only
- `member` users cannot create new users

## Important Considerations

- **Email Uniqueness**: Each user must have a unique email address. Attempting to create a user with an email that's already in use will result in a `409 Conflict` error.

- **User Roles**: Valid roles are "admin", "manager", and "member". If no role is specified, "member" is assigned by default.

- **Permissions**: The newly created user's permissions will be based on their role:
  - `admin`: Full access to all API endpoints
  - `manager`: Can manage users and tasks but with some restrictions
  - `member`: Limited access, primarily to their own resources

- **Auto-Generated Fields**: The `id`, `createdAt`, and `updatedAt` fields are automatically generated and cannot be specified in the request.

## Best Practices

- Validate the email format client-side before making the API request
- Use strong, unique passwords for each user (managed outside this API)
- Assign the least privileged role necessary for the user's needs
- Store the returned user ID for future operations involving this user
- Implement proper error handling for duplicate email addresses

## Code Examples

### JavaScript

```javascript
async function createUser(name, email, role = 'member') {
  try {
    const response = await fetch('https://api.taskmanagement.example.com/v1/users', {
      method: 'POST',
      headers: {
        'Authorization': `Bearer ${API_KEY}`,
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        name,
        email,
        role
      })
    });
    
    if (!response.ok) {
      const errorData = await response.json();
      throw new Error(`Failed to create user: ${errorData.error.message}`);
    }
    
    return await response.json();
  } catch (error) {
    console.error('Error creating user:', error);
    throw error;
  }
}

// Example usage
try {
  const newUser = await createUser(
    'Jane Smith',
    'jane.smith@example.com',
    'manager'
  );
  
  console.log(`User created with ID: ${newUser.id}`);
} catch (error) {
  // Handle error
  if (error.message.includes('already in use')) {
    console.error('Email address is already registered');
  } else {
    console.error('Failed to create user:', error);
  }
}
```

### Python

```python
import requests

def create_user(api_key, name, email, role='member'):
    """
    Create a new user in the system.
    
    Args:
        api_key (str): API key for authentication
        name (str): Full name of the user
        email (str): Email address of the user
        role (str, optional): User role (admin, manager, or member). Defaults to 'member'.
        
    Returns:
        dict: The created user object
        
    Raises:
        Exception: If the API request fails
    """
    url = 'https://api.taskmanagement.example.com/v1/users'
    headers = {
        'Authorization': f'Bearer {api_key}',
        'Content-Type': 'application/json'
    }
    data = {
        'name': name,
        'email': email,
        'role': role
    }
    
    response = requests.post(url, json=data, headers=headers)
    
    if response.status_code == 201:
        return response.json()
    elif response.status_code == 409:
        error_data = response.json()
        raise Exception(f"User creation failed: Email already exists")
    else:
        error_data = response.json()
        raise Exception(f"User creation failed: {error_data['error']['message']}")

# Example usage
try:
    user = create_user(
        api_key='YOUR_API_KEY',
        name='Alex Johnson',
        email='alex.johnson@example.com',
        role='member'
    )
    
    print(f"User created successfully:")
    print(f"ID: {user['id']}")
    print(f"Name: {user['name']}")
    print(f"Email: {user['email']}")
    print(f"Role: {user['role']}")
    
except Exception as e:
    print(f"Error: {e}")
```

### cURL

```bash
curl -X POST "https://api.taskmanagement.example.com/v1/users" \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "John Doe",
    "email": "john.doe@example.com",
    "role": "manager"
  }'
```

## Related Resources

- [User Resource](../resources/user-resource.md) - Detailed information about the User resource
- [Get All Users](../api-reference/get-all-users.md) - Retrieve a list of all users
- [Get User by ID](../api-reference/get-user-by-id.md) - Retrieve a specific user by ID

## See Also

- [Data Model](../core-concepts/data-model.md) - Overview of the core resources and their relationships
- [Authentication](../getting-started/authentication.md) - How to authenticate your API requests
- [Getting Started with Users](../tutorials/getting-started-with-users.md) - Guide to working with users


