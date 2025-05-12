# Get All Tasks

Returns a paginated list of all tasks in the Task Management system.

**Endpoint:** `GET /tasks`

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

### Query Parameters

| Parameter | Type | Required | Default | Description |
|-----------|------|----------|---------|-------------|
| `_page` | integer | No | 0 | Page number (zero-indexed) |
| `_perPage` | integer | No | 20 | Number of items per page (1-100) |
| `_sort` | string | No | | Field to sort by, prefix with `-` for descending order |
| `taskStatus` | string | No | | Filter tasks by status |

> **Note:** The `taskStatus` parameter accepts any of the following values: `NOT_STARTED`, `IN_PROGRESS`, `BLOCKED`, `DEFERRED`, `COMPLETED`, or `CANCELLED`.

> **Note:** Sorting is possible on any task property. For example, use `dueDate` to sort by due date ascending, or `-taskTitle` to sort tasks alphabetically by title in descending order.

## Response

### Success Response (200 OK)

When the request is successful, the API returns HTTP status code `200 OK` with an array of task objects.

> **Note:** The response does not include pagination metadata like total count or total pages. To navigate through all tasks, increment the `_page` parameter until you receive an empty array.

#### Response Body

```json
{
  "tasks": [
    {
      "taskId": 1,
      "userId": 1,
      "taskTitle": "Grocery shopping",
      "taskDescription": "eggs, bacon, gummy bears",
      "taskStatus": "NOT_STARTED",
      "dueDate": "2024-02-20T17:00:00.000-05:00",
      "warningOffset": 60
    },
    {
      "taskId": 2,
      "userId": 1,
      "taskTitle": "Piano recital",
      "taskDescription": "Daughter's first concert appearance",
      "taskStatus": "IN_PROGRESS",
      "dueDate": "2024-04-02T15:00:00-05:00",
      "warningOffset": 30
    },
    {
      "taskId": 3,
      "userId": 2,
      "taskTitle": "Oil change",
      "taskDescription": "5K auto service",
      "taskStatus": "COMPLETED",
      "dueDate": "2024-03-10T09:00:00-05:00",
      "warningOffset": 60
    },
    {
      "taskId": 4,
      "userId": 3,
      "taskTitle": "Get shots for dog",
      "taskDescription": "Annual vaccinations for poochy",
      "taskStatus": "DEFERRED",
      "dueDate": "2024-05-11T14:00:00-05:00",
      "warningOffset": 20
    }
  ]
}
```

### Error Responses

This endpoint may return the following error responses:

- `400 Bad Request` - Invalid query parameters
- `401 Unauthorized` - Missing or invalid authentication
- `403 Forbidden` - Insufficient permissions
- `404 Not Found` - Resource not found
- `429 Too Many Requests` - Rate limit exceeded
- `500 Server Error` - Unexpected server error

For detailed information about these errors, refer to the [API Error Responses](error-responses.md) documentation.

## Example

### cURL

```bash
# Get all tasks, sorted by due date, showing only in-progress tasks
curl -X GET "https://localhost:3000/tasks?_page=0&_perPage=10&_sort=dueDate&taskStatus=IN_PROGRESS" \
  -H "Authorization: Bearer your-token-here"
```

### JavaScript

```javascript
const getTasks = async (options = {}) => {
  try {
    const {
      page = 0,
      perPage = 20,
      sort = 'dueDate',
      status
    } = options;
    
    let url = `https://localhost:3000/tasks?_page=${page}&_perPage=${perPage}&_sort=${sort}`;
    if (status) {
      url += `&taskStatus=${status}`;
    }
    
    const response = await fetch(url, {
      method: 'GET',
      headers: {
        'Authorization': 'Bearer your-token-here'
      }
    });
    
    if (!response.ok) {
      const errorData = await response.json();
      throw new Error(`Error ${response.status}: ${errorData.message}`);
    }
    
    const data = await response.json();
    console.log('Tasks:', data.tasks);
    return data.tasks;
  } catch (error) {
    console.error('Failed to fetch tasks:', error);
  }
};

// Example: Get completed tasks
getTasks({ status: 'COMPLETED' });
```

### Python

```python
import requests

def get_tasks(page=0, per_page=20, sort="dueDate", status=None):
    url = "https://localhost:3000/tasks"
    params = {
        "_page": page,
        "_perPage": per_page,
        "_sort": sort
    }
    
    if status:
        params["taskStatus"] = status
        
    headers = {
        "Authorization": "Bearer your-token-here"
    }
    
    response = requests.get(url, params=params, headers=headers)
    
    if response.status_code == 200:
        data = response.json()
        print(f"Retrieved {len(data['tasks'])} tasks")
        return data['tasks']
    else:
        print(f"Error {response.status_code}: {response.json()}")
        return None
```

## Common Issues

1. **Invalid Status Filter**: If you provide an invalid value for the `taskStatus` parameter, you'll receive a `400 Bad Request` error. Make sure to use only the supported status values.

2. **Empty Response**: If you receive an empty `tasks` array, you may have reached the end of the available data, specified a `_page` value that's too high, or used a filter that matches no tasks.

3. **Performance Considerations**: Requesting all tasks without filters may be slow for large datasets. Use appropriate filters and pagination to improve performance.

4. **Task Ownership**: The endpoint returns all tasks in the system, regardless of the owner. If you want to see only tasks belonging to a specific user, you should filter the results client-side by `userId` or implement a custom filter server-side.

5. **Time Zone Handling**: The `dueDate` field includes time zone information. Ensure your application correctly interprets the date-time values, especially when comparing dates or displaying them to users.

6. **Sorting by Multiple Fields**: The API only supports sorting by a single field. If you need to sort by multiple criteria, you'll need to implement secondary sorting in your client application.

7. **Rate Limiting**: This endpoint is subject to rate limiting, especially when requesting large datasets. Implement backoff logic using the `Retry-After` header if necessary.
