---
title: "Task resource"
description: "Detailed information about the Task resource, its properties, and related endpoints."
tags: ["task", "resource"]
categories: ["resources"]
importance: 9
parent: "resources"
related_pages: ["get-all-tasks", "create-task", "get-task-by-id", "update-task", "delete-task"]
api_endpoints: ["/tasks", "/tasks/{taskId}"]
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "2025-05-13"
nav_order: "2"
layout: "default"
version: "v1.0.0"
lastUpdated: "2025-05-13"
---

# Task Resource

The Task resource represents a unit of work that needs to be completed within the Task Management API. This page provides detailed information about the Task resource, its properties, and related endpoints.

## Resource Properties

| Property | Type | Description | Required |
|----------|------|-------------|----------|
| `id` | String | Unique identifier for the task | Auto-generated |
| `title` | String | Title of the task | Yes |
| `description` | String | Detailed description of the task | No |
| `status` | String | Current status of the task | No (default: "TODO") |
| `priority` | String | Priority level of the task | No (default: "MEDIUM") |
| `createdBy` | String | ID of the user who created the task | Auto-generated |
| `assigneeId` | String | ID of the user assigned to the task | No |
| `dueDate` | Date | When the task is due | No |
| `warningOffset` | Number | Hours before due date to send a reminder | No |
| `tags` | Array | Array of string tags associated with the task | No |
| `createdAt` | Date | When the task was created | Auto-generated |
| `updatedAt` | Date | When the task was last updated | Auto-generated |

## Resource Representation

### JSON Format

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
  "warningOffset": 24,
  "tags": ["authentication", "security", "api"],
  "createdAt": "2025-05-01T10:30:00Z",
  "updatedAt": "2025-05-13T14:25:00Z"
}
```

## Task Status Values

The Task resource supports the following status values:

| Status | Description |
|--------|-------------|
| `TODO` | Task has been created but work hasn't started (default) |
| `IN_PROGRESS` | Work on the task has begun but is not yet complete |
| `REVIEW` | Task is completed and awaiting review or approval |
| `DONE` | Task has been completed and approved |
| `CANCELED` | Task has been canceled and won't be completed |

For more details on task status transitions, see [Task Status Lifecycle](/core-concepts/task-status-lifecycle.md).

## Task Priority Levels

The Task resource supports the following priority levels:

| Priority | Description |
|----------|-------------|
| `LOW` | Low priority task |
| `MEDIUM` | Medium priority task (default) |
| `HIGH` | High priority task |
| `URGENT` | Urgent task requiring immediate attention |

## Related Endpoints

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/tasks` | GET | [Get all tasks](/api-reference/get-all-tasks.md) |
| `/tasks` | POST | [Create a task](/api-reference/create-task.md) |
| `/tasks/{taskId}` | GET | [Get task by ID](/api-reference/get-task-by-id.md) |
| `/tasks/{taskId}` | PATCH | [Update a task](/api-reference/update-task.md) |
| `/tasks/{taskId}` | DELETE | [Delete a task](/api-reference/delete-task.md) |

## Creating a Task

To create a new task, send a `POST` request to the `/tasks` endpoint:

### Request

```http
POST /tasks
Content-Type: application/json

{
  "title": "Create API documentation",
  "description": "Write comprehensive API documentation for developers",
  "priority": "HIGH",
  "assigneeId": "user456",
  "dueDate": "2025-05-30T17:00:00Z",
  "tags": ["documentation", "api"]
}
```

### Response

```http
HTTP/1.1 201 Created
Content-Type: application/json

{
  "id": "task789",
  "title": "Create API documentation",
  "description": "Write comprehensive API documentation for developers",
  "status": "TODO",
  "priority": "HIGH",
  "createdBy": "user123",
  "assigneeId": "user456",
  "dueDate": "2025-05-30T17:00:00Z",
  "tags": ["documentation", "api"],
  "createdAt": "2025-05-13T15:30:00Z",
  "updatedAt": "2025-05-13T15:30:00Z"
}
```

## Updating a Task

To update an existing task, send a `PATCH` request to the `/tasks/{taskId}` endpoint:

### Request

```http
PATCH /tasks/task789
Content-Type: application/json

{
  "status": "IN_PROGRESS",
  "description": "Write comprehensive API documentation for developers, including examples and best practices"
}
```

### Response

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "id": "task789",
  "title": "Create API documentation",
  "description": "Write comprehensive API documentation for developers, including examples and best practices",
  "status": "IN_PROGRESS",
  "priority": "HIGH",
  "createdBy": "user123",
  "assigneeId": "user456",
  "dueDate": "2025-05-30T17:00:00Z",
  "tags": ["documentation", "api"],
  "createdAt": "2025-05-13T15:30:00Z",
  "updatedAt": "2025-05-13T15:45:00Z"
}
```

## Deleting a Task

To delete a task, send a `DELETE` request to the `/tasks/{taskId}` endpoint:

### Request

```http
DELETE /tasks/task789
```

### Response

```http
HTTP/1.1 204 No Content
```

## Task and User Relationships

Tasks are related to users in two ways:

1. **Created by**: Each task has a `createdBy` field that references the user who created it.

2. **Assigned to**: Each task can optionally have an `assigneeId` field that references the user assigned to complete it.

## Filtering Tasks

The `/tasks` endpoint supports various filtering parameters:

| Parameter | Description | Example |
|-----------|-------------|---------|
| `status` | Filter by task status | `/tasks?status=IN_PROGRESS` |
| `priority` | Filter by task priority | `/tasks?priority=HIGH` |
| `assigneeId` | Filter by assigned user | `/tasks?assigneeId=user456` |
| `createdBy` | Filter by creator | `/tasks?createdBy=user123` |
| `dueDate[lt]` | Tasks due before date | `/tasks?dueDate[lt]=2025-05-30T00:00:00Z` |
| `dueDate[gt]` | Tasks due after date | `/tasks?dueDate[gt]=2025-05-01T00:00:00Z` |
| `tags` | Filter by tags | `/tasks?tags=documentation,api` |

Multiple filters can be combined using the `&` operator:

```
/tasks?status=TODO,IN_PROGRESS&priority=HIGH,URGENT&assigneeId=user456
```

## Code Examples

### Get All Tasks - JavaScript

```javascript
async function getAllTasks() {
  try {
    const response = await fetch('https://api.taskmanagement.example.com/v1/tasks', {
      headers: {
        'Authorization': `Bearer ${API_KEY}`
      }
    });
    
    if (!response.ok) {
      throw new Error(`Failed to fetch tasks: ${response.status}`);
    }
    
    return await response.json();
  } catch (error) {
    console.error('Error fetching tasks:', error);
    return { data: [] };
  }
}
```

### Create a Task - Python

```python
import requests

def create_task(api_key, title, description=None, priority="MEDIUM", assignee_id=None, due_date=None):
    try:
        task_data = {
            "title": title,
            "priority": priority
        }
        
        if description:
            task_data["description"] = description
            
        if assignee_id:
            task_data["assigneeId"] = assignee_id
            
        if due_date:
            task_data["dueDate"] = due_date
        
        response = requests.post(
            "https://api.taskmanagement.example.com/v1/tasks",
            headers={
                "Authorization": f"Bearer {api_key}",
                "Content-Type": "application/json"
            },
            json=task_data
        )
        
        response.raise_for_status()
        return response.json()
    except requests.exceptions.RequestException as e:
        print(f"Error creating task: {e}")
        return None
```

### Update Task Status - cURL

```bash
curl -X PATCH "https://api.taskmanagement.example.com/v1/tasks/task123" \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "status": "DONE"
  }'
```

## Common Use Cases

- **Task Creation**: Creating new tasks for team members to work on
- **Task Assignment**: Assigning tasks to specific users
- **Task Tracking**: Tracking task progress through status updates
- **Due Date Management**: Setting and managing task deadlines
- **Priority Management**: Organizing tasks by priority level
- **Task Filtering**: Finding tasks based on various criteria

## Best Practices

1. **Set Clear Titles**: Use clear, concise titles that describe the task
2. **Provide Detailed Descriptions**: Include all necessary information in the task description
3. **Set Realistic Due Dates**: Assign reasonable deadlines for task completion
4. **Use Appropriate Priorities**: Reserve high and urgent priorities for truly important tasks
5. **Update Status Regularly**: Keep task status up-to-date to reflect current progress
6. **Use Tags for Organization**: Apply consistent tags to group related tasks
7. **Clean Up Completed Tasks**: Delete or archive tasks that are no longer needed

## See Also

- [User Resource](/resources/user-resource.md)
- [Task Status Lifecycle](/core-concepts/task-status-lifecycle.md)
- [Task Management Workflow](/tutorials/task-management-workflow.md)


