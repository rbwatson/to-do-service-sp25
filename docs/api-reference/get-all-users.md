---
title: "Get all users"
description: "API endpoint to retrieve a list of all users with pagination and sorting support."
tags: ["users", "endpoint", "GET"]
categories: ["api-reference"]
importance: 7
api_endpoints: ["/users"]
related_pages: ["user-resource", "pagination", "sorting"]
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 12, 2025"
navOrder: 2
---

# Get all users

The `GET /users` endpoint retrieves a list of all users in the system. This endpoint supports pagination and sorting to help manage large collections of users.

## Endpoint

```
GET /users
```

## Authentication

This endpoint requires authentication. Include the bearer token in the request header:

```
Authorization: Bearer YOUR_TOKEN
```

## Request parameters

The following query parameters are supported:

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `_page` | integer | No | Page number (zero-indexed). Default: 0 |
| `_perPage` | integer | No | Number of items per page (1-100). Default: 20 |
| `_sort` | string | No | Field to sort by. Prefix with `-` for descending order |

### Pagination parameters

- `_page`: Zero-indexed page number to retrieve
- `_perPage`: Number of users to return per page (maximum 100)

For more information on pagination, see the [Pagination](../core-concepts/pagination.html) document.

### Sorting parameters

- `_sort`: Field name to sort by
  - Available fields: `userId`, `firstName`, `lastName`, `contactEmail`
  - Prefix with `-` for descending order (e.g., `-lastName`)

For more information on sorting, see the [Sorting](../core-concepts/sorting.html) document.

## Request examples

### Basic request

```http
GET /users HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
```

### With pagination

```http
GET /users?_page=0&_perPage=10 HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
```

### With sorting

```http
GET /users?_sort=lastName HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
```

### With pagination and sorting

```http
GET /users?_page=0&_perPage=10&_sort=-lastName HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
```

## Response

### Success response (200 OK)

```json
{
  "users": [
    {
      "userId": 1,
      "firstName": "Ferdinand",
      "lastName": "Smith",
      "contactEmail": "f.smith@example.com"
    },
    {
      "userId": 2,
      "firstName": "Jill",
      "lastName": "Jones",
      "contactEmail": "j.jones@example.com"
    },
    {
      "userId": 3,
      "firstName": "Marty",
      "lastName": "Martinez",
      "contactEmail": "m.martinez@example.com"
    },
    {
      "userId": 4,
      "firstName": "Bill",
      "lastName": "Bailey",
      "contactEmail": "b.bailey@example.com"
    }
  ]
}
```

### Error responses

| Status | Code | Description |
|--------|------|-------------|
| 400 | `INVALID_FIELD` | Invalid query parameter |
| 401 | `UNAUTHORIZED` | Authentication required |
| 403 | `FORBIDDEN` | Access denied |
| 429 | `RATE_LIMIT_EXCEEDED` | Too many requests |
| 500 | `SERVER_ERROR` | Server error |

For more information on error responses, see the [Error responses](error-responses.html) document.

## Response fields

The response contains an array of user objects, each with the following fields:

| Field | Type | Description |
|-------|------|-------------|
| `userId` | integer | Unique identifier for the user |
| `firstName` | string | User's first name |
| `lastName` | string | User's last name |
| `contactEmail` | string | User's email address |

For more information about the user resource, see the [User resource](../resources/user-resource.html) document.

## Empty results

If no users match the criteria or if the page is beyond available data, the API returns an empty array:

```json
{
  "users": []
}
```

## Code examples

### cURL

```bash
curl -X GET \
  'http://localhost:3000/users?_page=0&_perPage=10&_sort=lastName' \
  -H 'Authorization: Bearer YOUR_TOKEN'
```

### JavaScript

```javascript
async function getAllUsers(page = 0, perPage = 20, sort = null) {
  const url = new URL('http://localhost:3000/users');
  
  url.searchParams.append('_page', page);
  url.searchParams.append('_perPage', perPage);
  
  if (sort) {
    url.searchParams.append('_sort', sort);
  }
  
  const response = await fetch(url, {
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
```

### Python

```python
import requests

def get_all_users(page=0, per_page=20, sort=None):
    url = 'http://localhost:3000/users'
    
    params = {
        '_page': page,
        '_perPage': per_page
    }
    
    if sort:
        params['_sort'] = sort
    
    headers = {
        'Authorization': 'Bearer YOUR_TOKEN',
        'Content-Type': 'application/json'
    }
    
    response = requests.get(url, params=params, headers=headers)
    
    if response.status_code != 200:
        error = response.json()
        raise Exception(error['message'])
    
    return response.json()
```

## Related resources

- [User resource](../resources/user-resource.html) - Detailed information about the user resource
- [Create a user](create-user.html) - Create a new user
- [Get user by ID](get-user-by-id.html) - Retrieve a specific user
- [Update a user](update-user.html) - Update an existing user
- [Delete a user](delete-user.html) - Remove a user

## See also

- [Pagination](../core-concepts/pagination.html) - Detailed information about pagination
- [Sorting](../core-concepts/sorting.html) - Detailed information about sorting
- [Error handling](../core-concepts/error-handling.html) - How to handle API errors


