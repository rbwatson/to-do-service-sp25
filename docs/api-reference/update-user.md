---
title: "Update a user"
description: "API endpoint to update an existing user's information."
tags: ["users", "endpoint", "PATCH"]
categories: ["api-reference"]
importance: 7
api_endpoints: ["/users/{userId}"]
related_pages: ["user-resource"]
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 12, 2025"
navOrder: 5
---

# Update a user

The `PATCH /users/{userId}` endpoint updates one or more properties of an existing user. This endpoint supports partial updates, allowing you to modify specific fields without affecting the others.

## Endpoint

```
PATCH /users/{userId}
```

## Authentication

This endpoint requires authentication. Include the bearer token in the request header:

```
Authorization: Bearer YOUR_TOKEN
```

## Path parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `userId` | integer | Yes | The unique identifier of the user to update |

## Request body

The request body should be a JSON object containing one or more user properties to update:

| Property | Type | Required | Description | Constraints |
|----------|------|----------|-------------|-------------|
| `firstName` | string | No | User's first name | 1-100 characters |
| `lastName` | string | No | User's last name | 1-100 characters |
| `contactEmail` | string | No | User's email address | Valid email format, unique |

At least one property must be included in the request.

### Example request body

```json
{
  "contactEmail": "new.email@example.com"
}
```

## Request example

```http
PATCH /users/1 HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
Content-Type: application/json

{
  "contactEmail": "new.email@example.com"
}
```

## Response

### Success response (200 OK)

If the user is updated successfully, the API returns a `200 OK` status code and the complete updated user object:

```json
{
  "userId": 1,
  "firstName": "Ferdinand",
  "lastName": "Smith",
  "contactEmail": "new.email@example.com"
}
```

### Error responses

| Status | Code | Description |
|--------|------|-------------|
| 400 | `INVALID_FIELD` | One or more fields have invalid values |
| 400 | `MISSING_REQUIRED_FIELD` | No fields provided for update |
| 400 | `DUPLICATE_EMAIL` | The email address is already in use |
| 401 | `UNAUTHORIZED` | Authentication required |
| 403 | `FORBIDDEN` | Access denied |
| 404 | `RESOURCE_NOT_FOUND` | User not found |
| 429 | `RATE_LIMIT_EXCEEDED` | Too many requests |
| 500 | `SERVER_ERROR` | Server error |

For more information on error responses, see the [Error responses](error-responses.html) document.

#### Invalid field example (400)

```json
{
  "code": "INVALID_FIELD",
  "message": "The field `contactEmail` must be a valid email address",
  "details": [
    {
      "field": "contactEmail",
      "reason": "Invalid format",
      "location": "body"
    }
  ],
  "requestId": "req-f8d31a62-e789-4856-9452-5efa50223c7a"
}
```

#### User not found example (404)

```json
{
  "code": "RESOURCE_NOT_FOUND",
  "message": "User with ID 999 could not be found",
  "requestId": "req-f8d31a62-e789-4856-9452-5efa50223c7a"
}
```

## Response fields

The response contains the updated user object with the following fields:

| Field | Type | Description |
|-------|------|-------------|
| `userId` | integer | Unique identifier for the user |
| `firstName` | string | User's first name |
| `lastName` | string | User's last name |
| `contactEmail` | string | User's email address |

For more information about the user resource, see the [User resource](../resources/user-resource.html) document.

## Validation rules

The API applies the following validation rules when updating a user:

- At least one field must be provided for update
- `firstName` must be between 1 and 100 characters, if provided
- `lastName` must be between 1 and 100 characters, if provided
- `contactEmail` must be a valid email format, if provided
- `contactEmail` must be unique across all users, if provided

If validation fails, the API returns a `400 Bad Request` response with details about the validation errors.

## Update behavior

- The update is partial, meaning only the fields included in the request will be modified
- Omitted fields retain their current values
- The `userId` cannot be modified
- The response includes the complete user object with all fields, including those not modified

## Code examples

### cURL

```bash
curl -X PATCH \
  http://localhost:3000/users/1 \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Content-Type: application/json' \
  -d '{
    "contactEmail": "new.email@example.com"
  }'
```

### JavaScript

```javascript
async function updateUser(userId, userData) {
  const response = await fetch(`http://localhost:3000/users/${userId}`, {
    method: 'PATCH',
    headers: {
      'Authorization': 'Bearer YOUR_TOKEN',
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(userData)
  });
  
  if (!response.ok) {
    const error = await response.json();
    throw new Error(error.message);
  }
  
  return await response.json();
}

// Example usage
const userUpdates = {
  contactEmail: "new.email@example.com"
};

updateUser(1, userUpdates)
  .then(user => console.log('User updated:', user))
  .catch(error => console.error('Failed to update user:', error));
```

### Python

```python
import requests

def update_user(user_id, user_data):
    url = f'http://localhost:3000/users/{user_id}'
    
    headers = {
        'Authorization': 'Bearer YOUR_TOKEN',
        'Content-Type': 'application/json'
    }
    
    response = requests.patch(url, headers=headers, json=user_data)
    
    if response.status_code != 200:
        error = response.json()
        raise Exception(error['message'])
    
    return response.json()

# Example usage
user_updates = {
    "contactEmail": "new.email@example.com"
}

try:
    user = update_user(1, user_updates)
    print('User updated:', user)
except Exception as e:
    print('Failed to update user:', str(e))
```

## Common use cases

### Update contact information

When a user's contact information changes, update their email address:

```json
{
  "contactEmail": "new.email@example.com"
}
```

### Update user name

When a user's name changes, update their first name, last name, or both:

```json
{
  "firstName": "NewFirstName",
  "lastName": "NewLastName"
}
```

## Related resources

- [User resource](../resources/user-resource.html) - Detailed information about the user resource
- [Get all users](get-all-users.html) - Retrieve a list of all users
- [Get user by ID](get-user-by-id.html) - Retrieve a specific user
- [Create a user](create-user.html) - Create a new user
- [Delete a user](delete-user.html) - Remove a user

## See also

- [Error handling](../core-concepts/error-handling.html) - How to handle API errors
- [Getting started with users](../tutorials/getting-started-with-users.html) - Tutorial on user management


