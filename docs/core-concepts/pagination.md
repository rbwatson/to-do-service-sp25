---
title: "Pagination"
description: "How to navigate through large collections of resources using pagination parameters."
tags: ["pagination", "collection"]
categories: ["core-concepts"]
importance: 7
parent: "Core Concepts"
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 20, 2025"
nav_order: "2"
layout: "default"
version: "v1.0.0"
lastUpdated: "May 20, 2025"
---

# Pagination

When retrieving collections of resources like users or tasks, the API implements pagination to manage large result sets. This page explains how to use pagination in the Task Management API.

## Pagination parameters

The API supports the following pagination parameters:

| Parameter | Description | Default | Constraints |
|-----------|-------------|---------|------------|
| `_page` | Page number (zero-indexed) | 0 | Minimum: 0 |
| `_perPage` | Number of items per page | 20 | Minimum: 1, Maximum: 100 |

## Request example

Here's an example of requesting the second page of users with 10 users per page:

```bash
# cURL example
curl -X GET "http://localhost:3000/users?_page=1&_perPage=10" \
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
    "_page": 1,
    "_perPage": 10
}

response = requests.get(url, headers=headers, params=params)
print(response.json())
```

```javascript
// JavaScript example
fetch('http://localhost:3000/users?_page=1&_perPage=10', {
  headers: {
    'Authorization': 'Bearer your-token-here'
  }
})
.then(response => response.json())
.then(data => console.log(data));
```

## Response format

The response will contain the requested page of resources:

```json
{
  "users": [
    {
      "userId": 11,
      "firstName": "Jane",
      "lastName": "Doe",
      "contactEmail": "jane.doe@example.com"
    },
    // ... more users up to the specified _perPage value
  ]
}
```

## Pagination strategy

To navigate through all pages of a resource:

1. Start with `_page=0` and your desired `_perPage` value
2. Process the items in the response
3. Increment `_page` by 1 and make another request
4. Repeat until you receive an empty array or fewer items than `_perPage`

## Combining with sorting

Pagination can be combined with sorting to create more complex queries:

```
GET /users?_page=1&_perPage=10&_sort=lastName
```

This retrieves the second page of users, with 10 users per page, sorted by last name in ascending order.

See the [sorting documentation](sorting.md) for more details on sorting options.

## Best practices

1. Use a reasonable `_perPage` value (10-50) to balance between request overhead and payload size
2. Remember that page numbers are zero-indexed (`_page=0` is the first page)
3. Handle empty results gracefully in your application
4. Consider implementing caching for paginated responses

## Endpoints supporting pagination

The following endpoints support pagination:

- `GET /users`: Retrieve all users
- `GET /tasks`: Retrieve all tasks

## Next steps

- Learn about [sorting](sorting.md) to order your paginated results
- Explore the [API reference](../api-reference.md) for detailed endpoint documentation


