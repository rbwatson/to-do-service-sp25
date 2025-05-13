---
title: "Get all tasks"
description: "API endpoint to retrieve a list of all tasks with pagination, sorting, and filtering options."
tags: ["tasks", "endpoint", "GET"]
categories: ["api-reference"]
importance: 7
api_endpoints: ["/tasks"]
related_pages: ["task-resource", "pagination", "sorting", "task-status-lifecycle"]
parent: "api-reference"
hasChildren: false
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "2025-05-13"
navOrder: "7"
layout: "default"
version: "v1.0.0"
lastUpdated: "2025-05-13"
---

# Get All Tasks

## Endpoint

```
GET /tasks
```

This endpoint retrieves a paginated list of tasks. It supports comprehensive filtering, sorting, and pagination options to help you find specific tasks or navigate through large task collections.

## Request Parameters

The following query parameters can be used to filter, sort, and paginate the results:

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `limit` | Integer | 10 | Number of items to return per page (max: 100) |
| `offset` | Integer | 0 | Number of items to skip before starting to collect the result set |
| `sort` | String | `-createdAt` | Field to sort by, optionally prefixed with `+` (ascending) or `-` (descending) |
| `status` | String | - | Filter by task status (comma-separated for multiple values) |
| `priority` | String | - | Filter by task priority (comma-separated for multiple values) |
| `assigneeId` | String | - | Filter by assigned user ID |
| `createdBy` | String | - | Filter by creator user ID |
| `tags` | String | - | Filter by tags (comma-separated for multiple values) |
| `dueDate[gt]` | String | - | Filter tasks due after this date (ISO format) |
| `dueDate[lt]` | String | - | Filter tasks due before this date (ISO format) |
| `dueDate[exists]` | Boolean | - | Filter tasks that have (true) or don't have (false) a due date |
| `search` | String | - | Search in task title and description (minimum 3 characters) |

## Request Example

### Basic Request

```http
GET /tasks
Authorization: Bearer YOUR_API_KEY
```

### Request with Pagination and Sorting

```http
GET /tasks?limit=5&offset=10&sort=-dueDate
Authorization: Bearer YOUR_API_KEY
```

This request will:
- Return up to 5 tasks per page
- Skip the first 10 tasks
- Sort the results by due date in descending order (tasks due sooner appear first)

### Request with Filtering

```http
GET /tasks?status=TODO,IN_PROGRESS&priority=HIGH,URGENT&assigneeId=user123&dueDate[lt]=2025-06-01T00:00:00Z
Authorization: Bearer YOUR_API_KEY
```

This request will return tasks:
- With status "TODO" or "IN_PROGRESS"
- With priority "HIGH" or "URGENT"
- Assigned to user with ID "user123"
- Due before June 1, 2025

## Response

### Success Response (200 OK)

```json
{
  "data": [
    {
      "id": "task123",
      "title": "Implement authentication",
      "description": "Add token-based authentication to the application",
      "status": "IN_PROGRESS",
      "priority": "HIGH",
      "createdBy": "user456",
      "assigneeId": "user123",
      "dueDate": "2025-05-20T17:00:00Z",
      "tags": ["authentication", "security"],
      "createdAt": "2025-05-01T10:30:00Z",
      "updatedAt": "2025-05-13T14:25:00Z"
    },
    {
      "id": "task456",
      "title": "Design user interface",
      "description": "Create wireframes for the new dashboard",
      "status": "TODO",
      "priority": "MEDIUM",
      "createdBy": "user789",
      "assigneeId": "user123",
      "dueDate": "2025-05-25T17:00:00Z",
      "tags": ["design", "ui"],
      "createdAt": "2025-05-05T09:15:00Z",
      "updatedAt": "2025-05-05T09:15:00Z"
    },
    // More tasks...
  ],
  "pagination": {
    "total": 42,    // Total number of tasks matching the filter
    "limit": 5,     // Number of tasks per page
    "offset": 10,   // Current offset
    "hasMore": true // Whether there are more tasks to fetch
  }
}
```

### Error Responses

| Status Code | Description |
|-------------|-------------|
| 400 | Bad request (e.g., invalid parameters) |
| 401 | Unauthorized (missing or invalid authentication) |
| 403 | Forbidden (insufficient permissions) |

For details on error responses, see [Error Responses](/api-reference/error-responses.md).

## Authentication

This endpoint requires authentication using a bearer token. Include your API key in the `Authorization` header:

```
Authorization: Bearer YOUR_API_KEY
```

The authenticated user's role affects which tasks they can view:
- `admin` users can see all tasks
- `manager` users can see all tasks
- `member` users can only see tasks they created or are assigned to

## Important Considerations

- **Task Visibility**: By default, users only see tasks they have access to based on their role. There is no need to filter by `createdBy` or `assigneeId` for member users as they will only see their own tasks.

- **Date Filtering**: When filtering by dates, use the ISO 8601 format (YYYY-MM-DDTHH:MM:SSZ). You can use `dueDate[gt]` and `dueDate[lt]` together to find tasks due within a specific range.

- **Status Values**: Valid status values are "TODO", "IN_PROGRESS", "REVIEW", "DONE", and "CANCELED".

- **Priority Values**: Valid priority values are "LOW", "MEDIUM", "HIGH", and "URGENT".

- **Performance**: For large task collections, use appropriate filtering to limit the result set. Using specific filters improves API performance.

## Best Practices

- **Use Pagination**: Always implement pagination for task lists to handle large numbers of tasks efficiently.

- **Filter Appropriately**: Apply relevant filters to get only the tasks you need. This reduces response size and improves performance.

- **Combine Filters**: For complex queries, combine multiple filters (e.g., status + priority + assignee).

- **Status Grouping**: For typical task views, group statuses logically:
  - Active tasks: `status=TODO,IN_PROGRESS,REVIEW`
  - Completed tasks: `status=DONE`
  - Archived tasks: `status=CANCELED`

- **Due Date Handling**: To find overdue tasks, use `dueDate[lt]=` with the current date and filter for non-completed statuses.

## Code Examples

### JavaScript

```javascript
async function getTasks(filters = {}, pagination = {}, sort = '-dueDate') {
  // Build query parameters
  const queryParams = new URLSearchParams();
  
  // Add pagination parameters
  if (pagination.limit) queryParams.append('limit', pagination.limit);
  if (pagination.offset) queryParams.append('offset', pagination.offset);
  
  // Add sort parameter
  queryParams.append('sort', sort);
  
  // Add filter parameters
  for (const [key, value] of Object.entries(filters)) {
    if (Array.isArray(value)) {
      queryParams.append(key, value.join(','));
    } else if (value !== null && value !== undefined) {
      queryParams.append(key, value);
    }
  }
  
  try {
    const response = await fetch(`https://api.taskmanagement.example.com/v1/tasks?${queryParams}`, {
      headers: {
        'Authorization': `Bearer ${API_KEY}`
      }
    });
    
    if (!response.ok) {
      const errorData = await response.json();
      throw new Error(`Error fetching tasks: ${errorData.error.message}`);
    }
    
    return await response.json();
  } catch (error) {
    console.error('Failed to fetch tasks:', error);
    throw error;
  }
}

// Example usage: Get high priority tasks due soon
const today = new Date();
const nextWeek = new Date(today);
nextWeek.setDate(today.getDate() + 7);

try {
  const result = await getTasks({
    status: ['TODO', 'IN_PROGRESS'],
    priority: ['HIGH', 'URGENT'],
    'dueDate[gt]': today.toISOString(),
    'dueDate[lt]': nextWeek.toISOString()
  }, {
    limit: 10,
    offset: 0
  }, '-priority');
  
  console.log(`Found ${result.pagination.total} high priority tasks due in the next week`);
  result.data.forEach(task => {
    console.log(`${task.title} (${task.priority}) - Due: ${new Date(task.dueDate).toLocaleDateString()}`);
  });
} catch (error) {
  console.error('Error:', error);
}
```

### Python

```python
import requests
from datetime import datetime, timedelta

def get_tasks(api_key, filters=None, pagination=None, sort='-dueDate'):
    """
    Retrieve a list of tasks with optional filtering, sorting, and pagination.
    
    Args:
        api_key (str): API key for authentication
        filters (dict, optional): Filters to apply
        pagination (dict, optional): Pagination parameters (limit, offset)
        sort (str, optional): Field to sort by
    
    Returns:
        dict: Response containing tasks and pagination info
    """
    url = 'https://api.taskmanagement.example.com/v1/tasks'
    
    # Build query parameters
    params = {}
    
    # Add pagination parameters
    if pagination:
        params.update(pagination)
    
    # Add sort parameter
    params['sort'] = sort
    
    # Add filter parameters
    if filters:
        for key, value in filters.items():
            if isinstance(value, list):
                params[key] = ','.join(value)
            elif value is not None:
                params[key] = value
    
    response = requests.get(
        url,
        params=params,
        headers={
            'Authorization': f'Bearer {api_key}'
        }
    )
    
    if response.status_code != 200:
        error_data = response.json()
        raise Exception(f"Error fetching tasks: {error_data['error']['message']}")
    
    return response.json()

# Example usage: Get tasks assigned to a specific user that are due this month
try:
    # Calculate date range for this month
    today = datetime.now()
    start_of_month = datetime(today.year, today.month, 1).isoformat()
    next_month = today.replace(day=28) + timedelta(days=4)
    end_of_month = next_month.replace(day=1) - timedelta(days=1)
    end_of_month = end_of_month.replace(hour=23, minute=59, second=59).isoformat()
    
    result = get_tasks(
        api_key='YOUR_API_KEY',
        filters={
            'assigneeId': 'user123',
            'status': ['TODO', 'IN_PROGRESS', 'REVIEW'],
            'dueDate[gt]': start_of_month,
            'dueDate[lt]': end_of_month
        },
        pagination={
            'limit': 20,
            'offset': 0
        },
        sort='dueDate'  # Ascending by due date (earliest first)
    )
    
    print(f"Found {result['pagination']['total']} tasks due this month")
    
    for task in result['data']:
        due_date = datetime.fromisoformat(task['dueDate'].replace('Z', '+00:00'))
        print(f"{task['title']} ({task['status']}) - Due: {due_date.strftime('%Y-%m-%d')}")
        
except Exception as e:
    print(f"Failed to retrieve tasks: {e}")
```

### cURL

```bash
# Basic request to get all tasks (first page)
curl -X GET "https://api.taskmanagement.example.com/v1/tasks" \
  -H "Authorization: Bearer YOUR_API_KEY"

# Request with pagination, sorting, and filtering
curl -X GET "https://api.taskmanagement.example.com/v1/tasks?limit=5&offset=0&sort=-priority&status=TODO,IN_PROGRESS&assigneeId=user123&dueDate[lt]=2025-06-01T00:00:00Z" \
  -H "Authorization: Bearer YOUR_API_KEY"
```

## Related Resources

- [Task Resource](/resources/task-resource.md) - Detailed information about the Task resource
- [Create a Task](/api-reference/create-task.md) - Create a new task
- [Get Task by ID](/api-reference/get-task-by-id.md) - Retrieve a specific task by ID

## See Also

- [Pagination](/core-concepts/pagination.md) - How to navigate through large collections of resources
- [Sorting](/core-concepts/sorting.md) - How to sort API results using sort parameters
- [Task Status Lifecycle](/core-concepts/task-status-lifecycle.md) - Understanding task statuses and transitions


