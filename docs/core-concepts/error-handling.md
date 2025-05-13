---
title: "Error handling"
description: "Common error patterns and best practices for handling errors in the Task Management API."
tags: ["errors", "troubleshooting"]
categories: ["core-concepts"]
importance: 8
parent: "core-concepts"
hasChildren: false
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "2025-05-13"
navOrder: "4"
layout: "default"
version: "v1.0.0"
lastUpdated: "2025-05-13"
---

# Error Handling

The Task Management API uses conventional HTTP response codes and a consistent error response format to indicate the success or failure of API requests. This page explains how errors are structured and provides best practices for handling them in your code.

## HTTP Status Codes

The API uses the following HTTP status codes to indicate the result of a request:

| Status Code | Description |
|-------------|-------------|
| 200 - OK | The request was successful |
| 201 - Created | The resource was successfully created |
| 400 - Bad Request | The request was invalid or improperly formatted |
| 401 - Unauthorized | Authentication is required or failed |
| 403 - Forbidden | The authenticated user lacks permission for the requested operation |
| 404 - Not Found | The requested resource does not exist |
| 409 - Conflict | The request conflicts with the current state of the resource |
| 422 - Unprocessable Entity | The request is properly formatted but contains semantic errors |
| 429 - Too Many Requests | The client has exceeded rate limits |
| 500 - Internal Server Error | Something went wrong on the server |

## Error Response Format

All error responses follow a consistent format:

```json
{
  "error": {
    "code": "error_code",
    "message": "A human-readable error message",
    "details": {
      // Additional error details if available
    }
  }
}
```

The `details` field is optional and may contain additional information about the error, such as specific validation errors for each field.

## Common Error Codes

| Error Code | HTTP Status | Description |
|------------|-------------|-------------|
| `invalid_request` | 400 | The request is malformed or missing required fields |
| `unauthorized` | 401 | Invalid or missing authentication |
| `forbidden` | 403 | The user doesn't have permission for this action |
| `not_found` | 404 | The requested resource doesn't exist |
| `conflict` | 409 | The request conflicts with the current state |
| `validation_error` | 422 | The request contains invalid data |
| `rate_limit_exceeded` | 429 | The client has sent too many requests |
| `server_error` | 500 | An unexpected error occurred on the server |

## Validation Error Example

When a request fails validation, the response includes details about each invalid field:

```json
{
  "error": {
    "code": "validation_error",
    "message": "The request contains invalid data",
    "details": {
      "title": "Title is required",
      "dueDate": "Due date must be in the future",
      "status": "Status must be one of: TODO, IN_PROGRESS, REVIEW, DONE, CANCELED"
    }
  }
}
```

## Error Handling Best Practices

### 1. Check HTTP Status Codes

Always check the HTTP status code before processing the response body:

```javascript
// JavaScript example
if (response.status >= 200 && response.status < 300) {
  // Success - process the response
} else {
  // Error - handle according to status code
}
```

### 2. Extract Error Information

Parse the error response to get detailed information:

```javascript
// JavaScript example
async function handleApiError(response) {
  try {
    const errorData = await response.json();
    console.error(`API Error (${response.status}): ${errorData.error.message}`);
    
    // Handle specific error codes
    if (errorData.error.code === 'validation_error') {
      handleValidationErrors(errorData.error.details);
    }
    
    return errorData.error;
  } catch (e) {
    console.error(`Failed to parse error response: ${e}`);
    return { code: 'unknown_error', message: 'An unknown error occurred' };
  }
}
```

### 3. Implement Retry Logic for Certain Errors

For transient errors like rate limiting (429), implement retry logic with exponential backoff:

```javascript
// JavaScript example
async function fetchWithRetry(url, options, maxRetries = 3) {
  let retries = 0;
  
  while (retries < maxRetries) {
    const response = await fetch(url, options);
    
    if (response.status !== 429) {
      return response;
    }
    
    // Get retry-after header or use exponential backoff
    const retryAfter = response.headers.get('Retry-After') || Math.pow(2, retries);
    const delay = parseInt(retryAfter, 10) * 1000;
    
    console.log(`Rate limited, retrying after ${delay}ms (retry ${retries + 1}/${maxRetries})`);
    await new Promise(resolve => setTimeout(resolve, delay));
    
    retries++;
  }
  
  // If we've exhausted all retries
  const response = await fetch(url, options);
  return response;
}
```

### 4. Gracefully Handle 404 Errors

Handle 404 errors gracefully, especially for `GET` requests:

```javascript
// JavaScript example
async function getTask(taskId) {
  const response = await fetch(`https://api.taskmanagement.example.com/v1/tasks/${taskId}`, {
    headers: { 'Authorization': `Bearer ${API_KEY}` }
  });
  
  if (response.status === 404) {
    console.warn(`Task ${taskId} not found`);
    return null;
  } else if (!response.ok) {
    throw await handleApiError(response);
  }
  
  return response.json();
}
```

### 5. Validate Input Before Sending

Validate user input client-side before sending requests to reduce validation errors:

```javascript
// JavaScript example
function validateTask(task) {
  const errors = {};
  
  if (!task.title || task.title.trim() === '') {
    errors.title = 'Title is required';
  }
  
  if (task.dueDate && new Date(task.dueDate) <= new Date()) {
    errors.dueDate = 'Due date must be in the future';
  }
  
  const validStatuses = ['TODO', 'IN_PROGRESS', 'REVIEW', 'DONE', 'CANCELED'];
  if (task.status && !validStatuses.includes(task.status)) {
    errors.status = `Status must be one of: ${validStatuses.join(', ')}`;
  }
  
  return Object.keys(errors).length > 0 ? errors : null;
}
```

## Language-Specific Examples

### Python

```python
import requests

def handle_api_error(response):
    try:
        error_data = response.json()
        print(f"API Error ({response.status_code}): {error_data['error']['message']}")
        return error_data['error']
    except Exception as e:
        print(f"Failed to parse error response: {e}")
        return {"code": "unknown_error", "message": "An unknown error occurred"}

def get_task(api_key, task_id):
    response = requests.get(
        f"https://api.taskmanagement.example.com/v1/tasks/{task_id}",
        headers={"Authorization": f"Bearer {api_key}"}
    )
    
    if response.status_code == 404:
        print(f"Task {task_id} not found")
        return None
    elif not response.ok:
        raise Exception(handle_api_error(response))
    
    return response.json()
```

### cURL

When using cURL, you'll need to handle errors manually by checking the response:

```bash
response=$(curl -s -w "\n%{http_code}" https://api.taskmanagement.example.com/v1/tasks/non-existent-id \
  -H "Authorization: Bearer YOUR_API_KEY")

http_code=$(echo "$response" | tail -n1)
body=$(echo "$response" | sed '$d')

if [ "$http_code" -ge 400 ]; then
  echo "Error (HTTP $http_code):"
  echo "$body" | jq .
else
  echo "Success:"
  echo "$body" | jq .
fi
```

## See Also

- [API Reference - Error Responses](/api-reference/error-responses.md)
- [Rate Limiting](/getting-started/rate-limiting.md)
- [Troubleshooting](/support/troubleshooting.md)


