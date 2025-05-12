---
title: "Error responses"
description: "Reference documentation for all error responses returned by the API."
tags: ["errors", "reference"]
categories: ["api-reference"]
importance: 8
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 12, 2025"
navOrder: 1
---

# Error responses

This document provides reference information for all error responses that can be returned by the Task Management API. Understanding these error structures will help you implement robust error handling in your applications.

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

### Error response properties

| Property | Type | Description | Always present |
|----------|------|-------------|----------------|
| `code` | string | Error code identifying the type of error | Yes |
| `message` | string | Human-readable description of the error | Yes |
| `details` | array | Array of objects with specific validation errors | No |
| `requestId` | string | Unique identifier for the request (for support) | Yes |

The `details` array is included for validation errors and provides information about specific fields that failed validation.

## HTTP status codes

| Status code | Name | Description |
|-------------|------|-------------|
| 400 | Bad Request | The request was malformed or contains invalid parameters |
| 401 | Unauthorized | Authentication is required or the provided credentials are invalid |
| 403 | Forbidden | The authenticated user does not have permission to access the requested resource |
| 404 | Not Found | The requested resource was not found |
| 429 | Too Many Requests | The client has sent too many requests in a given amount of time |
| 500 | Internal Server Error | An unexpected server error occurred |

## Error codes

The following error codes can be returned in the `code` field of the error response:

### Validation errors (400)

| Error code | Description | Example message |
|------------|-------------|-----------------|
| `INVALID_FIELD` | A field value is invalid | "The field `contactEmail` must be a valid email address" |
| `MISSING_REQUIRED_FIELD` | A required field is missing | "The `lastName` field is required" |
| `INVALID_FORMAT` | A field value has an invalid format | "The `dueDate` field must be in ISO 8601 format" |
| `INVALID_LENGTH` | A field value exceeds length limits | "The `taskTitle` field must be between 1 and 80 characters" |
| `DUPLICATE_EMAIL` | Email address is already in use | "The email address is already in use by another user" |
| `INVALID_STATUS` | Invalid task status value | "The `taskStatus` value 'DONE' is not valid" |
| `INVALID_RANGE` | Value outside allowed range | "The `warningOffset` must be between 0 and 64000" |
| `INVALID_USER_ID` | Referenced user does not exist | "The specified `userId` does not exist" |
| `INVALID_TASK_ID` | Referenced task does not exist | "The specified `taskId` does not exist" |

### Authentication errors (401)

| Error code | Description | Example message |
|------------|-------------|-----------------|
| `UNAUTHORIZED` | Authentication is required | "Authentication is required to access this resource" |
| `INVALID_TOKEN` | Token is invalid or malformed | "The provided authentication token is invalid" |
| `EXPIRED_TOKEN` | Token has expired | "The authentication token has expired" |

### Permission errors (403)

| Error code | Description | Example message |
|------------|-------------|-----------------|
| `FORBIDDEN` | Operation not permitted | "You do not have permission to access this resource" |
| `READ_ONLY_ACCESS` | Write operation not permitted | "You have read-only access to this resource" |

### Resource errors (404)

| Error code | Description | Example message |
|------------|-------------|-----------------|
| `RESOURCE_NOT_FOUND` | Resource does not exist | "The requested resource could not be found" |
| `USER_NOT_FOUND` | User does not exist | "User with ID 123 could not be found" |
| `TASK_NOT_FOUND` | Task does not exist | "Task with ID 456 could not be found" |

### Rate limit errors (429)

| Error code | Description | Example message |
|------------|-------------|-----------------|
| `RATE_LIMIT_EXCEEDED` | Too many requests | "Rate limit exceeded. Try again in 30 seconds" |

### Server errors (500)

| Error code | Description | Example message |
|------------|-------------|-----------------|
| `SERVER_ERROR` | Unexpected server error | "An unexpected error occurred. Please try again later" |
| `SERVICE_UNAVAILABLE` | Service temporarily unavailable | "The service is temporarily unavailable. Please try again later" |

## Detailed validation error examples

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

### Missing required field

```json
{
  "code": "MISSING_REQUIRED_FIELD",
  "message": "The `lastName` field is required",
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

### Invalid task status

```json
{
  "code": "INVALID_STATUS",
  "message": "The `taskStatus` value 'DONE' is not valid",
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

### Resource not found

```json
{
  "code": "RESOURCE_NOT_FOUND",
  "message": "User with ID 123 could not be found",
  "requestId": "req-f8d31a62-e789-4856-9452-5efa50223c7a"
}
```

### Authentication required

```json
{
  "code": "UNAUTHORIZED",
  "message": "Authentication is required to access this resource",
  "requestId": "req-f8d31a62-e789-4856-9452-5efa50223c7a"
}
```

### Rate limit exceeded

```json
{
  "code": "RATE_LIMIT_EXCEEDED",
  "message": "Rate limit exceeded. Try again in 30 seconds",
  "requestId": "req-f8d31a62-e789-4856-9452-5efa50223c7a"
}
```

## Handling errors

For guidance on handling these errors in your application, refer to the [Error handling](../core-concepts/error-handling.html) document.

## Error response headers

Some error responses include additional information in the headers:

| Error type | Header | Description | Example |
|------------|--------|-------------|---------|
| Rate limiting | `Retry-After` | Seconds to wait before retrying | `Retry-After: 30` |

## Next steps

Now that you understand the error response format, explore these related topics:

- [Error handling best practices](../core-concepts/error-handling.html)
- [Troubleshooting common issues](../support/troubleshooting.html)
- [Authentication](../getting-started/authentication.html)
- [Rate limiting](../getting-started/rate-limiting.html)


