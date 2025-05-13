---
title: "Pagination"
description: "How to navigate through large collections of resources using pagination parameters."
tags: ["pagination", "collection"]
categories: ["core-concepts"]
importance: 7
parent: "core-concepts"
hasChildren: false
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "2025-05-13"
navOrder: "2"
layout: "default"
version: "v1.0.0"
lastUpdated: "2025-05-13"
---

# Pagination

The Task Management API uses pagination to control the number of items returned in list responses. This helps improve performance and keeps response sizes manageable when working with large collections of resources.

## How Pagination Works

When you make a request to an endpoint that returns multiple resources (like `/users` or `/tasks`), the API will return a subset of the results along with pagination information to help you navigate through all available resources.

## Pagination Parameters

You can control pagination using the following query parameters:

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `limit` | Integer | 10 | Number of items to return per page (max: 100) |
| `offset` | Integer | 0 | Number of items to skip before starting to collect the result set |

## Example Request with Pagination

```http
GET /tasks?limit=5&offset=10
```

This request will:
- Skip the first 10 tasks (offset=10)
- Return the next 5 tasks (limit=5)

## Pagination Response Format

The API returns pagination information in the response body. Here's an example response for a paginated list of tasks:

```json
{
  "data": [
    {
      "id": "task123",
      "title": "Complete API documentation",
      "status": "IN_PROGRESS",
      // other task properties...
    },
    // more tasks...
  ],
  "pagination": {
    "total": 42,       // Total number of items across all pages
    "limit": 5,        // Number of items per page
    "offset": 10,      // Current offset
    "hasMore": true    // Whether there are more items beyond this page
  }
}
```

## Pagination Links

For convenience, the API also includes pagination links in the response headers using the `Link` header:

```
Link: <https://api.taskmanagement.example.com/v1/tasks?limit=5&offset=15>; rel="next",
      <https://api.taskmanagement.example.com/v1/tasks?limit=5&offset=5>; rel="prev",
      <https://api.taskmanagement.example.com/v1/tasks?limit=5&offset=0>; rel="first",
      <https://api.taskmanagement.example.com/v1/tasks?limit=5&offset=40>; rel="last"
```

These links provide URLs for the next, previous, first, and last pages of results.

## Handling Pagination in Code

### JavaScript Example

```javascript
async function getAllTasks() {
  const allTasks = [];
  let hasMore = true;
  let offset = 0;
  const limit = 20;
  
  while (hasMore) {
    const response = await fetch(`https://api.taskmanagement.example.com/v1/tasks?limit=${limit}&offset=${offset}`, {
      headers: {
        'Authorization': `Bearer ${API_KEY}`
      }
    });
    
    const result = await response.json();
    
    // Add the current page of results to our array
    allTasks.push(...result.data);
    
    // Update pagination variables for next iteration
    offset += limit;
    hasMore = result.pagination.hasMore;
  }
  
  return allTasks;
}
```

### Python Example

```python
import requests

def get_all_tasks(api_key):
    all_tasks = []
    has_more = True
    offset = 0
    limit = 20
    
    while has_more:
        response = requests.get(
            f"https://api.taskmanagement.example.com/v1/tasks?limit={limit}&offset={offset}",
            headers={
                'Authorization': f'Bearer {api_key}'
            }
        )
        
        result = response.json()
        
        # Add the current page of results to our list
        all_tasks.extend(result['data'])
        
        # Update pagination variables for next iteration
        offset += limit
        has_more = result['pagination']['hasMore']
    
    return all_tasks
```

## Best Practices

1. **Use reasonable page sizes**: Start with the default limit of 10 and adjust based on your needs. Using very large limits can impact performance.

2. **Cache results when appropriate**: If you're making multiple requests for the same data, consider caching the results to reduce API calls.

3. **Handle empty results**: When the offset exceeds the total number of items, the API will return an empty data array with `hasMore` set to `false`.

4. **Use the provided pagination links**: Instead of calculating offsets manually, use the pagination links provided in the `Link` header when available.

5. **Consider using cursor-based pagination for real-time data**: For frequently updated collections, consider using cursor-based pagination if available to avoid missing or duplicating items.

## See Also

- [Sorting](/core-concepts/sorting.md)
- [Get All Tasks](/api-reference/get-all-tasks.md)
- [Get All Users](/api-reference/get-all-users.md)


