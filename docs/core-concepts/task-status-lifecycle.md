---
title: "Task status lifecycle"
description: "Understanding the various status values that tasks can have and their transitions."
tags: ["task status", "workflow"]
categories: ["core-concepts"]
importance: 7
parent: "core-concepts"
hasChildren: false
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "2025-05-13"
navOrder: "5"
layout: "default"
version: "v1.0.0"
lastUpdated: "2025-05-13"
---

# Task Status Lifecycle

Tasks in the Task Management API move through a series of statuses throughout their lifecycle. This page explains the different status values, valid transitions between them, and how to implement a task lifecycle in your application.

## Task Status Values

The Task Management API supports the following status values for tasks:

| Status | Description |
|--------|-------------|
| `TODO` | The task has been created but work hasn't started yet |
| `IN_PROGRESS` | Work on the task has begun but is not yet complete |
| `REVIEW` | The task is completed and waiting for review or approval |
| `DONE` | The task has been completed and approved |
| `CANCELED` | The task has been canceled and won't be completed |

## Task Status Lifecycle Diagram

```
┌─────────┐     ┌─────────────┐     ┌────────┐     ┌──────┐
│   TODO  │────►│ IN_PROGRESS │────►│ REVIEW │────►│ DONE │
└─────────┘     └─────────────┘     └────────┘     └──────┘
     │                 │                │              │
     │                 │                │              │
     │                 ▼                ▼              ▼
     └───────────────►┌──────────┐◄─────────────────────
                      │ CANCELED │
                      └──────────┘
```

## Valid Status Transitions

Not all status transitions are valid. The following table shows the allowed transitions:

| Current Status | Valid Next Statuses |
|----------------|---------------------|
| `TODO` | `IN_PROGRESS`, `CANCELED` |
| `IN_PROGRESS` | `REVIEW`, `CANCELED` |
| `REVIEW` | `DONE`, `IN_PROGRESS`, `CANCELED` |
| `DONE` | `CANCELED` |
| `CANCELED` | None (terminal state) |

Attempting to make an invalid status transition will result in a `422 Unprocessable Entity` error.

## Implementing Status Transitions

To update a task's status, use the `PATCH` method on the task resource:

```http
PATCH /tasks/{taskId}
Content-Type: application/json

{
  "status": "IN_PROGRESS"
}
```

### Example Response

```json
{
  "id": "task123",
  "title": "Implement authentication",
  "description": "Add token-based authentication to the application",
  "status": "IN_PROGRESS",
  "priority": "HIGH",
  "createdBy": "user456",
  "assigneeId": "user789",
  "dueDate": "2025-06-01T17:00:00Z",
  "createdAt": "2025-05-01T10:30:00Z",
  "updatedAt": "2025-05-13T14:25:00Z"
}
```

## Status-Based Filtering

You can filter tasks by status when listing them:

```http
GET /tasks?status=IN_PROGRESS
```

You can also filter by multiple statuses:

```http
GET /tasks?status=TODO,IN_PROGRESS
```

This is useful for creating views like "Open Tasks" (TODO, IN_PROGRESS, REVIEW) or "Closed Tasks" (DONE, CANCELED).

## Status Workflow Automation

Here are some common automation practices for task status transitions:

### 1. Automatic Assignment

When a task moves from `TODO` to `IN_PROGRESS`, it often requires an assignee:

```javascript
// JavaScript example
async function startTask(taskId, assigneeId) {
  const response = await fetch(`https://api.taskmanagement.example.com/v1/tasks/${taskId}`, {
    method: 'PATCH',
    headers: {
      'Authorization': `Bearer ${API_KEY}`,
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({
      status: 'IN_PROGRESS',
      assigneeId: assigneeId
    })
  });
  
  return response.json();
}
```

### 2. Notifications on Status Change

You might want to notify relevant users when a task's status changes:

```python
# Python example
def update_task_status(api_key, task_id, new_status):
    # First, get the current task data
    response = requests.get(
        f"https://api.taskmanagement.example.com/v1/tasks/{task_id}",
        headers={"Authorization": f"Bearer {api_key}"}
    )
    
    current_task = response.json()
    old_status = current_task["status"]
    
    # Update the status
    response = requests.patch(
        f"https://api.taskmanagement.example.com/v1/tasks/{task_id}",
        headers={
            "Authorization": f"Bearer {api_key}",
            "Content-Type": "application/json"
        },
        json={"status": new_status}
    )
    
    updated_task = response.json()
    
    # Send notifications based on the transition
    if old_status == "TODO" and new_status == "IN_PROGRESS":
        notify_task_started(updated_task)
    elif old_status == "IN_PROGRESS" and new_status == "REVIEW":
        notify_task_ready_for_review(updated_task)
    elif new_status == "DONE":
        notify_task_completed(updated_task)
    elif new_status == "CANCELED":
        notify_task_canceled(updated_task)
    
    return updated_task
```

### 3. Implementing a Review Process

If your workflow requires formal review, you might implement a process like this:

```javascript
// JavaScript example
async function completeTaskWorkflow(taskId, reviewerId) {
  // 1. Developer marks task as ready for review
  await fetch(`https://api.taskmanagement.example.com/v1/tasks/${taskId}`, {
    method: 'PATCH',
    headers: {
      'Authorization': `Bearer ${API_KEY}`,
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({
      status: 'REVIEW'
    })
  });
  
  // 2. Assign the reviewer
  await fetch(`https://api.taskmanagement.example.com/v1/tasks/${taskId}`, {
    method: 'PATCH',
    headers: {
      'Authorization': `Bearer ${API_KEY}`,
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({
      assigneeId: reviewerId
    })
  });
  
  // In a real application, the reviewer would review and then update the status
  // to either DONE or back to IN_PROGRESS
}
```

## Best Practices

1. **Validate transitions**: Always validate status transitions before making API requests to avoid errors.

2. **Track status history**: If you need a history of status changes, consider implementing your own tracking as the API only provides the current status.

3. **Use webhooks if available**: If the API provides webhooks, subscribe to status change events to keep your application in sync.

4. **Consider user permissions**: Different users might have different permissions for status transitions. For example, only a reviewer might be able to move a task from `REVIEW` to `DONE`.

5. **Implement intuitive UI**: Design your user interface to make the task lifecycle clear, perhaps showing available actions based on the current status.

## See Also

- [Task Resource](/resources/task-resource.md)
- [Update Task](/api-reference/update-task.md)
- [Task Management Workflow](/tutorials/task-management-workflow.md)


