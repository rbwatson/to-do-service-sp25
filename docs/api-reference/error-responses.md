---
title: "Error responses"
description: "Reference documentation for all error responses returned by the API."
tags: ["errors", "reference"]
categories: ["api-reference"]
importance: 8
parent: "api-reference"
hasChildren: false
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "2025-05-13"
navOrder: "1"
layout: "default"
version: "v1.0.0"
lastUpdated: "2025-05-13"
---

# Error Responses

The Task Management API returns consistent error responses across all endpoints. This page documents the error response format, common error codes, and provides examples for each type of error.

## Error Response Format

All error responses follow this standard format:

```json
{
  "error": {
    "code": "error_code",
    "message": "A human-readable error message",
    "details": {
      // Additional error details (optional)
    }
  }
}
```

* `code`: A string identifier for the type of error
* `message`: A human-readable description of the error
* `details`: An optional object with additional information about the error

## HTTP Status Codes

The API uses standard HTTP status codes to indicate the general category of error:

| Status Code | Category | Description |
|-------------|----------|-------------|
| 400 | Bad Request | The request is malformed or contains invalid parameters |
| 401 | Unauthorized | Authentication is missing or invalid |
| 403 | Forbidden | The authenticated user lacks permission for this operation |
| 404 | Not Found | The requested resource does not exist |
| 409 | Conflict | The request conflicts with the current state of the resource |
| 422 | Unprocessable Entity | The request is well-formed but contains semantic errors |
| 429 | Too Many Requests | The client has sent too many requests in a given time |
| 500 | Internal Server Error | An unexpected error occurred on the server |

## Common Error Codes

### Authentication Errors

| Error Code | HTTP Status | Description |
|------------|-------------|-------------|
| `missing_authentication` | 401 | No authentication credentials were provided |
| `invalid_authentication` | 401 | The provided authentication credentials are invalid |
| `expired_token` | 401 | The authentication token has expired |

### Permission Errors

| Error Code | HTTP Status | Description |
|------------|-------------|-------------|
| `permission_denied` | 403 | The authenticated user does not have permission for this action |
| `insufficient_scope` | 403 | The token does not have the required scope for this action |

### Resource Errors

| Error Code | HTTP Status | Description |
|------------|-------------|-------------|
| `resource_not_found` | 404 | The requested resource does not exist |
| `resource_conflict` | 409 | The request conflicts with the current state of the resource |
| `resource_gone` | 410 | The resource existed previously but has been removed |

### Validation Errors

| Error Code | HTTP Status | Description |
|------------|-------------|-------------|
| `validation_error` | 422 | The request contains invalid data |
| `invalid_parameters` | 400 | One or more query parameters are invalid |
| `invalid_format` | 400 | The request body format is invalid (e.g., malformed JSON) |
| `missing_required_field` | 422 | A required field is missing from the request |
| `invalid_field_value` | 422 | A field value is invalid (e.g., wrong type or out of range) |
| `invalid_status_transition` | 422 | The requested status transition is not allowed |

### Rate Limiting Errors

| Error Code | HTTP Status | Description |
|------------|-------------|-------------|
| `rate_limit_exceeded` | 429 | The client has exceeded their rate limit |
| `daily_limit_exceeded` | 429 | The client has exceeded their daily request limit |

### Server Errors

| Error Code | HTTP Status | Description |
|------------|-------------|-------------|
| `server_error` | 500 | An unexpected error occurred on the server |
| `service_unavailable` | 503 | The service is temporarily unavailable |
| `database_error` | 500 | An error occurred while accessing the database |

## Error Examples

### Authentication Error

```http
HTTP/1.1 401 Unauthorized
Content-Type: application/json

{
  "error": {
    "code": "invalid_authentication",
    "message": "The provided API key is invalid or has been revoked"
  }
}
```

### Resource Not Found Error

```http
HTTP/1.1 404 Not Found
Content-Type: application/json

{
  "error": {
    "code": "resource_not_found",
    "message": "The requested task with ID 'task123' does not exist"
  }
}
```

### Validation Error

```http
HTTP/1.1 422 Unprocessable Entity
Content-Type: application/json

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

### Rate Limit Error

```http
HTTP/1.1 429 Too Many Requests
Content-Type: application/json
Retry-After: 60

{
  "error": {
    "code": "rate_limit_exceeded",
    "message": "You have exceeded the rate limit of 100 requests per minute",
    "details": {
      "limit": 100,
      "remaining": 0,
      "resetAt": "2025-05-13T15:45:00Z"
    }
  }
}
```

## Common Error Scenarios

### Missing or Invalid Authentication

If you receive a `401 Unauthorized` error, check that:
- You are including the `Authorization` header with your requests
- The format is correct: `Authorization: Bearer YOUR_API_KEY`
- Your API key is valid and has not expired

### Permission Denied

If you receive a `403 Forbidden` error, check that:
- The authenticated user has the necessary permissions for the action
- The user's role has access to the requested resource
- For task operations, the user may need to be the creator or assignee of the task

### Resource Not Found

If you receive a `404 Not Found` error, check that:
- The resource ID is correct
- The resource has not been deleted
- You are using the correct endpoint URL

### Validation Errors

If you receive a `422 Unprocessable Entity` error:
- Check the `details` field for specific validation errors
- Ensure all required fields are provided
- Verify that field values match the expected format and constraints
- For status updates, ensure the transition is valid (see [Task Status Lifecycle](/core-concepts/task-status-lifecycle.md))

## Handling Errors in Code

### JavaScript Example

```javascript
async function handleApiRequest(url, options) {
  try {
    const response = await fetch(url, options);
    
    if (!response.ok) {
      const errorData = await response.json();
      
      // Handle specific error types
      switch (errorData.error.code) {
        case 'rate_limit_exceeded':
          console.error('Rate limit exceeded. Try again later.');
          // Maybe implement retry with backoff
          break;
        case 'validation_error':
          console.error('Validation error:', errorData.error.details);
          // Maybe highlight form fields with errors
          break;
        default:
          console.error(`API Error (${response.status}):`, errorData.error.message);
      }
      
      throw new Error(errorData.error.message);
    }
    
    return await response.json();
  } catch (error) {
    // Handle network errors or other exceptions
    console.error('Request failed:', error);
    throw error;
  }
}
```

### Python Example

```python
import requests

def handle_api_request(url, method="GET", data=None, headers=None):
    try:
        if method == "GET":
            response = requests.get(url, headers=headers)
        elif method == "POST":
            response = requests.post(url, json=data, headers=headers)
        elif method == "PATCH":
            response = requests.patch(url, json=data, headers=headers)
        elif method == "DELETE":
            response = requests.delete(url, headers=headers)
        else:
            raise ValueError(f"Unsupported method: {method}")
        
        # Check if the request was successful
        response.raise_for_status()
        
        # For non-204 responses, return the JSON data
        if response.status_code != 204:
            return response.json()
        return None
        
    except requests.exceptions.HTTPError as e:
        # Handle API errors
        error_data = e.response.json()
        error_code = error_data.get("error", {}).get("code", "unknown_error")
        error_message = error_data.get("error", {}).get("message", "Unknown error")
        error_details = error_data.get("error", {}).get("details", {})
        
        print(f"API Error ({e.response.status_code}): {error_message}")
        
        if error_code == "validation_error" and error_details:
            print("Validation errors:")
            for field, error in error_details.items():
                print(f"  {field}: {error}")
        
        # Re-raise the exception with more context
        raise Exception(f"{error_code}: {error_message}") from e
        
    except requests.exceptions.RequestException as e:
        # Handle network errors
        print(f"Request failed: {e}")
        raise
```

## See Also

- [Core Concepts - Error Handling](/core-concepts/error-handling.md)
- [Getting Started - Authentication](/getting-started/authentication.md)
- [Rate Limiting](/getting-started/rate-limiting.md)
- [Troubleshooting](/support/troubleshooting.md)


