# Create a New Task

Creates a new task in the Task Management system.

**Endpoint:** `POST /tasks`

## Authentication

This endpoint requires authentication using a Bearer token.

```text
Authorization: Bearer {token}
```

## Request

### Headers

| Header | Value | Description |
|--------|-------|-------------|
| Content-Type | `application/json` | Specifies the format of the request body |
| Authorization | Bearer {token} | Authentication token |

### Request Body

The request body must be a JSON object with the following properties:

| Property | Type | Required | Default | Description |
|----------|------|----------|---------|-------------|
| `userId` | integer | Yes | | The ID of the user who owns this task |
| `taskTitle` | string | Yes | | The title of the task (1-80 characters) |
| `taskDescription` | string | No | | Detailed description of the task (1-255 characters) |
| `taskStatus` | string | No | `NOT_STARTED` | Current status of the task |
| `dueDate` | string | Yes | | When the task is due (ISO 8601 date-time format) |
| `warningOffset` | integer | Yes | | Minutes before due date to send a reminder (0-64000) |

> **Note:** The `userId` must correspond to an existing user in the system. If the specified user doesn't exist, you'll receive a `400 Bad Request` error.

> **Note:** The `dueDate` must be in the future. Past dates are not allowed for new tasks.

> **Note:** The `taskStatus` must be one of: `NOT_STARTED`, `IN_PROGRESS`, `BLOCKED`, `DEFERRED`, `COMPLETED`, or `CANCELLED`. If not provided, it defaults to `NOT_STARTED`.

```json
{
  "userId": 1,
  "taskTitle": "New Task",
  "taskDescription": "Description of the new task",
  "taskStatus": "NOT_STARTED",
  "dueDate": "2024-06-01T12:00:00-05:00",
  "warningOffset": 5
}
```

## Response

### Success Response (201 Created)

When the task is successfully created, the API returns HTTP status code `201 Created` with the created task object, including the system-assigned `taskId`.

> **Note:** The system automatically generates a unique `taskId` for each new task.

#### Response Body

```json
{
  "taskId": 5,
  "userId": 1,
  "taskTitle": "New Task",
  "taskDescription": "Description of the new task",
  "taskStatus": "NOT_STARTED",
  "dueDate": "2024-06-01T12:00:00-05:00",
  "warningOffset": 5
}
```

### Error Responses

This endpoint may return the following error responses:

- `400 Bad Request` - Invalid or missing required fields
- `401 Unauthorized` - Missing or invalid authentication
- `403 Forbidden` - Insufficient permissions
- `429 Too Many Requests` - Rate limit exceeded
- `500 Server Error` - Unexpected server error

For detailed information about these errors, refer to the [API Error Responses](error-responses.md) documentation.

## Example

### cURL

```bash
curl -X POST https://localhost:3000/tasks \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer your-token-here" \
  -d '{
    "userId": 1,
    "taskTitle": "New Task",
    "taskDescription": "Description of the new task",
    "taskStatus": "NOT_STARTED",
    "dueDate": "2024-06-01T12:00:00-05:00",
    "warningOffset": 5
  }'
```

### JavaScript

```javascript
const createTask = async (taskData) => {
  try {
    const response = await fetch('https://localhost:3000/tasks', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer your-token-here'
      },
      body: JSON.stringify(taskData)
    });
    
    if (!response.ok) {
      const errorData = await response.json();
      throw new Error(`Error ${response.status}: ${errorData.message}`);
    }
    
    const task = await response.json();
    console.log('Task created:', task);
    return task;
  } catch (error) {
    console.error('Failed to create task:', error);
  }
};

// Example usage
const newTask = {
  userId: 1,
  taskTitle: "New Task",
  taskDescription: "Description of the new task",
  taskStatus: "NOT_STARTED",
  dueDate: "2024-06-01T12:00:00-05:00",
  warningOffset: 5
};

createTask(newTask);
```

### Python

```python
import requests
from datetime import datetime, timedelta

def create_task(task_data):
    url = "https://localhost:3000/tasks"
    headers = {
        "Content-Type": "application/json",
        "Authorization": "Bearer your-token-here"
    }
    
    response = requests.post(url, json=task_data, headers=headers)
    
    if response.status_code == 201:
        task = response.json()
        print(f"Task created: {task}")
        return task
    else:
        print(f"Error {response.status_code}: {response.json()}")
        return None

# Example usage with a due date 7 days from now
future_date = (datetime.now() + timedelta(days=7)).isoformat()

new_task = {
    "userId": 1,
    "taskTitle": "New Task",
    "taskDescription": "Description of the new task",
    "taskStatus": "NOT_STARTED",
    "dueDate": future_date,
    "warningOffset": 5
}

create_task(new_task)
```

## Common Issues

1. **Invalid User ID**: The `userId` must correspond to an existing user in the system. If you provide a non-existent user ID, you'll receive a `400 Bad Request` error.

2. **Past Due Date**: The `dueDate` must be in the future for new tasks. Past dates will result in a `400 Bad Request` error.

3. **Invalid Task Status**: If you provide a value for `taskStatus` that isn't one of the allowed options, you'll receive a `400 Bad Request` error.

4. **Date Format Issues**: The `dueDate` must be in ISO 8601 format (e.g., `2024-06-01T12:00:00-05:00`). Incorrect date formats will result in a `400 Bad Request` error.

5. **Field Length Constraints**: The `taskTitle` is limited to 80 characters, and the `taskDescription` is limited to 255 characters. Exceeding these limits will result in a `400 Bad Request` error.

6. **Permission Issues**: The authenticated user must have permissions to create tasks. If you receive a `403 Forbidden` error, check your account permissions.

7. **Duplicate Detection**: The API doesn't check for duplicate tasks, so it's possible to create multiple tasks with identical details. If your application needs to prevent duplicates, you'll need to implement that logic client-side.

8. **Time Zone Considerations**: The `dueDate` should include time zone information. If omitted, the server might interpret the date in a different time zone than intended.
