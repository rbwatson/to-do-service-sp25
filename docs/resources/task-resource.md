---
title: "Task resource"
description: "Detailed information about the Task resource, its properties, and related endpoints."
tags: ["task", "resource"]
categories: ["resources"]
importance: 9
parent: "API Resources"
related_pages: ["get-all-tasks", "create-task", "get-task-by-id", "update-task", "delete-task"]
api_endpoints: ["/tasks", "/tasks/{taskId}"]
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 20, 2025"
nav_order: "2"
layout: "default"
version: "v1.0.0"
lastUpdated: "May 20, 2025"
---

# Task resource

The Task resource represents a to-do item in the Task Management API. Each task belongs to a user and has properties that describe what needs to be done, when it's due, and its current status.

## Properties

| Property | Type | Description | Required | Constraints |
|----------|------|-------------|----------|------------|
| `taskId` | integer | The unique identifier for the task | Yes (generated) | System-generated, read-only |
| `userId` | integer | ID of the user who owns the task | Yes | Must reference a valid user |
| `taskTitle` | string | Short description of the task | Yes | 1-80 characters |
| `taskDescription` | string | Detailed description of the task | No | 1-255 characters |
| `taskStatus` | string | Current status of the task | Yes (default: NOT_STARTED) | Must be one of the predefined status values |
| `dueDate` | string (date-time) | When the task is due | Yes | ISO 8601 format |
| `warningOffset` | integer | Minutes before due date to send reminder | Yes | 0-64000 |

## Task status values

The `taskStatus` field can have one of the following values:

- `NOT_STARTED`: The task has not been started yet
- `IN_PROGRESS`: The task is currently being worked on
- `BLOCKED`: The task cannot proceed due to an external factor
- `DEFERRED`: The task has been postponed to a later time
- `COMPLETED`: The task has been finished
- `CANCELLED`: The task has been cancelled and will not be completed

For more details on task status transitions, see the [Task status lifecycle](../core-concepts/task-status-lifecycle.md) documentation.

## Task representation

A Task resource is represented in JSON format:

```json
{
  "taskId": 1,
  "userId": 1,
  "taskTitle": "Complete project proposal",
  "taskDescription": "Finish the proposal for the new client project",
  "taskStatus": "IN_PROGRESS",
  "dueDate": "2025-06-15T17:00:00-05:00",
  "warningOffset": 120
}
```

## Creating a task

To create a task, send a POST request to the `/tasks` endpoint with the required task information:

```json
{
  "userId": 1,
  "taskTitle": "Complete project proposal",
  "taskDescription": "Finish the proposal for the new client project",
  "dueDate": "2025-06-15T17:00:00-05:00",
  "warningOffset": 120
}
```

The API will generate a unique `taskId` for the new task and set the `taskStatus` to `NOT_STARTED` if not specified.

For detailed information, see the [Create a task](../api-reference/create-task.md) endpoint documentation.

## Retrieving tasks

### Get all tasks

To retrieve all tasks, send a GET request to the `/tasks` endpoint. The response will include an array of task objects:

```json
{
  "tasks": [
    {
      "taskId": 1,
      "userId": 1,
      "taskTitle": "Complete project proposal",
      "taskDescription": "Finish the proposal for the new client project",
      "taskStatus": "IN_PROGRESS",
      "dueDate": "2025-06-15T17:00:00-05:00",
      "warningOffset": 120
    },
    {
      "taskId": 2,
      "userId": 2,
      "taskTitle": "Schedule team meeting",
      "taskDescription": "Coordinate with team for weekly sync-up",
      "taskStatus": "COMPLETED",
      "dueDate": "2025-05-10T10:00:00-05:00",
      "warningOffset": 60
    }
  ]
}
```

This endpoint supports pagination, sorting, and filtering by task status. For detailed information, see the [Get all tasks](../api-reference/get-all-tasks.md) endpoint documentation.

### Get a specific task

To retrieve a specific task, send a GET request to the `/tasks/{taskId}` endpoint, where `{taskId}` is the unique identifier of the task:

```
GET /tasks/1
```

For detailed information, see the [Get task by ID](../api-reference/get-task-by-id.md) endpoint documentation.

## Updating a task

To update a task, send a PATCH request to the `/tasks/{taskId}` endpoint with the fields you want to update:

```json
{
  "taskStatus": "COMPLETED"
}
```

The API supports partial updates, so you only need to include the fields you want to change.

For detailed information, see the [Update a task](../api-reference/update-task.md) endpoint documentation.

## Deleting a task

To delete a task, send a DELETE request to the `/tasks/{taskId}` endpoint:

```
DELETE /tasks/1
```

For detailed information, see the [Delete a task](../api-reference/delete-task.md) endpoint documentation.

## Related resources

The Task resource is related to the User resource. Each task must be associated with a user through the `userId` field.

To retrieve the user who owns a task, you can use the `GET /users/{userId}` endpoint with the `userId` from the task.

## Important considerations

- The `userId` must reference an existing user in the system.
- The `dueDate` should be in the future when creating a task.
- The `warningOffset` is used to calculate when reminders should be sent (e.g., 120 minutes before the due date).
- When updating a task's status, follow the typical status transitions described in the [Task status lifecycle](../core-concepts/task-status-lifecycle.md) documentation.

## Best practices

1. **Use meaningful task titles**: Task titles should be concise but descriptive enough to understand the task at a glance.
2. **Set appropriate warning offsets**: Consider the nature of the task when setting the warning offset. Critical tasks might need longer warning periods.
3. **Keep task statuses up to date**: Regularly update task statuses to reflect their current state.
4. **Use filtering for task lists**: When retrieving tasks, use status filtering to create focused views (e.g., only IN_PROGRESS tasks).

## See also

- [User resource](user-resource.md)
- [Task status lifecycle](../core-concepts/task-status-lifecycle.md)
- [Get all tasks](../api-reference/get-all-tasks.md)
- [Create a task](../api-reference/create-task.md)
- [Get task by ID](../api-reference/get-task-by-id.md)
- [Update a task](../api-reference/update-task.md)
- [Delete a task](../api-reference/delete-task.md)


