---
title: "Sorting"
description: "How to sort API results using sort parameters."
tags: ["sorting", "collection"]
categories: ["core-concepts"]
importance: 6
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 12, 2025"
navOrder: 3
---

# Sorting

The Task Management API provides sorting capabilities to order collections of resources based on specific fields. This document explains how to use sorting parameters to organize your API results.

## Sort parameter

To sort resources, use the `_sort` query parameter. The value should be the field name to sort by.

| Parameter | Description | Example |
|-----------|-------------|---------|
| `_sort` | Field to sort by | `_sort=dueDate` |

## Sorting direction

By default, sorting is in ascending order. To sort in descending order, prefix the field name with a minus sign (`-`).

| Example | Description |
|---------|-------------|
| `_sort=dueDate` | Sort by due date in ascending order (earliest first) |
| `_sort=-dueDate` | Sort by due date in descending order (latest first) |

## Request examples

To retrieve tasks sorted by title in ascending order:

```http
GET /tasks?_sort=taskTitle HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
```

To retrieve users sorted by last name in descending order:

```http
GET /users?_sort=-lastName HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
```

## Sortable fields

### User resource

| Field | Description | Example |
|-------|-------------|---------|
| `userId` | User ID | `_sort=userId` |
| `firstName` | First name | `_sort=firstName` |
| `lastName` | Last name | `_sort=lastName` |
| `contactEmail` | Email address | `_sort=contactEmail` |

### Task resource

| Field | Description | Example |
|-------|-------------|---------|
| `taskId` | Task ID | `_sort=taskId` |
| `userId` | User ID | `_sort=userId` |
| `taskTitle` | Task title | `_sort=taskTitle` |
| `taskStatus` | Task status | `_sort=taskStatus` |
| `dueDate` | Due date | `_sort=dueDate` |
| `warningOffset` | Warning offset | `_sort=warningOffset` |

## Combining sorting with pagination

Sorting works seamlessly with pagination. To retrieve the first page of tasks sorted by due date in descending order:

```http
GET /tasks?_sort=-dueDate&_page=0&_perPage=10 HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
```

For more information on pagination, see the [Pagination](pagination.html) documentation.

## Sorting behavior

- String fields are sorted alphabetically
- Date fields are sorted chronologically
- Numeric fields are sorted numerically
- Enum fields (like `taskStatus`) are sorted based on the string value
- If the sort parameter is omitted, resources are typically returned in the order they were created (by ID)

## Sort examples by use case

### Finding urgent tasks

To find tasks with the earliest due dates:

```http
GET /tasks?_sort=dueDate HTTP/1.1
```

### Finding recently added tasks

To find the most recently added tasks:

```http
GET /tasks?_sort=-taskId HTTP/1.1
```

### Alphabetical user list

To get an alphabetical list of users by last name:

```http
GET /users?_sort=lastName HTTP/1.1
```

## Implementing sorting in client applications

When implementing sorting in a client application, consider these best practices:

- Provide clear UI controls for users to sort by different fields
- Indicate the current sort field and direction
- Remember the user's sort preference between sessions
- Combine sorting with filtering for more precise results

## Sorting code example

```javascript
// Example function to fetch sorted tasks
async function fetchSortedTasks(sortField, ascending = true) {
  // Add a minus sign for descending order
  const sortParam = ascending ? sortField : `-${sortField}`;
  
  try {
    const response = await fetch(`http://localhost:3000/tasks?_sort=${sortParam}`, {
      method: 'GET',
      headers: {
        'Authorization': 'Bearer YOUR_TOKEN',
        'Content-Type': 'application/json'
      }
    });
    
    if (!response.ok) {
      throw new Error(`Error: ${response.status}`);
    }
    
    return await response.json();
  } catch (error) {
    console.error('Failed to fetch sorted tasks:', error);
    throw error;
  }
}
```

## Next steps

After learning about sorting, explore these related topics:

- [Pagination](pagination.html) to handle large result sets
- [Task status lifecycle](task-status-lifecycle.html) to understand the ordering of status values
- [Error handling](error-handling.html) for robust client applications
- [Task resource](../resources/task-resource.html) for more details on task fields


