---
title: "Update a task"
description: "API endpoint to update an existing task's information, including changing its status."
tags: ["tasks", "endpoint", "PATCH"]
categories: ["api-reference"]
importance: 7
api_endpoints: ["/tasks/{taskId}"]
related_pages: ["task-resource", "task-status-lifecycle"]
parent: "API Reference"
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "2025-05-13"
nav_order: "10"
layout: "default"
version: "v1.0.0"
lastUpdated: "2025-05-13"
---

# Update a Task

## Endpoint

```
PATCH /tasks/{taskId}
```

This endpoint updates an existing task's information. You can update one or more properties of the task resource, including its status, priority, assignee, and other fields.

## Path Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `taskId` | String | Unique identifier of the task to update |

## Request Body

The request body should be a JSON object containing the properties you want to update. You can include one or more of the following properties:

| Property | Type | Description |
|----------|------|-------------|
| `title` | String | Title of the task |
| `description` | String | Detailed description of the task |
| `status` | String | Status of the task: "TODO", "IN_PROGRESS", "REVIEW", "DONE", "CANCELED" |
| `priority` | String | Priority level: "LOW", "MEDIUM", "HIGH", "URGENT" |
| `assigneeId` | String | ID of the user assigned to the task |
| `dueDate` | String | When the task is due (ISO 8601 format) |
| `warningOffset` | Number | Hours before due date to send a reminder |
| `tags` | Array | Array of string tags associated with the task |

### Example Request Body

```json
{
  "status": "IN_PROGRESS",
  "description": "Add token-based authentication to the application. Use JWT for stateless authentication.",
  "priority": "HIGH"
}
```

## Request Example

```http
PATCH /tasks/task123
Content-Type: application/json
Authorization: Bearer YOUR_API_KEY

{
  "status": "IN_PROGRESS",
  "description": "Add token-based authentication to the application. Use JWT for stateless authentication.",
  "priority": "HIGH"
}
```

## Response

### Success Response (200 OK)

```json
{
  "id": "task123",
  "title": "Implement authentication",
  "description": "Add token-based authentication to the application. Use JWT for stateless authentication.",
  "status": "IN_PROGRESS",
  "priority": "HIGH",
  "createdBy": "user456",
  "assigneeId": "user789",
  "dueDate": "2025-06-01T17:00:00Z",
  "warningOffset": 24,
  "tags": ["authentication", "security", "api"],
  "createdAt": "2025-05-01T10:30:00Z",
  "updatedAt": "2025-05-13T15:45:00Z"
}
```

### Error Responses

| Status Code | Description |
|-------------|-------------|
| 400 | Bad request (e.g., malformed request body) |
| 401 | Unauthorized (missing or invalid authentication) |
| 403 | Forbidden (insufficient permissions to update this task) |
| 404 | Not Found (task with the specified ID does not exist) |
| 409 | Conflict (e.g., invalid status transition) |
| 422 | Unprocessable entity (e.g., validation errors) |

#### Example Error Response (422 Unprocessable Entity)

```json
{
  "error": {
    "code": "invalid_status_transition",
    "message": "Cannot transition from status 'DONE' to 'IN_PROGRESS'",
    "details": {
      "currentStatus": "DONE",
      "requestedStatus": "IN_PROGRESS",
      "allowedTransitions": ["CANCELED"]
    }
  }
}
```

For details on error responses, see [Error Responses](/api-reference/error-responses.md).

## Authentication

This endpoint requires authentication using a bearer token. Include your API key in the `Authorization` header:

```
Authorization: Bearer YOUR_API_KEY
```

The authenticated user must have appropriate permissions to update the requested task:
- `admin` users can update any task
- `manager` users can update any task
- `member` users can only update tasks they created or are assigned to

## Important Considerations

- **Partial Updates**: This endpoint supports partial updates. You only need to include the properties you want to change in the request body.

- **Status Transitions**: When updating the task status, only certain transitions are allowed based on the current status. See [Task Status Lifecycle](/core-concepts/task-status-lifecycle.md) for valid transitions.

- **Assignment Restrictions**: There may be restrictions on who can be assigned to a task:
  - `admin` and `manager` users can assign tasks to any user
  - `member` users may only be able to assign tasks to themselves

- **Read-Only Fields**: The `id`, `createdBy`, `createdAt`, and `updatedAt` fields are read-only and cannot be updated. If included in the request, they will be ignored.

- **Due Date Format**: When updating the `dueDate`, it must be specified in ISO 8601 format (YYYY-MM-DDTHH:MM:SSZ) and should be in the future.

- **Setting Fields to Null**: To remove an optional field, set its value to `null` in the request body.

## Best Practices

- Only include the fields you want to update in the request body
- Verify that status transitions are valid before attempting to update the status
- Validate due dates to ensure they are in the future
- Implement proper error handling for invalid status transitions
- Consider the impact of status changes on task workflows and notifications

## Code Examples

### JavaScript

```javascript
async function updateTask(taskId, updates) {
  try {
    const response = await fetch(`https://api.taskmanagement.example.com/v1/tasks/${taskId}`, {
      method: 'PATCH',
      headers: {
        'Authorization': `Bearer ${API_KEY}`,
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(updates)
    });
    
    if (!response.ok) {
      const errorData = await response.json();
      throw new Error(`Failed to update task: ${errorData.error.message}`);
    }
    
    return await response.json();
  } catch (error) {
    console.error(`Error updating task ${taskId}:`, error);
    throw error;
  }
}

// Example usage: Update task status and assignee
try {
  const updatedTask = await updateTask('task123', {
    status: 'IN_PROGRESS',
    assigneeId: 'user456'
  });
  
  console.log(`Task updated: ${updatedTask.title}`);
  console.log(`New status: ${updatedTask.status}`);
  console.log(`Assigned to: ${updatedTask.assigneeId}`);
  
  // You can check if the response matches the requested updates
  if (updatedTask.status !== 'IN_PROGRESS') {
    console.warn('Status was not updated as requested');
  }
} catch (error) {
  if (error.message.includes('invalid_status_transition')) {
    console.error('Cannot transition to the requested status. Check the task status lifecycle.');
  } else {
    console.error('Failed to update task:', error);
  }
}
```

### Python

```python
import requests

def update_task(api_key, task_id, **updates):
    """
    Update an existing task's information.
    
    Args:
        api_key (str): API key for authentication
        task_id (str): The unique identifier of the task to update
        **updates: Keyword arguments for fields to update
    
    Returns:
        dict: Updated task data if successful
        
    Raises:
        Exception: If the API request fails
    """
    url = f'https://api.taskmanagement.example.com/v1/tasks/{task_id}'
    headers = {
        'Authorization': f'Bearer {api_key}',
        'Content-Type': 'application/json'
    }
    
    # Filter out None values
    update_data = {k: v for k, v in updates.items() if v is not None}
    
    if not update_data:
        return None  # No updates to make
    
    response = requests.patch(url, json=update_data, headers=headers)
    
    if response.status_code == 200:
        return response.json()
    elif response.status_code == 404:
        raise Exception(f"Task with ID {task_id} not found")
    elif response.status_code == 422:
        error_data = response.json()
        if error_data['error']['code'] == 'invalid_status_transition':
            current = error_data['error']['details']['currentStatus']
            requested = error_data['error']['details']['requestedStatus']
            allowed = error_data['error']['details']['allowedTransitions']
            raise Exception(f"Cannot change status from '{current}' to '{requested}'. Allowed transitions: {', '.join(allowed)}")
        else:
            raise Exception(f"Validation error: {error_data['error']['message']}")
    else:
        error_data = response.json()
        raise Exception(f"API error: {error_data['error']['message']}")

# Example usage: Update task status and priority
try:
    task = update_task(
        api_key='YOUR_API_KEY',
        task_id='task123',
        status='REVIEW',
        priority='HIGH',
        description='Updated task description with additional details'
    )
    
    if task:
        print(f"Task '{task['title']}' updated successfully")
        print(f"Status: {task['status']}")
        print(f"Priority: {task['priority']}")
        print(f"Last updated: {task['updatedAt']}")
        
except Exception as e:
    print(f"Error updating task: {e}")
```

### cURL

```bash
# Update task status and priority
curl -X PATCH "https://api.taskmanagement.example.com/v1/tasks/task123" \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "status": "IN_PROGRESS",
    "priority": "HIGH"
  }'

# Update task due date and assignee
curl -X PATCH "https://api.taskmanagement.example.com/v1/tasks/task123" \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "dueDate": "2025-06-15T17:00:00Z",
    "assigneeId": "user456"
  }'
```

## Related Resources

- [Task Resource](/resources/task-resource.md) - Detailed information about the Task resource
- [Get Task by ID](/api-reference/get-task-by-id.md) - Retrieve a specific task by ID
- [Get All Tasks](/api-reference/get-all-tasks.md) - Retrieve a list of all tasks
- [Delete a Task](/api-reference/delete-task.md) - Remove a task from the system

## See Also

- [Task Status Lifecycle](/core-concepts/task-status-lifecycle.md) - Understanding valid status transitions
- [Data Model](/core-concepts/data-model.md) - Overview of the core resources and their relationships
- [Task Management Workflow](/tutorials/task-management-workflow.md) - Guide to implementing a task management workflow


