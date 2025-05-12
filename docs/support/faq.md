---
title: "Frequently asked questions"
description: "Common questions and answers about using the Task Management API."
tags: ["faq", "help"]
categories: ["support"]
importance: 4
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 12, 2025"
navOrder: 1
---

# Frequently asked questions

This document addresses common questions about using the Task Management API.

## General questions

### What is the Task Management API?

The Task Management API is a RESTful service that allows applications to create, retrieve, update, and delete tasks and users. It provides a complete solution for implementing task management functionality in your applications.

### What can I build with the Task Management API?

The API can be used to build a variety of applications, including:

- Personal to-do list applications
- Team task management tools
- Project management systems
- Reminder and calendar applications
- Productivity trackers
- Any application that needs task management functionality

### What technologies does the API use?

The Task Management API is built on REST principles using standard HTTP methods and JSON data formats. It can be accessed from any programming language or platform that supports HTTP requests.

## Authentication and security

### How do I authenticate with the API?

The API uses bearer token authentication. Include the token in the `Authorization` header of your requests:

```
Authorization: Bearer YOUR_TOKEN
```

For more details, see the [Authentication](../getting-started/authentication.html) documentation.

### How do I get an authentication token?

Authentication tokens are managed externally to the API. Contact your API administrator or follow your organization's process for requesting API access.

### How long are authentication tokens valid?

Token lifetime depends on your organization's security policy. Contact your API administrator for information about token expiration and renewal.

### Is the API secure?

Yes, the API implements several security measures:

- HTTPS encryption for all communication
- Token-based authentication
- Rate limiting to prevent abuse
- Input validation to protect against malicious data

For more information, see the [Security best practices](../advanced/security-best-practices.html) document.

## Users and tasks

### How do I create a user?

Send a POST request to the `/users` endpoint with the required user information:

```http
POST /users HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
Content-Type: application/json

{
  "firstName": "John",
  "lastName": "Doe",
  "contactEmail": "john.doe@example.com"
}
```

For more details, see the [Create a user](../api-reference/create-user.html) documentation.

### How do I create a task?

First, you need to have a user in the system. Then, send a POST request to the `/tasks` endpoint with the task details:

```http
POST /tasks HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
Content-Type: application/json

{
  "userId": 1,
  "taskTitle": "Complete API documentation",
  "taskDescription": "Finish the task management API documentation",
  "dueDate": "2025-06-01T12:00:00-05:00",
  "warningOffset": 60
}
```

For more details, see the [Create a task](../api-reference/create-task.html) documentation.

### What task statuses are available?

The API supports the following task statuses:

- `NOT_STARTED` - Default status for new tasks
- `IN_PROGRESS` - Task is actively being worked on
- `BLOCKED` - Task cannot proceed due to an obstacle
- `DEFERRED` - Task is postponed until a later time
- `COMPLETED` - Task has been finished successfully
- `CANCELLED` - Task has been abandoned

For more information, see the [Task status lifecycle](../core-concepts/task-status-lifecycle.html) document.

### Can I assign a task to multiple users?

No, each task can only be assigned to one user at a time. If you need to track tasks for multiple users, you would need to create separate tasks for each user.

### How do task reminders work?

Reminders are determined by the `dueDate` and `warningOffset` properties:

- `dueDate`: When the task is due
- `warningOffset`: Minutes before the due date to send a reminder

The reminder time is calculated as: `Reminder time = dueDate - warningOffset minutes`

The API does not send reminders directly; your application is responsible for checking tasks and generating notifications. For details, see the [Implementing reminders](../tutorials/implementing-reminders.html) tutorial.

## API functionality

### Does the API support filtering tasks?

Yes, you can filter tasks by their status using the `taskStatus` query parameter:

```
GET /tasks?taskStatus=IN_PROGRESS
```

### Does the API support pagination?

Yes, the API supports pagination with the `_page` and `_perPage` query parameters:

```
GET /tasks?_page=0&_perPage=10
```

The `_page` parameter is zero-indexed (the first page is 0), and `_perPage` specifies how many items to return per page (maximum 100).

For more details, see the [Pagination](../core-concepts/pagination.html) documentation.

### Can I sort the results?

Yes, you can sort results using the `_sort` query parameter:

```
GET /tasks?_sort=dueDate
```

To sort in descending order, prefix the field name with a minus sign:

```
GET /tasks?_sort=-dueDate
```

For more details, see the [Sorting](../core-concepts/sorting.html) documentation.

### Are there limits on API usage?

Yes, the API implements rate limiting to ensure fair usage. For details, see the [Rate limiting](../getting-started/rate-limiting.html) documentation.

### Does the API support bulk operations?

The current version does not support bulk create, update, or delete operations. You need to make individual API calls for each resource.

## Error handling

### What HTTP status codes does the API use?

The API uses standard HTTP status codes:

- `200 OK`: Successful GET or PATCH request
- `201 Created`: Successful POST request
- `204 No Content`: Successful DELETE request
- `400 Bad Request`: Invalid request format or validation error
- `401 Unauthorized`: Missing or invalid authentication
- `403 Forbidden`: Authentication succeeded but permission denied
- `404 Not Found`: Resource not found
- `429 Too Many Requests`: Rate limit exceeded
- `500 Internal Server Error`: Server-side error

### How do error responses look?

Error responses include a standardized JSON structure:

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

For more details, see the [Error responses](../api-reference/error-responses.html) documentation.

### How should I handle rate limiting?

When you exceed the rate limit, the API returns a `429 Too Many Requests` status code with a `Retry-After` header indicating how many seconds to wait before retrying. Implement exponential backoff in your application to handle rate limits gracefully.

## Integration and development

### What programming languages can I use with the API?

You can use any programming language that supports HTTP requests, including but not limited to:

- JavaScript/TypeScript
- Python
- Java
- C#
- Ruby
- Go
- PHP

For code examples in various languages, see the [Code examples](../developer-resources/code-examples.html) document.

### Is there a client library for the API?

The API does not provide official client libraries, but you can use standard HTTP client libraries in your preferred language. See the [Code examples](../developer-resources/code-examples.html) document for implementation examples.

### How do I test the API?

You can test the API using tools like:

- Postman
- cURL
- API testing frameworks (e.g., REST Assured, Supertest)
- Custom scripts in your preferred language

We provide a [Postman collection](../developer-resources/postman-collection.html) to help you get started.

### Is there a sandbox environment for testing?

Contact your API administrator for information about testing environments.

## Troubleshooting

### Why am I getting authentication errors?

Authentication errors (`401 Unauthorized`) can occur for several reasons:

1. Missing the `Authorization` header
2. Incorrect format of the authorization header
3. Invalid or expired token
4. Token not prefixed with "Bearer "

Make sure you're including the token correctly:

```
Authorization: Bearer YOUR_TOKEN
```

### Why am I getting "Resource not found" errors?

This error (`404 Not Found`) occurs when the requested resource doesn't exist. Common causes:

1. Incorrect URL or endpoint
2. Incorrect resource ID
3. The resource has been deleted

Double-check the resource ID and make sure it exists in the system.

### How do I resolve validation errors?

Validation errors (`400 Bad Request`) occur when the request data doesn't meet the API's requirements. The error response includes details about what's wrong:

```json
{
  "code": "INVALID_FIELD",
  "message": "The field `warningOffset` must be between 0 and 64000",
  "details": [
    {
      "field": "warningOffset",
      "reason": "Invalid range",
      "location": "body"
    }
  ],
  "requestId": "req-f8d31a62-e789-4856-9452-5efa50223c7a"
}
```

Check the error details and modify your request accordingly.

For more troubleshooting help, see the [Troubleshooting](troubleshooting.html) document.

## Additional help

If you didn't find the answer to your question, please:

1. Check the [API reference](../api-reference/error-responses.html) for detailed documentation
2. Consult the [Troubleshooting](troubleshooting.html) guide
3. Contact support using the resources listed in [Support resources](support-resources.html)


