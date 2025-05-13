---
title: "Get all users"
description: "API endpoint to retrieve a list of all users with pagination and sorting support."
tags: ["users", "endpoint", "GET"]
categories: ["api-reference"]
importance: 7
api_endpoints: ["/users"]
related_pages: ["user-resource", "pagination", "sorting"]
parent: "API Reference"
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "2025-05-13"
nav_order: "2"
layout: "default"
version: "v1.0.0"
lastUpdated: "2025-05-13"
---

# Get All Users

## Endpoint

```
GET /users
```

This endpoint retrieves a paginated list of users. It supports pagination, sorting, and filtering options to help you find specific users or navigate through large user collections.

## Request Parameters

The following query parameters can be used to filter, sort, and paginate the results:

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `limit` | Integer | 10 | Number of items to return per page (max: 100) |
| `offset` | Integer | 0 | Number of items to skip before starting to collect the result set |
| `sort` | String | `createdAt` | Field to sort by, optionally prefixed with `+` (ascending) or `-` (descending) |
| `email` | String | - | Filter by email (exact match) |
| `name` | String | - | Filter by name (partial match) |
| `role` | String | - | Filter by role (multiple roles can be separated by commas) |

## Request Example

### Basic Request

```http
GET /users
Authorization: Bearer YOUR_API_KEY
```

### Request with Pagination and Sorting

```http
GET /users?limit=5&offset=10&sort=-createdAt
Authorization: Bearer YOUR_API_KEY
```

This request will:
- Return up to 5 users per page
- Skip the first 10 users
- Sort the results by creation date in descending order (newest first)

### Request with Filtering

```http
GET /users?role=admin,manager&name=Smith
Authorization: Bearer YOUR_API_KEY
```

This request will return users:
- With roles "admin" or "manager"
- Whose name contains "Smith"

## Response

### Success Response (200 OK)

```json
{
  "data": [
    {
      "id": "user123",
      "name": "John Smith",
      "email": "john.smith@example.com",
      "role": "admin",
      "createdAt": "2025-04-01T10:00:00Z",
      "updatedAt": "2025-05-10T14:30:00Z"
    },
    {
      "id": "user456",
      "name": "Jane Smith",
      "email": "jane.smith@example.com",
      "role": "manager",
      "createdAt": "2025-04-15T09:30:00Z",
      "updatedAt": "2025-05-09T11:45:00Z"
    },
    // More users...
  ],
  "pagination": {
    "total": 42,    // Total number of users matching the filter
    "limit": 5,     // Number of users per page
    "offset": 10,   // Current offset
    "hasMore": true // Whether there are more users to fetch
  }
}
```

### Error Responses

| Status Code | Description |
|-------------|-------------|
| 400 | Bad request (e.g., invalid parameters) |
| 401 | Unauthorized (missing or invalid authentication) |
| 403 | Forbidden (insufficient permissions) |

For details on error responses, see [Error Responses](/api-reference/error-responses.md).

## Authentication

This endpoint requires authentication using a bearer token. Include your API key in the `Authorization` header:

```
Authorization: Bearer YOUR_API_KEY
```

The authenticated user must have appropriate permissions to view users based on their role:
- `admin` users can see all users
- `manager` users can see all users except admins
- `member` users can only see their own user information

## Important Considerations

- The user list is paginated. By default, only 10 users are returned per request.
- For large user collections, implement pagination to navigate through all users efficiently.
- Email addresses are unique across all users. If you're searching by email, use exact matches.
- Name searches are partial and case-insensitive (e.g., "smith" will match "John Smith").
- Multiple roles can be specified as a comma-separated list (e.g., `role=admin,manager`).

## Best Practices

- Use pagination to avoid loading too many users at once, especially for large organizations.
- Be specific with filtering to reduce the number of results and improve performance.
- Consider caching user data that doesn't change frequently to reduce API calls.
- When listing all users, sort by a relevant field (e.g., name for alphabetical listing, createdAt for newest users).
- Use the user IDs returned by this endpoint when creating tasks or specifying assignees.

## Code Examples

### JavaScript

```javascript
async function getAllUsers(options = {}) {
  // Default parameters
  const queryParams = {
    limit: options.limit || 10,
    offset: options.offset || 0,
    sort: options.sort || '-createdAt',
    ...options.filters
  };
  
  // Build query string
  const queryString = Object.entries(queryParams)
    .map(([key, value]) => `${key}=${encodeURIComponent(value)}`)
    .join('&');
  
  try {
    const response = await fetch(`https://api.taskmanagement.example.com/v1/users?${queryString}`, {
      headers: {
        'Authorization': `Bearer ${API_KEY}`
      }
    });
    
    if (!response.ok) {
      const errorData = await response.json();
      throw new Error(`Error fetching users: ${errorData.error.message}`);
    }
    
    return await response.json();
  } catch (error) {
    console.error('Failed to fetch users:', error);
    throw error;
  }
}

// Example usage
const adminUsers = await getAllUsers({
  filters: { role: 'admin' },
  limit: 20
});

console.log(`Found ${adminUsers.pagination.total} admin users`);
adminUsers.data.forEach(user => console.log(`${user.name} (${user.email})`));
```

### Python

```python
import requests

def get_all_users(api_key, limit=10, offset=0, sort='-createdAt', **filters):
    """
    Retrieve a list of users with optional filtering, sorting, and pagination.
    
    Args:
        api_key (str): API key for authentication
        limit (int): Number of users to return per page
        offset (int): Number of users to skip
        sort (str): Field to sort by (prefix with - for descending)
        **filters: Additional filters (role, name, email)
    
    Returns:
        dict: Response containing users and pagination info
    """
    params = {
        'limit': limit,
        'offset': offset,
        'sort': sort,
        **filters
    }
    
    response = requests.get(
        'https://api.taskmanagement.example.com/v1/users',
        params=params,
        headers={
            'Authorization': f'Bearer {api_key}'
        }
    )
    
    if response.status_code != 200:
        error_data = response.json()
        raise Exception(f"Error fetching users: {error_data['error']['message']}")
    
    return response.json()

# Example usage
try:
    # Get managers with "Johnson" in their name
    managers = get_all_users(
        api_key='YOUR_API_KEY',
        role='manager',
        name='Johnson',
        limit=5
    )
    
    print(f"Found {managers['pagination']['total']} managers matching the criteria")
    
    for user in managers['data']:
        print(f"{user['name']} ({user['email']}) - {user['role']}")
        
except Exception as e:
    print(f"Failed to retrieve users: {e}")
```

### cURL

```bash
# Basic request to get all users (first page)
curl -X GET "https://api.taskmanagement.example.com/v1/users" \
  -H "Authorization: Bearer YOUR_API_KEY"

# Request with pagination, sorting, and filtering
curl -X GET "https://api.taskmanagement.example.com/v1/users?limit=5&offset=10&sort=-createdAt&role=admin,manager&name=Smith" \
  -H "Authorization: Bearer YOUR_API_KEY"
```

## Related Resources

- [User Resource](/resources/user-resource.md) - Detailed information about the User resource
- [Create a User](/api-reference/create-user.md) - Create a new user
- [Get User by ID](/api-reference/get-user-by-id.md) - Retrieve a specific user by ID

## See Also

- [Pagination](/core-concepts/pagination.md) - How to navigate through large collections of resources
- [Sorting](/core-concepts/sorting.md) - How to sort API results using sort parameters
- [Authentication](/getting-started/authentication.md) - How to authenticate your API requests


