---
title: "Sorting"
description: "How to sort API results using sort parameters."
tags: ["sorting", "collection"]
categories: ["core-concepts"]
importance: 6
parent: "Core Concepts"
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 20, 2025"
nav_order: "3"
layout: "default"
version: "v1.0.0"
lastUpdated: "May 20, 2025"
---

# Sorting

The Task Management API supports sorting capabilities to help you organize and find specific resources. This page explains how to use sorting in the API.

## Sorting parameter

To sort API results, use the `_sort` query parameter:

| Parameter | Description | Example |
|-----------|-------------|---------|
| `_sort` | Field to sort by, prefixed with `-` for descending order | `_sort=lastName` or `_sort=-dueDate` |

## Sort direction

- **Ascending order**: Use the field name without a prefix (e.g., `_sort=firstName`)
- **Descending order**: Prefix the field name with a hyphen (e.g., `_sort=-dueDate`)

## Request examples

### Sort users by last name (ascending)

```bash
# cURL example
curl -X GET "http://localhost:3000/users?_sort=lastName" \
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
    "_sort": "lastName"
}

response = requests.get(url, headers=headers, params=params)
print(response.json())
```

```javascript
// JavaScript example
fetch('http://localhost:3000/users?_sort=lastName', {
  headers: {
    'Authorization': 'Bearer your-token-here'
  }
})
.then(response => response.json())
.then(data => console.log(data));
```

### Sort tasks by due date (descending)

```bash
# cURL example
curl -X GET "http://localhost:3000/tasks?_sort=-dueDate" \
  -H "Authorization: Bearer your-token-here"
```

```python
# Python example
import requests

url = "http://localhost:3000/tasks"
headers = {
    "Authorization": "Bearer your-token-here"
}
params = {
    "_sort": "-dueDate"
}

response = requests.get(url, headers=headers, params=params)
print(response.json())
```

```javascript
// JavaScript example
fetch('http://localhost:3000/tasks?_sort=-dueDate', {
  headers: {
    'Authorization': 'Bearer your-token-here'
  }
})
.then(response => response.json())
.then(data => console.log(data));
```

## Sortable fields

### User resource

You can sort the User resource by these fields:
- `userId`
- `firstName`
- `lastName`
- `contactEmail`

### Task resource

You can sort the Task resource by these fields:
- `taskId`
- `userId`
- `taskTitle`
- `taskStatus`
- `dueDate`
- `warningOffset`

## Combining with pagination

Sorting can be combined with pagination to create more complex queries:

```
GET /tasks?_sort=-dueDate&_page=0&_perPage=10
```

This retrieves the first page of tasks, with 10 tasks per page, sorted by due date in descending order (newest first).

See the [pagination documentation](pagination.md) for more details on pagination options.

## Combining with filtering

Sorting can also be combined with filtering:

```
GET /tasks?taskStatus=IN_PROGRESS&_sort=dueDate
```

This retrieves all in-progress tasks, sorted by due date in ascending order (oldest first).

## Best practices

1. Use sorting to create more usable and predictable API responses
2. Combine sorting with pagination when displaying lists to users
3. Sort by date fields in descending order (`-dueDate`) to show newest items first
4. Sort by name fields in ascending order (`firstName`, `lastName`) for alphabetical listings

## Endpoints supporting sorting

The following endpoints support sorting:

- `GET /users`: Retrieve all users
- `GET /tasks`: Retrieve all tasks

## Next steps

- Learn about [pagination](pagination.md) to manage large result sets
- Explore the [API reference](../api-reference.md) for detailed endpoint documentation


