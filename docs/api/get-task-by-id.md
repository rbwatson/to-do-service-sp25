# Get Task by ID

Retrieves a single task based on its unique task ID.

**Endpoint:** `GET /tasks/{taskId}`

## Authentication

This endpoint requires authentication using a Bearer token.

```
Authorization: Bearer {token}
```

## Request

### Headers

| Header | Value | Description |
|--------|-------|-------------|
| Authorization | Bearer {token} | Authentication token |

### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `taskId` | integer | Yes | The unique ID of the task to retrieve |

> **Note:** The `taskId` must be a valid integer value corresponding to an existing task in the system.

## Response

### Success Response (200 OK)

When the request is successful, the API returns HTTP status code `200 OK` with the task object.

#### Response Body

```json
{
  "taskId": 1,
  "userId": 1,
  "taskTitle": "Grocery shopping",
  "taskDescription": "eggs, bacon, gummy bears",
  "taskStatus": "NOT_STARTED",
  "dueDate": "2024-02-20T17:00:00-05:00",
  "warningOffset": 10
}
```

### Error Responses

This endpoint may return the following error responses:

- `400 Bad Request` - Invalid task ID format
- `401 Unauthorized` - Missing or invalid authentication
- `403 Forbidden` - Insufficient permissions
- `404 Not Found` - Task not found
- `429 Too Many Requests` - Rate limit exceeded
- `500 Server Error` - Unexpected server error

For detailed information about these errors, refer to the [API Error Responses](error-responses.md) documentation.

## Example

### cURL

```bash
curl -X GET https://localhost:3000/tasks/1 \
  -H "Authorization: Bearer your-token-here"
```

### JavaScript

```javascript
const getTask = async (taskId) => {
  try {
    const response = await fetch(`https://localhost:3000/tasks/${taskId}`, {
      method: 'GET',
      headers: {
        'Authorization': 'Bearer your-token-here'
      }
    });
    
    if (!response.ok) {
      const errorData = await response.json();
      throw new Error(`Error ${response.status}: ${errorData.message}`);
    }
    
    const task = await response.json();
    console.log('Task:', task);
    return task;
  } catch (error) {
    console.error('Failed to fetch task:', error);
  }
};
```

### Python

```python
import requests

def get_task(task_id):
    url = f"https://localhost:3000/tasks/{task_id}"
    headers = {
        "Authorization": "Bearer your-token-here"
    }
    
    response = requests.get(url, headers=headers)
    
    if response.status_code == 200:
        task = response.json()
        print(f"Task retrieved: {task}")
        return task
    else:
        print(f"Error {response.status_code}: {response.json()}")
        return None
```

## Common Issues

1. **Task Not Found**: If you request a task with an ID that doesn't exist, you'll receive a `404 Not Found` error. Double-check the `taskId` value.

2. **Invalid Task ID Format**: The `taskId` must be a valid integer. If you provide a non-integer value, you'll receive a `400 Bad Request` error.

3. **Permission Issues**: Depending on the system's permission model, users might only be able to view tasks they created or tasks assigned to them. If you attempt to access a task you don't have permission to view, you'll receive a `403 Forbidden` error.

4. **Data Interpretation**: Be careful when interpreting the `dueDate` field, as it includes time zone information. Ensure your application correctly handles the date-time values across different time zones.

5. **Task Status Handling**: The `taskStatus` field will be one of the predefined values (`NOT_STARTED`, `IN_PROGRESS`, `BLOCKED`, `DEFERRED`, `COMPLETED`, or `CANCELLED`). Your application should be prepared to handle any of these statuses appropriately.

6. **Deleted Users**: If the task's `userId` references a user that has been deleted, the task will still be accessible, but operations involving the associated user might fail. Consider how your application will handle this situation.

7. **Rate Limiting**: This endpoint is subject to rate limiting. If you're making many requests in quick succession, implement backoff logic using the `Retry-After` header.

8. **Caching Considerations**: For frequently accessed task data, consider implementing client-side caching to reduce API calls. Just be sure to invalidate the cache when tasks are updated.
