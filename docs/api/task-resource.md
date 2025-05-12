---
layout: default
nav_order: 4
has_children: true
has_toc: false
# tags used by AI files
title: `task` resource
description: Information about the `task` resource
tags: [api]
categories: [api-reference]
ai_relevance: high
importance: 8
prerequisites: []
related_pages: [/tutorials/add-a-new-task]
examples: []
api_endpoints: [/tasks]
version: "v1.0"
last_updated: "2025-05-08"
---
# Task Resource

## Overview

The Task resource represents an action item or to-do item in the system. Each task belongs to a user, has a status indicating its progress, and includes timing information such as due date and reminder settings. Tasks are the core entities that allow users to track their work and upcoming responsibilities.

## Resource Structure

| Property | Type | Description |
|----------|------|-------------|
| `taskId` | integer | The unique identifier for the task (system-generated) |
| `userId` | integer | The ID of the user who owns this task |
| `taskTitle` | string | The title or brief summary of the task (1-80 characters) |
| `taskDescription` | string | Optional detailed description of the task (1-255 characters) |
| `taskStatus` | string | Current status of the task (enum value) |
| `dueDate` | string | The date and time when the task is due (ISO 8601 format) |
| `warningOffset` | integer | Minutes before the due date to send a reminder notification (0-64000) |

## Task Status Values

| Status | Description |
|--------|-------------|
| `NOT_STARTED` | Task has been created but work has not begun |
| `IN_PROGRESS` | Work on the task has started but is not complete |
| `BLOCKED` | Task cannot proceed due to an external dependency or issue |
| `DEFERRED` | Task has been postponed to a later time |
| `COMPLETED` | Task has been finished successfully |
| `CANCELLED` | Task will not be completed and is no longer active |

## Example

```json
{
  "taskId": 1,
  "userId": 1,
  "taskTitle": "Grocery shopping",
  "taskDescription": "eggs, bacon, gummy bears",
  "taskStatus": "NOT_STARTED",
  "dueDate": "2024-02-20T17:00:00-05:00",
  "warningOffset": 10
}
```

## Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | [/tasks](get-all-tasks.md) | Retrieve a list of all tasks |
| POST | [/tasks](create-task.md) | Create a new task |
| GET | [/tasks/{taskId}](get-task-by-id.md) | Retrieve a specific task by ID |
| PATCH | [/tasks/{taskId}](update-task.md) | Update a task's information |
| DELETE | [/tasks/{taskId}](delete-task.md) | Delete a task |

## Business Rules

1. **Task Ownership**: Every task must be associated with a valid user via the `userId` property.

2. **Status Transitions**: Tasks can transition between any status values without restrictions.

3. **Due Date Requirements**: New tasks must have a due date in the future.

4. **Default Status**: If not specified during creation, new tasks default to the `NOT_STARTED` status.

5. **Validation**:
   - `taskTitle` must be between 1 and 80 characters
   - `taskDescription` must be between 1 and 255 characters if provided
   - `dueDate` must be in valid ISO 8601 format
   - `warningOffset` must be between 0 and 64000 minutes

6. **Task Filtering**: Tasks can be filtered by their status using the `taskStatus` query parameter.

## Related Resources

- [User Resource](user-resource.md) - Tasks belong to users via the `userId` property

## Common Use Cases

1. **Task Creation**: Add a new task with a due date and reminder settings.

2. **Task Listing**: Retrieve all tasks, optionally filtered by status.

3. **Status Updates**: Change a task's status as work progresses.

4. **Task Completion**: Mark tasks as completed or cancelled when finished.

5. **Task Modification**: Update task details, descriptions, or timing information.

6. **Task Removal**: Delete tasks that are no longer needed.

## Notes

- While `taskDescription` is optional, it's recommended to provide meaningful descriptions for better task clarity.

- The system does not enforce workflow rules on status transitions. Any status can be changed to any other status.

- The API doesn't provide direct notification functionality. The `warningOffset` value indicates when notifications should be sent, but implementation of actual notifications is the responsibility of the consuming application.

- Time zone information should be included in the `dueDate` to ensure correct interpretation across different regions.

- The API doesn't currently support recurring tasks or subtasks. Each task is an independent entity.

- Tasks can be sorted by any property, including custom sorting by status or due date.
