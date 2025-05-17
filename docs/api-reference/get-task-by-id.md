---
title: "Get task by ID"
description: "API endpoint to retrieve a specific task by its unique identifier."
tags: ["tasks", "endpoint", "GET"]
categories: ["api-reference"]
importance: 7
api_endpoints: ["/tasks/{taskId}"]
related_pages: ["task-resource"]
parent: "API Reference"
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "2025-05-13"
nav_order: "9"
layout: "default"
version: "v1.0.0"
lastUpdated: "2025-05-13"
---

# Get Task by ID

## Endpoint

```
GET /tasks/{taskId}
```

This endpoint retrieves a specific task by its unique identifier.

## Path Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `taskId` | String | Unique identifier of the task to retrieve |

## Request Example

```http
GET /tasks/task123
Authorization: Bearer YOUR_API_KEY
```

## Response

### Success Response (200 OK)

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

### Error Responses

| Status Code | Description |
|-------------|-------------|
| 401 | Unauthorized (missing or invalid authentication) |
| 403 | Forbidden (insufficient permissions to view this task) |
| 404 | Not Found (task with the specified ID does not exist) |

#### Example Error Response (404 Not Found)

```json
{
  "error": {
    "code": "resource_not_found",
    "message": "Task with ID 'task123' not found"
  }
}
```

For details on error responses, see [Error Responses](./api-reference/error-responses.md).

## Authentication

This endpoint requires authentication using a bearer token. Include your API key in the `Authorization` header:

```
Authorization: Bearer YOUR_API_KEY
```

The authenticated user must have appropriate permissions to view the requested task:
- `admin` and `manager` users can view any task
- `member` users can only view tasks they created or are assigned to

## Important Considerations

- **Task ID Format**: Task IDs are auto-generated strings assigned by the system when the task is created.

- **Permission Restrictions**: If a user attempts to access a task they don't have permission to view, a `403 Forbidden` error will be returned rather than a `404 Not Found`, for security reasons.

- **Date Format**: The `dueDate` and timestamp fields (`createdAt`, `updatedAt`) are returned in ISO 8601 format (YYYY-MM-DDTHH:MM:SSZ).

- **Referenced Users**: The `createdBy` and `assigneeId` fields contain user IDs. To get the full user details, you'll need to make additional API calls to the user endpoints.

## Best Practices

- Cache task data when appropriate to reduce API calls, especially for frequently accessed tasks.

- Handle 404 errors gracefully in your application, providing a user-friendly message when a task is not found.

- Use the task information to build detailed task views in your application, showing all relevant properties.

- Check the task's status and due date to highlight tasks that need attention, such as overdue tasks or tasks in specific statuses.

## Code Examples

### JavaScript

```javascript
async function getTaskById(taskId) {
  try {
    const response = await fetch(`https://api.taskmanagement.example.com/v1/tasks/${taskId}`, {
      headers: {
        'Authorization': `Bearer ${API_KEY}`
      }
    });
    
    if (response.status === 404) {
      console.warn(`Task with ID ${taskId} not found`);
      return null;
    }
    
    if (!response.ok) {
      const errorData = await response.json();
      throw new Error(`Error retrieving task: ${errorData.error.message}`);
    }
    
    return await response.json();
  } catch (error) {
    console.error(`Failed to get task ${taskId}:`, error);
    throw error;
  }
}

// Example usage
try {
  const task = await getTaskById('task123');
  
  if (task) {
    console.log(`Task: ${task.title}`);
    console.log(`Status: ${task.status}`);
    console.log(`Priority: ${task.priority}`);
    
    if (task.dueDate) {
      const dueDate = new Date(task.dueDate);
      const now = new Date();
      
      // Check if task is overdue
      if (task.status !== 'DONE' && task.status !== 'CANCELED' && dueDate < now) {
        console.log(`⚠️ OVERDUE by ${Math.floor((now - dueDate) / (1000 * 60 * 60 * 24))} days`);
      } else {
        console.log(`Due: ${dueDate.toLocaleDateString()}`);
      }
    }
    
    if (task.tags && task.tags.length > 0) {
      console.log(`Tags: ${task.tags.join(', ')}`);
    }
  } else {
    console.log('Task not found');
  }
} catch (error) {
  console.error('Error fetching task:', error);
}
```

### Python

```python
import requests
from datetime import datetime

def get_task_by_id(api_key, task_id):
    """
    Retrieve a specific task by its ID.
    
    Args:
        api_key (str): API key for authentication
        task_id (str): The unique identifier of the task
    
    Returns:
        dict: Task data if found, None if not found
        
    Raises:
        Exception: For API errors other than 404 Not Found
    """
    url = f'https://api.taskmanagement.example.com/v1/tasks/{task_id}'
    headers = {
        'Authorization': f'Bearer {api_key}'
    }
    
    response = requests.get(url, headers=headers)
    
    if response.status_code == 200:
        return response.json()
    elif response.status_code == 404:
        print(f"Task with ID {task_id} not found")
        return None
    elif response.status_code == 403:
        print(f"You don't have permission to view this task")
        return None
    else:
        error_data = response.json()
        raise Exception(f"API error: {error_data['error']['message']}")

# Example usage
try:
    task = get_task_by_id('YOUR_API_KEY', 'task123')
    
    if task:
        print(f"Task: {task['title']}")
        print(f"Status: {task['status']}")
        print(f"Priority: {task['priority']}")
        
        if 'dueDate' in task and task['dueDate']:
            # Parse the ISO date string
            due_date = datetime.fromisoformat(task['dueDate'].replace('Z', '+00:00'))
            now = datetime.now()
            
            # Check if task is overdue
            if task['status'] not in ['DONE', 'CANCELED'] and due_date < now:
                days_overdue = (now - due_date).days
                print(f"⚠️ OVERDUE by {days_overdue} days")
            else:
                print(f"Due: {due_date.strftime('%Y-%m-%d')}")
        
        if 'assigneeId' in task and task['assigneeId']:
            print(f"Assigned to: {task['assigneeId']}")
            
        if 'tags' in task and task['tags']:
            print(f"Tags: {', '.join(task['tags'])}")
    else:
        print("Task could not be retrieved")
        
except Exception as e:
    print(f"Error: {e}")
```

### cURL

```bash
curl -X GET "https://api.taskmanagement.example.com/v1/tasks/task123" \
  -H "Authorization: Bearer YOUR_API_KEY"
```

## Related Resources

- [Task Resource](/resources/task-resource.md) - Detailed information about the Task resource
- [Get All Tasks](/api-reference/get-all-tasks.md) - Retrieve a list of all tasks
- [Update a Task](/api-reference/update-task.md) - Update an existing task's information
- [Delete a Task](/api-reference/delete-task.md) - Remove a task from the system

## See Also

- [Data Model](/core-concepts/data-model.md) - Overview of the core resources and their relationships
- [Task Status Lifecycle](/core-concepts/task-status-lifecycle.md) - Understanding task statuses and transitions
- [Task Management Workflow](/tutorials/task-management-workflow.md) - Guide to implementing a task management workflow


