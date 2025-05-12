# API Error Responses

This document describes the standard error responses that may be returned by the Task Management API endpoints.

## Error Response Format

All error responses follow the same format:

```json
{
  "code": "ERROR_CODE",
  "message": "Human-readable error message",
  "details": [
    {
      "field": "fieldName",
      "reason": "Reason for the error",
      "location": "body|query|path"
    }
  ],
  "requestId": "req-f8d31a62-e789-4856-9452-5efa50223c7a"
}
```

| Field | Type | Description |
|-------|------|-------------|
| `code` | string | A machine-readable error code identifying the type of error |
| `message` | string | A human-readable description of what went wrong |
| `details` | array | Optional array of objects providing specific error details |
| `requestId` | string | A unique identifier for the request, useful for troubleshooting |

In the `details` array, each object may contain:

| Field | Type | Description |
|-------|------|-------------|
| `field` | string | The name of the field that caused the error |
| `reason` | string | The specific reason why the field is invalid |
| `location` | string | Where the field was found (body, query, path) |

## Common Error Status Codes

### 400 Bad Request

Returned when the request is malformed or contains invalid parameters.

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

### 401 Unauthorized

Returned when authentication is required but not provided or is invalid.

```json
{
  "code": "UNAUTHORIZED",
  "message": "Authentication is required to access this resource",
  "requestId": "req-f8d31a62-e789-4856-9452-5efa50223c7a"
}
```

### 403 Forbidden

Returned when the authenticated user does not have permission to access the requested resource.

```json
{
  "code": "FORBIDDEN",
  "message": "You do not have permission to access this resource",
  "requestId": "req-f8d31a62-e789-4856-9452-5efa50223c7a"
}
```

### 404 Not Found

Returned when the requested resource does not exist.

```json
{
  "code": "RESOURCE_NOT_FOUND",
  "message": "The requested resource could not be found",
  "requestId": "req-f8d31a62-e789-4856-9452-5efa50223c7a"
}
```

### 429 Too Many Requests

Returned when the client has sent too many requests in a given amount of time.

```json
{
  "code": "RATE_LIMIT_EXCEEDED",
  "message": "Rate limit exceeded. Try again in 30 seconds",
  "requestId": "req-f8d31a62-e789-4856-9452-5efa50223c7a"
}
```

> **Note:** When you receive this response, check the `Retry-After` header to determine how many seconds to wait before making another request.

### 500 Server Error

Returned when an unexpected error occurs on the server.

```json
{
  "code": "SERVER_ERROR",
  "message": "An unexpected error occurred. Please try again later",
  "requestId": "req-f8d31a62-e789-4856-9452-5efa50223c7a"
}
```

## Common Error Codes

| Error Code | Description |
|------------|-------------|
| `INVALID_FIELD` | A field in the request contains an invalid value |
| `MISSING_REQUIRED_FIELD` | A required field is missing from the request |
| `RESOURCE_NOT_FOUND` | The requested resource does not exist |
| `UNAUTHORIZED` | Authentication is required or credentials are invalid |
| `FORBIDDEN` | The authenticated user lacks permission |
| `RATE_LIMIT_EXCEEDED` | Too many requests in a given time period |
| `SERVER_ERROR` | An unexpected error on the server |

## Troubleshooting Tips

1. Always check the `code` and `details` fields for specific information about what went wrong.

2. Use the `requestId` when contacting support about an error - this helps them identify the specific request.

3. For validation errors (400 Bad Request), carefully check the field names and values in your request against the API documentation.

4. For authentication errors (401 Unauthorized), verify that your token is valid and properly formatted in the Authorization header.

5. For permission errors (403 Forbidden), ensure your account has the necessary permissions for the operation.

6. For rate limiting (429 Too Many Requests), implement exponential backoff with the time specified in the `Retry-After` header.

7. For server errors (500), retry the request after a short delay, as these are often temporary.
