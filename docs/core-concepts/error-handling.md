---
title: "Error handling"
description: "Common error patterns and best practices for handling errors in the Task Management API."
tags: ["errors", "troubleshooting"]
categories: ["core-concepts"]
importance: 8
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 12, 2025"
navOrder: 4
---

# Error handling

The Task Management API uses consistent error response patterns to help you identify and resolve issues. This document explains the error format, common error codes, and best practices for handling errors in your applications.

## Error response format

All API errors follow a standard JSON format:

```json
{
  "code": "ERROR_CODE",
  "message": "Human-readable error message",
  "details": [
    {
      "field": "fieldName",
      "reason": "specific reason",
      "location": "body"
    }
  ],
  "requestId": "req-f8d31a62-e789-4856-9452-5efa50223c7a"
}
```

### Error properties

| Property | Description | Always present |
|----------|-------------|----------------|
| `code` | Error code identifying the type of error | Yes |
| `message` | Human-readable description of the error | Yes |
| `details` | Array of objects with specific validation errors | No |
| `requestId` | Unique identifier for the request (for support) | Yes |

The `details` array is included for validation errors and provides information about specific fields that failed validation.

## HTTP status codes

The API uses standard HTTP status codes to indicate the general category of response:

| Status code | Description | Example scenario |
|-------------|-------------|------------------|
| 400 | Bad Request | Invalid request format or validation failure |
| 401 | Unauthorized | Missing or invalid authentication token |
| 403 | Forbidden | Valid authentication but insufficient permissions |
| 404 | Not Found | Requested resource does not exist |
| 429 | Too Many Requests | Rate limit exceeded |
| 500 | Internal Server Error | Unexpected server-side error |

## Common error codes

The `code` field in the error response provides more specific information about what went wrong:

| Error code | Description | HTTP status |
|------------|-------------|-------------|
| `INVALID_FIELD` | A field value is invalid | 400 |
| `MISSING_REQUIRED_FIELD` | A required field is missing | 400 |
| `RESOURCE_NOT_FOUND` | The requested resource doesn't exist | 404 |
| `UNAUTHORIZED` | Authentication is required | 401 |
| `FORBIDDEN` | Operation not permitted | 403 |
| `RATE_LIMIT_EXCEEDED` | Too many requests | 429 |
| `SERVER_ERROR` | Unexpected server error | 500 |

## Validation errors

Validation errors include detailed information about which fields failed validation and why:

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

## Error handling best practices

### 1. Check HTTP status code first

The HTTP status code provides the general category of the error and helps determine how to proceed:

```javascript
if (!response.ok) {
  if (response.status === 401 || response.status === 403) {
    // Handle authentication/authorization errors
  } else if (response.status === 400) {
    // Handle validation errors
  } else if (response.status === 404) {
    // Handle not found errors
  } else if (response.status === 429) {
    // Handle rate limiting
  } else {
    // Handle unexpected errors
  }
}
```

### 2. Parse error details for validation errors

For validation errors (status 400), check the `details` array for specific field errors:

```javascript
if (error.details && error.details.length > 0) {
  error.details.forEach(detail => {
    // Handle each validation error
    console.log(`Field ${detail.field}: ${detail.reason}`);
    
    // Update UI to show validation errors
    showValidationError(detail.field, detail.reason);
  });
}
```

### 3. Implement retry logic for rate limiting

For rate limit errors (status 429), implement a backoff strategy using the `Retry-After` header:

```javascript
if (response.status === 429) {
  const retryAfter = response.headers.get('Retry-After') || 30;
  console.log(`Rate limited. Retrying after ${retryAfter} seconds`);
  
  // Wait and retry
  setTimeout(() => {
    // Retry the request
  }, retryAfter * 1000);
}
```

### 4. Log the request ID for troubleshooting

Always log the `requestId` for troubleshooting purposes:

```javascript
console.error(`API Error: ${error.message}`, {
  code: error.code,
  requestId: error.requestId
});
```

## Error handling code example

```javascript
async function createTask(taskData) {
  try {
    const response = await fetch('http://localhost:3000/tasks', {
      method: 'POST',
      headers: {
        'Authorization': 'Bearer YOUR_TOKEN',
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(taskData)
    });
    
    if (!response.ok) {
      const errorData = await response.json();
      
      // Handle different types of errors
      switch (response.status) {
        case 400:
          handleValidationErrors(errorData);
          break;
        case 401:
        case 403:
          handleAuthErrors(errorData);
          break;
        case 429:
          handleRateLimiting(response, errorData);
          break;
        default:
          handleGenericError(errorData);
      }
      
      throw new Error(errorData.message);
    }
    
    return await response.json();
  } catch (error) {
    console.error('Task creation failed:', error);
    throw error;
  }
}

function handleValidationErrors(errorData) {
  if (errorData.details) {
    errorData.details.forEach(detail => {
      console.error(`Validation error: ${detail.field} - ${detail.reason}`);
      // Update UI to show validation errors
    });
  }
}
```

## Next steps

Now that you understand error handling, explore these related topics:

- [Authentication](../getting-started/authentication.html) to prevent authentication errors
- [Rate limiting](../getting-started/rate-limiting.html) to avoid rate limit errors
- [Data model](data-model.html) to understand validation requirements
- [Troubleshooting](../support/troubleshooting.html) for more help resolving common issues


