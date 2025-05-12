---
title: "Task status lifecycle"
description: "Understanding the various status values that tasks can have and their transitions."
tags: ["task status", "workflow"]
categories: ["core-concepts"]
importance: 7
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 12, 2025"
navOrder: 5
---

# Task status lifecycle

Tasks in the Task Management API progress through various states from creation to completion. This document explains the different status values, their meanings, and the typical transitions between them.

## Available status values

The Task resource uses the `taskStatus` property to track the current state of a task. The available status values are:

| Status | Description |
|--------|-------------|
| `NOT_STARTED` | Task has been created but work has not begun |
| `IN_PROGRESS` | Task is actively being worked on |
| `BLOCKED` | Task cannot proceed due to an obstacle or dependency |
| `DEFERRED` | Task has been postponed until a later time |
| `COMPLETED` | Task has been successfully finished |
| `CANCELLED` | Task has been abandoned and will not be completed |

## Default status

When a task is created without explicitly specifying a status, it defaults to `NOT_STARTED`.

## Status transitions

While the API allows updating a task's status to any valid value, the following diagram illustrates the typical workflow:

```
  ┌───────────────┐
  │  NOT_STARTED  │
  └───────┬───────┘
          │
          ▼
  ┌───────────────┐         ┌───────────────┐
  │  IN_PROGRESS  │◄───────►│    BLOCKED    │
  └───────┬───────┘         └───────┬───────┘
          │                         │
          ▼                         ▼
  ┌───────────────┐         ┌───────────────┐
  │   COMPLETED   │         │   CANCELLED   │
  └───────────────┘         └───────────────┘
          ▲                         ▲
          │                         │
  ┌───────────────┐                 │
  │   DEFERRED    │─────────────────┘
  └───────────────┘
```

### Common transitions

1. `NOT_STARTED` → `IN_PROGRESS`: Work has begun on the task
2. `IN_PROGRESS` → `BLOCKED`: Task has encountered an obstacle
3. `BLOCKED` → `IN_PROGRESS`: Obstacle has been resolved
4. `IN_PROGRESS` → `COMPLETED`: Task has been successfully completed
5. `NOT_STARTED` → `DEFERRED`: Task has been postponed
6. `DEFERRED` → `IN_PROGRESS`: Work has resumed on a postponed task
7. `DEFERRED` → `CANCELLED`: A postponed task has been abandoned
8. `BLOCKED` → `CANCELLED`: A blocked task has been abandoned

## Updating task status

To update a task's status, send a PATCH request to the `/tasks/{taskId}` endpoint:

```http
PATCH /tasks/123 HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
Content-Type: application/json

{
  "taskStatus": "IN_PROGRESS"
}
```

## Status implications

Each status has specific implications for task management:

### NOT_STARTED

- Task is in the backlog or queue
- No work has begun yet
- Reminder will trigger based on the `warningOffset` and `dueDate`

### IN_PROGRESS

- Task is actively being worked on
- Progress is being made toward completion
- Reminder will still trigger based on the `warningOffset` and `dueDate`

### BLOCKED

- Task cannot be completed due to a dependency or obstacle
- May require intervention to resolve the blocking issue
- Reminder will still trigger based on the `warningOffset` and `dueDate`

### DEFERRED

- Task has been postponed to a later time
- Not currently actively worked on
- Reminder will still trigger based on the `warningOffset` and `dueDate`

### COMPLETED

- Task has been successfully finished
- No further action is required
- Reminders are no longer triggered

### CANCELLED

- Task has been abandoned and will not be completed
- No further action is required
- Reminders are no longer triggered

## Filtering tasks by status

You can filter tasks by their status using the `taskStatus` query parameter:

```http
GET /tasks?taskStatus=IN_PROGRESS HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
```

This allows you to retrieve only tasks in a specific state, which is useful for creating views such as:

- Task backlogs (`NOT_STARTED`)
- Current work (`IN_PROGRESS`)
- Blocked tasks that need attention (`BLOCKED`)
- Completed tasks for review (`COMPLETED`)

## Implementation example

Here's an example of a function that updates a task's status:

```javascript
async function updateTaskStatus(taskId, newStatus) {
  try {
    const response = await fetch(`http://localhost:3000/tasks/${taskId}`, {
      method: 'PATCH',
      headers: {
        'Authorization': 'Bearer YOUR_TOKEN',
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({ taskStatus: newStatus })
    });
    
    if (!response.ok) {
      throw new Error(`Error: ${response.status}`);
    }
    
    return await response.json();
  } catch (error) {
    console.error(`Failed to update task ${taskId} status:`, error);
    throw error;
  }
}
```

## Best practices for status management

- Update the task status promptly to reflect its current state
- Use the `BLOCKED` status to highlight tasks that need attention
- Consider updating the `dueDate` when changing status to `DEFERRED`
- Include a reason when marking tasks as `CANCELLED` using the task description
- Review `BLOCKED` tasks regularly to prevent them from being forgotten

## Next steps

Now that you understand the task status lifecycle, explore these related topics:

- [Task resource](../resources/task-resource.html) for complete details on tasks
- [Update a task](../api-reference/update-task.html) for API reference on task updates
- [Get all tasks](../api-reference/get-all-tasks.html) for filtering tasks by status
- [Task management workflow](../tutorials/task-management-workflow.html) for implementing a complete workflow


