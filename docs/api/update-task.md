# Update a Task

Updates one or more properties of an existing task. The API supports partial updates, allowing you to modify only the fields you specify.

**Endpoint:** `PATCH /tasks/{taskId}`

## Authentication

This endpoint requires authentication using a Bearer token.

```
Authorization: Bearer {token}
```

## Request

### Headers

| Header | Value | Description |
|--------|-------|-------------|
| Content-Type | application/json | Specifies the format of the request body |
| Authorization | Bearer {token} | Authentication token |

### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `taskId` | integer | Yes | The unique ID of the task to update |

### Request Body

The request body should be a JSON object containing the fields you want to update. You can include any combination of the following fields:

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `userId` | integer | No | The ID of the user who owns this task |
| `taskTitle` | string | No | The title of the task (1-80 characters) |
| `taskDescription` | string | No | Detailed description of the task (1-255 characters) |
| `taskStatus` | string | No | Current status of the task |
| `dueDate` | string | No | When the task is due (ISO 8601 date-time format) |
| `warningOffset` | integer | No | Minutes before due date to send a reminder (0-64000) |

> **Note:** You must include at least one property in the request body. The `taskId` cannot be modified.

> **Note:** If you include `userId`, it must correspond to an existing user in the system.

> **Note:** If you include `taskStatus`, it must be one of: `NOT_STARTED`, `IN_PROGRESS`, `BLOCKED`, `DEFERRED`, `COMPLETED`, or `CANCELLED`.

```json
{
  "taskStatus": "COMPLETED"
}
```

## Response

### Success Response (200 OK)

When the task is successfully updated, the API returns HTTP status code `200 OK` with the updated task object.

#### Response Body

```json
{
  "taskId": 1,
  "userId": 1,
  "taskTitle": "Grocery shopping",
  "taskDescription": "eggs, bacon, gummy bears",
  "taskStatus": "COMPLETED",
  "dueDate": "2024-02-20T17:00:00-05:00",
  "warningOffset": 10
}
```

### Error Responses

This endpoint may return the following error responses:

- `400 Bad Request` - Invalid or missing fields
- `401 Unauthorized` - Missing or invalid authentication
- `403 Forbidden` - Insufficient permissions
- `404 Not Found` - Task not found
- `429 Too Many Requests` - Rate limit exceeded
- `500 Server Error` - Unexpected server error

For detailed information about these errors, refer to the [API Error Responses](error-responses.md) documentation.

## Example

### cURL

```bash
curl -X PATCH https://localhost:3000/tasks/1 \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer your-token-here" \
  -d '{
    "taskStatus": "COMPLETED"
  }'
```

### JavaScript

```javascript
const updateTask = async (taskId, updates) => {
  try {
    const response = await fetch(`https://localhost:3000/tasks/${taskId}`, {
      method: 'PATCH',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer your-token-here'
      },
      body: JSON.stringify(updates)
    });
    
    if (!response.ok) {
      const errorData = await response.json();
      throw new Error(`Error ${response.status}: ${errorData.message}`);
    }
    
    const task = await response.json();
    console.log('Task updated:', task);
    return task;
  } catch (error) {
    console.error('Failed to update task:', error);
  }
};

// Example: Mark a task as completed
updateTask(1, { taskStatus: "COMPLETED" });
```

### Python

```python
import requests

def update_task(task_id, updates):
    url = f"https://localhost:3000/tasks/{task_id}"
    headers = {
        "Content-Type": "application/json",
        "Authorization": "Bearer your-token-here"
    }
    
    response = requests.patch(url, json=updates, headers=headers)
    
    if response.status_code == 200:
        task = response.json()
        print(f"Task updated: {task}")
        return task
    else:
        print(f"Error {response.status_code}: {response.json()}")
        return None

# Example: Mark a task as completed
update_task(1, {"taskStatus": "COMPLETED"})
```

## Common Issues

1. **Empty Request Body**: You must include at least one valid field in the request body. An empty request body will result in a `400 Bad Request` error.

2. **Task Not Found**: If you attempt to update a task that doesn't exist, you'll receive a `404 Not Found` error. Verify the `taskId` is correct.

3. **Invalid User ID**: If you include `userId` in the update, it must correspond to an existing user in the system. If you provide a non-existent user ID, you'll receive a `400 Bad Request` error.

4. **Invalid Task Status**: If you provide a value for `taskStatus` that isn't one of the allowed options, you'll receive a `400 Bad Request` error.

5. **Permission Issues**: Depending on the system's permission model, users might only be able to update tasks they created or tasks assigned to them. If you attempt to update a task you don't have permission to modify, you'll receive a `403 Forbidden` error.

6. **Validation Errors**: Make sure all field values meet the validation requirements:
   - `taskTitle` must be between 1 and 80 characters
   - `taskDescription` must be between 1 and 255 characters
   - `dueDate` must be in valid ISO 8601 format
   - `warningOffset` must be between 0 and 64000

7. **Workflow Restrictions**: Some systems may enforce workflow rules for task status transitions. For example, a task might not be allowed to go directly from `NOT_STARTED` to `COMPLETED`. Check for any business rules that might restrict certain status transitions.

8. **Concurrent Updates**: If multiple updates are made to the same task simultaneously, the last one processed will take precedence. There is no built-in optimistic concurrency control in this API.

9. **Webhook Triggers**: Task updates, especially status changes, may trigger external integrations or notifications. Be aware of any downstream effects that might result from task updates.
