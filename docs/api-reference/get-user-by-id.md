---
title: "Get user by ID"
description: "API endpoint to retrieve a specific user by their unique identifier."
tags: ["users", "endpoint", "GET"]
categories: ["api-reference"]
importance: 7
api_endpoints: ["/users/{userId}"]
related_pages: ["user-resource"]
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 12, 2025"
navOrder: 4
---

# Get user by ID

The `GET /users/{userId}` endpoint retrieves a specific user by their unique identifier. This endpoint allows you to fetch detailed information about a single user.

## Endpoint

```
GET /users/{userId}
```

## Authentication

This endpoint requires authentication. Include the bearer token in the request header:

```
Authorization: Bearer YOUR_TOKEN
```

## Path parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `userId` | integer | Yes | The unique identifier of the user to retrieve |

## Request example

```http
GET /users/1 HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
```

## Response

### Success response (200 OK)

If the user exists, the API returns a `200 OK` status code and the user object:

```json
{
  "userId": 1,
  "firstName": "Ferdinand",
  "lastName": "Smith",
  "contactEmail": "f.smith@example.com"
}
```

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

#### Not found response example (404)

```json
{
  "code": "RESOURCE_NOT_FOUND",
  "message": "User with ID 999 could not be found",
  "requestId": "req-f8d31a62-e789-4856-9452-5efa50223c7a"
}
```

## Response fields

The response contains the user object with the following fields:

| Field | Type | Description |
|-------|------|-------------|
| `userId` | integer | Unique identifier for the user |
| `firstName` | string | User's first name |
| `lastName` | string | User's last name |
| `contactEmail` | string | User's email address |

For more information about the user resource, see the [User resource](../resources/user-resource.html) document.

## Common use cases

### User profile display

Retrieve a user's details to display their profile information in your application.

### User verification

Verify if a user exists before performing operations that require a valid user.

### User data retrieval

Get a user's information before updating or before associating them with a new task.

## Code examples

### cURL

```bash
curl -X GET \
  http://localhost:3000/users/1 \
  -H 'Authorization: Bearer YOUR_TOKEN'
```

### JavaScript

```javascript
async function getUserById(userId) {
  const response = await fetch(`http://localhost:3000/users/${userId}`, {
    method: 'GET',
    headers: {
      'Authorization': 'Bearer YOUR_TOKEN',
      'Content-Type': 'application/json'
    }
  });
  
  if (!response.ok) {
    const error = await response.json();
    throw new Error(error.message);
  }
  
  return await response.json();
}

// Example usage
getUserById(1)
  .then(user => console.log('User:', user))
  .catch(error => console.error('Failed to get user:', error));
```

### Python

```python
import requests

def get_user_by_id(user_id):
    url = f'http://localhost:3000/users/{user_id}'
    
    headers = {
        'Authorization': 'Bearer YOUR_TOKEN',
        'Content-Type': 'application/json'
    }
    
    response = requests.get(url, headers=headers)
    
    if response.status_code != 200:
        error = response.json()
        raise Exception(error['message'])
    
    return response.json()

# Example usage
try:
    user = get_user_by_id(1)
    print('User:', user)
except Exception as e:
    print('Failed to get user:', str(e))
```

## Error handling

When calling this endpoint, be prepared to handle the following common errors:

### User not found

If the specified `userId` does not exist, the API returns a `404 Not Found` response. Your application should handle this gracefully, for example by displaying a "User not found" message to the user.

### Invalid user ID format

If the `userId` is not a valid integer, the API returns a `400 Bad Request` response. Your application should validate the user ID before making the request.

## Related resources

- [User resource](../resources/user-resource.html) - Detailed information about the user resource
- [Get all users](get-all-users.html) - Retrieve a list of all users
- [Create a user](create-user.html) - Create a new user
- [Update a user](update-user.html) - Update an existing user
- [Delete a user](delete-user.html) - Remove a user

## See also

- [Error handling](../core-concepts/error-handling.html) - How to handle API errors
- [Getting started with users](../tutorials/getting-started-with-users.html) - Tutorial on user management


