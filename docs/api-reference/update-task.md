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
ai-generated-date: "May 20, 2025"
nav_order: "10"
layout: "default"
version: "v1.0.0"
lastUpdated: "May 20, 2025"
---

# Update a task

Updates one or more properties of an existing task. The API supports partial updates, so you only need to include the fields you want to change.

## Endpoint

```
PATCH /tasks/{taskId}
```

## Path parameters

| Parameter | Type | Description | Required |
|-----------|------|-------------|----------|
| `taskId` | integer | The unique identifier of the task to update | Yes |

## Request body

| Property | Type | Description | Required | Constraints |
|----------|------|-------------|----------|------------|
| `userId` | integer | ID of the user who owns the task | No | Must reference a valid user |
| `taskTitle` | string | Short description of the task | No | 1-80 characters |
| `taskDescription` | string | Detailed description of the task | No | 1-255 characters |
| `taskStatus` | string | Current status of the task | No | Must be one of the predefined status values |
| `dueDate` | string (date-time) | When the task is due | No | ISO 8601 format |
| `warningOffset` | integer | Minutes before due date to send reminder | No | 0-64000 |

You must include at least one property in the request body.

Example request body:

```json
{
  "taskStatus": "COMPLETED"
}
```

## Request example

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

## Response

### Success response (200 OK)

```json
{
  "taskId": 1,
  "userId": 1,
  "taskTitle": "Complete project proposal",
  "taskDescription": "Finish the proposal for the new client project",
  "taskStatus": "COMPLETED",
  "dueDate": "2025-06-15T17:00:00-05:00",
  "warningOffset": 120
}
```

### Error responses

| Status code | Description | Error code |
|-------------|-------------|------------|
| 400 Bad Request | Invalid request body or task ID | `INVALID_FIELD` |
| 401 Unauthorized | Missing or invalid authentication | `UNAUTHORIZED` |
| 403 Forbidden | Insufficient permissions | `FORBIDDEN` |
| 404 Not Found | Task not found | `RESOURCE_NOT_FOUND` |
| 429 Too Many Requests | Rate limit exceeded | `RATE_LIMIT_EXCEEDED` |
| 500 Server Error | Unexpected server error | `SERVER_ERROR` |

See [Error responses](error-responses.md) for details on error response format.

## Authentication

This endpoint requires authentication using a bearer token:

```
Authorization: Bearer your-token-here
```

## Important considerations

- You must include at least one property in the request body. If the request body is empty or doesn't contain any valid properties, the API will return a 400 Bad Request response.
- The `taskId` must be a valid integer that corresponds to an existing task. If the specified task does not exist, the API will return a 404 Not Found response.
- The `userId` must reference an existing user in the system if provided.
- The `taskStatus` must be one of the predefined status values if provided.
- The `dueDate` must be in ISO 8601 format if provided.
- String fields have minimum and maximum length constraints. If a field value is too short or too long, the API will return a 400 Bad Request response with an `INVALID_FIELD` error code.
- The response includes the complete task object with all properties, including those that weren't updated.

## Best practices

- Only include the fields you want to update in the request body to minimize payload size.
- When updating a task's status, follow the typical status transitions described in the [Task status lifecycle](../core-concepts/task-status-lifecycle.md) documentation.
- Validate user input on the client side before sending the request to reduce unnecessary API calls.
- Use this endpoint to mark tasks as completed by updating the `taskStatus` field to `COMPLETED`.
- Consider implementing optimistic updates in your UI to improve perceived performance.

## Code examples

### Update a task status with error handling

```javascript
// JavaScript example: Update a task status with error handling
async function updateTaskStatus(taskId, newStatus) {
  try {
    const response = await fetch(`http://localhost:3000/tasks/${taskId}`, {
      method: 'PATCH',
      headers: {
        'Authorization': 'Bearer your-token-here',
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        taskStatus: newStatus
      })
    });
    
    if (!response.ok) {
      const errorData = await response.json();
      
      // Handle specific error cases
      if (errorData.code === 'RESOURCE_NOT_FOUND') {
        throw new Error(`Task with ID ${taskId} not found`);
      }
      
      if (errorData.code === 'INVALID_FIELD') {
        const fieldErrors = {};
        
        if (errorData.details) {
          errorData.details.forEach(detail => {
            fieldErrors[detail.field] = detail.reason;
          });
        }
        
        throw {
          message: errorData.message,
          fieldErrors
        };
      }
      
      throw new Error(errorData.message || `Failed to update task with ID ${taskId}`);
    }
    
    return await response.json();
  } catch (error) {
    console.error(`Error updating task with ID ${taskId}:`, error);
    throw error;
  }
}

// Usage example
try {
  const updatedTask = await updateTaskStatus(1, 'COMPLETED');
  console.log('Task updated:', updatedTask);
  
  // Show success message based on the update
  if (updatedTask.taskStatus === 'COMPLETED') {
    console.log(`Task "${updatedTask.taskTitle}" marked as completed!`);
  }
} catch (error) {
  if (error.fieldErrors) {
    // Handle field-specific errors
    Object.entries(error.fieldErrors).forEach(([field, reason]) => {
      console.error(`Error in ${field}: ${reason}`);
      // Update UI to show error for this field
    });
  } else {
    // Handle general error
    console.error('Failed to update task:', error.message);
  }
}
```

```python
# Python example: Update a task status with error handling
def update_task_status(token, task_id, new_status):
    try:
        url = f"http://localhost:3000/tasks/{task_id}"
        headers = {
            "Authorization": f"Bearer {token}",
            "Content-Type": "application/json"
        }
        data = {
            "taskStatus": new_status
        }
        
        response = requests.patch(url, headers=headers, json=data)
        
        if response.status_code == 404:
            print(f"Task with ID {task_id} not found")
            return None
            
        response.raise_for_status()  # Raise exception for other 4XX/5XX status codes
        
        return response.json()
    except requests.exceptions.HTTPError as e:
        # Handle API errors
        try:
            error_data = e.response.json()
            
            # Handle field-specific errors
            if error_data.get("code") == "INVALID_FIELD":
                field_errors = {}
                
                if "details" in error_data:
                    for detail in error_data["details"]:
                        field_errors[detail["field"]] = detail["reason"]
                
                print(f"Validation error: {error_data['message']}")
                for field, reason in field_errors.items():
                    print(f"  - {field}: {reason}")
            else:
                print(f"API error: {error_data.get('message', str(e))}")
                
            return None
        except ValueError:
            # Could not parse error response as JSON
            print(f"Error updating task: {str(e)}")
            return None
    except Exception as e:
        print(f"Error updating task: {str(e)}")
        return None

# Usage example
updated_task = update_task_status("your-token-here", 1, "COMPLETED")

if updated_task:
    print(f"Task updated: {updated_task}")
    
    # Show success message based on the update
    if updated_task["taskStatus"] == "COMPLETED":
        print(f"Task \"{updated_task['taskTitle']}\" marked as completed!")
else:
    print("Failed to update task")
```

## Related resources

- [Task resource](../resources/task-resource.md)
- [Task status lifecycle](../core-concepts/task-status-lifecycle.md)

## See also

- [Get all tasks](get-all-tasks.md)
- [Create a task](create-task.md)
- [Get task by ID](get-task-by-id.md)
- [Delete a task](delete-task.md)


