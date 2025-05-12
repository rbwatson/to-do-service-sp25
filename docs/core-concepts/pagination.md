---
title: "Pagination"
description: "How to navigate through large collections of resources using pagination parameters."
tags: ["pagination", "collection"]
categories: ["core-concepts"]
importance: 7
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 12, 2025"
navOrder: 2
---

# Pagination

The Task Management API implements pagination to efficiently handle large collections of resources. This document explains how to use pagination parameters to retrieve resources in manageable chunks.

## Pagination parameters

The API supports the following query parameters for pagination:

| Parameter | Type | Description | Default | Example |
|-----------|------|-------------|---------|---------|
| `_page` | integer | Page number (zero-indexed) | 0 | `_page=0` |
| `_perPage` | integer | Number of items per page | 20 | `_perPage=10` |

## Request example

To retrieve the first page with 10 items per page:

```http
GET /tasks?_page=0&_perPage=10 HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
```

To retrieve the second page:

```http
GET /tasks?_page=1&_perPage=10 HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
```

## Response format

The response body contains the paginated resources:

```json
{
  "tasks": [
    {
      "taskId": 11,
      "userId": 1,
      "taskTitle": "Example Task 11",
      "taskDescription": "Description of task 11",
      "taskStatus": "NOT_STARTED",
      "dueDate": "2025-05-20T14:00:00-05:00",
      "warningOffset": 60
    },
    // ... 9 more tasks
  ]
}
```

## Pagination limits

- The `_page` parameter must be a non-negative integer (0 or greater)
- The `_perPage` parameter must be between 1 and 100
- If you request a page beyond the available data, the API returns an empty array of resources
- If pagination parameters are omitted, the API uses default values (`_page=0` and `_perPage=20`)

## Pagination and sorting

Pagination works seamlessly with sorting. You can combine both features to retrieve sorted pages of resources:

```http
GET /tasks?_page=0&_perPage=10&_sort=-dueDate HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
```

This request retrieves the first 10 tasks sorted by due date in descending order. For more information on sorting, see the [Sorting](sorting.html) document.

## Pagination and filtering

Pagination can be combined with filtering parameters. For example, to get the first page of tasks with the `IN_PROGRESS` status:

```http
GET /tasks?_page=0&_perPage=10&taskStatus=IN_PROGRESS HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
```

## Calculating total pages

The API does not currently provide the total count of resources or pages in the response. If you need to know the total number of pages, you can:

1. Gradually increment the `_page` parameter until you receive an empty array
2. Use a smaller `_perPage` value to reduce the number of requests needed

## Implementing pagination in client applications

When implementing pagination in a client application, consider these best practices:

- Allow users to adjust the number of items per page
- Provide navigation controls (Previous/Next buttons, page numbers)
- Show users which page they're currently viewing
- Cache previously fetched pages to improve performance

## Pagination code example

```javascript
// Example function to fetch paginated tasks
async function fetchTasks(page = 0, perPage = 20) {
  try {
    const response = await fetch(`http://localhost:3000/tasks?_page=${page}&_perPage=${perPage}`, {
      method: 'GET',
      headers: {
        'Authorization': 'Bearer YOUR_TOKEN',
        'Content-Type': 'application/json'
      }
    });
    
    if (!response.ok) {
      throw new Error(`Error: ${response.status}`);
    }
    
    const data = await response.json();
    
    // Check if we've reached the end of the data
    const isEmpty = data.tasks.length === 0;
    
    return {
      tasks: data.tasks,
      isEmpty: isEmpty,
      page: page,
      perPage: perPage
    };
  } catch (error) {
    console.error('Failed to fetch tasks:', error);
    throw error;
  }
}
```

## Next steps

After mastering pagination, explore these related topics:

- [Sorting](sorting.html) to order your paginated results
- [Error handling](error-handling.html) for robust client applications
- [User resource](../resources/user-resource.html) for user-specific operations
- [Task resource](../resources/task-resource.html) for task-specific operations


