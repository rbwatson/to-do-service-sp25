---
title: "Task resource"
description: "Detailed information about the Task resource, its properties, and related endpoints."
tags: ["task", "resource"]
categories: ["resources"]
importance: 9
related_pages: ["get-all-tasks", "create-task", "get-task-by-id", "update-task", "delete-task"]
api_endpoints: ["/tasks", "/tasks/{taskId}"]
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 12, 2025"
navOrder: 2
---

# Task resource

The Task resource represents a to-do item in the Task Management API. This document provides detailed information about the Task resource, its properties, and related endpoints.

## Resource overview

The Task resource has the following properties:

| Property | Type | Description | Constraints | Required |
|----------|------|-------------|------------|----------|
| `taskId` | integer | Unique identifier | System-generated, immutable | Yes (in responses) |
| `userId` | integer | Owner's user ID | Must reference existing user | Yes |
| `taskTitle` | string | Short description | 1-80 characters | Yes |
| `taskDescription` | string | Detailed description | 1-255 characters | No |
| `taskStatus` | string enum | Current status | One of predefined values | Yes (defaults to `NOT_STARTED`) |
| `dueDate` | string (date-time) | When task is due | ISO 8601 format | Yes |
| `warningOffset` | integer | Minutes before due date for reminder | 0-64000 | Yes |

## Resource representation

### JSON structure

```json
{
  "taskId": 1,
  "userId": 1,
  "taskTitle": "Complete API documentation",
  "taskDescription": "Finish the task management API documentation for the developer portal",
  "taskStatus": "IN_PROGRESS",
  "dueDate": "2025-05-15T17:00:00-05:00",
  "warningOffset": 60
}
```

## Property details

### taskId

- **Type**: integer
- **Description**: System-generated unique identifier for the task
- **Required**: Automatically generated for responses, not included in requests
- **Example**: `1`

### userId

- **Type**: integer
- **Description**: Identifier of the user who owns the task
- **Constraints**: Must reference an existing user
- **Required**: Yes
- **Example**: `1`

### taskTitle

- **Type**: string
- **Description**: Short description of the task used as the title in lists and headings
- **Constraints**: 1-80 characters
- **Required**: Yes
- **Example**: `"Complete API documentation"`

### taskDescription

- **Type**: string
- **Description**: Detailed description of the task
- **Constraints**: 1-255 characters
- **Required**: No
- **Example**: `"Finish the task management API documentation for the developer portal"`

### taskStatus

- **Type**: string enum
- **Description**: Current state of the task in its lifecycle
- **Constraints**: Must be one of:
  - `NOT_STARTED` - Default value for new tasks
  - `IN_PROGRESS` - Task is actively being worked on
  - `BLOCKED` - Task cannot proceed due to an obstacle
  - `DEFERRED` - Task has been postponed
  - `COMPLETED` - Task has been finished
  - `CANCELLED` - Task has been abandoned
- **Required**: Yes (defaults to `NOT_STARTED` if not provided)
- **Example**: `"IN_PROGRESS"`

For more information about task status values and transitions, see the [Task status lifecycle](../core-concepts/task-status-lifecycle.html) document.

### dueDate

- **Type**: string (date-time)
- **Description**: The date and time when the task should be completed
- **Constraints**: Must be in ISO 8601 format (`YYYY-MM-DDTHH:MM:SS.sssZ`)
- **Required**: Yes
- **Example**: `"2025-05-15T17:00:00-05:00"`

### warningOffset

- **Type**: integer
- **Description**: Number of minutes before the due date to send a reminder
- **Constraints**: 0-64000
- **Required**: Yes
- **Example**: `60` (reminder 1 hour before due date)

## Task lifecycle

1. **Creation**: A task is created via the [Create a task](../api-reference/create-task.html) endpoint
2. **Retrieval**: Task details can be fetched via the [Get task by ID](../api-reference/get-task-by-id.html) endpoint
3. **Update**: Task information can be updated via the [Update a task](../api-reference/update-task.html) endpoint
4. **Status changes**: The task moves through different statuses via updates
5. **Deletion**: A task can be deleted via the [Delete a task](../api-reference/delete-task.html) endpoint

## Related endpoints

The following endpoints work with the Task resource:

| Method | Endpoint | Description | Reference |
|--------|----------|-------------|-----------|
| GET | `/tasks` | Retrieve all tasks | [Get all tasks](../api-reference/get-all-tasks.html) |
| POST | `/tasks` | Create a new task | [Create a task](../api-reference/create-task.html) |
| GET | `/tasks/{taskId}` | Retrieve a specific task | [Get task by ID](../api-reference/get-task-by-id.html) |
| PATCH | `/tasks/{taskId}` | Update a task | [Update a task](../api-reference/update-task.html) |
| DELETE | `/tasks/{taskId}` | Delete a task | [Delete a task](../api-reference/delete-task.html) |

## Creating a task

To create a new task, send a POST request to the `/tasks` endpoint with the required fields:

```http
POST /tasks HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
Content-Type: application/json

{
  "userId": 1,
  "taskTitle": "Complete API documentation",
  "taskDescription": "Finish the task management API documentation for the developer portal",
  "dueDate": "2025-05-15T17:00:00-05:00",
  "warningOffset": 60
}
```

The API will respond with the newly created task, including the system-generated `taskId` and default `taskStatus`:

```json
{
  "taskId": 1,
  "userId": 1,
  "taskTitle": "Complete API documentation",
  "taskDescription": "Finish the task management API documentation for the developer portal",
  "taskStatus": "NOT_STARTED",
  "dueDate": "2025-05-15T17:00:00-05:00",
  "warningOffset": 60
}
```

## Updating a task

To update an existing task, send a PATCH request to the `/tasks/{taskId}` endpoint with the fields you want to update:

```http
PATCH /tasks/1 HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
Content-Type: application/json

{
  "taskStatus": "IN_PROGRESS"
}
```

The API will respond with the complete updated task:

```json
{
  "taskId": 1,
  "userId": 1,
  "taskTitle": "Complete API documentation",
  "taskDescription": "Finish the task management API documentation for the developer portal",
  "taskStatus": "IN_PROGRESS",
  "dueDate": "2025-05-15T17:00:00-05:00",
  "warningOffset": 60
}
```

## Retrieving tasks

To retrieve all tasks, send a GET request to the `/tasks` endpoint:

```http
GET /tasks HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
```

The API will respond with a list of tasks:

```json
{
  "tasks": [
    {
      "taskId": 1,
      "userId": 1,
      "taskTitle": "Complete API documentation",
      "taskDescription": "Finish the task management API documentation for the developer portal",
      "taskStatus": "IN_PROGRESS",
      "dueDate": "2025-05-15T17:00:00-05:00",
      "warningOffset": 60
    },
    {
      "taskId": 2,
      "userId": 1,
      "taskTitle": "Deploy application",
      "taskDescription": "Deploy the application to production",
      "taskStatus": "NOT_STARTED",
      "dueDate": "2025-05-20T09:00:00-05:00",
      "warningOffset": 120
    }
  ]
}
```

### Filtering tasks

You can filter tasks by their status using the `taskStatus` query parameter:

```http
GET /tasks?taskStatus=IN_PROGRESS HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
```

### Pagination and sorting

For large collections, you can use pagination and sorting parameters:

```http
GET /tasks?_page=0&_perPage=10&_sort=-dueDate HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
```

For more information, see the [Pagination](../core-concepts/pagination.html) and [Sorting](../core-concepts/sorting.html) documents.

## Deleting a task

To delete a task, send a DELETE request to the `/tasks/{taskId}` endpoint:

```http
DELETE /tasks/1 HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
```

A successful deletion returns a `204 No Content` response with no body.

## Common errors

| Error code | Description | HTTP status |
|------------|-------------|-------------|
| `INVALID_FIELD` | One or more fields have invalid values | 400 |
| `MISSING_REQUIRED_FIELD` | A required field is missing | 400 |
| `RESOURCE_NOT_FOUND` | The requested task does not exist | 404 |
| `INVALID_USER_ID` | The specified user does not exist | 400 |
| `INVALID_STATUS` | The specified status is not valid | 400 |

## Task reminders

The `dueDate` and `warningOffset` properties work together to determine when a reminder should be sent:

```
Reminder time = dueDate - warningOffset minutes
```

For example, if a task has:
- `dueDate`: `"2025-05-15T17:00:00-05:00"`
- `warningOffset`: `60` (minutes)

The reminder would be sent at `2025-05-15T16:00:00-05:00` (1 hour before the due date).

For more information on implementing reminders, see the [Implementing reminders](../tutorials/implementing-reminders.html) tutorial.

## Relationships

Each task belongs to exactly one user, identified by the `userId` property. This establishes a many-to-one relationship between tasks and users.

For more information on users, see the [User resource](user-resource.html) documentation.

## Next steps

- Learn about the [task status lifecycle](../core-concepts/task-status-lifecycle.html)
- Explore the [task management workflow](../tutorials/task-management-workflow.html)
- See [code examples](../developer-resources/code-examples.html) for working with tasks
- Implement [reminders](../tutorials/implementing-reminders.html) for upcoming tasks


