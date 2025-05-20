---
title: "API Reference"
description: "Comprehensive reference documentation for all endpoints in the Task Management API."
tags: ["reference", "endpoints", "api"]
categories: ["api-reference"]
importance: 8
has_toc: false
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 20, 2025"
nav_order: "5"
layout: "default"
version: "v1.0.0"
lastUpdated: "May 20, 2025"
---

# API Reference

This page provides a comprehensive reference for all endpoints in the Task Management API. Each endpoint is documented with its HTTP method, path, parameters, request format, response format, and example code.

## Authentication

All API endpoints require authentication using bearer tokens. Include your token in the Authorization header of each request:

```
Authorization: Bearer your-token-here
```

For more details, see the [Authentication guide](getting-started/authentication.md).

## Base URL

All API endpoints are relative to the base URL:

```
http://localhost:3000
```

## User endpoints

The following endpoints are available for managing users:

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | [/users](api-reference/get-all-users.md) | Get all users |
| POST | [/users](api-reference/create-user.md) | Create a new user |
| GET | [/users/{userId}](api-reference/get-user-by-id.md) | Get a user by ID |
| PATCH | [/users/{userId}](api-reference/update-user.md) | Update a user |
| DELETE | [/users/{userId}](api-reference/delete-user.md) | Delete a user |

## Task endpoints

The following endpoints are available for managing tasks:

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | [/tasks](api-reference/get-all-tasks.md) | Get all tasks |
| POST | [/tasks](api-reference/create-task.md) | Create a new task |
| GET | [/tasks/{taskId}](api-reference/get-task-by-id.md) | Get a task by ID |
| PATCH | [/tasks/{taskId}](api-reference/update-task.md) | Update a task |
| DELETE | [/tasks/{taskId}](api-reference/delete-task.md) | Delete a task |

## Error responses

All endpoints may return error responses in a consistent format. For details on error codes, messages, and handling, see the [Error responses](api-reference/error-responses.md) documentation.

## Common parameters

### Pagination parameters

The following parameters are supported by list endpoints (`GET /users` and `GET /tasks`):

| Parameter | Description | Default | Constraints |
|-----------|-------------|---------|------------|
| `_page` | Page number (zero-indexed) | 0 | Minimum: 0 |
| `_perPage` | Number of items per page | 20 | Minimum: 1, Maximum: 100 |

For more details, see the [Pagination documentation](core-concepts/pagination.md).

### Sorting parameter

The following parameter is supported by list endpoints (`GET /users` and `GET /tasks`):

| Parameter | Description | Example |
|-----------|-------------|---------|
| `_sort` | Field to sort by, prefixed with `-` for descending order | `_sort=lastName` or `_sort=-dueDate` |

For more details, see the [Sorting documentation](core-concepts/sorting.md).

### Filtering parameters

The following parameter is supported by the `GET /tasks` endpoint:

| Parameter | Description | Example |
|-----------|-------------|---------|
| `taskStatus` | Filter tasks by status | `taskStatus=IN_PROGRESS` |

## Resources

For detailed information about the resources used in the API, see:

- [User resource](resources/user-resource.md)
- [Task resource](resources/task-resource.md)

## Need more help?

If you need additional assistance, check out:

- [Getting started guide](getting-started.md)
- [Core concepts](core-concepts.md)
- [Tutorials & guides](tutorials.md)
- [Support & FAQ](support.md)


