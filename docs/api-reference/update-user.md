---
title: "Update a user"
description: "API endpoint to update an existing user's information."
tags: ["users", "endpoint", "PATCH"]
categories: ["api-reference"]
importance: 7
api_endpoints: ["/users/{userId}"]
related_pages: ["user-resource"]
parent: "API Reference" 
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 20, 2025"
nav_order: "5"
layout: "default"
version: "v1.0.0"
lastUpdated: "May 20, 2025"
---

# Update a user

Updates one or more properties of an existing user. The API supports partial updates, so you only need to include the fields you want to change.

## Endpoint

```
PATCH /users/{userId}
```

## Path parameters

| Parameter | Type | Description | Required |
|-----------|------|-------------|----------|
| `userId` | integer | The unique identifier of the user to update | Yes |

## Request body

| Property | Type | Description | Required | Constraints |
|----------|------|-------------|----------|------------|
| `firstName` | string | User's first name | No | 1-100 characters |
| `lastName` | string | User's last name | No | 1-100 characters |
| `contactEmail` | string | User's email address | No | Valid email format, 3-255 characters |

You must include at least one property in the request body.

Example request body:

```json
{
  "contactEmail": "new.email@example.com"
}
```

## Request example

```bash
# cURL example
curl -X PATCH http://localhost:3000/users/1 \
  -H "Authorization: Bearer your-token-here" \
  -H "Content-Type: application/json" \
  -d '{
    "contactEmail": "new.email@example.com"
  }'
```

```python
# Python example
import requests

url = "http://localhost:3000/users/1"
headers = {
    "Authorization": "Bearer your-token-here",
    "Content-Type": "application/json"
}
data = {
    "contactEmail": "new.email@example.com"
}

response = requests.patch(url, headers=headers, json=data)
print(response.json())
```

```javascript
// JavaScript example
fetch('http://localhost:3000/users/1', {
  method: 'PATCH',
  headers: {
    'Authorization': 'Bearer your-token-here',
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({
    contactEmail: 'new.email@example.com'
  })
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
  "contactEmail": "new.email@example.com"
}
```

### Error responses

| Status code | Description | Error code |
|-------------|-------------|------------|
| 400 Bad Request | Invalid request body or user ID | `INVALID_FIELD` |
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

- You must include at least one property in the request body. If the request body is empty or doesn't contain any valid properties, the API will return a 400 Bad Request response.
- The `userId` must be a valid integer that corresponds to an existing user. If the specified user does not exist, the API will return a 404 Not Found response.
- The `contactEmail` must be unique across all users in the system. If you attempt to update a user with an email that already exists for another user, the API will return a 400 Bad Request response.
- String fields have minimum and maximum length constraints. If a field value is too short or too long, the API will return a 400 Bad Request response with an `INVALID_FIELD` error code.
- The `contactEmail` field must contain a valid email address. If the email format is invalid, the API will return a 400 Bad Request response with an `INVALID_FIELD` error code.
- The response includes the complete user object with all properties, including those that weren't updated.

## Best practices

- Only include the fields you want to update in the request body to minimize payload size.
- Validate user input on the client side before sending the request to reduce unnecessary API calls.
- Handle unique email constraints by checking if the email already exists before updating a user.
- Use proper error handling to provide meaningful feedback to users when their input is invalid.
- Consider implementing optimistic updates in your UI to improve perceived performance.

## Code examples

### Update a user with error handling

```javascript
// JavaScript example: Update a user with error handling
async function updateUser(userId, userData) {
  try {
    const response = await fetch(`http://localhost:3000/users/${userId}`, {
      method: 'PATCH',
      headers: {
        'Authorization': 'Bearer your-token-here',
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(userData)
    });
    
    if (!response.ok) {
      const errorData = await response.json();
      
      // Handle specific error cases
      if (errorData.code === 'RESOURCE_NOT_FOUND') {
        throw new Error(`User with ID ${userId} not found`);
      }
      
      if (errorData.code === 'INVALID_FIELD') {
        const fieldErrors = {};
        
        if (errorData.details) {
          errorData.details.forEach(detail => {
            fieldErrors[detail.field] = detail.reason;
          });
        }
        
        throw {
          message: errorData.message,
          fieldErrors
        };
      }
      
      throw new Error(errorData.message || `Failed to update user with ID ${userId}`);
    }
    
    return await response.json();
  } catch (error) {
    console.error(`Error updating user with ID ${userId}:`, error);
    throw error;
  }
}

// Usage example
try {
  const updatedUser = await updateUser(1, {
    contactEmail: 'new.email@example.com'
  });
  console.log('User updated:', updatedUser);
} catch (error) {
  if (error.fieldErrors) {
    // Handle field-specific errors
    Object.entries(error.fieldErrors).forEach(([field, reason]) => {
      console.error(`Error in ${field}: ${reason}`);
      // Update UI to show error for this field
    });
  } else {
    // Handle general error
    console.error('Failed to update user:', error.message);
  }
}
```

```python
# Python example: Update a user with error handling
def update_user(token, user_id, user_data):
    try:
        url = f"http://localhost:3000/users/{user_id}"
        headers = {
            "Authorization": f"Bearer {token}",
            "Content-Type": "application/json"
        }
        
        response = requests.patch(url, headers=headers, json=user_data)
        
        if response.status_code == 404:
            print(f"User with ID {user_id} not found")
            return None
            
        response.raise_for_status()  # Raise exception for other 4XX/5XX status codes
        
        return response.json()
    except requests.exceptions.HTTPError as e:
        # Handle API errors
        try:
            error_data = e.response.json()
            
            # Handle field-specific errors
            if error_data.get("code") == "INVALID_FIELD":
                field_errors = {}
                
                if "details" in error_data:
                    for detail in error_data["details"]:
                        field_errors[detail["field"]] = detail["reason"]
                
                print(f"Validation error: {error_data['message']}")
                for field, reason in field_errors.items():
                    print(f"  - {field}: {reason}")
            else:
                print(f"API error: {error_data.get('message', str(e))}")
                
            return None
        except ValueError:
            # Could not parse error response as JSON
            print(f"Error updating user: {str(e)}")
            return None
    except Exception as e:
        print(f"Error updating user: {str(e)}")
        return None

# Usage example
updated_user = update_user("your-token-here", 1, {
    "contactEmail": "new.email@example.com"
})

if updated_user:
    print(f"User updated: {updated_user}")
else:
    print("Failed to update user")
```

## Related resources

- [User resource](../resources/user-resource.md)

## See also

- [Get all users](get-all-users.md)
- [Create a user](create-user.md)
- [Get user by ID](get-user-by-id.md)
- [Delete a user](delete-user.md)


