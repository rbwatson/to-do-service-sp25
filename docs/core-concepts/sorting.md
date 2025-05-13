---
title: "Sorting"
description: "How to sort API results using sort parameters."
tags: ["sorting", "collection"]
categories: ["core-concepts"]
importance: 6
parent: "Core Concepts"
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "2025-05-13"
nav_order: "3"
layout: "default"
version: "v1.0.0"
lastUpdated: "2025-05-13"
---

# Sorting

The Task Management API allows you to sort collections of resources using the `sort` query parameter. This page explains how to use sorting to organize and retrieve resources in a specific order.

## Basic Sorting

To sort resources, use the `sort` query parameter with a field name:

```
GET /tasks?sort=dueDate
```

By default, sorting is done in ascending order (A to Z, oldest to newest, etc.).

## Sort Direction

To specify the sort direction, prefix the field name with a plus (`+`) for ascending order or a minus (`-`) for descending order:

```
GET /tasks?sort=-dueDate   # Sort by due date, newest first
GET /tasks?sort=+title     # Sort by title, alphabetically A-Z
```

## Multiple Sort Fields

You can sort by multiple fields by separating them with commas:

```
GET /tasks?sort=-priority,dueDate
```

This example sorts tasks by priority in descending order (high to low) and then by due date in ascending order (earliest first) when priorities are the same.

## Sortable Fields

### User Resource

| Field | Type | Description |
|-------|------|-------------|
| `name` | String | User's full name |
| `email` | String | User's email address |
| `createdAt` | Date | When the user was created |
| `updatedAt` | Date | When the user was last updated |

### Task Resource

| Field | Type | Description |
|-------|------|-------------|
| `title` | String | Task title |
| `status` | String | Task status |
| `priority` | String | Task priority |
| `dueDate` | Date | Task due date |
| `createdAt` | Date | When the task was created |
| `updatedAt` | Date | When the task was last updated |

## Example Requests

### Sort Tasks by Due Date (Earliest First)

```http
GET /tasks?sort=dueDate
```

### Sort Tasks by Priority (Highest First) and Due Date (Earliest First)

```http
GET /tasks?sort=-priority,dueDate
```

### Sort Users by Name (Alphabetical)

```http
GET /users?sort=name
```

### Sort Users by Creation Date (Newest First)

```http
GET /users?sort=-createdAt
```

## Combining with Other Parameters

Sorting can be combined with other query parameters like pagination and filtering:

```http
GET /tasks?status=IN_PROGRESS&sort=-priority&limit=10&offset=0
```

This request retrieves:
- Tasks with status "IN_PROGRESS"
- Sorted by priority (highest first)
- Limited to 10 results
- Starting from the first result (offset 0)

## Sorting Response Format

The sorting parameters don't change the structure of the response, only the order of items in the `data` array:

```json
{
  "data": [
    {
      "id": "task123",
      "title": "High priority task",
      "priority": "HIGH",
      "dueDate": "2025-05-15T10:00:00Z",
      // other properties...
    },
    {
      "id": "task456",
      "title": "Medium priority task",
      "priority": "MEDIUM",
      "dueDate": "2025-05-14T10:00:00Z",
      // other properties...
    },
    // more tasks...
  ],
  "pagination": {
    "total": 42,
    "limit": 10,
    "offset": 0,
    "hasMore": true
  }
}
```

## Handling Sort in Code

### JavaScript Example

```javascript
async function getTasksSortedByPriorityAndDueDate() {
  try {
    const response = await fetch('https://api.taskmanagement.example.com/v1/tasks?sort=-priority,dueDate', {
      headers: {
        'Authorization': `Bearer ${API_KEY}`
      }
    });
    
    const result = await response.json();
    return result.data;
  } catch (error) {
    console.error('Error fetching sorted tasks:', error);
    return [];
  }
}
```

### Python Example

```python
import requests

def get_tasks_sorted_by_priority_and_due_date(api_key):
    try:
        response = requests.get(
            'https://api.taskmanagement.example.com/v1/tasks?sort=-priority,dueDate',
            headers={
                'Authorization': f'Bearer {api_key}'
            }
        )
        
        response.raise_for_status()
        result = response.json()
        return result['data']
    except requests.exceptions.RequestException as e:
        print(f'Error fetching sorted tasks: {e}')
        return []
```

## Best Practices

1. **Combine with pagination**: When sorting large collections, always use pagination to improve performance.

2. **Default sorting**: If no sorting is specified, resources are typically sorted by `createdAt` in descending order (newest first).

3. **Custom sorting**: For more complex sorting needs, consider using filtering and then sorting the results client-side.

4. **Sorting null values**: Fields with null values typically appear last in ascending sorts and first in descending sorts.

## See Also

- [Pagination](/core-concepts/pagination.md)
- [Get All Tasks](/api-reference/get-all-tasks.md)
- [Get All Users](/api-reference/get-all-users.md)


