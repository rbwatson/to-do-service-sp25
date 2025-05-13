---
title: "Update a user"
description: "API endpoint to update an existing user's information."
tags: ["users", "endpoint", "PATCH"]
categories: ["api-reference"]
importance: 7
api_endpoints: ["/users/{userId}"]
related_pages: ["user-resource"]
parent: "api-reference"
hasChildren: false
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "2025-05-13"
navOrder: "5"
layout: "default"
version: "v1.0.0"
lastUpdated: "2025-05-13"
---

# Update a User

## Endpoint

```
PATCH /users/{userId}
```

This endpoint updates an existing user's information. You can update one or more properties of the user resource.

## Path Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `userId` | String | Unique identifier of the user to update |

## Request Body

The request body should be a JSON object containing the properties you want to update. You can include one or more of the following properties:

| Property | Type | Description |
|----------|------|-------------|
| `name` | String | Full name of the user |
| `email` | String | Email address of the user (must be unique) |
| `role` | String | Role of the user: "admin", "manager", or "member" |

### Example Request Body

```json
{
  "name": "John Smith",
  "role": "admin"
}
```

## Request Example

```http
PATCH /users/user123
Content-Type: application/json
Authorization: Bearer YOUR_API_KEY

{
  "name": "John Smith",
  "role": "admin"
}
```

## Response

### Success Response (200 OK)

```json
{
  "id": "user123",
  "name": "John Smith",
  "email": "john.doe@example.com",
  "role": "admin",
  "createdAt": "2025-04-01T10:00:00Z",
  "updatedAt": "2025-05-13T15:30:00Z"
}
```

### Error Responses

| Status Code | Description |
|-------------|-------------|
| 400 | Bad request (e.g., malformed request body) |
| 401 | Unauthorized (missing or invalid authentication) |
| 403 | Forbidden (insufficient permissions to update this user) |
| 404 | Not Found (user with the specified ID does not exist) |
| 409 | Conflict (e.g., email already exists) |
| 422 | Unprocessable entity (e.g., validation errors) |

#### Example Error Response (409 Conflict)

```json
{
  "error": {
    "code": "resource_conflict",
    "message": "Email address is already in use by another user"
  }
}
```

For details on error responses, see [Error Responses](/api-reference/error-responses.md).

## Authentication

This endpoint requires authentication using a bearer token. Include your API key in the `Authorization` header:

```
Authorization: Bearer YOUR_API_KEY
```

The authenticated user must have appropriate permissions to update the requested user:
- `admin` users can update any user, including changing roles
- `manager` users can update users with "member" role but cannot change roles to "admin"
- `member` users can only update their own information and cannot change their role

## Important Considerations

- **Partial Updates**: This endpoint supports partial updates. You only need to include the properties you want to change in the request body.

- **Email Uniqueness**: If you update the email address, it must be unique across all users. Attempting to use an email that's already associated with another user will result in a `409 Conflict` error.

- **Role Restrictions**: There are restrictions on who can change roles:
  - Only admins can promote users to the "admin" role
  - Managers can promote members to "manager" but cannot promote to "admin"
  - Users cannot change their own role

- **Read-Only Fields**: The `id`, `createdAt`, and `updatedAt` fields are read-only and cannot be updated. If included in the request, they will be ignored.

- **No Response Body for Empty Updates**: If the request body is empty or contains only read-only fields, the response will be a `204 No Content` status with no response body.

## Best Practices

- Only include the fields you want to update in the request body
- Validate email formats client-side before making the API request
- Handle email conflict errors gracefully in your application
- Implement proper authorization checks in your application before attempting role changes
- Consider the impact of role changes on user permissions and access

## Code Examples

### JavaScript

```javascript
async function updateUser(userId, updates) {
  try {
    const response = await fetch(`https://api.taskmanagement.example.com/v1/users/${userId}`, {
      method: 'PATCH',
      headers: {
        'Authorization': `Bearer ${API_KEY}`,
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(updates)
    });
    
    if (response.status === 204) {
      // No content response (empty update)
      return null;
    }
    
    if (!response.ok) {
      const errorData = await response.json();
      throw new Error(`Failed to update user: ${errorData.error.message}`);
    }
    
    return await response.json();
  } catch (error) {
    console.error(`Error updating user ${userId}:`, error);
    throw error;
  }
}

// Example usage
try {
  const updatedUser = await updateUser('user123', {
    name: 'John Smith',
    role: 'manager'
  });
  
  if (updatedUser) {
    console.log(`User updated: ${updatedUser.name} (${updatedUser.role})`);
  } else {
    console.log('User update returned no content');
  }
} catch (error) {
  if (error.message.includes('already in use')) {
    console.error('Email address is already taken by another user');
  } else if (error.message.includes('permission')) {
    console.error('You do not have permission to perform this update');
  } else {
    console.error('Failed to update user:', error);
  }
}
```

### Python

```python
import requests

def update_user(api_key, user_id, **updates):
    """
    Update an existing user's information.
    
    Args:
        api_key (str): API key for authentication
        user_id (str): The unique identifier of the user to update
        **updates: Keyword arguments for fields to update (name, email, role)
    
    Returns:
        dict: Updated user data if successful, None for empty updates
        
    Raises:
        Exception: If the API request fails
    """
    url = f'https://api.taskmanagement.example.com/v1/users/{user_id}'
    headers = {
        'Authorization': f'Bearer {api_key}',
        'Content-Type': 'application/json'
    }
    
    # Filter out None values
    update_data = {k: v for k, v in updates.items() if v is not None}
    
    if not update_data:
        return None  # No updates to make
    
    response = requests.patch(url, json=update_data, headers=headers)
    
    if response.status_code == 204:
        # No content response (empty update was accepted)
        return None
    elif response.status_code == 200:
        return response.json()
    elif response.status_code == 404:
        raise Exception(f"User with ID {user_id} not found")
    elif response.status_code == 409:
        raise Exception("Email address is already in use by another user")
    elif response.status_code == 403:
        raise Exception("You don't have permission to update this user")
    else:
        error_data = response.json()
        raise Exception(f"API error: {error_data['error']['message']}")

# Example usage
try:
    # Update just the name
    updated_user = update_user(
        api_key='YOUR_API_KEY',
        user_id='user123',
        name='Jane Wilson'
    )
    
    if updated_user:
        print(f"User updated successfully:")
        print(f"Name: {updated_user['name']}")
        print(f"Email: {updated_user['email']}")
        print(f"Role: {updated_user['role']}")
    else:
        print("No updates were made or no content was returned")
        
except Exception as e:
    print(f"Error updating user: {e}")
```

### cURL

```bash
# Update name and role
curl -X PATCH "https://api.taskmanagement.example.com/v1/users/user123" \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "John Smith",
    "role": "admin"
  }'

# Update just the email
curl -X PATCH "https://api.taskmanagement.example.com/v1/users/user123" \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "email": "john.smith@example.com"
  }'
```

## Related Resources

- [User Resource](/resources/user-resource.md) - Detailed information about the User resource
- [Get All Users](/api-reference/get-all-users.md) - Retrieve a list of all users
- [Get User by ID](/api-reference/get-user-by-id.md) - Retrieve a specific user by ID
- [Delete a User](/api-reference/delete-user.md) - Remove a user from the system

## See Also

- [Data Model](/core-concepts/data-model.md) - Overview of the core resources and their relationships
- [Authentication](/getting-started/authentication.md) - How to authenticate your API requests
- [Getting Started with Users](/tutorials/getting-started-with-users.md) - Guide to working with users


