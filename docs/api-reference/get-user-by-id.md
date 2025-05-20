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
ai-generated-date: "May 20, 2025"
nav_order: "4"
layout: "default"
version: "v1.0.0"
lastUpdated: "May 20, 2025"
---

# Get user by ID

Retrieves a specific user by their unique identifier.

## Endpoint

```
GET /users/{userId}
```

## Path parameters

| Parameter | Type | Description | Required |
|-----------|------|-------------|----------|
| `userId` | integer | The unique identifier of the user to retrieve | Yes |

## Request example

```bash
# cURL example
curl -X GET http://localhost:3000/users/1 \
  -H "Authorization: Bearer your-token-here"
```

```python
# Python example
import requests

url = "http://localhost:3000/users/1"
headers = {
    "Authorization": "Bearer your-token-here"
}

response = requests.get(url, headers=headers)
print(response.json())
```

```javascript
// JavaScript example
fetch('http://localhost:3000/users/1', {
  headers: {
    'Authorization': 'Bearer your-token-here'
  }
})
.then(response => response.json())
.then(data => console.log(data));
```

## Response

### Success response (200 OK)

```json
{
  "userId": 1,
  "firstName": "John",
  "lastName": "Doe",
  "contactEmail": "john.doe@example.com"
}
```

### Error responses

| Status code | Description | Error code |
|-------------|-------------|------------|
| 400 Bad Request | Invalid user ID format | `INVALID_FIELD` |
| 401 Unauthorized | Missing or invalid authentication | `UNAUTHORIZED` |
| 403 Forbidden | Insufficient permissions | `FORBIDDEN` |
| 404 Not Found | User not found | `RESOURCE_NOT_FOUND` |
| 429 Too Many Requests | Rate limit exceeded | `RATE_LIMIT_EXCEEDED` |
| 500 Server Error | Unexpected server error | `SERVER_ERROR` |

See [Error responses](error-responses.md) for details on error response format.

## Authentication

This endpoint requires authentication using a bearer token:

```
Authorization: Bearer your-token-here
```

## Important considerations

- The `userId` must be a valid integer that corresponds to an existing user.
- If the specified user does not exist, the API will return a 404 Not Found response.
- This endpoint returns a single user object, not an array.

## Best practices

- Cache user details when appropriate to reduce API calls.
- Implement proper error handling to deal with cases where the user does not exist.
- Use this endpoint when you need detailed information about a specific user rather than filtering the GET /users endpoint.

## Code examples

### Retrieve a user by ID with error handling

```javascript
// JavaScript example: Retrieve a user by ID with error handling
async function getUserById(userId) {
  try {
    const response = await fetch(`http://localhost:3000/users/${userId}`, {
      headers: {
        'Authorization': 'Bearer your-token-here'
      }
    });
    
    if (!response.ok) {
      const errorData = await response.json();
      
      if (response.status === 404) {
        throw new Error(`User with ID ${userId} not found`);
      }
      
      throw new Error(errorData.message || `Failed to retrieve user with ID ${userId}`);
    }
    
    return await response.json();
  } catch (error) {
    console.error(`Error retrieving user with ID ${userId}:`, error);
    throw error;
  }
}

// Usage example
try {
  const user = await getUserById(1);
  console.log('User details:', user);
} catch (error) {
  console.error('Failed to retrieve user:', error.message);
}
```

```python
# Python example: Retrieve a user by ID with error handling
def get_user_by_id(token, user_id):
    try:
        url = f"http://localhost:3000/users/{user_id}"
        headers = {
            "Authorization": f"Bearer {token}"
        }
        
        response = requests.get(url, headers=headers)
        
        if response.status_code == 404:
            print(f"User with ID {user_id} not found")
            return None
            
        response.raise_for_status()  # Raise exception for other 4XX/5XX status codes
        
        return response.json()
    except requests.exceptions.HTTPError as e:
        # Handle API errors
        try:
            error_data = e.response.json()
            print(f"API error: {error_data.get('message', str(e))}")
        except ValueError:
            # Could not parse error response as JSON
            print(f"Error retrieving user: {str(e)}")
        return None
    except Exception as e:
        print(f"Error retrieving user: {str(e)}")
        return None

# Usage example
user = get_user_by_id("your-token-here", 1)

if user:
    print(f"User details: {user}")
else:
    print("Failed to retrieve user")
```

## Related resources

- [User resource](../resources/user-resource.md)

## See also

- [Get all users](get-all-users.md)
- [Create a user](create-user.md)
- [Update a user](update-user.md)
- [Delete a user](delete-user.md)


