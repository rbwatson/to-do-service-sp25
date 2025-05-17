---
title: "Get user by ID"
description: "API endpoint to retrieve a specific user by their unique identifier."
tags: ["users", "endpoint", "GET"]
categories: ["api-reference"]
importance: 7
api_endpoints: ["/users/{userId}"]
related_pages: ["user-resource"]
parent: "API Reference"
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "2025-05-13"
nav_order: "4"
layout: "default"
version: "v1.0.0"
lastUpdated: "2025-05-13"
---

# Get User by ID

## Endpoint

```
GET /users/{userId}
```

This endpoint retrieves a specific user by their unique identifier.

## Path Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `userId` | String | Unique identifier of the user to retrieve |

## Request Example

```http
GET /users/user123
Authorization: Bearer YOUR_API_KEY
```

## Response

### Success Response (200 OK)

```json
{
  "id": "user123",
  "name": "John Doe",
  "email": "john.doe@example.com",
  "role": "manager",
  "createdAt": "2025-04-01T10:00:00Z",
  "updatedAt": "2025-05-10T14:30:00Z"
}
```

### Error Responses

| Status Code | Description |
|-------------|-------------|
| 401 | Unauthorized (missing or invalid authentication) |
| 403 | Forbidden (insufficient permissions to view this user) |
| 404 | Not Found (user with the specified ID does not exist) |

#### Example Error Response (404 Not Found)

```json
{
  "error": {
    "code": "resource_not_found",
    "message": "User with ID 'user123' not found"
  }
}
```

For details on error responses, see [Error Responses](./api-reference/error-responses.md).

## Authentication

This endpoint requires authentication using a bearer token. Include your API key in the `Authorization` header:

```
Authorization: Bearer YOUR_API_KEY
```

The authenticated user must have appropriate permissions to view the requested user:
- `admin` users can view any user
- `manager` users can view all users except admins
- `member` users can only view their own user information

## Important Considerations

- **User ID Format**: User IDs are auto-generated strings assigned by the system when the user is created.

- **Permission Restrictions**: If a user attempts to access a user they don't have permission to view, a `403 Forbidden` error will be returned rather than a `404 Not Found`, for security reasons.

- **Data Sensitivity**: User information may contain sensitive data. Ensure appropriate access controls are in place in your application.

## Best Practices

- Cache user data when appropriate to reduce API calls, particularly for frequently accessed users.

- Handle 404 errors gracefully in your application, providing a user-friendly message when a user is not found.

- Verify that the returned user is the one you intended to retrieve by checking the email or other properties.

- Use the returned user ID in subsequent API calls involving this user, such as assigning tasks.

## Code Examples

### JavaScript

```javascript
async function getUserById(userId) {
  try {
    const response = await fetch(`https://api.taskmanagement.example.com/v1/users/${userId}`, {
      headers: {
        'Authorization': `Bearer ${API_KEY}`
      }
    });
    
    if (response.status === 404) {
      console.warn(`User with ID ${userId} not found`);
      return null;
    }
    
    if (!response.ok) {
      const errorData = await response.json();
      throw new Error(`Error retrieving user: ${errorData.error.message}`);
    }
    
    return await response.json();
  } catch (error) {
    console.error(`Failed to get user ${userId}:`, error);
    throw error;
  }
}

// Example usage
try {
  const user = await getUserById('user123');
  
  if (user) {
    console.log(`User found: ${user.name} (${user.email})`);
    
    // Use the user data for something
    if (user.role === 'manager') {
      // Perform manager-specific operations
    }
  } else {
    console.log('User not found');
  }
} catch (error) {
  console.error('Error fetching user:', error);
}
```

### Python

```python
import requests

def get_user_by_id(api_key, user_id):
    """
    Retrieve a specific user by their ID.
    
    Args:
        api_key (str): API key for authentication
        user_id (str): The unique identifier of the user
    
    Returns:
        dict: User data if found, None if not found
        
    Raises:
        Exception: For API errors other than 404 Not Found
    """
    url = f'https://api.taskmanagement.example.com/v1/users/{user_id}'
    headers = {
        'Authorization': f'Bearer {api_key}'
    }
    
    response = requests.get(url, headers=headers)
    
    if response.status_code == 200:
        return response.json()
    elif response.status_code == 404:
        print(f"User with ID {user_id} not found")
        return None
    elif response.status_code == 403:
        print(f"You don't have permission to view this user")
        return None
    else:
        error_data = response.json()
        raise Exception(f"API error: {error_data['error']['message']}")

# Example usage
try:
    user = get_user_by_id('YOUR_API_KEY', 'user123')
    
    if user:
        print(f"User: {user['name']}")
        print(f"Email: {user['email']}")
        print(f"Role: {user['role']}")
        
        # Use the user information
        if user['role'] == 'admin':
            print("This user has administrative privileges")
    else:
        print("User could not be retrieved")
        
except Exception as e:
    print(f"Error: {e}")
```

### cURL

```bash
curl -X GET "https://api.taskmanagement.example.com/v1/users/user123" \
  -H "Authorization: Bearer YOUR_API_KEY"
```

## Related Resources

- [User Resource](/resources/user-resource.md) - Detailed information about the User resource
- [Get All Users](/api-reference/get-all-users.md) - Retrieve a list of all users
- [Update a User](/api-reference/update-user.md) - Update an existing user's information
- [Delete a User](/api-reference/delete-user.md) - Remove a user from the system

## See Also

- [Data Model](../core-concepts/data-model.md) - Overview of the core resources and their relationships
- [Authentication](../getting-started/authentication.md) - How to authenticate your API requests
- [Getting Started with Users](../tutorials/getting-started-with-users.md) - Guide to working with users
