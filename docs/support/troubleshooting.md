---
title: "Troubleshooting"
description: "Solutions to common issues encountered when using the Task Management API."
tags: ["troubleshooting", "errors"]
categories: ["support"]
importance: 5
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 12, 2025"
navOrder: 2
---

# Troubleshooting

This document provides solutions to common issues you might encounter when using the Task Management API. It includes step-by-step diagnostics and recommended actions for resolving problems.

## Authentication issues

### Issue: 401 Unauthorized responses

**Symptom**: The API returns a `401 Unauthorized` status code with an error message like:

```json
{
  "code": "UNAUTHORIZED",
  "message": "Authentication is required to access this resource",
  "requestId": "req-f8d31a62-e789-4856-9452-5efa50223c7a"
}
```

**Possible causes and solutions**:

1. **Missing authentication header**
   - Ensure you're including the `Authorization` header in your request
   - Example: `Authorization: Bearer YOUR_TOKEN`

2. **Incorrect header format**
   - Verify the header format includes "Bearer " followed by your token
   - Check for typos in the word "Bearer" or extra spaces

3. **Invalid or expired token**
   - Request a new token if yours may have expired
   - Verify the token is valid and correctly copied

4. **Network issues**
   - Check that the authentication header isn't being stripped by a proxy or middleware

**Code example for correct authentication**:

```javascript
// JavaScript example
fetch('http://localhost:3000/tasks', {
  method: 'GET',
  headers: {
    'Authorization': 'Bearer YOUR_TOKEN'
  }
})
.then(response => {
  if (!response.ok) {
    throw new Error(`Error ${response.status}: ${response.statusText}`);
  }
  return response.json();
})
.then(data => console.log(data))
.catch(error => console.error('Error:', error));
```

## Resource not found errors

### Issue: 404 Not Found responses

**Symptom**: The API returns a `404 Not Found` status code with an error message like:

```json
{
  "code": "RESOURCE_NOT_FOUND",
  "message": "User with ID 123 could not be found",
  "requestId": "req-f8d31a62-e789-4856-9452-5efa50223c7a"
}
```

**Possible causes and solutions**:

1. **Incorrect resource ID**
   - Double-check the ID in your request URL
   - Verify the resource exists using a GET request to the collection endpoint

2. **Resource has been deleted**
   - If the resource previously existed, it may have been deleted
   - Check if your application has cached IDs that are no longer valid

3. **Incorrect URL or endpoint**
   - Verify the endpoint path is correct (e.g., `/users/{userId}` or `/tasks/{taskId}`)
   - Check for typos in the URL

4. **Base URL issues**
   - Ensure the base URL is correct (e.g., `http://localhost:3000`)

**Diagnostic steps**:

1. Try retrieving all resources to see what's available:
   ```
   GET /users
   GET /tasks
   ```

2. Check for appropriate IDs in the response and use them in your requests

## Validation errors

### Issue: 400 Bad Request responses

**Symptom**: The API returns a `400 Bad Request` status code with an error message like:

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

**Possible causes and solutions**:

1. **Invalid field values**
   - Check the error details to identify which field has invalid values
   - Correct the field value according to the validation requirements

2. **Missing required fields**
   - Ensure all required fields are included in your request
   - Reference the API documentation for each endpoint's required fields

3. **Incorrect data types**
   - Verify the data types match the expected types (e.g., integer for `userId`)
   - Check for string vs. number issues, especially in JSON formatting

4. **Value range violations**
   - Some fields have allowed ranges (e.g., `warningOffset` must be between 0 and 64000)
   - Adjust values to fit within allowed ranges

**Common validation requirements**:

| Field | Validation Requirements |
|-------|--------------------------|
| `firstName`, `lastName` | 1-100 characters |
| `contactEmail` | Valid email format, unique |
| `taskTitle` | 1-80 characters |
| `taskDescription` | 1-255 characters |
| `taskStatus` | One of: `NOT_STARTED`, `IN_PROGRESS`, `BLOCKED`, `DEFERRED`, `COMPLETED`, `CANCELLED` |
| `dueDate` | ISO 8601 format (e.g., `2025-05-15T17:00:00-05:00`) |
| `warningOffset` | Integer between 0 and 64000 |

## Rate limiting issues

### Issue: 429 Too Many Requests responses

**Symptom**: The API returns a `429 Too Many Requests` status code with an error message like:

```json
{
  "code": "RATE_LIMIT_EXCEEDED",
  "message": "Rate limit exceeded. Try again in 30 seconds",
  "requestId": "req-f8d31a62-e789-4856-9452-5efa50223c7a"
}
```

**Possible causes and solutions**:

1. **Exceeded request limit**
   - Reduce the frequency of requests to the API
   - Implement caching to avoid unnecessary requests

2. **Inefficient implementation**
   - Review your code for loops or patterns that might cause excessive API calls
   - Batch operations where possible

3. **Missing exponential backoff**
   - Implement exponential backoff when retrying requests
   - Use the `Retry-After` header to determine wait time

**Sample implementation with exponential backoff**:

```javascript
async function fetchWithBackoff(url, options, maxRetries = 3) {
  let retries = 0;
  
  while (true) {
    try {
      const response = await fetch(url, options);
      
      if (response.status !== 429) {
        return response;
      }
      
      if (retries >= maxRetries) {
        return response; // Give up after max retries
      }
      
      // Get retry-after header or use exponential backoff
      const retryAfter = response.headers.get('Retry-After') || 
                         Math.pow(2, retries) * 1000;
                         
      console.log(`Rate limited. Retrying in ${retryAfter} ms...`);
      
      // Wait before retrying
      await new Promise(resolve => setTimeout(resolve, retryAfter));
      
      retries++;
    } catch (error) {
      throw error;
    }
  }
}
```

## Data consistency issues

### Issue: Unexpected task or user data

**Symptom**: Resource data doesn't match expectations or appears inconsistent.

**Possible causes and solutions**:

1. **Race conditions**
   - Implement proper concurrency handling for updates
   - Consider implementing optimistic concurrency control

2. **Cached data**
   - Ensure your application is not using outdated cached data
   - Implement proper cache invalidation when resources change

3. **Multiple clients updating same resource**
   - Consider implementing a locking mechanism
   - Use optimistic updates with proper error handling

**Best practices**:

- Always fetch the latest resource before updating it
- Implement retry logic for failed updates
- Use proper error handling to recover from conflicts

For more information, see [Handling data consistency](../advanced/handling-data-consistency.html).

## Connection and timeout issues

### Issue: Request timeouts or connection errors

**Symptom**: Requests fail with network timeouts or connection errors.

**Possible causes and solutions**:

1. **Server is unavailable**
   - Check if the API server is running
   - Verify network connectivity to the server

2. **Request timeout too short**
   - Increase the timeout for your HTTP client
   - Implement retry logic for timeout errors

3. **Network issues**
   - Check for firewall or proxy settings that might block requests
   - Verify VPN connections if using a private network

4. **Server overload**
   - Implement exponential backoff and retry logic
   - Consider reducing request frequency

**Sample implementation with timeout and retry**:

```javascript
async function fetchWithTimeout(url, options, timeout = 10000) {
  // Create abort controller for timeout
  const controller = new AbortController();
  const timeoutId = setTimeout(() => controller.abort(), timeout);
  
  try {
    const response = await fetch(url, {
      ...options,
      signal: controller.signal
    });
    
    clearTimeout(timeoutId);
    return response;
  } catch (error) {
    clearTimeout(timeoutId);
    if (error.name === 'AbortError') {
      throw new Error('Request timed out');
    }
    throw error;
  }
}
```

## Common error codes and solutions

| Error Code | Description | Common Solutions |
|------------|-------------|------------------|
| `UNAUTHORIZED` | Authentication required | Provide or refresh authentication token |
| `FORBIDDEN` | Permission denied | Check user permissions and access rights |
| `RESOURCE_NOT_FOUND` | Resource doesn't exist | Verify resource ID and existence |
| `INVALID_FIELD` | Field validation failed | Fix the specified field according to validation rules |
| `MISSING_REQUIRED_FIELD` | Required field is missing | Add the missing field to the request |
| `DUPLICATE_EMAIL` | Email already in use | Use a different email address |
| `INVALID_USER_ID` | Referenced user doesn't exist | Create the user first or use a valid user ID |
| `RATE_LIMIT_EXCEEDED` | Too many requests | Implement rate limiting handling and backoff |
| `SERVER_ERROR` | Server-side error | Try again later or contact support |

## Debugging techniques

### Request and response logging

Implement logging for API requests and responses to help diagnose issues:

```javascript
async function loggedFetch(url, options) {
  console.log(`API Request: ${options.method} ${url}`, {
    headers: options.headers,
    body: options.body
  });
  
  try {
    const startTime = Date.now();
    const response = await fetch(url, options);
    const duration = Date.now() - startTime;
    
    const responseData = response.status !== 204 ? 
                         await response.clone().json() : 
                         null;
    
    console.log(`API Response (${duration}ms): ${response.status}`, responseData);
    
    return response;
  } catch (error) {
    console.error(`API Error: ${error.message}`);
    throw error;
  }
}
```

### Using request IDs for support

Every error response includes a `requestId` that can help with troubleshooting:

```json
{
  "code": "RESOURCE_NOT_FOUND",
  "message": "User with ID 123 could not be found",
  "requestId": "req-f8d31a62-e789-4856-9452-5efa50223c7a"
}
```

When contacting support, always include:
- The complete error response, including the `requestId`
- The request details (endpoint, method, headers, body)
- Steps to reproduce the issue

## Still having issues?

If you're still experiencing problems after trying the troubleshooting steps above:

1. Check the [API reference](../api-reference/error-responses.html) for detailed documentation on error responses
2. Review the [FAQ](faq.html) for answers to common questions
3. Refer to [Support resources](support-resources.html) for additional help options


