---
title: "Authentication"
description: "Learn how to authenticate your requests to the Task Management API using bearer tokens."
tags: ["authentication", "security", "bearer token"]
categories: ["getting-started"]
importance: 8
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 12, 2025"
navOrder: 3
---

# Authentication

The Task Management API uses bearer token authentication to secure endpoints. This page explains how to authenticate your requests and manage tokens for the API.

## Bearer token authentication

All API requests must include an `Authorization` header with a valid bearer token. The format is:

```
Authorization: Bearer YOUR_TOKEN
```

Replace `YOUR_TOKEN` with the actual authentication token provided to you.

## Obtaining a token

To obtain a bearer token, contact the API administrator or follow your organization's process for requesting API access. The Task Management API does not provide an endpoint for token generation as token management is handled externally.

## Token security

Follow these security best practices when working with authentication tokens:

- Store tokens securely and never expose them in client-side code
- Rotate tokens periodically according to your organization's security policy
- Do not share tokens across different applications or environments
- Revoke tokens immediately if they are compromised

## Authentication errors

If authentication fails, the API returns a `401 Unauthorized` status code with an error response:

```json
{
  "code": "UNAUTHORIZED",
  "message": "Authentication is required to access this resource",
  "requestId": "req-f8d31a62-e789-4856-9452-5efa50223c7a"
}
```

Common authentication errors include:

- Missing the `Authorization` header
- Invalid token format
- Expired token
- Revoked token

## Permission errors

Even with valid authentication, a user might not have permission to access certain resources. In these cases, the API returns a `403 Forbidden` status code:

```json
{
  "code": "FORBIDDEN",
  "message": "You do not have permission to access this resource",
  "requestId": "req-f8d31a62-e789-4856-9452-5efa50223c7a"
}
```

## Token lifespan

Bearer tokens have a finite lifespan. Once a token expires, you need to request a new one. The expiration policy depends on your organization's security requirements.

## Implementation example

Here's an example of how to include the bearer token in a request using cURL:

```shell
curl -X GET \
  http://localhost:3000/tasks \
  -H 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...' \
  -H 'Content-Type: application/json'
```

And using JavaScript/Fetch API:

```javascript
fetch('http://localhost:3000/tasks', {
  method: 'GET',
  headers: {
    'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...',
    'Content-Type': 'application/json'
  }
})
.then(response => response.json())
.then(data => console.log(data))
.catch(error => console.error('Error:', error));
```

## Next steps

After authenticating your requests, you can proceed to:

- [Rate limiting](rate-limiting.html) to understand API usage constraints
- [Quick start guide](quickstart.html) to create your first API resources
- [Error handling](../core-concepts/error-handling.html) to handle authentication and other errors


