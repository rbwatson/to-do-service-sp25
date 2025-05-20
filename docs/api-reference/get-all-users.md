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
ai-generated-date: "May 20, 2025"
nav_order: "2"
layout: "default"
version: "v1.0.0"
lastUpdated: "May 20, 2025"
---

# Get all users

Retrieves a list of all users in the system. This endpoint supports pagination and sorting options to help manage large result sets.

## Endpoint

```
GET /users
```

## Path parameters

None.

## Query parameters

| Parameter | Type | Description | Required | Default | Constraints |
|-----------|------|-------------|----------|---------|------------|
| `_page` | integer | Page number (zero-indexed) | No | 0 | Minimum: 0 |
| `_perPage` | integer | Number of items per page | No | 20 | Minimum: 1, Maximum: 100 |
| `_sort` | string | Field to sort by | No | None | Valid fields: `userId`, `firstName`, `lastName`, `contactEmail` |

### Sorting

To sort results in ascending order, specify the field name:
```
GET /users?_sort=lastName
```

To sort results in descending order, prefix the field name with a hyphen:
```
GET /users?_sort=-lastName
```

## Request example

```bash
# cURL example
curl -X GET "http://localhost:3000/users?_page=0&_perPage=10&_sort=lastName" \
  -H "Authorization: Bearer your-token-here"
```

```python
# Python example
import requests

url = "http://localhost:3000/users"
headers = {
    "Authorization": "Bearer your-token-here"
}
params = {
    "_page": 0,
    "_perPage": 10,
    "_sort": "lastName"
}

response = requests.get(url, headers=headers, params=params)
print(response.json())
```

```javascript
// JavaScript example
fetch('http://localhost:3000/users?_page=0&_perPage=10&_sort=lastName', {
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
  "users": [
    {
      "userId": 1,
      "firstName": "John",
      "lastName": "Doe",
      "contactEmail": "john.doe@example.com"
    },
    {
      "userId": 2,
      "firstName": "Jane",
      "lastName": "Smith",
      "contactEmail": "jane.smith@example.com"
    }
    // Additional users...
  ]
}
```

### Error responses

| Status code | Description | Error code |
|-------------|-------------|------------|
| 400 Bad Request | Invalid query parameters | `INVALID_FIELD` |
| 401 Unauthorized | Missing or invalid authentication | `UNAUTHORIZED` |
| 403 Forbidden | Insufficient permissions | `FORBIDDEN` |
| 429 Too Many Requests | Rate limit exceeded | `RATE_LIMIT_EXCEEDED` |
| 500 Server Error | Unexpected server error | `SERVER_ERROR` |

See [Error responses](error-responses.md) for details on error response format.

## Authentication

This endpoint requires authentication using a bearer token:

```
Authorization: Bearer your-token-here
```

## Important considerations

- The response does not include information about the total number of users or pages. Your application should check if the number of returned users is less than `_perPage` to determine if you've reached the last page.
- Sorting is case-sensitive. For example, when sorting by `lastName`, names starting with uppercase letters will appear before those starting with lowercase letters.
- When retrieving large sets of users, use pagination to improve performance and reduce response payload size.

## Best practices

- Use reasonable page sizes (10-50 users per page) to balance between number of requests and payload size.
- Implement caching for paginated responses to reduce server load and improve application performance.
- When displaying a list of users, include controls to change the sort field and direction.
- Handle empty result sets gracefully in your UI.

## Code examples

### Fetch all users with pagination

```javascript
// JavaScript example: Fetch all users with pagination
async function getAllUsers() {
  const pageSize = 20;
  let currentPage = 0;
  let allUsers = [];
  let hasMoreUsers = true;
  
  while (hasMoreUsers) {
    try {
      const response = await fetch(`http://localhost:3000/users?_page=${currentPage}&_perPage=${pageSize}`, {
        headers: {
          'Authorization': 'Bearer your-token-here'
        }
      });
      
      if (!response.ok) {
        throw new Error(`API error: ${response.status}`);
      }
      
      const data = await response.json();
      const users = data.users;
      
      if (users.length === 0) {
        hasMoreUsers = false;
      } else {
        allUsers = allUsers.concat(users);
        currentPage++;
        
        // Check if we received fewer users than requested (last page)
        if (users.length < pageSize) {
          hasMoreUsers = false;
        }
      }
    } catch (error) {
      console.error('Error fetching users:', error);
      hasMoreUsers = false;
    }
  }
  
  return allUsers;
}
```

```python
# Python example: Fetch all users with pagination
import requests

def get_all_users(token):
    page_size = 20
    current_page = 0
    all_users = []
    has_more_users = True
    
    while has_more_users:
        try:
            url = f"http://localhost:3000/users?_page={current_page}&_perPage={page_size}"
            headers = {"Authorization": f"Bearer {token}"}
            
            response = requests.get(url, headers=headers)
            response.raise_for_status()
            
            data = response.json()
            users = data.get("users", [])
            
            if not users:
                has_more_users = False
            else:
                all_users.extend(users)
                current_page += 1
                
                # Check if we received fewer users than requested (last page)
                if len(users) < page_size:
                    has_more_users = False
                    
        except Exception as e:
            print(f"Error fetching users: {e}")
            has_more_users = False
    
    return all_users
```

```bash
# cURL example: Fetch all users with pagination (bash script)
#!/bin/bash

TOKEN="your-token-here"
PAGE_SIZE=20
CURRENT_PAGE=0
ALL_USERS=""

while true; do
  RESPONSE=$(curl -s -X GET "http://localhost:3000/users?_page=$CURRENT_PAGE&_perPage=$PAGE_SIZE" \
    -H "Authorization: Bearer $TOKEN")
  
  # Extract users array
  USERS=$(echo $RESPONSE | jq -r '.users')
  
  # Check if users array is empty or has fewer items than page size
  USER_COUNT=$(echo $USERS | jq -r 'length')
  
  if [ "$USER_COUNT" -eq 0 ]; then
    break
  fi
  
  # Append to all users
  if [ -z "$ALL_USERS" ]; then
    ALL_USERS=$USERS
  else
    ALL_USERS=$(echo $ALL_USERS $USERS | jq -s 'add')
  fi
  
  CURRENT_PAGE=$((CURRENT_PAGE + 1))
  
  if [ "$USER_COUNT" -lt "$PAGE_SIZE" ]; then
    break
  fi
done

echo $ALL_USERS | jq
```

## Related resources

- [User resource](../resources/user-resource.md)
- [Pagination](../core-concepts/pagination.md)
- [Sorting](../core-concepts/sorting.md)

## See also

- [Create a user](create-user.md)
- [Get user by ID](get-user-by-id.md)
- [Update a user](update-user.md)
- [Delete a user](delete-user.md)


