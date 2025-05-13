---
title: "Create a task"
description: "API endpoint to create a new task in the system."
tags: ["tasks", "endpoint", "POST"]
categories: ["api-reference"]
importance: 7
api_endpoints: ["/tasks"]
related_pages: ["task-resource", "task-status-lifecycle"]
parent: "api-reference"
hasChildren: false
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "2025-05-13"
navOrder: "8"
layout: "default"
version: "v1.0.0"
lastUpdated: "2025-05-13"
---

# Create a Task

## Endpoint

```
POST /tasks
```

This endpoint creates a new task in the system. The task can include a title, description, priority, assignment to a user, due date, and other properties.

## Path Parameters

None.

## Request Body

The request body should be a JSON object with the following properties:

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `title` | String | Yes | Title of the task |
| `description` | String | No | Detailed description of the task |
| `status` | String | No | Initial status of the task (default: "TODO") |
| `priority` | String | No | Priority level: "LOW", "MEDIUM", "HIGH", "URGENT" (default: "MEDIUM") |
| `assigneeId` | String | No | ID of the user assigned to the task |
| `dueDate` | String | No | When the task is due (ISO 8601 format) |
| `warningOffset` | Number | No | Hours before due date to send a reminder |
| `tags` | Array | No | Array of string tags associated with the task |

### Example Request Body

```json
{
  "title": "Implement authentication",
  "description": "Add token-based authentication to the application",
  "status": "TODO",
  "priority": "HIGH",
  "assigneeId": "user123",
  "dueDate": "2025-06-01T17:00:00Z",
  "warningOffset": 24,
  "tags": ["authentication", "security", "api"]
}
```

## Request Example

```http
POST /tasks
Content-Type: application/json
Authorization: Bearer YOUR_API_KEY

{
  "title": "Implement authentication",
  "description": "Add token-based authentication to the application",
  "status": "TODO",
  "priority": "HIGH",
  "assigneeId": "user123",
  "dueDate": "2025-06-01T17:00:00Z",
  "warningOffset": 24,
  "tags": ["authentication", "security", "api"]
}
```

## Response

### Success Response (201 Created)

```json
{
  "id": "task789",
  "title": "Implement authentication",
  "description": "Add token-based authentication to the application",
  "status": "TODO",
  "priority": "HIGH",
  "createdBy": "user456",
  "assigneeId": "user123",
  "dueDate": "2025-06-01T17:00:00Z",
  "warningOffset": 24,
  "tags": ["authentication", "security", "api"],
  "createdAt": "2025-05-13T15:30:00Z",
  "updatedAt": "2025-05-13T15:30:00Z"
}
```

### Error Responses

| Status Code | Description |
|-------------|-------------|
| 400 | Bad request (e.g., malformed request body) |
| 401 | Unauthorized (missing or invalid authentication) |
| 403 | Forbidden (insufficient permissions to create tasks) |
| 404 | Not Found (e.g., referenced assignee does not exist) |
| 422 | Unprocessable entity (e.g., validation errors) |

#### Example Error Response

```json
{
  "error": {
    "code": "validation_error",
    "message": "The request contains invalid data",
    "details": {
      "title": "Title is required",
      "dueDate": "Due date must be in the future",
      "assigneeId": "Assignee with ID 'user123' does not exist"
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

All authenticated users can create tasks, but there may be restrictions on certain fields:
- Only `admin` and `manager` users can assign tasks to any user
- `member` users can only assign tasks to themselves

## Important Considerations

- **Auto-Generated Fields**: The `id`, `createdBy`, `createdAt`, and `updatedAt` fields are automatically generated and cannot be specified in the request.

- **CreatedBy Field**: The `createdBy` field is automatically set to the ID of the authenticated user who creates the task.

- **Status Restrictions**: If `status` is specified, it must be a valid task status. If omitted, "TODO" is used as the default initial status.

- **Priority Levels**: Valid priority values are "LOW", "MEDIUM", "HIGH", and "URGENT". If omitted, "MEDIUM" is used as the default.

- **Date Format**: The `dueDate` must be specified in ISO 8601 format (YYYY-MM-DDTHH:MM:SSZ) and should be in the future.

- **Warning Offset**: If `warningOffset` is specified, it defines the number of hours before the due date when a reminder should be sent. This requires a valid `dueDate` to be set.

- **Tags Limitations**: Each tag must be a string. The maximum number of tags per task is 10, and each tag can be at most 50 characters long.

## Best Practices

- Provide clear, descriptive titles and detailed descriptions to make tasks easy to understand
- Set appropriate priority levels to help team members prioritize their work
- Assign due dates that allow sufficient time for task completion
- Use consistent tags to categorize and filter tasks effectively
- Consider setting warning offsets for important tasks to provide timely reminders
- Validate input client-side before sending to reduce validation errors

## Code Examples

### JavaScript

```javascript
async function createTask(taskData) {
  try {
    const response = await fetch('https://api.taskmanagement.example.com/v1/tasks', {
      method: 'POST',
      headers: {
        'Authorization': `Bearer ${API_KEY}`,
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(taskData)
    });
    
    if (!response.ok) {
      const errorData = await response.json();
      throw new Error(`Failed to create task: ${errorData.error.message}`);
    }
    
    return await response.json();
  } catch (error) {
    console.error('Error creating task:', error);
    throw error;
  }
}

// Example usage
try {
  // Set the due date to 2 weeks from now
  const dueDate = new Date();
  dueDate.setDate(dueDate.getDate() + 14);
  
  const newTask = await createTask({
    title: 'Create API documentation',
    description: 'Write comprehensive API documentation for developers',
    priority: 'HIGH',
    assigneeId: 'user123',
    dueDate: dueDate.toISOString(),
    warningOffset: 24, // Reminder 24 hours before due date
    tags: ['documentation', 'api']
  });
  
  console.log(`Task created with ID: ${newTask.id}`);
  console.log(`Due date: ${new Date(newTask.dueDate).toLocaleDateString()}`);
} catch (error) {
  // Handle validation errors specifically
  if (error.message.includes('validation_error')) {
    console.error('Please correct the following errors:');
    // Extract and display specific validation errors
    const errorDetails = JSON.parse(error.message.split(': ')[1]);
    Object.entries(errorDetails).forEach(([field, message]) => {
      console.error(`- ${field}: ${message}`);
    });
  } else {
    console.error('Failed to create task:', error);
  }
}
```

### Python

```python
import requests
from datetime import datetime, timedelta

def create_task(api_key, title, description=None, status='TODO', priority='MEDIUM', assignee_id=None, due_date=None, warning_offset=None, tags=None):
    """
    Create a new task in the system.
    
    Args:
        api_key (str): API key for authentication
        title (str): Title of the task
        description (str, optional): Detailed description of the task
        status (str, optional): Initial status of the task. Defaults to 'TODO'.
        priority (str, optional): Priority level. Defaults to 'MEDIUM'.
        assignee_id (str, optional): ID of the user assigned to the task
        due_date (datetime or str, optional): When the task is due
        warning_offset (int, optional): Hours before due date to send a reminder
        tags (list, optional): List of tags associated with the task
        
    Returns:
        dict: Created task object
        
    Raises:
        Exception: If the API request fails
    """
    url = 'https://api.taskmanagement.example.com/v1/tasks'
    headers = {
        'Authorization': f'Bearer {api_key}',
        'Content-Type': 'application/json'
    }
    
    # Build request data
    data = {
        'title': title,
        'status': status,
        'priority': priority
    }
    
    if description:
        data['description'] = description
        
    if assignee_id:
        data['assigneeId'] = assignee_id
        
    if due_date:
        # Convert datetime to ISO string if needed
        if isinstance(due_date, datetime):
            data['dueDate'] = due_date.isoformat()
        else:
            data['dueDate'] = due_date
            
    if warning_offset is not None:
        data['warningOffset'] = warning_offset
        
    if tags:
        data['tags'] = tags
    
    response = requests.post(url, json=data, headers=headers)
    
    if response.status_code == 201:
        return response.json()
    else:
        error_data = response.json()
        
        if response.status_code == 422 and 'details' in error_data['error']:
            error_details = error_data['error']['details']
            raise Exception(f"Validation error: {error_details}")
        else:
            raise Exception(f"Task creation failed: {error_data['error']['message']}")

# Example usage
try:
    # Set due date to 1 week from now
    due_date = datetime.now() + timedelta(days=7)
    
    task = create_task(
        api_key='YOUR_API_KEY',
        title='Prepare quarterly report',
        description='Compile and analyze Q2 2025 financial data',
        priority='HIGH',
        assignee_id='user456',
        due_date=due_date,
        warning_offset=48,  # 2 days before deadline
        tags=['finance', 'reporting', 'quarterly']
    )
    
    print(f"Task created successfully:")
    print(f"ID: {task['id']}")
    print(f"Title: {task['title']}")
    print(f"Assigned to: {task['assigneeId']}")
    print(f"Due date: {task['dueDate']}")
    
except Exception as e:
    print(f"Error: {e}")
```

### cURL

```bash
curl -X POST "https://api.taskmanagement.example.com/v1/tasks" \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "title": "Implement authentication",
    "description": "Add token-based authentication to the application",
    "priority": "HIGH",
    "assigneeId": "user123",
    "dueDate": "2025-06-01T17:00:00Z",
    "tags": ["authentication", "security", "api"]
  }'
```

## Related Resources

- [Task Resource](/resources/task-resource.md) - Detailed information about the Task resource
- [Get All Tasks](/api-reference/get-all-tasks.md) - Retrieve a list of all tasks
- [Get Task by ID](/api-reference/get-task-by-id.md) - Retrieve a specific task by ID

## See Also

- [Task Status Lifecycle](/core-concepts/task-status-lifecycle.md) - Understanding task statuses and transitions
- [Data Model](/core-concepts/data-model.md) - Overview of the core resources and their relationships
- [Task Management Workflow](/tutorials/task-management-workflow.md) - Guide to implementing a task management workflow


