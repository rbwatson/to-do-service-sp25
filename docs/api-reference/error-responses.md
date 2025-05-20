---
title: "Error responses"
description: "Reference documentation for all error responses returned by the API."
tags: ["errors", "reference"]
categories: ["api-reference"]
importance: 8
parent: "API Reference" 
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 20, 2025"
nav_order: "1"
layout: "default"
version: "v1.0.0"
lastUpdated: "May 20, 2025"
---

# Error responses

The Task Management API returns standardized error responses for all endpoints. This page documents the standard error format and common error codes you might encounter.

## Error response format

All error responses follow a consistent JSON format:

```json
{
  "code": "ERROR_CODE",
  "message": "Human-readable error message",
  "details": [
    {
      "field": "fieldName",
      "reason": "Specific reason for the error",
      "location": "body"
    }
  ],
  "requestId": "req-f8d31a62-e789-4856-9452-5efa50223c7a"
}
```

## Error response properties

| Property | Description | Always included |
|----------|-------------|----------------|
| `code` | Error code identifying the type of error | Yes |
| `message` | Human-readable error message | Yes |
| `details` | Array of objects with field-specific error information | No |
| `requestId` | Unique identifier for the request, useful for troubleshooting | No |

## HTTP status codes

The API uses standard HTTP status codes to indicate the success or failure of requests:

| Status code | Description | Example error codes |
|-------------|-------------|---------------------|
| 400 Bad Request | The request contains invalid parameters or fields | `INVALID_FIELD`, `MISSING_REQUIRED_FIELD` |
| 401 Unauthorized | Authentication is required or the provided credentials are invalid | `UNAUTHORIZED` |
| 403 Forbidden | The authenticated user does not have permission to access the resource | `FORBIDDEN` |
| 404 Not Found | The requested resource was not found | `RESOURCE_NOT_FOUND` |
| 429 Too Many Requests | The client has sent too many requests in a given amount of time | `RATE_LIMIT_EXCEEDED` |
| 500 Server Error | An unexpected server error occurred | `SERVER_ERROR` |

## Common error codes

### INVALID_FIELD

Returned when a field value is invalid. The `details` array will contain information about which field failed validation and why.

```json
{
  "code": "INVALID_FIELD",
  "message": "The field `contactEmail` must be a valid email address",
  "details": [
    {
      "field": "contactEmail",
      "reason": "Invalid format",
      "location": "body"
    }
  ],
  "requestId": "req-f8d31a62-e789-4856-9452-5efa50223c7a"
}
```

### MISSING_REQUIRED_FIELD

Returned when a required field is missing from the request. The `details` array will contain information about which required field is missing.

```json
{
  "code": "MISSING_REQUIRED_FIELD",
  "message": "The `lastName` field is required.",
  "details": [
    {
      "field": "lastName",
      "reason": "Is required",
      "location": "body"
    }
  ],
  "requestId": "req-f8d31a62-e789-4856-9452-5efa50223c7a"
}
```

### RESOURCE_NOT_FOUND

Returned when the requested resource could not be found.

```json
{
  "code": "RESOURCE_NOT_FOUND",
  "message": "The requested resource could not be found",
  "requestId": "req-f8d31a62-e789-4856-9452-5efa50223c7a"
}
```

### UNAUTHORIZED

Returned when authentication is required or the provided credentials are invalid.

```json
{
  "code": "UNAUTHORIZED",
  "message": "Authentication is required to access this resource",
  "requestId": "req-f8d31a62-e789-4856-9452-5efa50223c7a"
}
```

### FORBIDDEN

Returned when the authenticated user does not have permission to access the requested resource.

```json
{
  "code": "FORBIDDEN",
  "message": "You do not have permission to access this resource",
  "requestId": "req-f8d31a62-e789-4856-9452-5efa50223c7a"
}
```

### RATE_LIMIT_EXCEEDED

Returned when the client has sent too many requests in a given amount of time. The response will include a `Retry-After` header indicating how long to wait before making a new request.

```json
{
  "code": "RATE_LIMIT_EXCEEDED",
  "message": "Rate limit exceeded. Try again in 30 seconds",
  "requestId": "req-f8d31a62-e789-4856-9452-5efa50223c7a"
}
```

### SERVER_ERROR

Returned when an unexpected server error occurs.

```json
{
  "code": "SERVER_ERROR",
  "message": "An unexpected error occurred. Please try again later",
  "requestId": "req-f8d31a62-e789-4856-9452-5efa50223c7a"
}
```

## Field-specific error patterns

### Invalid email format

```json
{
  "code": "INVALID_FIELD",
  "message": "The field `contactEmail` must be a valid email address",
  "details": [
    {
      "field": "contactEmail",
      "reason": "Invalid format",
      "location": "body"
    }
  ],
  "requestId": "req-f8d31a62-e789-4856-9452-5efa50223c7a"
}
```

### Invalid task status

```json
{
  "code": "INVALID_FIELD",
  "message": "The `taskStatus` value 'DONE' is not valid.",
  "details": [
    {
      "field": "taskStatus",
      "reason": "Invalid value",
      "location": "body"
    }
  ],
  "requestId": "req-f8d31a62-e789-4856-9452-5efa50223c7a"
}
```

### String length constraints

```json
{
  "code": "INVALID_FIELD",
  "message": "The field `taskTitle` must be between 1 and 80 characters",
  "details": [
    {
      "field": "taskTitle",
      "reason": "String too long",
      "location": "body"
    }
  ],
  "requestId": "req-f8d31a62-e789-4856-9452-5efa50223c7a"
}
```

### Numeric constraints

```json
{
  "code": "INVALID_FIELD",
  "message": "The field `warningOffset` must be between 0 and 64000",
  "details": [
    {
      "field": "warningOffset",
      "reason": "Value too large",
      "location": "body"
    }
  ],
  "requestId": "req-f8d31a62-e789-4856-9452-5efa50223c7a"
}
```

## Handling errors in your application

Here's an example of how to handle errors in a JavaScript application:

```javascript
async function makeApiRequest(endpoint, options) {
  try {
    const response = await fetch(`http://localhost:3000${endpoint}`, {
      ...options,
      headers: {
        'Authorization': 'Bearer your-token-here',
        'Content-Type': 'application/json',
        ...options.headers
      }
    });
    
    if (!response.ok) {
      const errorData = await response.json();
      
      // Handle specific error codes
      switch (errorData.code) {
        case 'UNAUTHORIZED':
          // Redirect to login page
          window.location.href = '/login';
          break;
        case 'RATE_LIMIT_EXCEEDED':
          // Wait and retry
          const retryAfter = response.headers.get('Retry-After') || 5;
          console.log(`Rate limited. Retrying in ${retryAfter} seconds.`);
          setTimeout(() => makeApiRequest(endpoint, options), retryAfter * 1000);
          return;
        case 'INVALID_FIELD':
        case 'MISSING_REQUIRED_FIELD':
          // Display field-specific errors
          if (errorData.details) {
            errorData.details.forEach(detail => {
              console.error(`Field error: ${detail.field} - ${detail.reason}`);
              // Update UI to show error next to field
            });
          }
          break;
        default:
          // Display generic error message
          console.error(`API Error: ${errorData.message}`);
      }
      
      // Log the error with request ID
      console.error(`Request ID: ${errorData.requestId}`);
      
      throw errorData;
    }
    
    return await response.json();
  } catch (error) {
    console.error('API Request Failed:', error);
    throw error;
  }
}
```

## Best practices

1. **Always check HTTP status codes**: The HTTP status code provides the first indication of what went wrong.
2. **Parse error responses**: Extract the error code, message, and details to provide useful feedback to users.
3. **Log request IDs**: The `requestId` field is valuable for troubleshooting and should be included in error logs.
4. **Handle field-specific errors**: Use the `details` array to highlight specific form fields that need correction.
5. **Implement retry logic for rate limiting**: When you receive a 429 status code, use the Retry-After header to determine when to retry.

## See also

- [Core concepts: Error handling](../core-concepts/error-handling.md)
- [Getting started: Authentication](../getting-started/authentication.md)


