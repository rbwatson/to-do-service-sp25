---
title: "Task status lifecycle"
description: "Understanding the various status values that tasks can have and their transitions."
tags: ["task status", "workflow"]
categories: ["core-concepts"]
importance: 7
parent: "Core Concepts"
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 20, 2025"
nav_order: "5"
layout: "default"
version: "v1.0.0"
lastUpdated: "May 20, 2025"
---

# Task status lifecycle

The Task Management API uses a set of predefined status values to track the progress of tasks throughout their lifecycle. This page explains these statuses and their typical transitions.

## Task status values

Each task in the system has a `taskStatus` field that can have one of the following values:

| Status | Description |
|--------|-------------|
| `NOT_STARTED` | The task has not been started yet. This is the default status for new tasks. |
| `IN_PROGRESS` | The task is currently being worked on. |
| `BLOCKED` | The task cannot proceed due to an external factor or dependency. |
| `DEFERRED` | The task has been postponed to a later time. |
| `COMPLETED` | The task has been finished successfully. |
| `CANCELLED` | The task has been cancelled and will not be completed. |

## Status transitions

While the API doesn't enforce a specific workflow, tasks typically follow these transitions:

```
                   ┌─────────────┐
                   │ NOT_STARTED │
                   └──────┬──────┘
                          │
                          ▼
┌─────────┐       ┌─────────────┐       ┌─────────┐
│ DEFERRED │◄────►│ IN_PROGRESS │◄────►│ BLOCKED │
└─────┬───┘       └──────┬──────┘       └────┬────┘
      │                  │                   │
      │                  ▼                   │
      │           ┌─────────────┐            │
      └──────────►│  COMPLETED  │◄───────────┘
                  └──────┬──────┘
                         │
                         ▼
                  ┌─────────────┐
                  │  CANCELLED  │
                  └─────────────┘
```

## Setting and updating task status

### When creating a task

When creating a new task, you can specify the initial status in the request. If not provided, it defaults to `NOT_STARTED`:

```json
{
  "userId": 1,
  "taskTitle": "Complete project proposal",
  "taskDescription": "Finish the proposal for the new client project",
  "taskStatus": "IN_PROGRESS", // Optional, defaults to NOT_STARTED
  "dueDate": "2025-06-15T17:00:00-05:00",
  "warningOffset": 120
}
```

### Updating task status

To update a task's status, use the PATCH method on the task endpoint:

```bash
# cURL example
curl -X PATCH http://localhost:3000/tasks/1 \
  -H "Authorization: Bearer your-token-here" \
  -H "Content-Type: application/json" \
  -d '{
    "taskStatus": "COMPLETED"
  }'
```

```python
# Python example
import requests

url = "http://localhost:3000/tasks/1"
headers = {
    "Authorization": "Bearer your-token-here",
    "Content-Type": "application/json"
}
data = {
    "taskStatus": "COMPLETED"
}

response = requests.patch(url, headers=headers, json=data)
print(response.json())
```

```javascript
// JavaScript example
fetch('http://localhost:3000/tasks/1', {
  method: 'PATCH',
  headers: {
    'Authorization': 'Bearer your-token-here',
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({
    taskStatus: 'COMPLETED'
  })
})
.then(response => response.json())
.then(data => console.log(data));
```

## Filtering tasks by status

You can filter tasks by their status using the `taskStatus` query parameter:

```bash
# cURL example
curl -X GET "http://localhost:3000/tasks?taskStatus=IN_PROGRESS" \
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
    "taskStatus": "IN_PROGRESS"
}

response = requests.get(url, headers=headers, params=params)
print(response.json())
```

```javascript
// JavaScript example
fetch('http://localhost:3000/tasks?taskStatus=IN_PROGRESS', {
  headers: {
    'Authorization': 'Bearer your-token-here'
  }
})
.then(response => response.json())
.then(data => console.log(data));
```

## Best practices

1. **Use appropriate statuses**: Choose the status that best reflects the current state of the task.
2. **Update status promptly**: Update the task status as soon as its state changes to keep the system current.
3. **Filter by status**: Use status filtering to create views of tasks that require attention.
4. **Track transitions**: Consider tracking status transitions in your application to create an audit trail.

## Common use cases

- **To-do list**: Filter for `NOT_STARTED` tasks to see what needs to be done.
- **In progress**: Filter for `IN_PROGRESS` tasks to see what's currently being worked on.
- **Blocked items**: Filter for `BLOCKED` tasks to identify bottlenecks.
- **Completed items**: Filter for `COMPLETED` tasks to review what's been accomplished.

## Next steps

- Learn about [filtering tasks](../api-reference/get-all-tasks.md#filtering) in the API reference
- Explore the [Task resource](../resources/task-resource.md) in more detail
- Check out the [update task endpoint](../api-reference/update-task.md) for updating task statuses


