---
title: "Error handling"
description: "Common error patterns and best practices for handling errors in the Task Management API."
tags: ["errors", "troubleshooting"]
categories: ["core-concepts"]
importance: 8
parent: "Core Concepts"
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 20, 2025"
nav_order: "4"
layout: "default"
version: "v1.0.0"
lastUpdated: "May 20, 2025"
---

# Error handling

The Task Management API uses consistent error formats to help you understand and resolve issues. This page explains the API's error handling approach and provides guidance on best practices.

## Error response format

All API errors follow a consistent JSON format:

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

### Error properties

| Property | Description | Always included |
|----------|-------------|----------------|
| `code` | Error code that identifies the type of error | Yes |
| `message` | Human-readable error message | Yes |
| `details` | Array of objects with field-specific error information | No |
| `requestId` | Unique identifier for the request, useful for troubleshooting | No |

## HTTP status codes

The API uses standard HTTP status codes to indicate the success or failure of requests:

| Status code | Description |
|-------------|-------------|
| 200 OK | The request succeeded |
| 201 Created | The request succeeded and a new resource was created |
| 204 No Content | The request succeeded but there is no content to return |
| 400 Bad Request | The request contains invalid parameters or fields |
| 401 Unauthorized | Authentication is required or the provided credentials are invalid |
| 403 Forbidden | The authenticated user does not have permission to access the resource |
| 404 Not Found | The requested resource was not found |
| 429 Too Many Requests | The client has sent too many requests in a given amount of time |
| 500 Server Error | An unexpected server error occurred |

## Common error codes

| Error code | Description |
|------------|-------------|
| `INVALID_FIELD` | A field value is invalid |
| `MISSING_REQUIRED_FIELD` | A required field is missing |
| `RESOURCE_NOT_FOUND` | The requested resource could not be found |
| `UNAUTHORIZED` | Authentication is required |
| `FORBIDDEN` | Permission denied |
| `RATE_LIMIT_EXCEEDED` | Too many requests |
| `SERVER_ERROR` | An unexpected server error occurred |

## Error handling examples

### Invalid field value

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

### Missing required field

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

### Resource not found

```json
{
  "code": "RESOURCE_NOT_FOUND",
  "message": "The requested resource could not be found",
  "requestId": "req-f8d31a62-e789-4856-9452-5efa50223c7a"
}
```

## Best practices for error handling

1. **Check HTTP status codes first**: The HTTP status code provides the first indication of what went wrong.

2. **Examine the error code**: The `code` field provides a specific error type that you can use to handle different errors in your application.

3. **Display error messages to users**: The `message` field contains a human-readable error message that you can display to your users.

4. **Check field-specific errors**: The `details` array provides field-level validation errors that you can use to highlight specific form fields.

5. **Log the request ID**: The `requestId` field is useful for troubleshooting and should be included in any error logs.

6. **Implement retry logic for 429 errors**: When you receive a 429 Too Many Requests response, use the Retry-After header to determine when to retry the request.

7. **Handle authentication errors gracefully**: Redirect users to a login page or prompt them to re-authenticate when you receive 401 Unauthorized errors.

## Client-side error handling example

```javascript
// JavaScript example
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
    
    // If the response is not OK, parse the error
    if (!response.ok) {
      const errorData = await response.json();
      
      // Handle specific error codes
      switch (errorData.code) {
        case 'UNAUTHORIZED':
          // Redirect to login page
          redirectToLogin();
          break;
        case 'RATE_LIMIT_EXCEEDED':
          // Implement retry with exponential backoff
          const retryAfter = response.headers.get('Retry-After') || 5;
          return await retryRequest(endpoint, options, retryAfter);
        case 'INVALID_FIELD':
        case 'MISSING_REQUIRED_FIELD':
          // Display field-specific errors
          displayFieldErrors(errorData.details);
          break;
        default:
          // Display generic error message
          displayErrorMessage(errorData.message);
      }
      
      // Log the error with request ID
      console.error(`API Error (${errorData.requestId}):`, errorData);
      
      throw errorData;
    }
    
    // If the response is OK but there's no content, return null
    if (response.status === 204) {
      return null;
    }
    
    // Otherwise, parse and return the JSON response
    return await response.json();
  } catch (error) {
    // Handle network errors or JSON parsing errors
    console.error('API Request Failed:', error);
    throw error;
  }
}
```

## For more information

- [API reference](../api-reference.md): Detailed endpoint documentation including possible error responses
- [Error responses reference](../api-reference/error-responses.md): Comprehensive list of all possible error responses


