---
title: "Create a user"
description: "API endpoint to create a new user in the system."
tags: ["users", "endpoint", "POST"]
categories: ["api-reference"]
importance: 7
api_endpoints: ["/users"]
related_pages: ["user-resource"]
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 12, 2025"
navOrder: 3
---

# Create a user

The `POST /users` endpoint creates a new user in the system. This endpoint allows you to add a user record that can then be associated with tasks.

## Endpoint

```
POST /users
```

## Authentication

This endpoint requires authentication. Include the bearer token in the request header:

```
Authorization: Bearer YOUR_TOKEN
```

## Request body

The request body must be a JSON object with the following properties:

| Property | Type | Required | Description | Constraints |
|----------|------|----------|-------------|-------------|
| `firstName` | string | Yes | User's first name | 1-100 characters |
| `lastName` | string | Yes | User's last name | 1-100 characters |
| `contactEmail` | string | Yes | User's email address | Valid email format, unique |

### Example request body

```json
{
  "firstName": "John",
  "lastName": "Doe",
  "contactEmail": "j.doe@example.com"
}
```

## Request example

```http
POST /users HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
Content-Type: application/json

{
  "firstName": "John",
  "lastName": "Doe",
  "contactEmail": "j.doe@example.com"
}
```

## Response

### Success response (201 Created)

If the user is created successfully, the API returns a `201 Created` status code and the complete user object, including the system-generated `userId`:

```json
{
  "userId": 5,
  "firstName": "John",
  "lastName": "Doe",
  "contactEmail": "j.doe@example.com"
}
```

### Error responses

| Status | Code | Description |
|--------|------|-------------|
| 400 | `INVALID_FIELD` | One or more fields have invalid values |
| 400 | `MISSING_REQUIRED_FIELD` | A required field is missing |
| 400 | `DUPLICATE_EMAIL` | The email address is already in use |
| 401 | `UNAUTHORIZED` | Authentication required |
| 403 | `FORBIDDEN` | Access denied |
| 429 | `RATE_LIMIT_EXCEEDED` | Too many requests |
| 500 | `SERVER_ERROR` | Server error |

For more information on error responses, see the [Error responses](error-responses.html) document.

## Response fields

The response contains the newly created user object with the following fields:

| Field | Type | Description |
|-------|------|-------------|
| `userId` | integer | System-generated unique identifier for the user |
| `firstName` | string | User's first name |
| `lastName` | string | User's last name |
| `contactEmail` | string | User's email address |

For more information about the user resource, see the [User resource](../resources/user-resource.html) document.

## Validation rules

The API applies the following validation rules when creating a user:

- `firstName` must be between 1 and 100 characters
- `lastName` must be between 1 and 100 characters
- `contactEmail` must be a valid email format
- `contactEmail` must be unique across all users
- All required fields must be provided

If validation fails, the API returns a `400 Bad Request` response with details about the validation errors:

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

## Code examples

### cURL

```bash
curl -X POST \
  http://localhost:3000/users \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Content-Type: application/json' \
  -d '{
    "firstName": "John",
    "lastName": "Doe",
    "contactEmail": "j.doe@example.com"
  }'
```

### JavaScript

```javascript
async function createUser(userData) {
  const response = await fetch('http://localhost:3000/users', {
    method: 'POST',
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
const newUser = {
  firstName: "John",
  lastName: "Doe",
  contactEmail: "j.doe@example.com"
};

createUser(newUser)
  .then(user => console.log('User created:', user))
  .catch(error => console.error('Failed to create user:', error));
```

### Python

```python
import requests
import json

def create_user(user_data):
    url = 'http://localhost:3000/users'
    
    headers = {
        'Authorization': 'Bearer YOUR_TOKEN',
        'Content-Type': 'application/json'
    }
    
    response = requests.post(url, headers=headers, json=user_data)
    
    if response.status_code != 201:
        error = response.json()
        raise Exception(error['message'])
    
    return response.json()

# Example usage
new_user = {
    "firstName": "John",
    "lastName": "Doe",
    "contactEmail": "j.doe@example.com"
}

try:
    user = create_user(new_user)
    print('User created:', user)
except Exception as e:
    print('Failed to create user:', str(e))
```

## Next steps

After creating a user, you can:

- [Get user by ID](get-user-by-id.html) to retrieve the user
- [Update a user](update-user.html) to modify the user
- [Create a task](create-task.html) associated with the user
- [Get all tasks](get-all-tasks.html) for the user

## Related resources

- [User resource](../resources/user-resource.html) - Detailed information about the user resource
- [Get all users](get-all-users.html) - Retrieve a list of all users
- [Get user by ID](get-user-by-id.html) - Retrieve a specific user
- [Update a user](update-user.html) - Update an existing user
- [Delete a user](delete-user.html) - Remove a user

## See also

- [Error handling](../core-concepts/error-handling.html) - How to handle API errors
- [Getting started with users](../tutorials/getting-started-with-users.html) - Tutorial on user management


