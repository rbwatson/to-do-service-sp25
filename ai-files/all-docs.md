--- FILE: getting-started/introduction.md
---
title: "Introduction to the Task Management API"
description: "Overview of the Task Management API capabilities, features, and use cases."
tags: ["introduction", "overview"]
categories: ["getting-started"]
importance: 10
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 12, 2025"
navOrder: 1
---

# Introduction to the Task Management API

The Task Management API is a comprehensive solution for creating and managing to-do tasks and users. This RESTful API provides all the tools needed to build robust task management applications with features for tracking task status, setting deadlines, and managing reminders.

## Key features

- **User management**: Create, retrieve, update, and delete user accounts
- **Task management**: Create, retrieve, update, and delete tasks with support for various status values
- **Task status lifecycle**: Track tasks through their complete lifecycle from creation to completion
- **Due dates and reminders**: Set due dates for tasks with configurable warning offsets for reminders
- **Pagination and sorting**: Efficiently navigate through large collections of resources
- **Comprehensive error handling**: Clear error messages and status codes for troubleshooting

## Use cases

The Task Management API is designed to support a wide range of applications, including:

- Personal to-do list applications
- Team task management tools
- Project management systems
- Reminder and calendar applications
- Productivity trackers

## Getting started

To start using the Task Management API:

1. Review the [Quick start guide](quickstart.html) to set up your development environment
2. Learn how to [authenticate](authentication.html) your API requests
3. Understand the [rate limits](rate-limiting.html) to ensure uninterrupted service

## API design principles

The Task Management API follows RESTful design principles with consistent patterns for resource naming, HTTP methods, and response formats. Key design elements include:

- Resource-based URL structure
- Appropriate use of HTTP methods (GET, POST, PATCH, DELETE)
- JSON request and response bodies
- Consistent error handling
- Bearer token authentication

This API documentation provides all the information needed to effectively utilize the Task Management API in your applications.

--- FILE: getting-started/quickstart.md
---
title: "Quick start guide"
description: "Get up and running with the Task Management API in minutes."
tags: ["quick start", "tutorial"]
categories: ["getting-started"]
importance: 9
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 12, 2025"
navOrder: 2
---

# Quick start guide

This guide helps you get started with the Task Management API quickly. Follow these steps to create your first user and task.

## Prerequisites

Before you begin, make sure you have:

- An API client or HTTP tool like Postman, cURL, or similar
- A text editor for writing request bodies
- Basic understanding of RESTful APIs and JSON

## Base URL

For development and testing, the API is available at:

```
http://localhost:3000
```

## Step 1: Authenticate

The Task Management API uses bearer token authentication. Include the bearer token in your request headers:

```
Authorization: Bearer YOUR_TOKEN
```

Refer to the [Authentication](authentication.html) page for details on obtaining a token.

## Step 2: Create a user

Create a user by sending a POST request to the `/users` endpoint with the required user information.

### Request

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

### Response

```json
{
  "userId": 1,
  "firstName": "John",
  "lastName": "Doe",
  "contactEmail": "john.doe@example.com"
}
```

Take note of the `userId` as you need it to create tasks.

## Step 3: Create a task

Create a task by sending a POST request to the `/tasks` endpoint with the task details.

### Request

```http
POST /tasks HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
Content-Type: application/json

{
  "userId": 1,
  "taskTitle": "Complete API setup",
  "taskDescription": "Set up and test the Task Management API",
  "dueDate": "2025-05-20T14:00:00-05:00",
  "warningOffset": 60
}
```

### Response

```json
{
  "taskId": 1,
  "userId": 1,
  "taskTitle": "Complete API setup",
  "taskDescription": "Set up and test the Task Management API",
  "taskStatus": "NOT_STARTED",
  "dueDate": "2025-05-20T14:00:00-05:00",
  "warningOffset": 60
}
```

## Step 4: Retrieve tasks

Retrieve all tasks with a GET request to the `/tasks` endpoint:

```http
GET /tasks HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
```

### Response

```json
{
  "tasks": [
    {
      "taskId": 1,
      "userId": 1,
      "taskTitle": "Complete API setup",
      "taskDescription": "Set up and test the Task Management API",
      "taskStatus": "NOT_STARTED",
      "dueDate": "2025-05-20T14:00:00-05:00",
      "warningOffset": 60
    }
  ]
}
```

## Step 5: Update a task's status

Update the task status by sending a PATCH request to `/tasks/{taskId}`:

```http
PATCH /tasks/1 HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
Content-Type: application/json

{
  "taskStatus": "IN_PROGRESS"
}
```

### Response

```json
{
  "taskId": 1,
  "userId": 1,
  "taskTitle": "Complete API setup",
  "taskDescription": "Set up and test the Task Management API",
  "taskStatus": "IN_PROGRESS",
  "dueDate": "2025-05-20T14:00:00-05:00",
  "warningOffset": 60
}
```

## Next steps

Now that you've created a user and managed tasks, explore more advanced features:

- [Task status lifecycle](../core-concepts/task-status-lifecycle.html) to understand all possible task states
- [User resource](../resources/user-resource.html) for details on user management
- [Task resource](../resources/task-resource.html) for complete task management capabilities
- [Pagination](../core-concepts/pagination.html) to handle large collections of tasks
- [Error handling](../core-concepts/error-handling.html) for robust application development

--- FILE: getting-started/authentication.md
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

--- FILE: getting-started/rate-limiting.md
---
title: "Rate limiting"
description: "Understand the API's rate limits and how to handle rate limiting responses."
tags: ["rate limiting", "throttling"]
categories: ["getting-started"]
importance: 7
ai-generated: false
navOrder: 4
---

# Rate limiting

The Task Management API implements rate limiting to ensure fair usage and system stability. This document explains how rate limiting works and how to handle rate limit responses.

## Rate limit overview

<!-- This section should explain the basic concept of rate limiting and why it's necessary -->

- Explain the purpose of rate limiting
- Detail the current rate limits (requests per minute/hour)
- Describe how limits are applied (per token, IP address, or user)
- Note any endpoints with special rate limits

## Rate limit headers

<!-- This section should list and describe the response headers related to rate limiting -->

- `X-RateLimit-Limit`: Maximum number of requests allowed in a time window
- `X-RateLimit-Remaining`: Number of requests remaining in the current window
- `X-RateLimit-Reset`: Time when the current rate limit window resets (Unix timestamp)

## Handling rate limit exceeded responses

<!-- This section should explain what happens when rate limits are exceeded and how to handle it -->

- Explain the 429 Too Many Requests response
- Detail the Retry-After header and its usage
- Provide code examples for handling rate limit errors
- Suggest exponential backoff strategies

## Best practices

<!-- This section should provide recommendations for working within rate limits -->

- Implement request caching where appropriate
- Use bulk operations instead of multiple single requests
- Monitor rate limit headers proactively
- Implement graceful degradation when limits are approached

## Rate limit increase requests

<!-- This section should explain if and how rate limits can be increased -->

- Process for requesting increased rate limits
- Criteria for rate limit increases
- Contact information for support

## Example implementation

<!-- This section should include a code example showing how to handle rate limits -->

```javascript
// Example code for handling rate limits
```

<!-- Consider adding a diagram showing the rate limiting process -->

--- FILE: core-concepts/data-model.md
---
title: "Data model"
description: "Overview of the core resources in the Task Management API and their relationships."
tags: ["data model", "resources", "schema"]
categories: ["core-concepts"]
importance: 9
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 12, 2025"
navOrder: 1
---

# Data model

The Task Management API is built around two primary resources: Users and Tasks. This document explains the core data model and the relationships between these resources.

## Resource overview

The API has two main resources:

1. **User** - Represents a person who can create and manage tasks
2. **Task** - Represents a to-do item that needs to be completed

These resources are linked by the `userId` property, establishing a one-to-many relationship between users and tasks.

## User resource

The User resource contains information about individuals who use the task management system.

### User properties

| Property | Type | Description | Required |
|----------|------|-------------|----------|
| userId | integer | System-generated unique identifier | Yes |
| firstName | string | User's first name (1-100 characters) | Yes |
| lastName | string | User's last name (1-100 characters) | Yes |
| contactEmail | string | Valid email address for the user (unique) | Yes |

### User constraints

- Each user must have a unique `contactEmail`
- The `userId` is automatically generated and immutable
- `firstName` and `lastName` must be between 1 and 100 characters
- `contactEmail` must follow standard email format

## Task resource

The Task resource represents individual to-do items that users create and manage.

### Task properties

| Property | Type | Description | Required |
|----------|------|-------------|----------|
| taskId | integer | System-generated unique identifier | Yes |
| userId | integer | ID of the user who owns the task | Yes |
| taskTitle | string | Short description (1-80 characters) | Yes |
| taskDescription | string | Detailed description (1-255 characters) | No |
| taskStatus | string enum | Current status of the task | Yes |
| dueDate | string (date-time) | When the task should be completed | Yes |
| warningOffset | integer | Minutes before due date to send reminder | Yes |

### Task status values

The `taskStatus` property can have one of the following values:

- `NOT_STARTED` - Default status for new tasks
- `IN_PROGRESS` - Task is actively being worked on
- `BLOCKED` - Task cannot proceed due to an obstacle
- `DEFERRED` - Task is postponed until a later time
- `COMPLETED` - Task has been finished successfully
- `CANCELLED` - Task has been abandoned

For more details on task status transitions, see the [Task status lifecycle](task-status-lifecycle.html) document.

### Task constraints

- Each task must be associated with a valid user
- The `taskId` is automatically generated and immutable
- `taskTitle` must be between 1 and 80 characters
- `taskDescription` must be between 1 and 255 characters, if provided
- `dueDate` must be in ISO 8601 format (`YYYY-MM-DDTHH:MM:SS.sssZ`)
- `warningOffset` must be a non-negative integer (0-64000)

## Resource relationships

```
    +--------+          +---------+
    |        |          |         |
    |  User  |<---------+  Task   |
    |        |    1:n   |         |
    +--------+          +---------+
```

- Each User can have multiple Tasks (one-to-many relationship)
- Each Task belongs to exactly one User
- When a User is deleted, all associated Tasks are also deleted

## Data model diagram

The following entity-relationship diagram shows the relationships between the core resources:

```
+-------------------+       +-------------------+
| User              |       | Task              |
+-------------------+       +-------------------+
| userId (PK)       |<----->| taskId (PK)       |
| firstName         |       | userId (FK)       |
| lastName          |       | taskTitle         |
| contactEmail      |       | taskDescription   |
+-------------------+       | taskStatus        |
                            | dueDate           |
                            | warningOffset     |
                            +-------------------+
```

## Next steps

Now that you understand the data model, learn more about:

- [User resource details](../resources/user-resource.html)
- [Task resource details](../resources/task-resource.html)
- [Task status lifecycle](task-status-lifecycle.html)
- [Pagination](pagination.html) for retrieving multiple resources

--- FILE: core-concepts/pagination.md
---
title: "Pagination"
description: "How to navigate through large collections of resources using pagination parameters."
tags: ["pagination", "collection"]
categories: ["core-concepts"]
importance: 7
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 12, 2025"
navOrder: 2
---

# Pagination

The Task Management API implements pagination to efficiently handle large collections of resources. This document explains how to use pagination parameters to retrieve resources in manageable chunks.

## Pagination parameters

The API supports the following query parameters for pagination:

| Parameter | Type | Description | Default | Example |
|-----------|------|-------------|---------|---------|
| `_page` | integer | Page number (zero-indexed) | 0 | `_page=0` |
| `_perPage` | integer | Number of items per page | 20 | `_perPage=10` |

## Request example

To retrieve the first page with 10 items per page:

```http
GET /tasks?_page=0&_perPage=10 HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
```

To retrieve the second page:

```http
GET /tasks?_page=1&_perPage=10 HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
```

## Response format

The response body contains the paginated resources:

```json
{
  "tasks": [
    {
      "taskId": 11,
      "userId": 1,
      "taskTitle": "Example Task 11",
      "taskDescription": "Description of task 11",
      "taskStatus": "NOT_STARTED",
      "dueDate": "2025-05-20T14:00:00-05:00",
      "warningOffset": 60
    },
    // ... 9 more tasks
  ]
}
```

## Pagination limits

- The `_page` parameter must be a non-negative integer (0 or greater)
- The `_perPage` parameter must be between 1 and 100
- If you request a page beyond the available data, the API returns an empty array of resources
- If pagination parameters are omitted, the API uses default values (`_page=0` and `_perPage=20`)

## Pagination and sorting

Pagination works seamlessly with sorting. You can combine both features to retrieve sorted pages of resources:

```http
GET /tasks?_page=0&_perPage=10&_sort=-dueDate HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
```

This request retrieves the first 10 tasks sorted by due date in descending order. For more information on sorting, see the [Sorting](sorting.html) document.

## Pagination and filtering

Pagination can be combined with filtering parameters. For example, to get the first page of tasks with the `IN_PROGRESS` status:

```http
GET /tasks?_page=0&_perPage=10&taskStatus=IN_PROGRESS HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
```

## Calculating total pages

The API does not currently provide the total count of resources or pages in the response. If you need to know the total number of pages, you can:

1. Gradually increment the `_page` parameter until you receive an empty array
2. Use a smaller `_perPage` value to reduce the number of requests needed

## Implementing pagination in client applications

When implementing pagination in a client application, consider these best practices:

- Allow users to adjust the number of items per page
- Provide navigation controls (Previous/Next buttons, page numbers)
- Show users which page they're currently viewing
- Cache previously fetched pages to improve performance

## Pagination code example

```javascript
// Example function to fetch paginated tasks
async function fetchTasks(page = 0, perPage = 20) {
  try {
    const response = await fetch(`http://localhost:3000/tasks?_page=${page}&_perPage=${perPage}`, {
      method: 'GET',
      headers: {
        'Authorization': 'Bearer YOUR_TOKEN',
        'Content-Type': 'application/json'
      }
    });
    
    if (!response.ok) {
      throw new Error(`Error: ${response.status}`);
    }
    
    const data = await response.json();
    
    // Check if we've reached the end of the data
    const isEmpty = data.tasks.length === 0;
    
    return {
      tasks: data.tasks,
      isEmpty: isEmpty,
      page: page,
      perPage: perPage
    };
  } catch (error) {
    console.error('Failed to fetch tasks:', error);
    throw error;
  }
}
```

## Next steps

After mastering pagination, explore these related topics:

- [Sorting](sorting.html) to order your paginated results
- [Error handling](error-handling.html) for robust client applications
- [User resource](../resources/user-resource.html) for user-specific operations
- [Task resource](../resources/task-resource.html) for task-specific operations

--- FILE: core-concepts/sorting.md
---
title: "Sorting"
description: "How to sort API results using sort parameters."
tags: ["sorting", "collection"]
categories: ["core-concepts"]
importance: 6
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 12, 2025"
navOrder: 3
---

# Sorting

The Task Management API provides sorting capabilities to order collections of resources based on specific fields. This document explains how to use sorting parameters to organize your API results.

## Sort parameter

To sort resources, use the `_sort` query parameter. The value should be the field name to sort by.

| Parameter | Description | Example |
|-----------|-------------|---------|
| `_sort` | Field to sort by | `_sort=dueDate` |

## Sorting direction

By default, sorting is in ascending order. To sort in descending order, prefix the field name with a minus sign (`-`).

| Example | Description |
|---------|-------------|
| `_sort=dueDate` | Sort by due date in ascending order (earliest first) |
| `_sort=-dueDate` | Sort by due date in descending order (latest first) |

## Request examples

To retrieve tasks sorted by title in ascending order:

```http
GET /tasks?_sort=taskTitle HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
```

To retrieve users sorted by last name in descending order:

```http
GET /users?_sort=-lastName HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
```

## Sortable fields

### User resource

| Field | Description | Example |
|-------|-------------|---------|
| `userId` | User ID | `_sort=userId` |
| `firstName` | First name | `_sort=firstName` |
| `lastName` | Last name | `_sort=lastName` |
| `contactEmail` | Email address | `_sort=contactEmail` |

### Task resource

| Field | Description | Example |
|-------|-------------|---------|
| `taskId` | Task ID | `_sort=taskId` |
| `userId` | User ID | `_sort=userId` |
| `taskTitle` | Task title | `_sort=taskTitle` |
| `taskStatus` | Task status | `_sort=taskStatus` |
| `dueDate` | Due date | `_sort=dueDate` |
| `warningOffset` | Warning offset | `_sort=warningOffset` |

## Combining sorting with pagination

Sorting works seamlessly with pagination. To retrieve the first page of tasks sorted by due date in descending order:

```http
GET /tasks?_sort=-dueDate&_page=0&_perPage=10 HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
```

For more information on pagination, see the [Pagination](pagination.html) documentation.

## Sorting behavior

- String fields are sorted alphabetically
- Date fields are sorted chronologically
- Numeric fields are sorted numerically
- Enum fields (like `taskStatus`) are sorted based on the string value
- If the sort parameter is omitted, resources are typically returned in the order they were created (by ID)

## Sort examples by use case

### Finding urgent tasks

To find tasks with the earliest due dates:

```http
GET /tasks?_sort=dueDate HTTP/1.1
```

### Finding recently added tasks

To find the most recently added tasks:

```http
GET /tasks?_sort=-taskId HTTP/1.1
```

### Alphabetical user list

To get an alphabetical list of users by last name:

```http
GET /users?_sort=lastName HTTP/1.1
```

## Implementing sorting in client applications

When implementing sorting in a client application, consider these best practices:

- Provide clear UI controls for users to sort by different fields
- Indicate the current sort field and direction
- Remember the user's sort preference between sessions
- Combine sorting with filtering for more precise results

## Sorting code example

```javascript
// Example function to fetch sorted tasks
async function fetchSortedTasks(sortField, ascending = true) {
  // Add a minus sign for descending order
  const sortParam = ascending ? sortField : `-${sortField}`;
  
  try {
    const response = await fetch(`http://localhost:3000/tasks?_sort=${sortParam}`, {
      method: 'GET',
      headers: {
        'Authorization': 'Bearer YOUR_TOKEN',
        'Content-Type': 'application/json'
      }
    });
    
    if (!response.ok) {
      throw new Error(`Error: ${response.status}`);
    }
    
    return await response.json();
  } catch (error) {
    console.error('Failed to fetch sorted tasks:', error);
    throw error;
  }
}
```

## Next steps

After learning about sorting, explore these related topics:

- [Pagination](pagination.html) to handle large result sets
- [Task status lifecycle](task-status-lifecycle.html) to understand the ordering of status values
- [Error handling](error-handling.html) for robust client applications
- [Task resource](../resources/task-resource.html) for more details on task fields

--- FILE: core-concepts/error-handling.md
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

--- FILE: core-concepts/task-status-lifecycle.md
---
title: "Task status lifecycle"
description: "Understanding the various status values that tasks can have and their transitions."
tags: ["task status", "workflow"]
categories: ["core-concepts"]
importance: 7
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 12, 2025"
navOrder: 5
---

# Task status lifecycle

Tasks in the Task Management API progress through various states from creation to completion. This document explains the different status values, their meanings, and the typical transitions between them.

## Available status values

The Task resource uses the `taskStatus` property to track the current state of a task. The available status values are:

| Status | Description |
|--------|-------------|
| `NOT_STARTED` | Task has been created but work has not begun |
| `IN_PROGRESS` | Task is actively being worked on |
| `BLOCKED` | Task cannot proceed due to an obstacle or dependency |
| `DEFERRED` | Task has been postponed until a later time |
| `COMPLETED` | Task has been successfully finished |
| `CANCELLED` | Task has been abandoned and will not be completed |

## Default status

When a task is created without explicitly specifying a status, it defaults to `NOT_STARTED`.

## Status transitions

While the API allows updating a task's status to any valid value, the following diagram illustrates the typical workflow:

```
  ┌───────────────┐
  │  NOT_STARTED  │
  └───────┬───────┘
          │
          ▼
  ┌───────────────┐         ┌───────────────┐
  │  IN_PROGRESS  │◄───────►│    BLOCKED    │
  └───────┬───────┘         └───────┬───────┘
          │                         │
          ▼                         ▼
  ┌───────────────┐         ┌───────────────┐
  │   COMPLETED   │         │   CANCELLED   │
  └───────────────┘         └───────────────┘
          ▲                         ▲
          │                         │
  ┌───────────────┐                 │
  │   DEFERRED    │─────────────────┘
  └───────────────┘
```

### Common transitions

1. `NOT_STARTED` → `IN_PROGRESS`: Work has begun on the task
2. `IN_PROGRESS` → `BLOCKED`: Task has encountered an obstacle
3. `BLOCKED` → `IN_PROGRESS`: Obstacle has been resolved
4. `IN_PROGRESS` → `COMPLETED`: Task has been successfully completed
5. `NOT_STARTED` → `DEFERRED`: Task has been postponed
6. `DEFERRED` → `IN_PROGRESS`: Work has resumed on a postponed task
7. `DEFERRED` → `CANCELLED`: A postponed task has been abandoned
8. `BLOCKED` → `CANCELLED`: A blocked task has been abandoned

## Updating task status

To update a task's status, send a PATCH request to the `/tasks/{taskId}` endpoint:

```http
PATCH /tasks/123 HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
Content-Type: application/json

{
  "taskStatus": "IN_PROGRESS"
}
```

## Status implications

Each status has specific implications for task management:

### NOT_STARTED

- Task is in the backlog or queue
- No work has begun yet
- Reminder will trigger based on the `warningOffset` and `dueDate`

### IN_PROGRESS

- Task is actively being worked on
- Progress is being made toward completion
- Reminder will still trigger based on the `warningOffset` and `dueDate`

### BLOCKED

- Task cannot be completed due to a dependency or obstacle
- May require intervention to resolve the blocking issue
- Reminder will still trigger based on the `warningOffset` and `dueDate`

### DEFERRED

- Task has been postponed to a later time
- Not currently actively worked on
- Reminder will still trigger based on the `warningOffset` and `dueDate`

### COMPLETED

- Task has been successfully finished
- No further action is required
- Reminders are no longer triggered

### CANCELLED

- Task has been abandoned and will not be completed
- No further action is required
- Reminders are no longer triggered

## Filtering tasks by status

You can filter tasks by their status using the `taskStatus` query parameter:

```http
GET /tasks?taskStatus=IN_PROGRESS HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
```

This allows you to retrieve only tasks in a specific state, which is useful for creating views such as:

- Task backlogs (`NOT_STARTED`)
- Current work (`IN_PROGRESS`)
- Blocked tasks that need attention (`BLOCKED`)
- Completed tasks for review (`COMPLETED`)

## Implementation example

Here's an example of a function that updates a task's status:

```javascript
async function updateTaskStatus(taskId, newStatus) {
  try {
    const response = await fetch(`http://localhost:3000/tasks/${taskId}`, {
      method: 'PATCH',
      headers: {
        'Authorization': 'Bearer YOUR_TOKEN',
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({ taskStatus: newStatus })
    });
    
    if (!response.ok) {
      throw new Error(`Error: ${response.status}`);
    }
    
    return await response.json();
  } catch (error) {
    console.error(`Failed to update task ${taskId} status:`, error);
    throw error;
  }
}
```

## Best practices for status management

- Update the task status promptly to reflect its current state
- Use the `BLOCKED` status to highlight tasks that need attention
- Consider updating the `dueDate` when changing status to `DEFERRED`
- Include a reason when marking tasks as `CANCELLED` using the task description
- Review `BLOCKED` tasks regularly to prevent them from being forgotten

## Next steps

Now that you understand the task status lifecycle, explore these related topics:

- [Task resource](../resources/task-resource.html) for complete details on tasks
- [Update a task](../api-reference/update-task.html) for API reference on task updates
- [Get all tasks](../api-reference/get-all-tasks.html) for filtering tasks by status
- [Task management workflow](../tutorials/task-management-workflow.html) for implementing a complete workflow

--- FILE: resources/user-resource.md
---
title: "User resource"
description: "Detailed information about the User resource, its properties, and related endpoints."
tags: ["user", "resource"]
categories: ["resources"]
importance: 9
related_pages: ["get-all-users", "create-user", "get-user-by-id", "update-user", "delete-user"]
api_endpoints: ["/users", "/users/{userId}"]
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 12, 2025"
navOrder: 1
---

# User resource

The User resource represents a person who can create and manage tasks in the Task Management API. This document provides detailed information about the User resource, its properties, and related endpoints.

## Resource overview

The User resource has the following properties:

| Property | Type | Description | Constraints | Required |
|----------|------|-------------|------------|----------|
| `userId` | integer | Unique identifier | System-generated, immutable | Yes (in responses) |
| `firstName` | string | User's first name | 1-100 characters | Yes |
| `lastName` | string | User's last name | 1-100 characters | Yes |
| `contactEmail` | string | User's email address | Valid email format, unique | Yes |

## Resource representation

### JSON structure

```json
{
  "userId": 1,
  "firstName": "John",
  "lastName": "Doe",
  "contactEmail": "john.doe@example.com"
}
```

## Property details

### userId

- **Type**: integer
- **Description**: System-generated unique identifier for the user
- **Required**: Automatically generated for responses, not included in requests
- **Example**: `1`

### firstName

- **Type**: string
- **Description**: The user's first name
- **Constraints**: 1-100 characters
- **Required**: Yes
- **Example**: `"John"`

### lastName

- **Type**: string
- **Description**: The user's last name
- **Constraints**: 1-100 characters
- **Required**: Yes
- **Example**: `"Doe"`

### contactEmail

- **Type**: string
- **Description**: The user's email address for contact purposes
- **Constraints**: 
  - Must be a valid email address
  - Must be unique across all users
  - 3-255 characters
- **Required**: Yes
- **Example**: `"john.doe@example.com"`

## User lifecycle

1. **Creation**: A user is created via the [Create a user](../api-reference/create-user.html) endpoint
2. **Retrieval**: User details can be fetched via the [Get user by ID](../api-reference/get-user-by-id.html) endpoint
3. **Update**: User information can be updated via the [Update a user](../api-reference/update-user.html) endpoint
4. **Deletion**: A user can be deleted via the [Delete a user](../api-reference/delete-user.html) endpoint

When a user is deleted, all associated tasks are also removed from the system.

## Related endpoints

The following endpoints work with the User resource:

| Method | Endpoint | Description | Reference |
|--------|----------|-------------|-----------|
| GET | `/users` | Retrieve all users | [Get all users](../api-reference/get-all-users.html) |
| POST | `/users` | Create a new user | [Create a user](../api-reference/create-user.html) |
| GET | `/users/{userId}` | Retrieve a specific user | [Get user by ID](../api-reference/get-user-by-id.html) |
| PATCH | `/users/{userId}` | Update a user | [Update a user](../api-reference/update-user.html) |
| DELETE | `/users/{userId}` | Delete a user | [Delete a user](../api-reference/delete-user.html) |

## Creating a user

To create a new user, send a POST request to the `/users` endpoint with the required fields:

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

The API will respond with the newly created user, including the system-generated `userId`:

```json
{
  "userId": 1,
  "firstName": "John",
  "lastName": "Doe",
  "contactEmail": "john.doe@example.com"
}
```

## Updating a user

To update an existing user, send a PATCH request to the `/users/{userId}` endpoint with the fields you want to update:

```http
PATCH /users/1 HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
Content-Type: application/json

{
  "contactEmail": "new.email@example.com"
}
```

The API will respond with the complete updated user:

```json
{
  "userId": 1,
  "firstName": "John",
  "lastName": "Doe",
  "contactEmail": "new.email@example.com"
}
```

## Retrieving users

To retrieve all users, send a GET request to the `/users` endpoint:

```http
GET /users HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
```

The API will respond with a list of users:

```json
{
  "users": [
    {
      "userId": 1,
      "firstName": "John",
      "lastName": "Doe",
      "contactEmail": "john.doe@example.com"
    },
    {
      "userId": 2,
      "firstName": "Jane",
      "lastName": "Smith",
      "contactEmail": "jane.smith@example.com"
    }
  ]
}
```

To retrieve a specific user, send a GET request to the `/users/{userId}` endpoint:

```http
GET /users/1 HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
```

## Deleting a user

To delete a user, send a DELETE request to the `/users/{userId}` endpoint:

```http
DELETE /users/1 HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
```

A successful deletion returns a `204 No Content` response with no body.

## Common errors

| Error code | Description | HTTP status |
|------------|-------------|-------------|
| `INVALID_FIELD` | One or more fields have invalid values | 400 |
| `MISSING_REQUIRED_FIELD` | A required field is missing | 400 |
| `RESOURCE_NOT_FOUND` | The requested user does not exist | 404 |
| `DUPLICATE_EMAIL` | The email address is already in use | 400 |

## Relationships

Each user can have multiple tasks. This one-to-many relationship is established through the `userId` field in the Task resource.

For more information on tasks, see the [Task resource](task-resource.html) documentation.

## Next steps

- Learn how to [get started with users](../tutorials/getting-started-with-users.html)
- Explore [user code examples](../developer-resources/code-examples.html)
- Understand how users relate to [tasks](task-resource.html)
- Learn about [authentication](../getting-started/authentication.html) for user-based operations

--- FILE: resources/task-resource.md
---
title: "Task resource"
description: "Detailed information about the Task resource, its properties, and related endpoints."
tags: ["task", "resource"]
categories: ["resources"]
importance: 9
related_pages: ["get-all-tasks", "create-task", "get-task-by-id", "update-task", "delete-task"]
api_endpoints: ["/tasks", "/tasks/{taskId}"]
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 12, 2025"
navOrder: 2
---

# Task resource

The Task resource represents a to-do item in the Task Management API. This document provides detailed information about the Task resource, its properties, and related endpoints.

## Resource overview

The Task resource has the following properties:

| Property | Type | Description | Constraints | Required |
|----------|------|-------------|------------|----------|
| `taskId` | integer | Unique identifier | System-generated, immutable | Yes (in responses) |
| `userId` | integer | Owner's user ID | Must reference existing user | Yes |
| `taskTitle` | string | Short description | 1-80 characters | Yes |
| `taskDescription` | string | Detailed description | 1-255 characters | No |
| `taskStatus` | string enum | Current status | One of predefined values | Yes (defaults to `NOT_STARTED`) |
| `dueDate` | string (date-time) | When task is due | ISO 8601 format | Yes |
| `warningOffset` | integer | Minutes before due date for reminder | 0-64000 | Yes |

## Resource representation

### JSON structure

```json
{
  "taskId": 1,
  "userId": 1,
  "taskTitle": "Complete API documentation",
  "taskDescription": "Finish the task management API documentation for the developer portal",
  "taskStatus": "IN_PROGRESS",
  "dueDate": "2025-05-15T17:00:00-05:00",
  "warningOffset": 60
}
```

## Property details

### taskId

- **Type**: integer
- **Description**: System-generated unique identifier for the task
- **Required**: Automatically generated for responses, not included in requests
- **Example**: `1`

### userId

- **Type**: integer
- **Description**: Identifier of the user who owns the task
- **Constraints**: Must reference an existing user
- **Required**: Yes
- **Example**: `1`

### taskTitle

- **Type**: string
- **Description**: Short description of the task used as the title in lists and headings
- **Constraints**: 1-80 characters
- **Required**: Yes
- **Example**: `"Complete API documentation"`

### taskDescription

- **Type**: string
- **Description**: Detailed description of the task
- **Constraints**: 1-255 characters
- **Required**: No
- **Example**: `"Finish the task management API documentation for the developer portal"`

### taskStatus

- **Type**: string enum
- **Description**: Current state of the task in its lifecycle
- **Constraints**: Must be one of:
  - `NOT_STARTED` - Default value for new tasks
  - `IN_PROGRESS` - Task is actively being worked on
  - `BLOCKED` - Task cannot proceed due to an obstacle
  - `DEFERRED` - Task has been postponed
  - `COMPLETED` - Task has been finished
  - `CANCELLED` - Task has been abandoned
- **Required**: Yes (defaults to `NOT_STARTED` if not provided)
- **Example**: `"IN_PROGRESS"`

For more information about task status values and transitions, see the [Task status lifecycle](../core-concepts/task-status-lifecycle.html) document.

### dueDate

- **Type**: string (date-time)
- **Description**: The date and time when the task should be completed
- **Constraints**: Must be in ISO 8601 format (`YYYY-MM-DDTHH:MM:SS.sssZ`)
- **Required**: Yes
- **Example**: `"2025-05-15T17:00:00-05:00"`

### warningOffset

- **Type**: integer
- **Description**: Number of minutes before the due date to send a reminder
- **Constraints**: 0-64000
- **Required**: Yes
- **Example**: `60` (reminder 1 hour before due date)

## Task lifecycle

1. **Creation**: A task is created via the [Create a task](../api-reference/create-task.html) endpoint
2. **Retrieval**: Task details can be fetched via the [Get task by ID](../api-reference/get-task-by-id.html) endpoint
3. **Update**: Task information can be updated via the [Update a task](../api-reference/update-task.html) endpoint
4. **Status changes**: The task moves through different statuses via updates
5. **Deletion**: A task can be deleted via the [Delete a task](../api-reference/delete-task.html) endpoint

## Related endpoints

The following endpoints work with the Task resource:

| Method | Endpoint | Description | Reference |
|--------|----------|-------------|-----------|
| GET | `/tasks` | Retrieve all tasks | [Get all tasks](../api-reference/get-all-tasks.html) |
| POST | `/tasks` | Create a new task | [Create a task](../api-reference/create-task.html) |
| GET | `/tasks/{taskId}` | Retrieve a specific task | [Get task by ID](../api-reference/get-task-by-id.html) |
| PATCH | `/tasks/{taskId}` | Update a task | [Update a task](../api-reference/update-task.html) |
| DELETE | `/tasks/{taskId}` | Delete a task | [Delete a task](../api-reference/delete-task.html) |

## Creating a task

To create a new task, send a POST request to the `/tasks` endpoint with the required fields:

```http
POST /tasks HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
Content-Type: application/json

{
  "userId": 1,
  "taskTitle": "Complete API documentation",
  "taskDescription": "Finish the task management API documentation for the developer portal",
  "dueDate": "2025-05-15T17:00:00-05:00",
  "warningOffset": 60
}
```

The API will respond with the newly created task, including the system-generated `taskId` and default `taskStatus`:

```json
{
  "taskId": 1,
  "userId": 1,
  "taskTitle": "Complete API documentation",
  "taskDescription": "Finish the task management API documentation for the developer portal",
  "taskStatus": "NOT_STARTED",
  "dueDate": "2025-05-15T17:00:00-05:00",
  "warningOffset": 60
}
```

## Updating a task

To update an existing task, send a PATCH request to the `/tasks/{taskId}` endpoint with the fields you want to update:

```http
PATCH /tasks/1 HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
Content-Type: application/json

{
  "taskStatus": "IN_PROGRESS"
}
```

The API will respond with the complete updated task:

```json
{
  "taskId": 1,
  "userId": 1,
  "taskTitle": "Complete API documentation",
  "taskDescription": "Finish the task management API documentation for the developer portal",
  "taskStatus": "IN_PROGRESS",
  "dueDate": "2025-05-15T17:00:00-05:00",
  "warningOffset": 60
}
```

## Retrieving tasks

To retrieve all tasks, send a GET request to the `/tasks` endpoint:

```http
GET /tasks HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
```

The API will respond with a list of tasks:

```json
{
  "tasks": [
    {
      "taskId": 1,
      "userId": 1,
      "taskTitle": "Complete API documentation",
      "taskDescription": "Finish the task management API documentation for the developer portal",
      "taskStatus": "IN_PROGRESS",
      "dueDate": "2025-05-15T17:00:00-05:00",
      "warningOffset": 60
    },
    {
      "taskId": 2,
      "userId": 1,
      "taskTitle": "Deploy application",
      "taskDescription": "Deploy the application to production",
      "taskStatus": "NOT_STARTED",
      "dueDate": "2025-05-20T09:00:00-05:00",
      "warningOffset": 120
    }
  ]
}
```

### Filtering tasks

You can filter tasks by their status using the `taskStatus` query parameter:

```http
GET /tasks?taskStatus=IN_PROGRESS HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
```

### Pagination and sorting

For large collections, you can use pagination and sorting parameters:

```http
GET /tasks?_page=0&_perPage=10&_sort=-dueDate HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
```

For more information, see the [Pagination](../core-concepts/pagination.html) and [Sorting](../core-concepts/sorting.html) documents.

## Deleting a task

To delete a task, send a DELETE request to the `/tasks/{taskId}` endpoint:

```http
DELETE /tasks/1 HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
```

A successful deletion returns a `204 No Content` response with no body.

## Common errors

| Error code | Description | HTTP status |
|------------|-------------|-------------|
| `INVALID_FIELD` | One or more fields have invalid values | 400 |
| `MISSING_REQUIRED_FIELD` | A required field is missing | 400 |
| `RESOURCE_NOT_FOUND` | The requested task does not exist | 404 |
| `INVALID_USER_ID` | The specified user does not exist | 400 |
| `INVALID_STATUS` | The specified status is not valid | 400 |

## Task reminders

The `dueDate` and `warningOffset` properties work together to determine when a reminder should be sent:

```
Reminder time = dueDate - warningOffset minutes
```

For example, if a task has:
- `dueDate`: `"2025-05-15T17:00:00-05:00"`
- `warningOffset`: `60` (minutes)

The reminder would be sent at `2025-05-15T16:00:00-05:00` (1 hour before the due date).

For more information on implementing reminders, see the [Implementing reminders](../tutorials/implementing-reminders.html) tutorial.

## Relationships

Each task belongs to exactly one user, identified by the `userId` property. This establishes a many-to-one relationship between tasks and users.

For more information on users, see the [User resource](user-resource.html) documentation.

## Next steps

- Learn about the [task status lifecycle](../core-concepts/task-status-lifecycle.html)
- Explore the [task management workflow](../tutorials/task-management-workflow.html)
- See [code examples](../developer-resources/code-examples.html) for working with tasks
- Implement [reminders](../tutorials/implementing-reminders.html) for upcoming tasks

--- FILE: api-reference/error-responses.md
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

--- FILE: api-reference/get-all-users.md
---
title: "Get all users"
description: "API endpoint to retrieve a list of all users with pagination and sorting support."
tags: ["users", "endpoint", "GET"]
categories: ["api-reference"]
importance: 7
api_endpoints: ["/users"]
related_pages: ["user-resource", "pagination", "sorting"]
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 12, 2025"
navOrder: 2
---

# Get all users

The `GET /users` endpoint retrieves a list of all users in the system. This endpoint supports pagination and sorting to help manage large collections of users.

## Endpoint

```
GET /users
```

## Authentication

This endpoint requires authentication. Include the bearer token in the request header:

```
Authorization: Bearer YOUR_TOKEN
```

## Request parameters

The following query parameters are supported:

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `_page` | integer | No | Page number (zero-indexed). Default: 0 |
| `_perPage` | integer | No | Number of items per page (1-100). Default: 20 |
| `_sort` | string | No | Field to sort by. Prefix with `-` for descending order |

### Pagination parameters

- `_page`: Zero-indexed page number to retrieve
- `_perPage`: Number of users to return per page (maximum 100)

For more information on pagination, see the [Pagination](../core-concepts/pagination.html) document.

### Sorting parameters

- `_sort`: Field name to sort by
  - Available fields: `userId`, `firstName`, `lastName`, `contactEmail`
  - Prefix with `-` for descending order (e.g., `-lastName`)

For more information on sorting, see the [Sorting](../core-concepts/sorting.html) document.

## Request examples

### Basic request

```http
GET /users HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
```

### With pagination

```http
GET /users?_page=0&_perPage=10 HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
```

### With sorting

```http
GET /users?_sort=lastName HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
```

### With pagination and sorting

```http
GET /users?_page=0&_perPage=10&_sort=-lastName HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
```

## Response

### Success response (200 OK)

```json
{
  "users": [
    {
      "userId": 1,
      "firstName": "Ferdinand",
      "lastName": "Smith",
      "contactEmail": "f.smith@example.com"
    },
    {
      "userId": 2,
      "firstName": "Jill",
      "lastName": "Jones",
      "contactEmail": "j.jones@example.com"
    },
    {
      "userId": 3,
      "firstName": "Marty",
      "lastName": "Martinez",
      "contactEmail": "m.martinez@example.com"
    },
    {
      "userId": 4,
      "firstName": "Bill",
      "lastName": "Bailey",
      "contactEmail": "b.bailey@example.com"
    }
  ]
}
```

### Error responses

| Status | Code | Description |
|--------|------|-------------|
| 400 | `INVALID_FIELD` | Invalid query parameter |
| 401 | `UNAUTHORIZED` | Authentication required |
| 403 | `FORBIDDEN` | Access denied |
| 429 | `RATE_LIMIT_EXCEEDED` | Too many requests |
| 500 | `SERVER_ERROR` | Server error |

For more information on error responses, see the [Error responses](error-responses.html) document.

## Response fields

The response contains an array of user objects, each with the following fields:

| Field | Type | Description |
|-------|------|-------------|
| `userId` | integer | Unique identifier for the user |
| `firstName` | string | User's first name |
| `lastName` | string | User's last name |
| `contactEmail` | string | User's email address |

For more information about the user resource, see the [User resource](../resources/user-resource.html) document.

## Empty results

If no users match the criteria or if the page is beyond available data, the API returns an empty array:

```json
{
  "users": []
}
```

## Code examples

### cURL

```bash
curl -X GET \
  'http://localhost:3000/users?_page=0&_perPage=10&_sort=lastName' \
  -H 'Authorization: Bearer YOUR_TOKEN'
```

### JavaScript

```javascript
async function getAllUsers(page = 0, perPage = 20, sort = null) {
  const url = new URL('http://localhost:3000/users');
  
  url.searchParams.append('_page', page);
  url.searchParams.append('_perPage', perPage);
  
  if (sort) {
    url.searchParams.append('_sort', sort);
  }
  
  const response = await fetch(url, {
    method: 'GET',
    headers: {
      'Authorization': 'Bearer YOUR_TOKEN',
      'Content-Type': 'application/json'
    }
  });
  
  if (!response.ok) {
    const error = await response.json();
    throw new Error(error.message);
  }
  
  return await response.json();
}
```

### Python

```python
import requests

def get_all_users(page=0, per_page=20, sort=None):
    url = 'http://localhost:3000/users'
    
    params = {
        '_page': page,
        '_perPage': per_page
    }
    
    if sort:
        params['_sort'] = sort
    
    headers = {
        'Authorization': 'Bearer YOUR_TOKEN',
        'Content-Type': 'application/json'
    }
    
    response = requests.get(url, params=params, headers=headers)
    
    if response.status_code != 200:
        error = response.json()
        raise Exception(error['message'])
    
    return response.json()
```

## Related resources

- [User resource](../resources/user-resource.html) - Detailed information about the user resource
- [Create a user](create-user.html) - Create a new user
- [Get user by ID](get-user-by-id.html) - Retrieve a specific user
- [Update a user](update-user.html) - Update an existing user
- [Delete a user](delete-user.html) - Remove a user

## See also

- [Pagination](../core-concepts/pagination.html) - Detailed information about pagination
- [Sorting](../core-concepts/sorting.html) - Detailed information about sorting
- [Error handling](../core-concepts/error-handling.html) - How to handle API errors

--- FILE: api-reference/create-user.md
---
title: "Create a user"
description: "API endpoint to create a new user in the system."
tags: ["users", "endpoint", "POST"]
categories: ["api-reference"]
importance: 7
api_endpoints: ["/users"]
related_pages: ["user-resource"]
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 12, 2025"
navOrder: 3
---

# Create a user

The `POST /users` endpoint creates a new user in the system. This endpoint allows you to add a user record that can then be associated with tasks.

## Endpoint

```
POST /users
```

## Authentication

This endpoint requires authentication. Include the bearer token in the request header:

```
Authorization: Bearer YOUR_TOKEN
```

## Request body

The request body must be a JSON object with the following properties:

| Property | Type | Required | Description | Constraints |
|----------|------|----------|-------------|-------------|
| `firstName` | string | Yes | User's first name | 1-100 characters |
| `lastName` | string | Yes | User's last name | 1-100 characters |
| `contactEmail` | string | Yes | User's email address | Valid email format, unique |

### Example request body

```json
{
  "firstName": "John",
  "lastName": "Doe",
  "contactEmail": "j.doe@example.com"
}
```

## Request example

```http
POST /users HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
Content-Type: application/json

{
  "firstName": "John",
  "lastName": "Doe",
  "contactEmail": "j.doe@example.com"
}
```

## Response

### Success response (201 Created)

If the user is created successfully, the API returns a `201 Created` status code and the complete user object, including the system-generated `userId`:

```json
{
  "userId": 5,
  "firstName": "John",
  "lastName": "Doe",
  "contactEmail": "j.doe@example.com"
}
```

### Error responses

| Status | Code | Description |
|--------|------|-------------|
| 400 | `INVALID_FIELD` | One or more fields have invalid values |
| 400 | `MISSING_REQUIRED_FIELD` | A required field is missing |
| 400 | `DUPLICATE_EMAIL` | The email address is already in use |
| 401 | `UNAUTHORIZED` | Authentication required |
| 403 | `FORBIDDEN` | Access denied |
| 429 | `RATE_LIMIT_EXCEEDED` | Too many requests |
| 500 | `SERVER_ERROR` | Server error |

For more information on error responses, see the [Error responses](error-responses.html) document.

## Response fields

The response contains the newly created user object with the following fields:

| Field | Type | Description |
|-------|------|-------------|
| `userId` | integer | System-generated unique identifier for the user |
| `firstName` | string | User's first name |
| `lastName` | string | User's last name |
| `contactEmail` | string | User's email address |

For more information about the user resource, see the [User resource](../resources/user-resource.html) document.

## Validation rules

The API applies the following validation rules when creating a user:

- `firstName` must be between 1 and 100 characters
- `lastName` must be between 1 and 100 characters
- `contactEmail` must be a valid email format
- `contactEmail` must be unique across all users
- All required fields must be provided

If validation fails, the API returns a `400 Bad Request` response with details about the validation errors:

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

## Code examples

### cURL

```bash
curl -X POST \
  http://localhost:3000/users \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Content-Type: application/json' \
  -d '{
    "firstName": "John",
    "lastName": "Doe",
    "contactEmail": "j.doe@example.com"
  }'
```

### JavaScript

```javascript
async function createUser(userData) {
  const response = await fetch('http://localhost:3000/users', {
    method: 'POST',
    headers: {
      'Authorization': 'Bearer YOUR_TOKEN',
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(userData)
  });
  
  if (!response.ok) {
    const error = await response.json();
    throw new Error(error.message);
  }
  
  return await response.json();
}

// Example usage
const newUser = {
  firstName: "John",
  lastName: "Doe",
  contactEmail: "j.doe@example.com"
};

createUser(newUser)
  .then(user => console.log('User created:', user))
  .catch(error => console.error('Failed to create user:', error));
```

### Python

```python
import requests
import json

def create_user(user_data):
    url = 'http://localhost:3000/users'
    
    headers = {
        'Authorization': 'Bearer YOUR_TOKEN',
        'Content-Type': 'application/json'
    }
    
    response = requests.post(url, headers=headers, json=user_data)
    
    if response.status_code != 201:
        error = response.json()
        raise Exception(error['message'])
    
    return response.json()

# Example usage
new_user = {
    "firstName": "John",
    "lastName": "Doe",
    "contactEmail": "j.doe@example.com"
}

try:
    user = create_user(new_user)
    print('User created:', user)
except Exception as e:
    print('Failed to create user:', str(e))
```

## Next steps

After creating a user, you can:

- [Get user by ID](get-user-by-id.html) to retrieve the user
- [Update a user](update-user.html) to modify the user
- [Create a task](create-task.html) associated with the user
- [Get all tasks](get-all-tasks.html) for the user

## Related resources

- [User resource](../resources/user-resource.html) - Detailed information about the user resource
- [Get all users](get-all-users.html) - Retrieve a list of all users
- [Get user by ID](get-user-by-id.html) - Retrieve a specific user
- [Update a user](update-user.html) - Update an existing user
- [Delete a user](delete-user.html) - Remove a user

## See also

- [Error handling](../core-concepts/error-handling.html) - How to handle API errors
- [Getting started with users](../tutorials/getting-started-with-users.html) - Tutorial on user management

--- FILE: api-reference/get-user-by-id.md
---
title: "Get user by ID"
description: "API endpoint to retrieve a specific user by their unique identifier."
tags: ["users", "endpoint", "GET"]
categories: ["api-reference"]
importance: 7
api_endpoints: ["/users/{userId}"]
related_pages: ["user-resource"]
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 12, 2025"
navOrder: 4
---

# Get user by ID

The `GET /users/{userId}` endpoint retrieves a specific user by their unique identifier. This endpoint allows you to fetch detailed information about a single user.

## Endpoint

```
GET /users/{userId}
```

## Authentication

This endpoint requires authentication. Include the bearer token in the request header:

```
Authorization: Bearer YOUR_TOKEN
```

## Path parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `userId` | integer | Yes | The unique identifier of the user to retrieve |

## Request example

```http
GET /users/1 HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
```

## Response

### Success response (200 OK)

If the user exists, the API returns a `200 OK` status code and the user object:

```json
{
  "userId": 1,
  "firstName": "Ferdinand",
  "lastName": "Smith",
  "contactEmail": "f.smith@example.com"
}
```

### Error responses

| Status | Code | Description |
|--------|------|-------------|
| 400 | `INVALID_FIELD` | Invalid `userId` format |
| 401 | `UNAUTHORIZED` | Authentication required |
| 403 | `FORBIDDEN` | Access denied |
| 404 | `RESOURCE_NOT_FOUND` | User not found |
| 429 | `RATE_LIMIT_EXCEEDED` | Too many requests |
| 500 | `SERVER_ERROR` | Server error |

For more information on error responses, see the [Error responses](error-responses.html) document.

#### Not found response example (404)

```json
{
  "code": "RESOURCE_NOT_FOUND",
  "message": "User with ID 999 could not be found",
  "requestId": "req-f8d31a62-e789-4856-9452-5efa50223c7a"
}
```

## Response fields

The response contains the user object with the following fields:

| Field | Type | Description |
|-------|------|-------------|
| `userId` | integer | Unique identifier for the user |
| `firstName` | string | User's first name |
| `lastName` | string | User's last name |
| `contactEmail` | string | User's email address |

For more information about the user resource, see the [User resource](../resources/user-resource.html) document.

## Common use cases

### User profile display

Retrieve a user's details to display their profile information in your application.

### User verification

Verify if a user exists before performing operations that require a valid user.

### User data retrieval

Get a user's information before updating or before associating them with a new task.

## Code examples

### cURL

```bash
curl -X GET \
  http://localhost:3000/users/1 \
  -H 'Authorization: Bearer YOUR_TOKEN'
```

### JavaScript

```javascript
async function getUserById(userId) {
  const response = await fetch(`http://localhost:3000/users/${userId}`, {
    method: 'GET',
    headers: {
      'Authorization': 'Bearer YOUR_TOKEN',
      'Content-Type': 'application/json'
    }
  });
  
  if (!response.ok) {
    const error = await response.json();
    throw new Error(error.message);
  }
  
  return await response.json();
}

// Example usage
getUserById(1)
  .then(user => console.log('User:', user))
  .catch(error => console.error('Failed to get user:', error));
```

### Python

```python
import requests

def get_user_by_id(user_id):
    url = f'http://localhost:3000/users/{user_id}'
    
    headers = {
        'Authorization': 'Bearer YOUR_TOKEN',
        'Content-Type': 'application/json'
    }
    
    response = requests.get(url, headers=headers)
    
    if response.status_code != 200:
        error = response.json()
        raise Exception(error['message'])
    
    return response.json()

# Example usage
try:
    user = get_user_by_id(1)
    print('User:', user)
except Exception as e:
    print('Failed to get user:', str(e))
```

## Error handling

When calling this endpoint, be prepared to handle the following common errors:

### User not found

If the specified `userId` does not exist, the API returns a `404 Not Found` response. Your application should handle this gracefully, for example by displaying a "User not found" message to the user.

### Invalid user ID format

If the `userId` is not a valid integer, the API returns a `400 Bad Request` response. Your application should validate the user ID before making the request.

## Related resources

- [User resource](../resources/user-resource.html) - Detailed information about the user resource
- [Get all users](get-all-users.html) - Retrieve a list of all users
- [Create a user](create-user.html) - Create a new user
- [Update a user](update-user.html) - Update an existing user
- [Delete a user](delete-user.html) - Remove a user

## See also

- [Error handling](../core-concepts/error-handling.html) - How to handle API errors
- [Getting started with users](../tutorials/getting-started-with-users.html) - Tutorial on user management

--- FILE: api-reference/update-user.md
---
title: "Update a user"
description: "API endpoint to update an existing user's information."
tags: ["users", "endpoint", "PATCH"]
categories: ["api-reference"]
importance: 7
api_endpoints: ["/users/{userId}"]
related_pages: ["user-resource"]
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 12, 2025"
navOrder: 5
---

# Update a user

The `PATCH /users/{userId}` endpoint updates one or more properties of an existing user. This endpoint supports partial updates, allowing you to modify specific fields without affecting the others.

## Endpoint

```
PATCH /users/{userId}
```

## Authentication

This endpoint requires authentication. Include the bearer token in the request header:

```
Authorization: Bearer YOUR_TOKEN
```

## Path parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `userId` | integer | Yes | The unique identifier of the user to update |

## Request body

The request body should be a JSON object containing one or more user properties to update:

| Property | Type | Required | Description | Constraints |
|----------|------|----------|-------------|-------------|
| `firstName` | string | No | User's first name | 1-100 characters |
| `lastName` | string | No | User's last name | 1-100 characters |
| `contactEmail` | string | No | User's email address | Valid email format, unique |

At least one property must be included in the request.

### Example request body

```json
{
  "contactEmail": "new.email@example.com"
}
```

## Request example

```http
PATCH /users/1 HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
Content-Type: application/json

{
  "contactEmail": "new.email@example.com"
}
```

## Response

### Success response (200 OK)

If the user is updated successfully, the API returns a `200 OK` status code and the complete updated user object:

```json
{
  "userId": 1,
  "firstName": "Ferdinand",
  "lastName": "Smith",
  "contactEmail": "new.email@example.com"
}
```

### Error responses

| Status | Code | Description |
|--------|------|-------------|
| 400 | `INVALID_FIELD` | One or more fields have invalid values |
| 400 | `MISSING_REQUIRED_FIELD` | No fields provided for update |
| 400 | `DUPLICATE_EMAIL` | The email address is already in use |
| 401 | `UNAUTHORIZED` | Authentication required |
| 403 | `FORBIDDEN` | Access denied |
| 404 | `RESOURCE_NOT_FOUND` | User not found |
| 429 | `RATE_LIMIT_EXCEEDED` | Too many requests |
| 500 | `SERVER_ERROR` | Server error |

For more information on error responses, see the [Error responses](error-responses.html) document.

#### Invalid field example (400)

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

#### User not found example (404)

```json
{
  "code": "RESOURCE_NOT_FOUND",
  "message": "User with ID 999 could not be found",
  "requestId": "req-f8d31a62-e789-4856-9452-5efa50223c7a"
}
```

## Response fields

The response contains the updated user object with the following fields:

| Field | Type | Description |
|-------|------|-------------|
| `userId` | integer | Unique identifier for the user |
| `firstName` | string | User's first name |
| `lastName` | string | User's last name |
| `contactEmail` | string | User's email address |

For more information about the user resource, see the [User resource](../resources/user-resource.html) document.

## Validation rules

The API applies the following validation rules when updating a user:

- At least one field must be provided for update
- `firstName` must be between 1 and 100 characters, if provided
- `lastName` must be between 1 and 100 characters, if provided
- `contactEmail` must be a valid email format, if provided
- `contactEmail` must be unique across all users, if provided

If validation fails, the API returns a `400 Bad Request` response with details about the validation errors.

## Update behavior

- The update is partial, meaning only the fields included in the request will be modified
- Omitted fields retain their current values
- The `userId` cannot be modified
- The response includes the complete user object with all fields, including those not modified

## Code examples

### cURL

```bash
curl -X PATCH \
  http://localhost:3000/users/1 \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Content-Type: application/json' \
  -d '{
    "contactEmail": "new.email@example.com"
  }'
```

### JavaScript

```javascript
async function updateUser(userId, userData) {
  const response = await fetch(`http://localhost:3000/users/${userId}`, {
    method: 'PATCH',
    headers: {
      'Authorization': 'Bearer YOUR_TOKEN',
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(userData)
  });
  
  if (!response.ok) {
    const error = await response.json();
    throw new Error(error.message);
  }
  
  return await response.json();
}

// Example usage
const userUpdates = {
  contactEmail: "new.email@example.com"
};

updateUser(1, userUpdates)
  .then(user => console.log('User updated:', user))
  .catch(error => console.error('Failed to update user:', error));
```

### Python

```python
import requests

def update_user(user_id, user_data):
    url = f'http://localhost:3000/users/{user_id}'
    
    headers = {
        'Authorization': 'Bearer YOUR_TOKEN',
        'Content-Type': 'application/json'
    }
    
    response = requests.patch(url, headers=headers, json=user_data)
    
    if response.status_code != 200:
        error = response.json()
        raise Exception(error['message'])
    
    return response.json()

# Example usage
user_updates = {
    "contactEmail": "new.email@example.com"
}

try:
    user = update_user(1, user_updates)
    print('User updated:', user)
except Exception as e:
    print('Failed to update user:', str(e))
```

## Common use cases

### Update contact information

When a user's contact information changes, update their email address:

```json
{
  "contactEmail": "new.email@example.com"
}
```

### Update user name

When a user's name changes, update their first name, last name, or both:

```json
{
  "firstName": "NewFirstName",
  "lastName": "NewLastName"
}
```

## Related resources

- [User resource](../resources/user-resource.html) - Detailed information about the user resource
- [Get all users](get-all-users.html) - Retrieve a list of all users
- [Get user by ID](get-user-by-id.html) - Retrieve a specific user
- [Create a user](create-user.html) - Create a new user
- [Delete a user](delete-user.html) - Remove a user

## See also

- [Error handling](../core-concepts/error-handling.html) - How to handle API errors
- [Getting started with users](../tutorials/getting-started-with-users.html) - Tutorial on user management

--- FILE: api-reference/delete-user.md
---
title: "Delete a user"
description: "API endpoint to remove a user from the system."
tags: ["users", "endpoint", "DELETE"]
categories: ["api-reference"]
importance: 7
api_endpoints: ["/users/{userId}"]
related_pages: ["user-resource"]
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 12, 2025"
navOrder: 6
---

# Delete a user

The `DELETE /users/{userId}` endpoint removes a specific user from the system. This endpoint permanently deletes the user and all associated tasks.

## Endpoint

```
DELETE /users/{userId}
```

## Authentication

This endpoint requires authentication. Include the bearer token in the request header:

```
Authorization: Bearer YOUR_TOKEN
```

## Path parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `userId` | integer | Yes | The unique identifier of the user to delete |

## Request example

```http
DELETE /users/1 HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
```

## Response

### Success response (204 No Content)

If the user is deleted successfully, the API returns a `204 No Content` status code with no response body.

### Error responses

| Status | Code | Description |
|--------|------|-------------|
| 400 | `INVALID_FIELD` | Invalid `userId` format |
| 401 | `UNAUTHORIZED` | Authentication required |
| 403 | `FORBIDDEN` | Access denied |
| 404 | `RESOURCE_NOT_FOUND` | User not found |
| 429 | `RATE_LIMIT_EXCEEDED` | Too many requests |
| 500 | `SERVER_ERROR` | Server error |

For more information on error responses, see the [Error responses](error-responses.html) document.

#### User not found example (404)

```json
{
  "code": "RESOURCE_NOT_FOUND",
  "message": "User with ID 999 could not be found",
  "requestId": "req-f8d31a62-e789-4856-9452-5efa50223c7a"
}
```

## Cascade delete behavior

When a user is deleted, all tasks associated with that user are also deleted. This cascade delete behavior ensures that no orphaned tasks remain in the system.

## Important considerations

- This operation cannot be undone
- All tasks owned by the user will be permanently deleted
- The `userId` cannot be reused for new users

## Code examples

### cURL

```bash
curl -X DELETE \
  http://localhost:3000/users/1 \
  -H 'Authorization: Bearer YOUR_TOKEN'
```

### JavaScript

```javascript
async function deleteUser(userId) {
  const response = await fetch(`http://localhost:3000/users/${userId}`, {
    method: 'DELETE',
    headers: {
      'Authorization': 'Bearer YOUR_TOKEN'
    }
  });
  
  if (!response.ok) {
    const error = await response.json();
    throw new Error(error.message);
  }
  
  // Success response has no content
  return true;
}

// Example usage
deleteUser(1)
  .then(() => console.log('User deleted successfully'))
  .catch(error => console.error('Failed to delete user:', error));
```

### Python

```python
import requests

def delete_user(user_id):
    url = f'http://localhost:3000/users/{user_id}'
    
    headers = {
        'Authorization': 'Bearer YOUR_TOKEN'
    }
    
    response = requests.delete(url, headers=headers)
    
    if response.status_code != 204:
        error = response.json()
        raise Exception(error['message'])
    
    # Success response has no content
    return True

# Example usage
try:
    delete_user(1)
    print('User deleted successfully')
except Exception as e:
    print('Failed to delete user:', str(e))
```

## Common use cases

### Account removal

When a user wants to remove their account from the system, along with all their tasks.

### Administrative cleanup

When administrators need to remove inactive or problematic user accounts.

## Best practices

- Confirm the deletion with the user before making this request, as it cannot be undone
- Consider implementing a "soft delete" in your application logic if you need to preserve user data
- Handle the 404 error gracefully if the user has already been deleted

## Related resources

- [User resource](../resources/user-resource.html) - Detailed information about the user resource
- [Get all users](get-all-users.html) - Retrieve a list of all users
- [Get user by ID](get-user-by-id.html) - Retrieve a specific user
- [Create a user](create-user.html) - Create a new user
- [Update a user](update-user.html) - Update an existing user

## See also

- [Error handling](../core-concepts/error-handling.html) - How to handle API errors
- [Getting started with users](../tutorials/getting-started-with-users.html) - Tutorial on user management

--- FILE: api-reference/get-all-tasks.md
---
title: "Get all tasks"
description: "API endpoint to retrieve a list of all tasks with pagination, sorting, and filtering options."
tags: ["tasks", "endpoint", "GET"]
categories: ["api-reference"]
importance: 7
api_endpoints: ["/tasks"]
related_pages: ["task-resource", "pagination", "sorting", "task-status-lifecycle"]
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 12, 2025"
navOrder: 7
---

# Get all tasks

The `GET /tasks` endpoint retrieves a list of all tasks in the system. This endpoint supports pagination, sorting, and filtering by task status to help manage large collections of tasks.

## Endpoint

```
GET /tasks
```

## Authentication

This endpoint requires authentication. Include the bearer token in the request header:

```
Authorization: Bearer YOUR_TOKEN
```

## Request parameters

The following query parameters are supported:

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `_page` | integer | No | Page number (zero-indexed). Default: 0 |
| `_perPage` | integer | No | Number of items per page (1-100). Default: 20 |
| `_sort` | string | No | Field to sort by. Prefix with `-` for descending order |
| `taskStatus` | string | No | Filter tasks by status (e.g., `NOT_STARTED`, `IN_PROGRESS`) |

### Pagination parameters

- `_page`: Zero-indexed page number to retrieve
- `_perPage`: Number of tasks to return per page (maximum 100)

For more information on pagination, see the [Pagination](../core-concepts/pagination.html) document.

### Sorting parameters

- `_sort`: Field name to sort by
  - Available fields: `taskId`, `userId`, `taskTitle`, `taskStatus`, `dueDate`, `warningOffset`
  - Prefix with `-` for descending order (e.g., `-dueDate`)

For more information on sorting, see the [Sorting](../core-concepts/sorting.html) document.

### Filtering parameters

- `taskStatus`: Filter tasks by their status
  - Possible values: `NOT_STARTED`, `IN_PROGRESS`, `BLOCKED`, `DEFERRED`, `COMPLETED`, `CANCELLED`

For more information on task statuses, see the [Task status lifecycle](../core-concepts/task-status-lifecycle.html) document.

## Request examples

### Basic request

```http
GET /tasks HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
```

### With pagination

```http
GET /tasks?_page=0&_perPage=10 HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
```

### With sorting

```http
GET /tasks?_sort=dueDate HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
```

### With status filtering

```http
GET /tasks?taskStatus=IN_PROGRESS HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
```

### Combined parameters

```http
GET /tasks?_page=0&_perPage=10&_sort=-dueDate&taskStatus=NOT_STARTED HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
```

## Response

### Success response (200 OK)

```json
{
  "tasks": [
    {
      "taskId": 1,
      "userId": 1,
      "taskTitle": "Grocery shopping",
      "taskDescription": "eggs, bacon, gummy bears",
      "taskStatus": "NOT_STARTED",
      "dueDate": "2025-05-20T17:00:00-05:00",
      "warningOffset": 60
    },
    {
      "taskId": 2,
      "userId": 1,
      "taskTitle": "Piano recital",
      "taskDescription": "Daughter's first concert appearance",
      "taskStatus": "IN_PROGRESS",
      "dueDate": "2025-04-02T15:00:00-05:00",
      "warningOffset": 30
    },
    {
      "taskId": 3,
      "userId": 2,
      "taskTitle": "Oil change",
      "taskDescription": "5K auto service",
      "taskStatus": "COMPLETED",
      "dueDate": "2025-03-10T09:00:00-05:00",
      "warningOffset": 60
    },
    {
      "taskId": 4,
      "userId": 3,
      "taskTitle": "Get shots for dog",
      "taskDescription": "Annual vaccinations for poochy",
      "taskStatus": "DEFERRED",
      "dueDate": "2025-05-11T14:00:00-05:00",
      "warningOffset": 20
    }
  ]
}
```

### Error responses

| Status | Code | Description |
|--------|------|-------------|
| 400 | `INVALID_FIELD` | Invalid query parameter |
| 401 | `UNAUTHORIZED` | Authentication required |
| 403 | `FORBIDDEN` | Access denied |
| 429 | `RATE_LIMIT_EXCEEDED` | Too many requests |
| 500 | `SERVER_ERROR` | Server error |

For more information on error responses, see the [Error responses](error-responses.html) document.

## Response fields

The response contains an array of task objects, each with the following fields:

| Field | Type | Description |
|-------|------|-------------|
| `taskId` | integer | Unique identifier for the task |
| `userId` | integer | ID of the user who owns the task |
| `taskTitle` | string | Short description (1-80 characters) |
| `taskDescription` | string | Detailed description (1-255 characters) |
| `taskStatus` | string | Current status of the task |
| `dueDate` | string (date-time) | When the task should be completed |
| `warningOffset` | integer | Minutes before due date to send reminder |

For more information about the task resource, see the [Task resource](../resources/task-resource.html) document.

## Empty results

If no tasks match the criteria or if the page is beyond available data, the API returns an empty array:

```json
{
  "tasks": []
}
```

## Code examples

### cURL

```bash
curl -X GET \
  'http://localhost:3000/tasks?_page=0&_perPage=10&_sort=-dueDate&taskStatus=NOT_STARTED' \
  -H 'Authorization: Bearer YOUR_TOKEN'
```

### JavaScript

```javascript
async function getAllTasks(page = 0, perPage = 20, sort = null, status = null) {
  const url = new URL('http://localhost:3000/tasks');
  
  url.searchParams.append('_page', page);
  url.searchParams.append('_perPage', perPage);
  
  if (sort) {
    url.searchParams.append('_sort', sort);
  }
  
  if (status) {
    url.searchParams.append('taskStatus', status);
  }
  
  const response = await fetch(url, {
    method: 'GET',
    headers: {
      'Authorization': 'Bearer YOUR_TOKEN',
      'Content-Type': 'application/json'
    }
  });
  
  if (!response.ok) {
    const error = await response.json();
    throw new Error(error.message);
  }
  
  return await response.json();
}

// Example usage
getAllTasks(0, 10, '-dueDate', 'NOT_STARTED')
  .then(data => console.log('Tasks:', data.tasks))
  .catch(error => console.error('Failed to fetch tasks:', error));
```

### Python

```python
import requests

def get_all_tasks(page=0, per_page=20, sort=None, status=None):
    url = 'http://localhost:3000/tasks'
    
    params = {
        '_page': page,
        '_perPage': per_page
    }
    
    if sort:
        params['_sort'] = sort
    
    if status:
        params['taskStatus'] = status
    
    headers = {
        'Authorization': 'Bearer YOUR_TOKEN',
        'Content-Type': 'application/json'
    }
    
    response = requests.get(url, params=params, headers=headers)
    
    if response.status_code != 200:
        error = response.json()
        raise Exception(error['message'])
    
    return response.json()

# Example usage
try:
    result = get_all_tasks(page=0, per_page=10, sort='-dueDate', status='NOT_STARTED')
    print('Tasks:', result['tasks'])
except Exception as e:
    print('Failed to fetch tasks:', str(e))
```

## Common use cases

### Task list view

Retrieve all tasks for display in a list view, sorted by due date:

```http
GET /tasks?_sort=dueDate HTTP/1.1
```

### Filtering by status

Retrieve only tasks with a specific status, such as those in progress:

```http
GET /tasks?taskStatus=IN_PROGRESS HTTP/1.1
```

### Finding urgent tasks

Retrieve tasks sorted by due date to identify those that need attention soon:

```http
GET /tasks?_sort=dueDate&_perPage=5 HTTP/1.1
```

## Related resources

- [Task resource](../resources/task-resource.html) - Detailed information about the task resource
- [Create a task](create-task.html) - Create a new task
- [Get task by ID](get-task-by-id.html) - Retrieve a specific task
- [Update a task](update-task.html) - Update an existing task
- [Delete a task](delete-task.html) - Remove a task

## See also

- [Pagination](../core-concepts/pagination.html) - Detailed information about pagination
- [Sorting](../core-concepts/sorting.html) - Detailed information about sorting
- [Task status lifecycle](../core-concepts/task-status-lifecycle.html) - Understanding task statuses
- [Error handling](../core-concepts/error-handling.html) - How to handle API errors

--- FILE: api-reference/create-task.md
---
title: "Create a task"
description: "API endpoint to create a new task in the system."
tags: ["tasks", "endpoint", "POST"]
categories: ["api-reference"]
importance: 7
api_endpoints: ["/tasks"]
related_pages: ["task-resource", "task-status-lifecycle"]
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 12, 2025"
navOrder: 8
---

# Create a task

The `POST /tasks` endpoint creates a new task in the system. This endpoint allows you to add a task that belongs to a specific user with details such as title, description, due date, and warning offset.

## Endpoint

```
POST /tasks
```

## Authentication

This endpoint requires authentication. Include the bearer token in the request header:

```
Authorization: Bearer YOUR_TOKEN
```

## Request body

The request body must be a JSON object with the following properties:

| Property | Type | Required | Description | Constraints |
|----------|------|----------|-------------|-------------|
| `userId` | integer | Yes | ID of the user who owns the task | Must reference existing user |
| `taskTitle` | string | Yes | Short description of the task | 1-80 characters |
| `taskDescription` | string | No | Detailed description of the task | 1-255 characters |
| `taskStatus` | string | No | Current status of the task | One of predefined values |
| `dueDate` | string (date-time) | Yes | When the task should be completed | ISO 8601 format |
| `warningOffset` | integer | Yes | Minutes before due date to send reminder | 0-64000 |

### Default values

- `taskStatus`: If not provided, defaults to `NOT_STARTED`

### Example request body

```json
{
  "userId": 1,
  "taskTitle": "Complete API documentation",
  "taskDescription": "Finish the task management API documentation for the developer portal",
  "dueDate": "2025-05-15T17:00:00-05:00",
  "warningOffset": 60
}
```

## Request example

```http
POST /tasks HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
Content-Type: application/json

{
  "userId": 1,
  "taskTitle": "Complete API documentation",
  "taskDescription": "Finish the task management API documentation for the developer portal",
  "dueDate": "2025-05-15T17:00:00-05:00",
  "warningOffset": 60
}
```

## Response

### Success response (201 Created)

If the task is created successfully, the API returns a `201 Created` status code and the complete task object, including the system-generated `taskId` and default values for any omitted fields:

```json
{
  "taskId": 5,
  "userId": 1,
  "taskTitle": "Complete API documentation",
  "taskDescription": "Finish the task management API documentation for the developer portal",
  "taskStatus": "NOT_STARTED",
  "dueDate": "2025-05-15T17:00:00-05:00",
  "warningOffset": 60
}
```

### Error responses

| Status | Code | Description |
|--------|------|-------------|
| 400 | `INVALID_FIELD` | One or more fields have invalid values |
| 400 | `MISSING_REQUIRED_FIELD` | A required field is missing |
| 400 | `INVALID_USER_ID` | The specified user doesn't exist |
| 401 | `UNAUTHORIZED` | Authentication required |
| 403 | `FORBIDDEN` | Access denied |
| 429 | `RATE_LIMIT_EXCEEDED` | Too many requests |
| 500 | `SERVER_ERROR` | Server error |

For more information on error responses, see the [Error responses](error-responses.html) document.

## Response fields

The response contains the newly created task object with the following fields:

| Field | Type | Description |
|-------|------|-------------|
| `taskId` | integer | System-generated unique identifier for the task |
| `userId` | integer | ID of the user who owns the task |
| `taskTitle` | string | Short description of the task |
| `taskDescription` | string | Detailed description of the task |
| `taskStatus` | string | Current status of the task |
| `dueDate` | string (date-time) | When the task should be completed |
| `warningOffset` | integer | Minutes before due date to send reminder |

For more information about the task resource, see the [Task resource](../resources/task-resource.html) document.

## Validation rules

The API applies the following validation rules when creating a task:

- `userId` must reference an existing user
- `taskTitle` must be between 1 and 80 characters
- `taskDescription` must be between 1 and 255 characters, if provided
- `taskStatus` must be one of the valid status values, if provided
- `dueDate` must be in ISO 8601 format
- `warningOffset` must be between 0 and 64000
- All required fields must be provided

If validation fails, the API returns a `400 Bad Request` response with details about the validation errors:

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

## Code examples

### cURL

```bash
curl -X POST \
  http://localhost:3000/tasks \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Content-Type: application/json' \
  -d '{
    "userId": 1,
    "taskTitle": "Complete API documentation",
    "taskDescription": "Finish the task management API documentation for the developer portal",
    "dueDate": "2025-05-15T17:00:00-05:00",
    "warningOffset": 60
  }'
```

### JavaScript

```javascript
async function createTask(taskData) {
  const response = await fetch('http://localhost:3000/tasks', {
    method: 'POST',
    headers: {
      'Authorization': 'Bearer YOUR_TOKEN',
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(taskData)
  });
  
  if (!response.ok) {
    const error = await response.json();
    throw new Error(error.message);
  }
  
  return await response.json();
}

// Example usage
const newTask = {
  userId: 1,
  taskTitle: "Complete API documentation",
  taskDescription: "Finish the task management API documentation for the developer portal",
  dueDate: "2025-05-15T17:00:00-05:00",
  warningOffset: 60
};

createTask(newTask)
  .then(task => console.log('Task created:', task))
  .catch(error => console.error('Failed to create task:', error));
```

### Python

```python
import requests
import json

def create_task(task_data):
    url = 'http://localhost:3000/tasks'
    
    headers = {
        'Authorization': 'Bearer YOUR_TOKEN',
        'Content-Type': 'application/json'
    }
    
    response = requests.post(url, headers=headers, json=task_data)
    
    if response.status_code != 201:
        error = response.json()
        raise Exception(error['message'])
    
    return response.json()

# Example usage
new_task = {
    "userId": 1,
    "taskTitle": "Complete API documentation",
    "taskDescription": "Finish the task management API documentation for the developer portal",
    "dueDate": "2025-05-15T17:00:00-05:00",
    "warningOffset": 60
}

try:
    task = create_task(new_task)
    print('Task created:', task)
except Exception as e:
    print('Failed to create task:', str(e))
```

## Common use cases

### Basic task creation

Create a simple task with just the required fields:

```json
{
  "userId": 1,
  "taskTitle": "Buy groceries",
  "dueDate": "2025-05-20T17:00:00-05:00",
  "warningOffset": 60
}
```

### Detailed task with specific status

Create a task with all fields and a specific initial status:

```json
{
  "userId": 1,
  "taskTitle": "Prepare quarterly report",
  "taskDescription": "Gather data, create charts, write executive summary",
  "taskStatus": "IN_PROGRESS",
  "dueDate": "2025-06-30T17:00:00-05:00",
  "warningOffset": 1440
}
```

## Next steps

After creating a task, you can:

- [Get task by ID](get-task-by-id.html) to retrieve the task
- [Update a task](update-task.html) to modify the task
- [Get all tasks](get-all-tasks.html) to view all tasks

## Related resources

- [Task resource](../resources/task-resource.html) - Detailed information about the task resource
- [Task status lifecycle](../core-concepts/task-status-lifecycle.html) - Understanding task statuses
- [User resource](../resources/user-resource.html) - Information about the user resource
- [Get all tasks](get-all-tasks.html) - Retrieve a list of all tasks
- [Get task by ID](get-task-by-id.html) - Retrieve a specific task
- [Update a task](update-task.html) - Update an existing task
- [Delete a task](delete-task.html) - Remove a task

## See also

- [Error handling](../core-concepts/error-handling.html) - How to handle API errors
- [Task management workflow](../tutorials/task-management-workflow.html) - Tutorial on task management

--- FILE: api-reference/get-task-by-id.md
---
title: "Get task by ID"
description: "API endpoint to retrieve a specific task by its unique identifier."
tags: ["tasks", "endpoint", "GET"]
categories: ["api-reference"]
importance: 7
api_endpoints: ["/tasks/{taskId}"]
related_pages: ["task-resource"]
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 12, 2025"
navOrder: 9
---

# Get task by ID

The `GET /tasks/{taskId}` endpoint retrieves a specific task by its unique identifier. This endpoint allows you to fetch detailed information about a single task.

## Endpoint

```
GET /tasks/{taskId}
```

## Authentication

This endpoint requires authentication. Include the bearer token in the request header:

```
Authorization: Bearer YOUR_TOKEN
```

## Path parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `taskId` | integer | Yes | The unique identifier of the task to retrieve |

## Request example

```http
GET /tasks/1 HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
```

## Response

### Success response (200 OK)

If the task exists, the API returns a `200 OK` status code and the task object:

```json
{
  "taskId": 1,
  "userId": 1,
  "taskTitle": "Grocery shopping",
  "taskDescription": "eggs, bacon, gummy bears",
  "taskStatus": "NOT_STARTED",
  "dueDate": "2025-05-20T17:00:00-05:00",
  "warningOffset": 60
}
```

### Error responses

| Status | Code | Description |
|--------|------|-------------|
| 400 | `INVALID_FIELD` | Invalid `taskId` format |
| 401 | `UNAUTHORIZED` | Authentication required |
| 403 | `FORBIDDEN` | Access denied |
| 404 | `RESOURCE_NOT_FOUND` | Task not found |
| 429 | `RATE_LIMIT_EXCEEDED` | Too many requests |
| 500 | `SERVER_ERROR` | Server error |

For more information on error responses, see the [Error responses](error-responses.html) document.

#### Not found response example (404)

```json
{
  "code": "RESOURCE_NOT_FOUND",
  "message": "Task with ID 999 could not be found",
  "requestId": "req-f8d31a62-e789-4856-9452-5efa50223c7a"
}
```

## Response fields

The response contains the task object with the following fields:

| Field | Type | Description |
|-------|------|-------------|
| `taskId` | integer | Unique identifier for the task |
| `userId` | integer | ID of the user who owns the task |
| `taskTitle` | string | Short description of the task |
| `taskDescription` | string | Detailed description of the task |
| `taskStatus` | string | Current status of the task |
| `dueDate` | string (date-time) | When the task should be completed |
| `warningOffset` | integer | Minutes before due date to send reminder |

For more information about the task resource, see the [Task resource](../resources/task-resource.html) document.

## Common use cases

### Task detail view

Retrieve a task's details to display in a detail view or edit form in your application.

### Task verification

Verify if a task exists before performing operations that require a valid task.

### Task status check

Check the current status of a specific task.

## Code examples

### cURL

```bash
curl -X GET \
  http://localhost:3000/tasks/1 \
  -H 'Authorization: Bearer YOUR_TOKEN'
```

### JavaScript

```javascript
async function getTaskById(taskId) {
  const response = await fetch(`http://localhost:3000/tasks/${taskId}`, {
    method: 'GET',
    headers: {
      'Authorization': 'Bearer YOUR_TOKEN',
      'Content-Type': 'application/json'
    }
  });
  
  if (!response.ok) {
    const error = await response.json();
    throw new Error(error.message);
  }
  
  return await response.json();
}

// Example usage
getTaskById(1)
  .then(task => console.log('Task:', task))
  .catch(error => console.error('Failed to get task:', error));
```

### Python

```python
import requests

def get_task_by_id(task_id):
    url = f'http://localhost:3000/tasks/{task_id}'
    
    headers = {
        'Authorization': 'Bearer YOUR_TOKEN',
        'Content-Type': 'application/json'
    }
    
    response = requests.get(url, headers=headers)
    
    if response.status_code != 200:
        error = response.json()
        raise Exception(error['message'])
    
    return response.json()

# Example usage
try:
    task = get_task_by_id(1)
    print('Task:', task)
except Exception as e:
    print('Failed to get task:', str(e))
```

## Error handling

When calling this endpoint, be prepared to handle the following common errors:

### Task not found

If the specified `taskId` does not exist, the API returns a `404 Not Found` response. Your application should handle this gracefully, for example by displaying a "Task not found" message to the user.

### Invalid task ID format

If the `taskId` is not a valid integer, the API returns a `400 Bad Request` response. Your application should validate the task ID before making the request.

## Related resources

- [Task resource](../resources/task-resource.html) - Detailed information about the task resource
- [Get all tasks](get-all-tasks.html) - Retrieve a list of all tasks
- [Create a task](create-task.html) - Create a new task
- [Update a task](update-task.html) - Update an existing task
- [Delete a task](delete-task.html) - Remove a task

## See also

- [Error handling](../core-concepts/error-handling.html) - How to handle API errors
- [Task management workflow](../tutorials/task-management-workflow.html) - Tutorial on task management
- [Task status lifecycle](../core-concepts/task-status-lifecycle.html) - Understanding task statuses

--- FILE: api-reference/update-task.md
---
title: "Update a task"
description: "API endpoint to update an existing task's information, including changing its status."
tags: ["tasks", "endpoint", "PATCH"]
categories: ["api-reference"]
importance: 7
api_endpoints: ["/tasks/{taskId}"]
related_pages: ["task-resource", "task-status-lifecycle"]
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 12, 2025"
navOrder: 10
---

# Update a task

The `PATCH /tasks/{taskId}` endpoint updates one or more properties of an existing task. This endpoint supports partial updates, allowing you to modify specific fields without affecting the others.

## Endpoint

```
PATCH /tasks/{taskId}
```

## Authentication

This endpoint requires authentication. Include the bearer token in the request header:

```
Authorization: Bearer YOUR_TOKEN
```

## Path parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `taskId` | integer | Yes | The unique identifier of the task to update |

## Request body

The request body should be a JSON object containing one or more task properties to update:

| Property | Type | Required | Description | Constraints |
|----------|------|----------|-------------|-------------|
| `userId` | integer | No | ID of the user who owns the task | Must reference existing user |
| `taskTitle` | string | No | Short description of the task | 1-80 characters |
| `taskDescription` | string | No | Detailed description of the task | 1-255 characters |
| `taskStatus` | string | No | Current status of the task | One of predefined values |
| `dueDate` | string (date-time) | No | When the task should be completed | ISO 8601 format |
| `warningOffset` | integer | No | Minutes before due date to send reminder | 0-64000 |

At least one property must be included in the request.

### Example request body

```json
{
  "taskStatus": "IN_PROGRESS"
}
```

## Request example

```http
PATCH /tasks/1 HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
Content-Type: application/json

{
  "taskStatus": "IN_PROGRESS"
}
```

## Response

### Success response (200 OK)

If the task is updated successfully, the API returns a `200 OK` status code and the complete updated task object:

```json
{
  "taskId": 1,
  "userId": 1,
  "taskTitle": "Grocery shopping",
  "taskDescription": "eggs, bacon, gummy bears",
  "taskStatus": "IN_PROGRESS",
  "dueDate": "2025-05-20T17:00:00-05:00",
  "warningOffset": 60
}
```

### Error responses

| Status | Code | Description |
|--------|------|-------------|
| 400 | `INVALID_FIELD` | One or more fields have invalid values |
| 400 | `MISSING_REQUIRED_FIELD` | No fields provided for update |
| 400 | `INVALID_USER_ID` | The specified user doesn't exist |
| 400 | `INVALID_STATUS` | The specified status is not valid |
| 401 | `UNAUTHORIZED` | Authentication required |
| 403 | `FORBIDDEN` | Access denied |
| 404 | `RESOURCE_NOT_FOUND` | Task not found |
| 429 | `RATE_LIMIT_EXCEEDED` | Too many requests |
| 500 | `SERVER_ERROR` | Server error |

For more information on error responses, see the [Error responses](error-responses.html) document.

#### Invalid status example (400)

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

#### Task not found example (404)

```json
{
  "code": "RESOURCE_NOT_FOUND",
  "message": "Task with ID 999 could not be found",
  "requestId": "req-f8d31a62-e789-4856-9452-5efa50223c7a"
}
```

## Response fields

The response contains the updated task object with the following fields:

| Field | Type | Description |
|-------|------|-------------|
| `taskId` | integer | Unique identifier for the task |
| `userId` | integer | ID of the user who owns the task |
| `taskTitle` | string | Short description of the task |
| `taskDescription` | string | Detailed description of the task |
| `taskStatus` | string | Current status of the task |
| `dueDate` | string (date-time) | When the task should be completed |
| `warningOffset` | integer | Minutes before due date to send reminder |

For more information about the task resource, see the [Task resource](../resources/task-resource.html) document.

## Validation rules

The API applies the following validation rules when updating a task:

- At least one field must be provided for update
- `userId` must reference an existing user, if provided
- `taskTitle` must be between 1 and 80 characters, if provided
- `taskDescription` must be between 1 and 255 characters, if provided
- `taskStatus` must be one of the valid status values, if provided
- `dueDate` must be in ISO 8601 format, if provided
- `warningOffset` must be between 0 and 64000, if provided

If validation fails, the API returns a `400 Bad Request` response with details about the validation errors.

## Update behavior

- The update is partial, meaning only the fields included in the request will be modified
- Omitted fields retain their current values
- The `taskId` cannot be modified
- The response includes the complete task object with all fields, including those not modified

## Code examples

### cURL

```bash
curl -X PATCH \
  http://localhost:3000/tasks/1 \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Content-Type: application/json' \
  -d '{
    "taskStatus": "IN_PROGRESS"
  }'
```

### JavaScript

```javascript
async function updateTask(taskId, taskData) {
  const response = await fetch(`http://localhost:3000/tasks/${taskId}`, {
    method: 'PATCH',
    headers: {
      'Authorization': 'Bearer YOUR_TOKEN',
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(taskData)
  });
  
  if (!response.ok) {
    const error = await response.json();
    throw new Error(error.message);
  }
  
  return await response.json();
}

// Example usage
const taskUpdates = {
  taskStatus: "IN_PROGRESS"
};

updateTask(1, taskUpdates)
  .then(task => console.log('Task updated:', task))
  .catch(error => console.error('Failed to update task:', error));
```

### Python

```python
import requests

def update_task(task_id, task_data):
    url = f'http://localhost:3000/tasks/{task_id}'
    
    headers = {
        'Authorization': 'Bearer YOUR_TOKEN',
        'Content-Type': 'application/json'
    }
    
    response = requests.patch(url, headers=headers, json=task_data)
    
    if response.status_code != 200:
        error = response.json()
        raise Exception(error['message'])
    
    return response.json()

# Example usage
task_updates = {
    "taskStatus": "IN_PROGRESS"
}

try:
    task = update_task(1, task_updates)
    print('Task updated:', task)
except Exception as e:
    print('Failed to update task:', str(e))
```

## Common use cases

### Update task status

The most common use case is updating a task's status as it progresses through its lifecycle:

```json
{
  "taskStatus": "COMPLETED"
}
```

For more information about task status values and transitions, see the [Task status lifecycle](../core-concepts/task-status-lifecycle.html) document.

### Update due date

Adjust a task's due date when a deadline changes:

```json
{
  "dueDate": "2025-06-01T17:00:00-05:00"
}
```

### Update task description

Add or modify details in a task's description:

```json
{
  "taskDescription": "Updated task description with more details"
}
```

### Transfer task to another user

Change the user who owns the task:

```json
{
  "userId": 2
}
```

## Related resources

- [Task resource](../resources/task-resource.html) - Detailed information about the task resource
- [Task status lifecycle](../core-concepts/task-status-lifecycle.html) - Understanding task statuses
- [Get all tasks](get-all-tasks.html) - Retrieve a list of all tasks
- [Get task by ID](get-task-by-id.html) - Retrieve a specific task
- [Create a task](create-task.html) - Create a new task
- [Delete a task](delete-task.html) - Remove a task

## See also

- [Error handling](../core-concepts/error-handling.html) - How to handle API errors
- [Task management workflow](../tutorials/task-management-workflow.html) - Tutorial on task management

--- FILE: api-reference/delete-task.md
---
title: "Delete a task"
description: "API endpoint to remove a task from the system."
tags: ["tasks", "endpoint", "DELETE"]
categories: ["api-reference"]
importance: 7
api_endpoints: ["/tasks/{taskId}"]
related_pages: ["task-resource"]
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 12, 2025"
navOrder: 11
---

# Delete a task

The `DELETE /tasks/{taskId}` endpoint removes a specific task from the system. This endpoint permanently deletes the task.

## Endpoint

```
DELETE /tasks/{taskId}
```

## Authentication

This endpoint requires authentication. Include the bearer token in the request header:

```
Authorization: Bearer YOUR_TOKEN
```

## Path parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `taskId` | integer | Yes | The unique identifier of the task to delete |

## Request example

```http
DELETE /tasks/1 HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
```

## Response

### Success response (204 No Content)

If the task is deleted successfully, the API returns a `204 No Content` status code with no response body.

### Error responses

| Status | Code | Description |
|--------|------|-------------|
| 400 | `INVALID_FIELD` | Invalid `taskId` format |
| 401 | `UNAUTHORIZED` | Authentication required |
| 403 | `FORBIDDEN` | Access denied |
| 404 | `RESOURCE_NOT_FOUND` | Task not found |
| 429 | `RATE_LIMIT_EXCEEDED` | Too many requests |
| 500 | `SERVER_ERROR` | Server error |

For more information on error responses, see the [Error responses](error-responses.html) document.

#### Task not found example (404)

```json
{
  "code": "RESOURCE_NOT_FOUND",
  "message": "Task with ID 999 could not be found",
  "requestId": "req-f8d31a62-e789-4856-9452-5efa50223c7a"
}
```

## Important considerations

- This operation cannot be undone
- The task will be permanently deleted
- The `taskId` cannot be reused for new tasks
- Consider using the `CANCELLED` or `COMPLETED` status instead of deletion for tasks that need to be preserved for historical purposes

## Code examples

### cURL

```bash
curl -X DELETE \
  http://localhost:3000/tasks/1 \
  -H 'Authorization: Bearer YOUR_TOKEN'
```

### JavaScript

```javascript
async function deleteTask(taskId) {
  const response = await fetch(`http://localhost:3000/tasks/${taskId}`, {
    method: 'DELETE',
    headers: {
      'Authorization': 'Bearer YOUR_TOKEN'
    }
  });
  
  if (!response.ok) {
    const error = await response.json();
    throw new Error(error.message);
  }
  
  // Success response has no content
  return true;
}

// Example usage
deleteTask(1)
  .then(() => console.log('Task deleted successfully'))
  .catch(error => console.error('Failed to delete task:', error));
```

### Python

```python
import requests

def delete_task(task_id):
    url = f'http://localhost:3000/tasks/{task_id}'
    
    headers = {
        'Authorization': 'Bearer YOUR_TOKEN'
    }
    
    response = requests.delete(url, headers=headers)
    
    if response.status_code != 204:
        error = response.json()
        raise Exception(error['message'])
    
    # Success response has no content
    return True

# Example usage
try:
    delete_task(1)
    print('Task deleted successfully')
except Exception as e:
    print('Failed to delete task:', str(e))
```

## Common use cases

### Task cleanup

Remove completed or cancelled tasks that are no longer needed.

### Error correction

Delete tasks that were created by mistake.

### Privacy compliance

Remove tasks containing sensitive or personal information when no longer needed.

## Alternatives to deletion

Instead of deleting tasks, consider these alternatives:

1. **Update the status**: Mark tasks as `COMPLETED` or `CANCELLED` to preserve the history
   ```http
   PATCH /tasks/1 HTTP/1.1
   Content-Type: application/json
   
   {
     "taskStatus": "COMPLETED"
   }
   ```

2. **Archive functionality**: Implement client-side archiving to hide tasks without deleting them

## Best practices

- Confirm the deletion with the user before making this request, as it cannot be undone
- Consider implementing a "soft delete" in your application logic if you need to preserve task history
- Handle the 404 error gracefully if the task has already been deleted

## Related resources

- [Task resource](../resources/task-resource.html) - Detailed information about the task resource
- [Get all tasks](get-all-tasks.html) - Retrieve a list of all tasks
- [Get task by ID](get-task-by-id.html) - Retrieve a specific task
- [Create a task](create-task.html) - Create a new task
- [Update a task](update-task.html) - Update an existing task

## See also

- [Error handling](../core-concepts/error-handling.html) - How to handle API errors
- [Task management workflow](../tutorials/task-management-workflow.html) - Tutorial on task management
- [Task status lifecycle](../core-concepts/task-status-lifecycle.html) - Understanding task statuses

--- FILE: tutorials/getting-started-with-users.md
---
title: "Getting started with users"
description: "A practical guide to creating, listing, updating, and deleting users in the Task Management API."
tags: ["tutorial", "users"]
categories: ["tutorials"]
importance: 6
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 12, 2025"
navOrder: 1
---

# Getting started with users

This tutorial guides you through common operations for managing users in the Task Management API. You'll learn how to create, list, retrieve, update, and delete user resources.

## Prerequisites

Before you begin, make sure you have:

- An API client (like cURL, Postman, or your own code)
- A valid authentication token for the API
- Understanding of basic HTTP request methods (GET, POST, PATCH, DELETE)
- Familiarity with JSON data format

## Step 1: Create a user

Let's start by creating a new user. Send a POST request to the `/users` endpoint with the required user information.

### Request

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

### Response

```json
{
  "userId": 1,
  "firstName": "John",
  "lastName": "Doe",
  "contactEmail": "john.doe@example.com"
}
```

The API has assigned a unique `userId` to your new user. Make note of this ID as you'll need it for subsequent operations.

### Code example

```javascript
// Create a user
async function createUser() {
  const userData = {
    firstName: "John",
    lastName: "Doe",
    contactEmail: "john.doe@example.com"
  };
  
  const response = await fetch('http://localhost:3000/users', {
    method: 'POST',
    headers: {
      'Authorization': 'Bearer YOUR_TOKEN',
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(userData)
  });
  
  if (!response.ok) {
    throw new Error(`Error: ${response.status}`);
  }
  
  const user = await response.json();
  console.log('User created:', user);
  return user;
}
```

## Step 2: Retrieve all users

Next, let's retrieve a list of all users in the system. Send a GET request to the `/users` endpoint.

### Request

```http
GET /users HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
```

### Response

```json
{
  "users": [
    {
      "userId": 1,
      "firstName": "John",
      "lastName": "Doe",
      "contactEmail": "john.doe@example.com"
    }
  ]
}
```

### With pagination

For systems with many users, you can use pagination parameters to limit the results:

```http
GET /users?_page=0&_perPage=10 HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
```

### Code example

```javascript
// Get all users
async function getAllUsers(page = 0, perPage = 10) {
  const response = await fetch(`http://localhost:3000/users?_page=${page}&_perPage=${perPage}`, {
    method: 'GET',
    headers: {
      'Authorization': 'Bearer YOUR_TOKEN'
    }
  });
  
  if (!response.ok) {
    throw new Error(`Error: ${response.status}`);
  }
  
  const data = await response.json();
  console.log('Users:', data.users);
  return data.users;
}
```

## Step 3: Retrieve a specific user

To get details for a specific user, send a GET request to `/users/{userId}` with the user's ID.

### Request

```http
GET /users/1 HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
```

### Response

```json
{
  "userId": 1,
  "firstName": "John",
  "lastName": "Doe",
  "contactEmail": "john.doe@example.com"
}
```

### Code example

```javascript
// Get a specific user
async function getUser(userId) {
  const response = await fetch(`http://localhost:3000/users/${userId}`, {
    method: 'GET',
    headers: {
      'Authorization': 'Bearer YOUR_TOKEN'
    }
  });
  
  if (!response.ok) {
    throw new Error(`Error: ${response.status}`);
  }
  
  const user = await response.json();
  console.log('User details:', user);
  return user;
}
```

## Step 4: Update a user

To update an existing user, send a PATCH request to `/users/{userId}` with the fields you want to change.

### Request

```http
PATCH /users/1 HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
Content-Type: application/json

{
  "contactEmail": "new.email@example.com"
}
```

### Response

```json
{
  "userId": 1,
  "firstName": "John",
  "lastName": "Doe",
  "contactEmail": "new.email@example.com"
}
```

The API returns the complete updated user object. Notice that only the `contactEmail` field was changed, while other fields remain the same.

### Code example

```javascript
// Update a user
async function updateUser(userId, updateData) {
  const response = await fetch(`http://localhost:3000/users/${userId}`, {
    method: 'PATCH',
    headers: {
      'Authorization': 'Bearer YOUR_TOKEN',
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(updateData)
  });
  
  if (!response.ok) {
    throw new Error(`Error: ${response.status}`);
  }
  
  const updatedUser = await response.json();
  console.log('User updated:', updatedUser);
  return updatedUser;
}

// Example usage
updateUser(1, { contactEmail: "new.email@example.com" });
```

## Step 5: Delete a user

To remove a user, send a DELETE request to `/users/{userId}`.

### Request

```http
DELETE /users/1 HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
```

### Response

A successful deletion returns a `204 No Content` status code with no response body.

### Code example

```javascript
// Delete a user
async function deleteUser(userId) {
  const response = await fetch(`http://localhost:3000/users/${userId}`, {
    method: 'DELETE',
    headers: {
      'Authorization': 'Bearer YOUR_TOKEN'
    }
  });
  
  if (!response.ok) {
    throw new Error(`Error: ${response.status}`);
  }
  
  console.log('User deleted successfully');
  return true;
}
```

## Handling errors

The API returns appropriate error responses when operations fail. Always check for error responses in your code.

### Common errors

- `400 Bad Request`: Invalid input data (e.g., missing required fields)
- `404 Not Found`: User not found
- `401 Unauthorized`: Authentication token missing or invalid
- `403 Forbidden`: Permission denied

### Error response example

```json
{
  "code": "RESOURCE_NOT_FOUND",
  "message": "User with ID 999 could not be found",
  "requestId": "req-f8d31a62-e789-4856-9452-5efa50223c7a"
}
```

### Error handling example

```javascript
async function getUserSafely(userId) {
  try {
    const response = await fetch(`http://localhost:3000/users/${userId}`, {
      method: 'GET',
      headers: {
        'Authorization': 'Bearer YOUR_TOKEN'
      }
    });
    
    if (!response.ok) {
      const error = await response.json();
      console.error(`Error ${response.status}: ${error.message}`);
      return null;
    }
    
    return await response.json();
  } catch (error) {
    console.error('Failed to fetch user:', error);
    return null;
  }
}
```

## Complete user management example

Here's a complete example that demonstrates all the user management operations:

```javascript
// User management functions
const API_BASE_URL = 'http://localhost:3000';
const TOKEN = 'YOUR_TOKEN';

async function apiRequest(endpoint, method, data = null) {
  const options = {
    method: method,
    headers: {
      'Authorization': `Bearer ${TOKEN}`,
      'Content-Type': 'application/json'
    }
  };
  
  if (data && (method === 'POST' || method === 'PATCH')) {
    options.body = JSON.stringify(data);
  }
  
  const response = await fetch(`${API_BASE_URL}${endpoint}`, options);
  
  if (response.status === 204) {
    return true; // No content but successful
  }
  
  if (!response.ok) {
    const error = await response.json();
    throw new Error(`API Error: ${error.message}`);
  }
  
  return await response.json();
}

// User management operations
async function createUser(userData) {
  return apiRequest('/users', 'POST', userData);
}

async function getAllUsers(page = 0, perPage = 10) {
  const result = await apiRequest(`/users?_page=${page}&_perPage=${perPage}`, 'GET');
  return result.users;
}

async function getUserById(userId) {
  return apiRequest(`/users/${userId}`, 'GET');
}

async function updateUser(userId, userData) {
  return apiRequest(`/users/${userId}`, 'PATCH', userData);
}

async function deleteUser(userId) {
  return apiRequest(`/users/${userId}`, 'DELETE');
}

// Example usage
async function userManagementExample() {
  try {
    // Create a user
    console.log('Creating a user...');
    const newUser = await createUser({
      firstName: "Jane",
      lastName: "Smith",
      contactEmail: "jane.smith@example.com"
    });
    console.log('User created:', newUser);
    
    // Get all users
    console.log('\nGetting all users...');
    const users = await getAllUsers();
    console.log('All users:', users);
    
    // Get user by ID
    console.log(`\nGetting user ${newUser.userId}...`);
    const user = await getUserById(newUser.userId);
    console.log('User details:', user);
    
    // Update user
    console.log(`\nUpdating user ${newUser.userId}...`);
    const updatedUser = await updateUser(newUser.userId, {
      firstName: "Janet"
    });
    console.log('Updated user:', updatedUser);
    
    // Delete user
    console.log(`\nDeleting user ${newUser.userId}...`);
    await deleteUser(newUser.userId);
    console.log('User deleted successfully');
    
  } catch (error) {
    console.error('Error:', error.message);
  }
}

// Run the example
userManagementExample();
```

## Next steps

Now that you understand how to manage users, you can:

1. Create a user interface for user management
2. Implement user authentication in your application
3. Learn how to [create and manage tasks](task-management-workflow.html) for users
4. Explore more advanced topics like [pagination](../core-concepts/pagination.html) and [sorting](../core-concepts/sorting.html)

## Related resources

- [User resource](../resources/user-resource.html) - Detailed information about the user resource
- [API reference](../api-reference/get-all-users.html) - Complete API reference for user endpoints
- [Error handling](../core-concepts/error-handling.html) - In-depth guide to API error handling

--- FILE: tutorials/task-management-workflow.md
---
title: "Task management workflow"
description: "A guide to implementing a complete task management workflow using the API, from creation to completion."
tags: ["tutorial", "tasks", "workflow"]
categories: ["tutorials"]
importance: 6
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 12, 2025"
navOrder: 2
---

# Task management workflow

This tutorial guides you through implementing a complete task management workflow using the Task Management API. You'll learn how to create, track, update, and complete tasks as part of a cohesive workflow.

## Overview

A typical task management workflow includes these stages:

1. Creating a new task
2. Viewing and tracking tasks
3. Starting work on a task
4. Handling obstacles
5. Completing or cancelling tasks

We'll implement each stage using the appropriate API endpoints.

## Prerequisites

Before you begin, make sure you have:

- An API client (like cURL, Postman, or your own code)
- A valid authentication token for the API
- At least one user created in the system (see [Getting started with users](getting-started-with-users.html))
- Understanding of the [task status lifecycle](../core-concepts/task-status-lifecycle.html)

## Stage 1: Creating a new task

The first step in any task workflow is creating the task. We'll create a task with the initial status `NOT_STARTED`.

### Request

```http
POST /tasks HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
Content-Type: application/json

{
  "userId": 1,
  "taskTitle": "Prepare quarterly report",
  "taskDescription": "Gather data, create charts, write executive summary",
  "dueDate": "2025-06-30T17:00:00-05:00",
  "warningOffset": 1440
}
```

### Response

```json
{
  "taskId": 1,
  "userId": 1,
  "taskTitle": "Prepare quarterly report",
  "taskDescription": "Gather data, create charts, write executive summary",
  "taskStatus": "NOT_STARTED",
  "dueDate": "2025-06-30T17:00:00-05:00",
  "warningOffset": 1440
}
```

The task is created with the default status `NOT_STARTED`. The `warningOffset` of 1440 minutes means you'll receive a reminder 24 hours before the due date.

### Code example

```javascript
async function createTask(taskData) {
  const response = await fetch('http://localhost:3000/tasks', {
    method: 'POST',
    headers: {
      'Authorization': 'Bearer YOUR_TOKEN',
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(taskData)
  });
  
  if (!response.ok) {
    const error = await response.json();
    throw new Error(error.message);
  }
  
  return await response.json();
}

// Example usage
const newTask = {
  userId: 1,
  taskTitle: "Prepare quarterly report",
  taskDescription: "Gather data, create charts, write executive summary",
  dueDate: "2025-06-30T17:00:00-05:00",
  warningOffset: 1440
};

createTask(newTask)
  .then(task => console.log('Task created:', task))
  .catch(error => console.error('Failed to create task:', error));
```

## Stage 2: Viewing and tracking tasks

After creating tasks, you'll need to view and track them. Let's retrieve all tasks for a specific status.

### Request

```http
GET /tasks?taskStatus=NOT_STARTED HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
```

### Response

```json
{
  "tasks": [
    {
      "taskId": 1,
      "userId": 1,
      "taskTitle": "Prepare quarterly report",
      "taskDescription": "Gather data, create charts, write executive summary",
      "taskStatus": "NOT_STARTED",
      "dueDate": "2025-06-30T17:00:00-05:00",
      "warningOffset": 1440
    },
    {
      "taskId": 2,
      "userId": 1,
      "taskTitle": "Review marketing materials",
      "taskDescription": "Check new brochures and website content",
      "taskStatus": "NOT_STARTED",
      "dueDate": "2025-06-15T12:00:00-05:00",
      "warningOffset": 120
    }
  ]
}
```

You can also retrieve tasks sorted by due date to prioritize your work:

```http
GET /tasks?_sort=dueDate HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
```

### Code example

```javascript
async function getTasks(status = null, sortBy = null) {
  let url = 'http://localhost:3000/tasks';
  const params = [];
  
  if (status) {
    params.push(`taskStatus=${status}`);
  }
  
  if (sortBy) {
    params.push(`_sort=${sortBy}`);
  }
  
  if (params.length > 0) {
    url += '?' + params.join('&');
  }
  
  const response = await fetch(url, {
    method: 'GET',
    headers: {
      'Authorization': 'Bearer YOUR_TOKEN'
    }
  });
  
  if (!response.ok) {
    const error = await response.json();
    throw new Error(error.message);
  }
  
  const data = await response.json();
  return data.tasks;
}

// Example: Get not started tasks sorted by due date
getTasks('NOT_STARTED', 'dueDate')
  .then(tasks => {
    console.log('Tasks to do (sorted by due date):', tasks);
  })
  .catch(error => console.error('Failed to get tasks:', error));
```

## Stage 3: Starting work on a task

When you begin working on a task, update its status to `IN_PROGRESS`.

### Request

```http
PATCH /tasks/1 HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
Content-Type: application/json

{
  "taskStatus": "IN_PROGRESS"
}
```

### Response

```json
{
  "taskId": 1,
  "userId": 1,
  "taskTitle": "Prepare quarterly report",
  "taskDescription": "Gather data, create charts, write executive summary",
  "taskStatus": "IN_PROGRESS",
  "dueDate": "2025-06-30T17:00:00-05:00",
  "warningOffset": 1440
}
```

The task status is now updated to `IN_PROGRESS`, indicating that work has begun.

### Code example

```javascript
async function updateTaskStatus(taskId, newStatus) {
  const response = await fetch(`http://localhost:3000/tasks/${taskId}`, {
    method: 'PATCH',
    headers: {
      'Authorization': 'Bearer YOUR_TOKEN',
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({ taskStatus: newStatus })
  });
  
  if (!response.ok) {
    const error = await response.json();
    throw new Error(error.message);
  }
  
  return await response.json();
}

// Example: Start working on a task
updateTaskStatus(1, 'IN_PROGRESS')
  .then(task => console.log('Task updated:', task))
  .catch(error => console.error('Failed to update task:', error));
```

## Stage 4: Handling obstacles

If you encounter an obstacle that prevents you from completing the task, update its status to `BLOCKED`.

### Request

```http
PATCH /tasks/1 HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
Content-Type: application/json

{
  "taskStatus": "BLOCKED",
  "taskDescription": "Gather data, create charts, write executive summary. BLOCKED: Waiting for financial data from accounting team."
}
```

### Response

```json
{
  "taskId": 1,
  "userId": 1,
  "taskTitle": "Prepare quarterly report",
  "taskDescription": "Gather data, create charts, write executive summary. BLOCKED: Waiting for financial data from accounting team.",
  "taskStatus": "BLOCKED",
  "dueDate": "2025-06-30T17:00:00-05:00",
  "warningOffset": 1440
}
```

Notice how we also updated the task description to include the reason for the blocked status. This is a good practice to provide context about the blocker.

### Code example

```javascript
async function blockTask(taskId, reason) {
  // Get the current task first
  const response = await fetch(`http://localhost:3000/tasks/${taskId}`, {
    method: 'GET',
    headers: {
      'Authorization': 'Bearer YOUR_TOKEN'
    }
  });
  
  if (!response.ok) {
    const error = await response.json();
    throw new Error(error.message);
  }
  
  const task = await response.json();
  
  // Update the description to include the reason for blocking
  const updatedDescription = task.taskDescription + ` BLOCKED: ${reason}`;
  
  // Update the task
  const updateResponse = await fetch(`http://localhost:3000/tasks/${taskId}`, {
    method: 'PATCH',
    headers: {
      'Authorization': 'Bearer YOUR_TOKEN',
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({
      taskStatus: 'BLOCKED',
      taskDescription: updatedDescription
    })
  });
  
  if (!updateResponse.ok) {
    const error = await updateResponse.json();
    throw new Error(error.message);
  }
  
  return await updateResponse.json();
}

// Example: Block a task
blockTask(1, 'Waiting for financial data from accounting team.')
  .then(task => console.log('Task blocked:', task))
  .catch(error => console.error('Failed to block task:', error));
```

Once the blocker is resolved, you can resume work by updating the status back to `IN_PROGRESS`:

```http
PATCH /tasks/1 HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
Content-Type: application/json

{
  "taskStatus": "IN_PROGRESS",
  "taskDescription": "Gather data, create charts, write executive summary. Received financial data from accounting team."
}
```

## Stage 5: Completing or cancelling tasks

When a task is finished, update its status to `COMPLETED`.

### Request

```http
PATCH /tasks/1 HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
Content-Type: application/json

{
  "taskStatus": "COMPLETED"
}
```

### Response

```json
{
  "taskId": 1,
  "userId": 1,
  "taskTitle": "Prepare quarterly report",
  "taskDescription": "Gather data, create charts, write executive summary. Received financial data from accounting team.",
  "taskStatus": "COMPLETED",
  "dueDate": "2025-06-30T17:00:00-05:00",
  "warningOffset": 1440
}
```

Alternatively, if a task is no longer relevant or needed, you can cancel it:

```http
PATCH /tasks/1 HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
Content-Type: application/json

{
  "taskStatus": "CANCELLED",
  "taskDescription": "Gather data, create charts, write executive summary. CANCELLED: Report format changed, using new template instead."
}
```

### Code example

```javascript
async function completeTask(taskId) {
  const response = await fetch(`http://localhost:3000/tasks/${taskId}`, {
    method: 'PATCH',
    headers: {
      'Authorization': 'Bearer YOUR_TOKEN',
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({ taskStatus: 'COMPLETED' })
  });
  
  if (!response.ok) {
    const error = await response.json();
    throw new Error(error.message);
  }
  
  return await response.json();
}

async function cancelTask(taskId, reason) {
  // Get the current task first
  const task = await getTaskById(taskId);
  
  // Update the description to include the cancellation reason
  const updatedDescription = task.taskDescription + ` CANCELLED: ${reason}`;
  
  const response = await fetch(`http://localhost:3000/tasks/${taskId}`, {
    method: 'PATCH',
    headers: {
      'Authorization': 'Bearer YOUR_TOKEN',
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({
      taskStatus: 'CANCELLED',
      taskDescription: updatedDescription
    })
  });
  
  if (!response.ok) {
    const error = await response.json();
    throw new Error(error.message);
  }
  
  return await response.json();
}
```

## Deferring tasks

If a task needs to be postponed, update its status to `DEFERRED` and possibly adjust the due date:

```http
PATCH /tasks/1 HTTP/1.1
Host: localhost:3000
Authorization: Bearer YOUR_TOKEN
Content-Type: application/json

{
  "taskStatus": "DEFERRED",
  "dueDate": "2025-07-15T17:00:00-05:00",
  "taskDescription": "Gather data, create charts, write executive summary. DEFERRED: Pushed to next month due to urgent project."
}
```

## Complete workflow example

Here's a complete example that demonstrates the entire task lifecycle:

```javascript
const API_BASE_URL = 'http://localhost:3000';
const TOKEN = 'YOUR_TOKEN';

// Helper function for API requests
async function apiRequest(endpoint, method, data = null) {
  const options = {
    method: method,
    headers: {
      'Authorization': `Bearer ${TOKEN}`,
      'Content-Type': 'application/json'
    }
  };
  
  if (data && (method === 'POST' || method === 'PATCH')) {
    options.body = JSON.stringify(data);
  }
  
  const response = await fetch(`${API_BASE_URL}${endpoint}`, options);
  
  if (!response.ok) {
    const error = await response.json();
    throw new Error(`API Error: ${error.message}`);
  }
  
  return await response.json();
}

// Task management functions
async function createTask(taskData) {
  return apiRequest('/tasks', 'POST', taskData);
}

async function getTaskById(taskId) {
  return apiRequest(`/tasks/${taskId}`, 'GET');
}

async function getTasks(status = null, sortBy = null) {
  let endpoint = '/tasks';
  const params = [];
  
  if (status) {
    params.push(`taskStatus=${status}`);
  }
  
  if (sortBy) {
    params.push(`_sort=${sortBy}`);
  }
  
  if (params.length > 0) {
    endpoint += '?' + params.join('&');
  }
  
  const result = await apiRequest(endpoint, 'GET');
  return result.tasks;
}

async function updateTask(taskId, taskData) {
  return apiRequest(`/tasks/${taskId}`, 'PATCH', taskData);
}

// Workflow functions
async function startTask(taskId) {
  return updateTask(taskId, { taskStatus: 'IN_PROGRESS' });
}

async function blockTask(taskId, reason) {
  const task = await getTaskById(taskId);
  const updatedDescription = task.taskDescription + ` BLOCKED: ${reason}`;
  
  return updateTask(taskId, {
    taskStatus: 'BLOCKED',
    taskDescription: updatedDescription
  });
}

async function resumeTask(taskId) {
  return updateTask(taskId, { taskStatus: 'IN_PROGRESS' });
}

async function completeTask(taskId) {
  return updateTask(taskId, { taskStatus: 'COMPLETED' });
}

async function cancelTask(taskId, reason) {
  const task = await getTaskById(taskId);
  const updatedDescription = task.taskDescription + ` CANCELLED: ${reason}`;
  
  return updateTask(taskId, {
    taskStatus: 'CANCELLED',
    taskDescription: updatedDescription
  });
}

async function deferTask(taskId, newDueDate, reason) {
  const task = await getTaskById(taskId);
  const updatedDescription = task.taskDescription + ` DEFERRED: ${reason}`;
  
  return updateTask(taskId, {
    taskStatus: 'DEFERRED',
    dueDate: newDueDate,
    taskDescription: updatedDescription
  });
}

// Example usage
async function taskWorkflowExample() {
  try {
    // Step 1: Create a new task
    console.log('\nCreating a new task...');
    const task = await createTask({
      userId: 1,
      taskTitle: "Write API documentation",
      taskDescription: "Create comprehensive documentation for the Task Management API",
      dueDate: "2025-06-01T17:00:00-05:00",
      warningOffset: 1440
    });
    console.log('New task created:', task);
    
    // Step 2: Start working on the task
    console.log('\nStarting work on the task...');
    const inProgressTask = await startTask(task.taskId);
    console.log('Task updated to IN_PROGRESS:', inProgressTask);
    
    // Step 3: Block the task due to an obstacle
    console.log('\nBlocking the task...');
    const blockedTask = await blockTask(task.taskId, "Waiting for API spec review");
    console.log('Task blocked:', blockedTask);
    
    // Step 4: Resume work after obstacle is resolved
    console.log('\nResuming work on the task...');
    const resumedTask = await resumeTask(task.taskId);
    console.log('Task resumed:', resumedTask);
    
    // Step 5: Complete the task
    console.log('\nCompleting the task...');
    const completedTask = await completeTask(task.taskId);
    console.log('Task completed:', completedTask);
    
    // Alternative flow: Create a task that will be deferred
    console.log('\nCreating another task...');
    const anotherTask = await createTask({
      userId: 1,
      taskTitle: "Update user interface",
      taskDescription: "Redesign the task management dashboard",
      dueDate: "2025-05-15T17:00:00-05:00",
      warningOffset: 1440
    });
    
    // Defer the task
    console.log('\nDeferring the task...');
    const deferredTask = await deferTask(
      anotherTask.taskId,
      "2025-06-15T17:00:00-05:00",
      "Priorities changed, pushing to next month"
    );
    console.log('Task deferred:', deferredTask);
    
    // Alternative flow: Create a task that will be cancelled
    console.log('\nCreating a task that will be cancelled...');
    const taskToCancel = await createTask({
      userId: 1,
      taskTitle: "Prepare old report format",
      taskDescription: "Use the previous quarter's report format",
      dueDate: "2025-05-20T17:00:00-05:00",
      warningOffset: 1440
    });
    
    // Cancel the task
    console.log('\nCancelling the task...');
    const cancelledTask = await cancelTask(
      taskToCancel.taskId,
      "Format requirement changed, no longer needed"
    );
    console.log('Task cancelled:', cancelledTask);
    
    // Get all completed tasks
    console.log('\nGetting all completed tasks...');
    const completedTasks = await getTasks('COMPLETED');
    console.log('Completed tasks:', completedTasks);
    
  } catch (error) {
    console.error('Error:', error.message);
  }
}

// Run the example
taskWorkflowExample();
```

## Building user interfaces for task management

When building a user interface for task management, consider these views:

1. **Task inbox**: Show all `NOT_STARTED` tasks, sorted by due date
2. **In progress**: Show all `IN_PROGRESS` tasks
3. **Blocked**: Show all `BLOCKED` tasks that need attention
4. **Deferred**: Show all `DEFERRED` tasks for future planning
5. **Completed**: Show all `COMPLETED` tasks for reference
6. **Cancelled**: Show all `CANCELLED` tasks (or hide them)

## Best practices

- Use task status transitions to track progress accurately
- Include reasons in task descriptions when blocking, deferring, or cancelling
- Regularly check for `BLOCKED` tasks to prevent them from being forgotten
- Set appropriate reminder offsets based on task importance
- Use sorting by due date to prioritize work

## Next steps

Now that you understand the complete task management workflow, you can:

1. Implement a task management UI in your application
2. Create dashboards to visualize task status distribution
3. Learn about [implementing reminders](implementing-reminders.html) based on due dates
4. Explore [data consistency](../advanced/handling-data-consistency.html) for robust task management

## Related resources

- [Task resource](../resources/task-resource.html) - Detailed information about the task resource
- [Task status lifecycle](../core-concepts/task-status-lifecycle.html) - Understanding task statuses
- [API reference](../api-reference/get-all-tasks.html) - Complete API reference for task endpoints

--- FILE: tutorials/implementing-reminders.md
---
title: "Implementing reminders"
description: "How to use the warningOffset property to implement a reminder system for tasks approaching their due date."
tags: ["tutorial", "reminders"]
categories: ["tutorials"]
importance: 5
ai-generated: false
navOrder: 3
---

# Implementing reminders

This document provides guidance on how to implement a reminder system using the Task Management API's `warningOffset` property. Learn how to notify users when their tasks are approaching due dates.

## Understanding the warningOffset property

<!-- This section should explain what warningOffset is and how it works -->

- Define what `warningOffset` represents (minutes before due date)
- Explain how it works with the `dueDate` property
- Provide examples of different warning offset values and their practical implications
- Show the calculation: Reminder time = dueDate - warningOffset minutes

## Implementing a basic reminder system

<!-- This section should outline how to implement a basic reminder system -->

- Client-side vs. server-side implementation considerations 
- Polling strategy for checking upcoming reminders
- Suggestions for storing reminder states
- Code example of a reminder checking function
- Example of reminder notification UI

## Advanced reminder patterns

<!-- This section should cover more complex reminder implementations -->

- Multiple reminders for important tasks
- Escalating reminders (increasing frequency as deadline approaches)
- Team/manager notifications for overdue tasks
- Reminder preferences and customization
- Integration with external notification systems (email, SMS, etc.)

## Best practices

<!-- This section should provide recommendations for effective reminder systems -->

- Appropriate warning offset selection based on task importance
- Handling timezone differences
- Dealing with reminder acknowledgments
- Reminder grouping to avoid notification fatigue
- Handling overdue tasks

## Example implementation

<!-- This section should provide a complete code example -->

```javascript
// Example code for a reminder system
```

<!-- Consider adding a diagram showing the reminder calculation process -->

## Related resources

<!-- This section should link to related documentation -->

- Reference to task resource documentation
- Link to client notification libraries/frameworks
- Other relevant resources

--- FILE: tutorials/integration-patterns.md
---
title: "Integration patterns"
description: "Common patterns for integrating the Task Management API with other systems and services."
tags: ["integration", "architecture"]
categories: ["tutorials"]
importance: 6
ai-generated: false
navOrder: 4
---

# Integration patterns

This document describes common patterns and best practices for integrating the Task Management API with other systems and services in your technology ecosystem.

## Common integration scenarios

<!-- This section should outline different integration scenarios -->

- Integrating with authentication systems
- Connecting with calendar applications
- Incorporating into project management tools
- Adding to communication platforms
- Embedding in productivity suites
- Mobile application integration

## Integration approaches

<!-- This section should explain different integration approaches -->

- Direct API integration
- Webhook-based integration
- Message queue integration
- Backend-for-Frontend (BFF) pattern
- Microservices architecture considerations

## Authentication and security

<!-- This section should cover authentication and security considerations -->

- Token management and security
- Credential handling
- Role-based access control
- API key rotation practices
- Error handling for authentication issues

## Data synchronization patterns

<!-- This section should address data synchronization challenges -->

- One-way vs. two-way synchronization
- Handling conflicts
- Synchronization frequency
- Offline-first considerations
- Dealing with schema differences

## Performance considerations

<!-- This section should provide performance recommendations -->

- Caching strategies
- Rate limiting awareness
- Batch operations
- Connection pooling
- Request optimization

## Implementation examples

<!-- This section should provide code examples for common integrations -->

```javascript
// Examples of integration code
```

<!-- Consider adding a system architecture diagram showing integration points -->

## Case studies

<!-- This section could include brief case studies of integration examples -->

- Calendar integration example
- Project management tool integration
- Mobile app integration

## Related resources

<!-- This section should link to related documentation -->

- Authentication documentation
- API reference
- Error handling guidelines
- Performance optimization resources

--- FILE: advanced/optimizing-api-usage.md
---
title: "Optimizing API usage"
description: "Best practices for efficient API usage, including caching, batch operations, and performance considerations."
tags: ["optimization", "performance"]
categories: ["advanced"]
importance: 5
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 12, 2025"
navOrder: 1
---

# Optimizing API usage

This document provides best practices for optimizing your use of the Task Management API, focusing on performance, efficiency, and cost considerations.

## Understanding API limits

While using the Task Management API, be aware of the following limitations:

- **Rate limits**: The API enforces rate limits to ensure fair usage
- **Response size**: Large result sets are paginated
- **Performance considerations**: Frequent polling may impact performance

Optimizing your API usage helps you stay within these limits while maintaining a responsive application.

## Caching strategies

Implementing effective caching is one of the most important ways to optimize API usage.

### What to cache

Consider caching these resources:

- User data that changes infrequently
- Task lists that don't need real-time updates
- Reference data (e.g., available task statuses)

### Client-side caching

Implement client-side caching in your application:

```javascript
// Simple cache implementation
class ApiCache {
  constructor(ttlMs = 60000) { // Default TTL: 1 minute
    this.cache = new Map();
    this.ttlMs = ttlMs;
  }

  set(key, value) {
    const expiresAt = Date.now() + this.ttlMs;
    this.cache.set(key, { value, expiresAt });
    return value;
  }

  get(key) {
    const entry = this.cache.get(key);
    if (!entry) return null;
    
    if (Date.now() > entry.expiresAt) {
      this.cache.delete(key);
      return null;
    }
    
    return entry.value;
  }

  invalidate(key) {
    this.cache.delete(key);
  }
}

// Usage example
const cache = new ApiCache(300000); // 5-minute TTL

async function getTasksWithCaching(status = null) {
  const cacheKey = `tasks_${status || 'all'}`;
  const cachedData = cache.get(cacheKey);
  
  if (cachedData) {
    console.log('Using cached task data');
    return cachedData;
  }
  
  console.log('Fetching fresh task data');
  const tasks = await getTasks(status);
  cache.set(cacheKey, tasks);
  return tasks;
}
```

### Cache invalidation

Implement proper cache invalidation to maintain data consistency:

- Invalidate user cache when user details are updated
- Invalidate task caches when tasks are created, updated, or deleted
- Use time-based expiration for less critical data

```javascript
// Invalidate cache when a task is updated
async function updateTaskWithCacheInvalidation(taskId, taskData) {
  const updatedTask = await updateTask(taskId, taskData);
  
  // Invalidate specific task cache
  cache.invalidate(`task_${taskId}`);
  
  // Invalidate task list caches
  cache.invalidate('tasks_all');
  cache.invalidate(`tasks_${updatedTask.taskStatus}`);
  
  return updatedTask;
}
```

## Batch operations

Minimize the number of API calls by utilizing batch operations when possible.

### Pagination optimization

When working with large data sets, use appropriate page sizes:

```javascript
// Fetch all tasks efficiently with pagination
async function getAllTasksEfficiently(batchSize = 50) {
  let page = 0;
  let allTasks = [];
  let hasMoreData = true;
  
  while (hasMoreData) {
    const response = await fetch(`http://localhost:3000/tasks?_page=${page}&_perPage=${batchSize}`, {
      headers: { 'Authorization': 'Bearer YOUR_TOKEN' }
    });
    
    const data = await response.json();
    const tasks = data.tasks || [];
    
    allTasks = allTasks.concat(tasks);
    hasMoreData = tasks.length === batchSize;
    page++;
  }
  
  return allTasks;
}
```

### Process data in chunks

For operations that involve large sets of data, process them in chunks:

```javascript
// Update multiple tasks in chunks
async function updateTasksInChunks(taskUpdates, chunkSize = 5) {
  const chunks = [];
  
  // Split updates into chunks
  for (let i = 0; i < taskUpdates.length; i += chunkSize) {
    chunks.push(taskUpdates.slice(i, i + chunkSize));
  }
  
  const results = [];
  
  // Process each chunk
  for (const chunk of chunks) {
    const chunkPromises = chunk.map(update => 
      updateTask(update.taskId, update.data)
    );
    
    const chunkResults = await Promise.all(chunkPromises);
    results.push(...chunkResults);
    
    // Optional delay between chunks to avoid rate limits
    await new Promise(resolve => setTimeout(resolve, 100));
  }
  
  return results;
}
```

## Polling optimization

If your application needs to check for updates regularly, optimize your polling strategy.

### Adaptive polling

Implement adaptive polling intervals based on user activity:

```javascript
class AdaptivePoller {
  constructor(minInterval = 5000, maxInterval = 60000) {
    this.minInterval = minInterval; // 5 seconds
    this.maxInterval = maxInterval; // 1 minute
    this.currentInterval = minInterval;
    this.timerId = null;
    this.lastActivity = Date.now();
    this.callback = null;
  }
  
  setCallback(callback) {
    this.callback = callback;
  }
  
  start() {
    this.poll();
    
    // Reset interval on user interaction
    document.addEventListener('click', () => this.userActivity());
    document.addEventListener('keypress', () => this.userActivity());
  }
  
  stop() {
    if (this.timerId) {
      clearTimeout(this.timerId);
      this.timerId = null;
    }
  }
  
  userActivity() {
    this.lastActivity = Date.now();
    this.currentInterval = this.minInterval;
  }
  
  poll() {
    if (this.callback) {
      this.callback();
    }
    
    // Adjust polling interval based on inactivity
    const inactiveTime = Date.now() - this.lastActivity;
    if (inactiveTime > 30000) { // 30 seconds of inactivity
      this.currentInterval = Math.min(this.maxInterval, this.currentInterval * 1.5);
    }
    
    this.timerId = setTimeout(() => this.poll(), this.currentInterval);
  }
}

// Usage example
const taskPoller = new AdaptivePoller();

taskPoller.setCallback(async () => {
  try {
    // Only fetch tasks that are relevant to current view
    const status = getCurrentViewStatus(); // e.g., 'IN_PROGRESS'
    const tasks = await getTasks(status);
    updateTasksUI(tasks);
  } catch (error) {
    console.error('Polling error:', error);
  }
});

taskPoller.start();
```

### Webhooks as an alternative

For real-time updates, consider implementing a webhook-based approach instead of polling, if your infrastructure supports it.

## Request optimization

Optimize your API requests to minimize data transfer and processing time.

### Use filtering

Filter results on the server side rather than client side:

```javascript
// Efficient: Server-side filtering
const inProgressTasks = await getTasks('IN_PROGRESS');

// Less efficient: Client-side filtering
const allTasks = await getTasks();
const inProgressTasks = allTasks.filter(task => task.taskStatus === 'IN_PROGRESS');
```

### Select only needed fields

If the API supports field selection, use it to retrieve only the data you need.

### Combine related operations

Combine related operations to reduce round trips:

```javascript
// Helper function to fetch task and user in parallel
async function getTaskWithUserDetails(taskId) {
  const task = await getTaskById(taskId);
  const user = await getUserById(task.userId);
  
  return {
    ...task,
    user
  };
}
```

## Connection management

Properly manage connections to the API to avoid overhead.

### Reuse HTTP connections

Use connection pooling or HTTP keep-alive to reduce connection overhead:

```javascript
// Example with node-fetch
const fetch = require('node-fetch');
const HttpAgent = require('agentkeepalive');

const agent = new HttpAgent({
  keepAlive: true,
  maxSockets: 10,
  maxFreeSockets: 5,
  timeout: 60000,
  freeSocketTimeout: 30000
});

async function fetchWithKeepalive(url, options = {}) {
  return fetch(url, {
    ...options,
    agent
  });
}
```

### Handle timeouts and retries

Implement proper timeout handling and retry logic:

```javascript
async function fetchWithRetry(url, options = {}, retries = 3, backoff = 300) {
  try {
    const response = await fetch(url, {
      ...options,
      timeout: 5000 // 5 second timeout
    });
    
    return response;
  } catch (error) {
    if (retries <= 0) throw error;
    
    await new Promise(resolve => setTimeout(resolve, backoff));
    return fetchWithRetry(url, options, retries - 1, backoff * 2);
  }
}
```

## Monitoring and analytics

Implement monitoring to identify optimization opportunities.

### Track API usage

Monitor API calls to identify patterns and optimization opportunities:

```javascript
// Simple API call tracker
class ApiMonitor {
  constructor() {
    this.callCounts = {};
    this.responseTimesMs = {};
  }
  
  recordCall(endpoint, responseTimeMs) {
    this.callCounts[endpoint] = (this.callCounts[endpoint] || 0) + 1;
    
    if (!this.responseTimesMs[endpoint]) {
      this.responseTimesMs[endpoint] = [];
    }
    this.responseTimesMs[endpoint].push(responseTimeMs);
  }
  
  getStats() {
    const stats = {};
    
    for (const endpoint in this.callCounts) {
      const times = this.responseTimesMs[endpoint];
      const avgTime = times.reduce((sum, time) => sum + time, 0) / times.length;
      
      stats[endpoint] = {
        calls: this.callCounts[endpoint],
        avgResponseTimeMs: avgTime,
        minResponseTimeMs: Math.min(...times),
        maxResponseTimeMs: Math.max(...times)
      };
    }
    
    return stats;
  }
  
  logStats() {
    console.table(this.getStats());
  }
}

const apiMonitor = new ApiMonitor();

// Wrap API calls with monitoring
async function monitoredApiCall(endpoint, callFn) {
  const startTime = performance.now();
  try {
    return await callFn();
  } finally {
    const endTime = performance.now();
    apiMonitor.recordCall(endpoint, endTime - startTime);
  }
}

// Usage example
async function getTasksMonitored(status) {
  return monitoredApiCall(`getTasks(${status || 'all'})`, () => getTasks(status));
}
```

### Identify bottlenecks

Use monitoring data to identify and address bottlenecks:

- Endpoints with high response times
- Frequently called endpoints that could benefit from caching
- Patterns of bursts that could be smoothed out

## Client-side optimization

Optimize your client-side code for efficient API interaction.

### State management

Use efficient state management to minimize API calls:

```javascript
// Example with React and context API
function TaskProvider({ children }) {
  const [tasks, setTasks] = useState([]);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(null);
  
  // Fetch tasks only once when component mounts
  useEffect(() => {
    const fetchTasks = async () => {
      setLoading(true);
      try {
        const data = await getTasks();
        setTasks(data);
        setError(null);
      } catch (err) {
        setError(err.message);
      } finally {
        setLoading(false);
      }
    };
    
    fetchTasks();
  }, []);
  
  // Update tasks locally first, then in API
  const updateTaskOptimistically = async (taskId, updates) => {
    // Update locally first for responsiveness
    setTasks(prevTasks => 
      prevTasks.map(task => 
        task.taskId === taskId ? { ...task, ...updates } : task
      )
    );
    
    // Then update in API
    try {
      await updateTask(taskId, updates);
    } catch (err) {
      // Revert on error
      setError(err.message);
      setTasks(prevTasks => [...prevTasks]); // Trigger re-fetch
    }
  };
  
  {% raw %}
  return (
    <TaskContext.Provider value={{ 
      tasks, 
      loading, 
      error, 
      updateTask: updateTaskOptimistically
    }}>
      {children}
    </TaskContext.Provider>
  );
  {% endraw %}
}
```

### Debouncing and throttling

Implement debouncing for user input and throttling for frequent actions:

```javascript
// Debounce function for search inputs
function debounce(func, wait) {
  let timeout;
  return function(...args) {
    const context = this;
    clearTimeout(timeout);
    timeout = setTimeout(() => func.apply(context, args), wait);
  };
}

// Throttle function for scroll events
function throttle(func, limit) {
  let inThrottle;
  return function(...args) {
    const context = this;
    if (!inThrottle) {
      func.apply(context, args);
      inThrottle = true;
      setTimeout(() => inThrottle = false, limit);
    }
  };
}

// Example usage
const debouncedSearch = debounce(async (searchTerm) => {
  // This will only be called after user stops typing for 300ms
  const results = await searchTasks(searchTerm);
  updateSearchResults(results);
}, 300);

// Usage in UI
searchInput.addEventListener('input', (e) => {
  debouncedSearch(e.target.value);
});
```

## Summary of best practices

- **Implement caching**: Cache responses to reduce API calls
- **Use pagination efficiently**: Fetch data in appropriate page sizes
- **Optimize polling**: Use adaptive polling or consider webhooks
- **Batch operations**: Process data in chunks to reduce API calls
- **Monitor performance**: Track API usage to identify optimization opportunities
- **Implement error handling**: Add proper timeout handling and retries
- **Use client-side optimizations**: Implement debouncing, throttling, and optimistic updates

By following these best practices, you can optimize your use of the Task Management API, resulting in better performance, lower costs, and an improved user experience.

## Related resources

- [Rate limiting](../getting-started/rate-limiting.html)
- [Pagination](../core-concepts/pagination.html)
- [Error handling](../core-concepts/error-handling.html)
- [Data consistency](handling-data-consistency.html)

--- FILE: advanced/security-best-practices.md
---
title: "Security best practices"
description: "Advanced security considerations when working with the Task Management API."
tags: ["security", "best practices"]
categories: ["advanced"]
importance: 6
ai-generated: false
navOrder: 2
---

# Security best practices

This document outlines security best practices and considerations when working with the Task Management API to help ensure the safety and privacy of your application and its data.

## Authentication security

<!-- This section should cover authentication-related security practices -->

- Secure storage of authentication tokens
- Token lifecycle management
- Token refresh strategies
- Multi-factor authentication integration
- Handling authentication failures
- Detecting and responding to unauthorized access attempts

## Data protection

<!-- This section should address data protection measures -->

- Protecting sensitive task information
- User data privacy considerations
- Data minimization principles
- Client-side data storage security
- Transport layer security requirements
- Secure handling of personally identifiable information (PII)

## Access control

<!-- This section should explain access control approaches -->

- Implementing role-based access control (RBAC)
- Principle of least privilege
- User permission management
- Team/organization-level permissions
- Attribute-based access control considerations
- Auditing access to resources

## Client-side security

<!-- This section should cover client-side security considerations -->

- Cross-site scripting (XSS) prevention
- Cross-site request forgery (CSRF) protection
- Content security policy implementation
- Secure UI practices
- Input validation
- Output encoding

## Security monitoring

<!-- This section should address security monitoring approaches -->

- Security logging best practices
- Monitoring for suspicious activities
- Detecting brute force attempts
- Abnormal usage pattern detection
- Integration with security information and event management (SIEM) systems
- Incident response procedures

## Implementation examples

<!-- This section should provide code examples -->

```javascript
// Examples of security implementations
```

## Security checklist

<!-- This section should provide a security checklist -->

- Authentication implementation checklist
- Data protection checklist 
- Access control checklist
- Client-side security checklist
- Security monitoring checklist

## Related resources

<!-- This section should link to related resources -->

- Authentication documentation
- API security guides
- OWASP resources

--- FILE: advanced/handling-data-consistency.md
---
title: "Handling data consistency"
description: "Strategies for maintaining data consistency when working with the API, including handling race conditions and concurrency."
tags: ["data consistency", "concurrency"]
categories: ["advanced"]
importance: 4
ai-generated: false
navOrder: 3
---

# Handling data consistency

This document outlines strategies for maintaining data consistency when working with the Task Management API, with particular focus on handling race conditions and concurrency issues.

## Understanding consistency challenges

<!-- This section should explain the types of consistency challenges -->

- Race conditions explained
- Optimistic vs. pessimistic concurrency
- Last-write-wins issues
- Lost update problems
- Data staleness considerations
- Eventually consistent systems

## Concurrency control strategies

<!-- This section should outline concurrency control approaches -->

- Optimistic concurrency control
- Conditional updates
- Version-based concurrency
- Resource locking patterns
- Conflict detection and resolution
- Handling update conflicts

## Client-side consistency patterns

<!-- This section should explain client-side approaches -->

- Local state management
- Optimistic UI updates
- Conflict resolution UI
- Offline-first considerations
- Synchronization strategies
- Handling network partitions

## Task-specific consistency challenges

<!-- This section should address task-specific consistency issues -->

- Task status transition race conditions
- Simultaneous task updates
- Task assignment conflicts
- Due date modifications
- Detecting and resolving task conflicts
- Maintaining user-task relationship consistency

## Implementation examples

<!-- This section should provide code examples -->

```javascript
// Examples of consistency handling code
```

<!-- Consider adding a diagram showing race conditions and resolution approaches -->

## Best practices checklist

<!-- This section should provide a consistency checklist -->

- Concurrency control implementation checklist
- Client-side consistency checklist
- Task-specific consistency checklist

## Related resources

<!-- This section should link to related resources -->

- Error handling documentation
- API reference for conditional operations
- Conflict resolution patterns

--- FILE: developer-resources/api-changelog.md
---
title: "API changelog"
description: "History of changes to the Task Management API across versions."
tags: ["changelog", "versions"]
categories: ["developer-resources"]
importance: 3
ai-generated: false
navOrder: 1
---

# API changelog

This document tracks the changes and evolution of the Task Management API across different versions. Use this changelog to understand what has changed between versions and to guide your migration efforts.

## Version history

<!-- This section should outline the version history of the API -->

### v1.0.0 (Current)

<!-- Include details of the current version -->

- Initial release of the Task Management API
- Core functionality including user and task management
- Status lifecycle for tasks
- Pagination and sorting support
- Complete REST API for managing resources

## Upcoming changes

<!-- This section should include planned changes -->

- Future enhancements and expected changes
- Deprecation notices for future versions
- Beta features being considered

## Migration guides

<!-- This section should provide migration guidance -->

- Guidelines for adopting the current version
- Best practices for version migration
- Handling breaking changes

## Versioning policy

<!-- This section should explain versioning approach -->

- Explanation of semantic versioning (SemVer) usage
- What constitutes a breaking change
- API stability guarantees
- Version support lifecycle

## Change request process

<!-- This section should explain how to request changes -->

- How to provide feedback on the API
- Process for requesting new features or changes
- Bug reporting procedures
- Community involvement in API evolution

## Related resources

<!-- This section should link to related resources -->

- API reference documentation
- Release notes
- Migration tooling
- Support resources for version-specific issues

--- FILE: developer-resources/postman-collection.md
---
title: "Postman collection"
description: "How to use the Task Management API Postman collection for testing and development."
tags: ["tools", "postman"]
categories: ["developer-resources"]
importance: 4
ai-generated: false
navOrder: 2
---

# Postman collection

This document explains how to use the Task Management API Postman collection to explore, test, and develop with the API.

## Getting started with the Postman collection

<!-- This section should explain how to get the collection -->

- Downloading the Postman collection file
- Importing the collection into Postman
- Setting up environments (development, testing, production)
- Configuring authentication
- Collection structure overview

## Using environment variables

<!-- This section should explain environment variables usage -->

- Pre-configured environment variables
- Setting API base URL
- Managing authentication tokens
- Using dynamic variables
- Variable scopes (collection vs environment)

## Running API requests

<!-- This section should cover making requests -->

- Making your first request
- Understanding request components
- Using path and query parameters
- Request body formatting
- Viewing and interpreting responses

## Testing with the collection

<!-- This section should cover testing capabilities -->

- Running pre-configured tests
- Understanding test scripts
- Creating your own tests
- Using test assertions
- Collection runner for batch testing

## Workflow examples

<!-- This section should provide example workflows -->

- Complete user management workflow
- Task lifecycle workflow
- Authentication workflow
- Error scenario testing

## Customizing the collection

<!-- This section should explain customization options -->

- Adding your own requests
- Modifying existing requests
- Creating new test scripts
- Adding pre-request scripts
- Using collection variables

## Sharing and collaboration

<!-- This section should cover collaboration features -->

- Exporting and sharing the collection
- Team collaboration on API testing
- Version control for collections
- Documentation generation

## Troubleshooting

<!-- This section should address common issues -->

- Common issues and solutions
- Debugging requests
- Console logging
- Error handling tips

## Related resources

<!-- This section should link to related resources -->

- Postman documentation
- API reference documentation
- Authentication documentation
- Testing best practices

--- FILE: developer-resources/code-examples.md
---
title: "Code examples"
description: "Example code for common operations in various programming languages including JavaScript, Python, and more."
tags: ["code", "examples"]
categories: ["developer-resources"]
importance: 7
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 12, 2025"
navOrder: 3
---

# Code examples

This document provides ready-to-use code examples for common operations with the Task Management API in various programming languages. You can use these examples as a starting point for your own implementation.

## JavaScript/TypeScript examples

### Authentication and setup

```javascript
// API client setup with authentication
class TaskApiClient {
  constructor(baseUrl, token) {
    this.baseUrl = baseUrl;
    this.token = token;
  }

  async request(endpoint, method = 'GET', data = null) {
    const url = `${this.baseUrl}${endpoint}`;
    
    const options = {
      method,
      headers: {
        'Authorization': `Bearer ${this.token}`,
        'Content-Type': 'application/json'
      }
    };
    
    if (data && (method === 'POST' || method === 'PATCH')) {
      options.body = JSON.stringify(data);
    }
    
    try {
      const response = await fetch(url, options);
      
      if (response.status === 204) {
        return true; // No content but successful
      }
      
      if (!response.ok) {
        const errorData = await response.json();
        throw new Error(`API Error (${response.status}): ${errorData.message}`);
      }
      
      return await response.json();
    } catch (error) {
      console.error('API Request Failed:', error);
      throw error;
    }
  }
  
  // User endpoints
  async getUsers(page = 0, perPage = 20, sort = null) {
    let endpoint = `/users?_page=${page}&_perPage=${perPage}`;
    if (sort) endpoint += `&_sort=${sort}`;
    const result = await this.request(endpoint);
    return result.users;
  }
  
  async getUserById(userId) {
    return this.request(`/users/${userId}`);
  }
  
  async createUser(userData) {
    return this.request('/users', 'POST', userData);
  }
  
  async updateUser(userId, userData) {
    return this.request(`/users/${userId}`, 'PATCH', userData);
  }
  
  async deleteUser(userId) {
    return this.request(`/users/${userId}`, 'DELETE');
  }
  
  // Task endpoints
  async getTasks(page = 0, perPage = 20, sort = null, status = null) {
    let endpoint = `/tasks?_page=${page}&_perPage=${perPage}`;
    if (sort) endpoint += `&_sort=${sort}`;
    if (status) endpoint += `&taskStatus=${status}`;
    const result = await this.request(endpoint);
    return result.tasks;
  }
  
  async getTaskById(taskId) {
    return this.request(`/tasks/${taskId}`);
  }
  
  async createTask(taskData) {
    return this.request('/tasks', 'POST', taskData);
  }
  
  async updateTask(taskId, taskData) {
    return this.request(`/tasks/${taskId}`, 'PATCH', taskData);
  }
  
  async deleteTask(taskId) {
    return this.request(`/tasks/${taskId}`, 'DELETE');
  }
}

// Usage example
const apiClient = new TaskApiClient('http://localhost:3000', 'YOUR_TOKEN');
```

### User management example

```javascript
// User management examples
async function userManagementExample() {
  try {
    // Create a user
    const newUser = await apiClient.createUser({
      firstName: "Jane",
      lastName: "Smith",
      contactEmail: "jane.smith@example.com"
    });
    console.log('User created:', newUser);
    
    // Get all users
    const users = await apiClient.getUsers();
    console.log('All users:', users);
    
    // Update user
    const updatedUser = await apiClient.updateUser(newUser.userId, {
      contactEmail: "jane.updated@example.com"
    });
    console.log('Updated user:', updatedUser);
    
    // Get specific user
    const user = await apiClient.getUserById(newUser.userId);
    console.log('User details:', user);
    
    // Delete user
    await apiClient.deleteUser(newUser.userId);
    console.log('User deleted successfully');
    
  } catch (error) {
    console.error('Error in user management example:', error);
  }
}
```

### Task management example

```javascript
// Task management examples
async function taskManagementExample() {
  try {
    // First, ensure we have a user
    const user = await apiClient.createUser({
      firstName: "Task",
      lastName: "Owner",
      contactEmail: "task.owner@example.com"
    });
    
    // Create a new task
    const newTask = await apiClient.createTask({
      userId: user.userId,
      taskTitle: "Example Task",
      taskDescription: "This is an example task for the code example",
      dueDate: "2025-12-31T23:59:59Z",
      warningOffset: 1440 // 24 hours before due date
    });
    console.log('Task created:', newTask);
    
    // Get all tasks
    const tasks = await apiClient.getTasks();
    console.log('All tasks:', tasks);
    
    // Get tasks by status
    const inProgressTasks = await apiClient.getTasks(0, 20, 'dueDate', 'IN_PROGRESS');
    console.log('In-progress tasks:', inProgressTasks);
    
    // Update task status
    const updatedTask = await apiClient.updateTask(newTask.taskId, {
      taskStatus: "IN_PROGRESS"
    });
    console.log('Task updated:', updatedTask);
    
    // Complete task
    const completedTask = await apiClient.updateTask(newTask.taskId, {
      taskStatus: "COMPLETED"
    });
    console.log('Task completed:', completedTask);
    
    // Delete task
    await apiClient.deleteTask(newTask.taskId);
    console.log('Task deleted successfully');
    
    // Clean up - delete user
    await apiClient.deleteUser(user.userId);
    
  } catch (error) {
    console.error('Error in task management example:', error);
  }
}
```

### React component example

```jsx
// React component example
import React, { useState, useEffect } from 'react';

// Task List Component
function TaskList() {
  const [tasks, setTasks] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  
  useEffect(() => {
    async function fetchTasks() {
      try {
        setLoading(true);
        // Assuming apiClient is available in the context or imported
        const taskData = await apiClient.getTasks(0, 50, 'dueDate');
        setTasks(taskData);
        setError(null);
      } catch (err) {
        setError('Failed to load tasks: ' + err.message);
      } finally {
        setLoading(false);
      }
    }
    
    fetchTasks();
  }, []);
  
  const updateTaskStatus = async (taskId, newStatus) => {
    try {
      setLoading(true);
      await apiClient.updateTask(taskId, { taskStatus: newStatus });
      
      // Update local state with the new status
      setTasks(prevTasks => 
        prevTasks.map(task => 
          task.taskId === taskId ? { ...task, taskStatus: newStatus } : task
        )
      );
      
    } catch (err) {
      setError('Failed to update task: ' + err.message);
    } finally {
      setLoading(false);
    }
  };
  
  if (loading && tasks.length === 0) return <div>Loading tasks...</div>;
  if (error) return <div className="error">{error}</div>;
  if (tasks.length === 0) return <div>No tasks found</div>;
  
  return (
    <div className="task-list">
      <h2>Tasks</h2>
      {loading && <div className="loading-overlay">Updating...</div>}
      
      <ul>
        {tasks.map(task => (
          <li key={task.taskId} className={`task-item status-${task.taskStatus.toLowerCase()}`}>
            <h3>{task.taskTitle}</h3>
            <p>{task.taskDescription}</p>
            <div className="task-meta">
              <span>Due: {new Date(task.dueDate).toLocaleString()}</span>
              <span>Status: {task.taskStatus}</span>
            </div>
            
            <div className="task-actions">
              {task.taskStatus === 'NOT_STARTED' && (
                <button 
                  onClick={() => updateTaskStatus(task.taskId, 'IN_PROGRESS')}
                >
                  Start Task
                </button>
              )}
              
              {task.taskStatus === 'IN_PROGRESS' && (
                <button 
                  onClick={() => updateTaskStatus(task.taskId, 'COMPLETED')}
                >
                  Complete Task
                </button>
              )}
              
              {task.taskStatus === 'IN_PROGRESS' && (
                <button 
                  onClick={() => updateTaskStatus(task.taskId, 'BLOCKED')}
                >
                  Block Task
                </button>
              )}
            </div>
          </li>
        ))}
      </ul>
    </div>
  );
}

export default TaskList;
```

## Python examples

### Client setup

```python
import requests
import json
from datetime import datetime

class TaskApiClient:
    def __init__(self, base_url, token):
        self.base_url = base_url
        self.token = token
        self.headers = {
            'Authorization': f'Bearer {token}',
            'Content-Type': 'application/json'
        }
    
    def request(self, endpoint, method='GET', data=None, params=None):
        url = f"{self.base_url}{endpoint}"
        
        try:
            if method == 'GET':
                response = requests.get(url, headers=self.headers, params=params)
            elif method == 'POST':
                response = requests.post(url, headers=self.headers, json=data)
            elif method == 'PATCH':
                response = requests.patch(url, headers=self.headers, json=data)
            elif method == 'DELETE':
                response = requests.delete(url, headers=self.headers)
            else:
                raise ValueError(f"Unsupported HTTP method: {method}")
            
            if response.status_code == 204:
                return True  # No content but successful
            
            if not response.ok:
                error_data = response.json()
                raise Exception(f"API Error ({response.status_code}): {error_data.get('message', 'Unknown error')}")
            
            return response.json()
        
        except requests.exceptions.RequestException as e:
            print(f"Request failed: {e}")
            raise
    
    # User endpoints
    def get_users(self, page=0, per_page=20, sort=None):
        params = {
            '_page': page,
            '_perPage': per_page
        }
        
        if sort:
            params['_sort'] = sort
        
        result = self.request('/users', params=params)
        return result.get('users', [])
    
    def get_user_by_id(self, user_id):
        return self.request(f'/users/{user_id}')
    
    def create_user(self, user_data):
        return self.request('/users', method='POST', data=user_data)
    
    def update_user(self, user_id, user_data):
        return self.request(f'/users/{user_id}', method='PATCH', data=user_data)
    
    def delete_user(self, user_id):
        return self.request(f'/users/{user_id}', method='DELETE')
    
    # Task endpoints
    def get_tasks(self, page=0, per_page=20, sort=None, status=None):
        params = {
            '_page': page,
            '_perPage': per_page
        }
        
        if sort:
            params['_sort'] = sort
        
        if status:
            params['taskStatus'] = status
        
        result = self.request('/tasks', params=params)
        return result.get('tasks', [])
    
    def get_task_by_id(self, task_id):
        return self.request(f'/tasks/{task_id}')
    
    def create_task(self, task_data):
        return self.request('/tasks', method='POST', data=task_data)
    
    def update_task(self, task_id, task_data):
        return self.request(f'/tasks/{task_id}', method='PATCH', data=task_data)
    
    def delete_task(self, task_id):
        return self.request(f'/tasks/{task_id}', method='DELETE')

# Usage example
api_client = TaskApiClient('http://localhost:3000', 'YOUR_TOKEN')
```

### User management example

```python
# User management example
def user_management_example():
    try:
        # Create a user
        new_user = api_client.create_user({
            "firstName": "John",
            "lastName": "Python",
            "contactEmail": "john.python@example.com"
        })
        print("User created:", new_user)
        
        # Get all users
        users = api_client.get_users()
        print(f"Found {len(users)} users:")
        for user in users:
            print(f"- {user['firstName']} {user['lastName']} ({user['contactEmail']})")
        
        # Update user
        updated_user = api_client.update_user(new_user['userId'], {
            "contactEmail": "john.updated@example.com"
        })
        print("User updated:", updated_user)
        
        # Get specific user
        user = api_client.get_user_by_id(new_user['userId'])
        print("User details:", user)
        
        # Delete user
        api_client.delete_user(new_user['userId'])
        print("User deleted successfully")
        
    except Exception as e:
        print(f"Error in user management example: {e}")

# Run the example
if __name__ == "__main__":
    user_management_example()
```

### Task management example

```python
# Task management example
def task_management_example():
    try:
        # First, ensure we have a user
        user = api_client.create_user({
            "firstName": "Task",
            "lastName": "Owner",
            "contactEmail": "task.python@example.com"
        })
        
        # Create a new task
        new_task = api_client.create_task({
            "userId": user['userId'],
            "taskTitle": "Python Example Task",
            "taskDescription": "This is an example task created with Python",
            "dueDate": "2025-12-31T23:59:59Z",
            "warningOffset": 1440  # 24 hours before due date
        })
        print("Task created:", new_task)
        
        # Get all tasks
        tasks = api_client.get_tasks()
        print(f"Found {len(tasks)} tasks")
        
        # Update task status
        updated_task = api_client.update_task(new_task['taskId'], {
            "taskStatus": "IN_PROGRESS"
        })
        print("Task updated:", updated_task)
        
        # Get tasks by status
        in_progress_tasks = api_client.get_tasks(status="IN_PROGRESS")
        print(f"Found {len(in_progress_tasks)} tasks in progress")
        
        # Complete task
        completed_task = api_client.update_task(new_task['taskId'], {
            "taskStatus": "COMPLETED"
        })
        print("Task completed:", completed_task)
        
        # Delete task
        api_client.delete_task(new_task['taskId'])
        print("Task deleted successfully")
        
        # Clean up - delete user
        api_client.delete_user(user['userId'])
        
    except Exception as e:
        print(f"Error in task management example: {e}")

# Run the example
if __name__ == "__main__":
    task_management_example()
```

### CLI tool example

```python
import argparse
import json
from datetime import datetime, timedelta

def create_cli():
    parser = argparse.ArgumentParser(description='Task Management CLI')
    subparsers = parser.add_subparsers(dest='command', help='Commands')
    
    # User commands
    user_parser = subparsers.add_parser('user', help='User management')
    user_subparsers = user_parser.add_subparsers(dest='subcommand', help='User commands')
    
    # User list
    user_list = user_subparsers.add_parser('list', help='List users')
    user_list.add_argument('--page', type=int, default=0, help='Page number')
    user_list.add_argument('--per-page', type=int, default=20, help='Items per page')
    user_list.add_argument('--sort', help='Sort field')
    
    # User get
    user_get = user_subparsers.add_parser('get', help='Get user by ID')
    user_get.add_argument('id', type=int, help='User ID')
    
    # User create
    user_create = user_subparsers.add_parser('create', help='Create user')
    user_create.add_argument('--first-name', required=True, help='First name')
    user_create.add_argument('--last-name', required=True, help='Last name')
    user_create.add_argument('--email', required=True, help='Email address')
    
    # User update
    user_update = user_subparsers.add_parser('update', help='Update user')
    user_update.add_argument('id', type=int, help='User ID')
    user_update.add_argument('--first-name', help='First name')
    user_update.add_argument('--last-name', help='Last name')
    user_update.add_argument('--email', help='Email address')
    
    # User delete
    user_delete = user_subparsers.add_parser('delete', help='Delete user')
    user_delete.add_argument('id', type=int, help='User ID')
    
    # Task commands
    task_parser = subparsers.add_parser('task', help='Task management')
    task_subparsers = task_parser.add_subparsers(dest='subcommand', help='Task commands')
    
    # Task list
    task_list = task_subparsers.add_parser('list', help='List tasks')
    task_list.add_argument('--page', type=int, default=0, help='Page number')
    task_list.add_argument('--per-page', type=int, default=20, help='Items per page')
    task_list.add_argument('--sort', help='Sort field')
    task_list.add_argument('--status', help='Filter by status')
    
    # Task get
    task_get = task_subparsers.add_parser('get', help='Get task by ID')
    task_get.add_argument('id', type=int, help='Task ID')
    
    # Task create
    task_create = task_subparsers.add_parser('create', help='Create task')
    task_create.add_argument('--user-id', type=int, required=True, help='User ID')
    task_create.add_argument('--title', required=True, help='Task title')
    task_create.add_argument('--description', help='Task description')
    task_create.add_argument('--status', default='NOT_STARTED', help='Task status')
    task_create.add_argument('--due-days', type=int, default=7, help='Days until due')
    task_create.add_argument('--warning-offset', type=int, default=60, help='Warning offset in minutes')
    
    # Task update
    task_update = task_subparsers.add_parser('update', help='Update task')
    task_update.add_argument('id', type=int, help='Task ID')
    task_update.add_argument('--title', help='Task title')
    task_update.add_argument('--description', help='Task description')
    task_update.add_argument('--status', help='Task status')
    task_update.add_argument('--due-days', type=int, help='Days until due')
    task_update.add_argument('--warning-offset', type=int, help='Warning offset in minutes')
    
    # Task delete
    task_delete = task_subparsers.add_parser('delete', help='Delete task')
    task_delete.add_argument('id', type=int, help='Task ID')
    
    return parser

def handle_command(args):
    # Initialize the API client
    api_client = TaskApiClient('http://localhost:3000', 'YOUR_TOKEN')
    
    if args.command == 'user':
        handle_user_command(args, api_client)
    elif args.command == 'task':
        handle_task_command(args, api_client)
    else:
        print("Invalid command. Use --help for usage information.")

def handle_user_command(args, api_client):
    if args.subcommand == 'list':
        users = api_client.get_users(page=args.page, per_page=args.per_page, sort=args.sort)
        print(json.dumps(users, indent=2))
    
    elif args.subcommand == 'get':
        user = api_client.get_user_by_id(args.id)
        print(json.dumps(user, indent=2))
    
    elif args.subcommand == 'create':
        user_data = {
            "firstName": args.first_name,
            "lastName": args.last_name,
            "contactEmail": args.email
        }
        user = api_client.create_user(user_data)
        print(json.dumps(user, indent=2))
    
    elif args.subcommand == 'update':
        user_data = {}
        if args.first_name:
            user_data["firstName"] = args.first_name
        if args.last_name:
            user_data["lastName"] = args.last_name
        if args.email:
            user_data["contactEmail"] = args.email
        
        if user_data:
            user = api_client.update_user(args.id, user_data)
            print(json.dumps(user, indent=2))
        else:
            print("No update data provided")
    
    elif args.subcommand == 'delete':
        result = api_client.delete_user(args.id)
        print("User deleted successfully" if result else "Failed to delete user")
    
    else:
        print("Invalid user subcommand. Use 'user --help' for usage information.")

def handle_task_command(args, api_client):
    if args.subcommand == 'list':
        tasks = api_client.get_tasks(page=args.page, per_page=args.per_page, 
                                     sort=args.sort, status=args.status)
        print(json.dumps(tasks, indent=2))
    
    elif args.subcommand == 'get':
        task = api_client.get_task_by_id(args.id)
        print(json.dumps(task, indent=2))
    
    elif args.subcommand == 'create':
        # Calculate due date
        due_date = (datetime.now() + timedelta(days=args.due_days)).isoformat()
        
        task_data = {
            "userId": args.user_id,
            "taskTitle": args.title,
            "taskStatus": args.status,
            "dueDate": due_date,
            "warningOffset": args.warning_offset
        }
        
        if args.description:
            task_data["taskDescription"] = args.description
        
        task = api_client.create_task(task_data)
        print(json.dumps(task, indent=2))
    
    elif args.subcommand == 'update':
        task_data = {}
        
        if args.title:
            task_data["taskTitle"] = args.title
        
        if args.description:
            task_data["taskDescription"] = args.description
        
        if args.status:
            task_data["taskStatus"] = args.status
        
        if args.due_days is not None:
            due_date = (datetime.now() + timedelta(days=args.due_days)).isoformat()
            task_data["dueDate"] = due_date
        
        if args.warning_offset is not None:
            task_data["warningOffset"] = args.warning_offset
        
        if task_data:
            task = api_client.update_task(args.id, task_data)
            print(json.dumps(task, indent=2))
        else:
            print("No update data provided")
    
    elif args.subcommand == 'delete':
        result = api_client.delete_task(args.id)
        print("Task deleted successfully" if result else "Failed to delete task")
    
    else:
        print("Invalid task subcommand. Use 'task --help' for usage information.")

# Run the CLI
if __name__ == "__main__":
    parser = create_cli()
    args = parser.parse_args()
    
    if args.command:
        handle_command(args)
    else:
        parser.print_help()
```

## Java examples

### Client setup

```java
import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.time.Duration;
import java.util.HashMap;
import java.util.Map;
import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.node.ObjectNode;

public class TaskApiClient {
    private final String baseUrl;
    private final String token;
    private final HttpClient httpClient;
    private final ObjectMapper objectMapper;
    
    public TaskApiClient(String baseUrl, String token) {
        this.baseUrl = baseUrl;
        this.token = token;
        this.httpClient = HttpClient.newBuilder()
                .version(HttpClient.Version.HTTP_2)
                .connectTimeout(Duration.ofSeconds(10))
                .build();
        this.objectMapper = new ObjectMapper();
    }
    
    private HttpResponse<String> request(String endpoint, String method, String jsonBody) 
            throws IOException, InterruptedException {
        String url = baseUrl + endpoint;
        
        HttpRequest.Builder requestBuilder = HttpRequest.newBuilder()
                .uri(URI.create(url))
                .header("Authorization", "Bearer " + token)
                .header("Content-Type", "application/json");
        
        if (method.equals("GET")) {
            requestBuilder.GET();
        } else if (method.equals("DELETE")) {
            requestBuilder.DELETE();
        } else if (method.equals("POST") || method.equals("PATCH")) {
            requestBuilder.method(method, HttpRequest.BodyPublishers.ofString(
                    jsonBody != null ? jsonBody : "{}"));
        }
        
        HttpRequest request = requestBuilder.build();
        
        return httpClient.send(request, HttpResponse.BodyHandlers.ofString());
    }
    
    // Helper method to handle responses
    private JsonNode handleResponse(HttpResponse<String> response) throws IOException {
        if (response.statusCode() == 204) {
            // No content - success
            return null;
        }
        
        if (response.statusCode() < 200 || response.statusCode() >= 300) {
            JsonNode errorNode = objectMapper.readTree(response.body());
            String errorMessage = errorNode.has("message") 
                ? errorNode.get("message").asText() 
                : "Unknown error";
            throw new IOException("API Error (" + response.statusCode() + "): " + errorMessage);
        }
        
        if (response.body() == null || response.body().isEmpty()) {
            return null;
        }
        
        return objectMapper.readTree(response.body());
    }
    
    // User endpoints
    public List<JsonNode> getUsers(int page, int perPage, String sort) 
            throws IOException, InterruptedException {
        String endpoint = String.format("/users?_page=%d&_perPage=%d", page, perPage);
        if (sort != null && !sort.isEmpty()) {
            endpoint += "&_sort=" + sort;
        }
        
        HttpResponse<String> response = request(endpoint, "GET", null);
        JsonNode rootNode = handleResponse(response);
        
        List<JsonNode> users = new ArrayList<>();
        if (rootNode != null && rootNode.has("users")) {
            JsonNode usersNode = rootNode.get("users");
            if (usersNode.isArray()) {
                for (JsonNode user : usersNode) {
                    users.add(user);
                }
            }
        }
        
        return users;
    }
    
    public JsonNode getUserById(int userId) throws IOException, InterruptedException {
        String endpoint = "/users/" + userId;
        HttpResponse<String> response = request(endpoint, "GET", null);
        return handleResponse(response);
    }
    
    public JsonNode createUser(String firstName, String lastName, String contactEmail) 
            throws IOException, InterruptedException {
        ObjectNode userNode = objectMapper.createObjectNode();
        userNode.put("firstName", firstName);
        userNode.put("lastName", lastName);
        userNode.put("contactEmail", contactEmail);
        
        String jsonBody = objectMapper.writeValueAsString(userNode);
        HttpResponse<String> response = request("/users", "POST", jsonBody);
        return handleResponse(response);
    }
    
    public JsonNode updateUser(int userId, Map<String, String> updates) 
            throws IOException, InterruptedException {
        ObjectNode updateNode = objectMapper.createObjectNode();
        for (Map.Entry<String, String> entry : updates.entrySet()) {
            updateNode.put(entry.getKey(), entry.getValue());
        }
        
        String jsonBody = objectMapper.writeValueAsString(updateNode);
        HttpResponse<String> response = request("/users/" + userId, "PATCH", jsonBody);
        return handleResponse(response);
    }
    
    public boolean deleteUser(int userId) throws IOException, InterruptedException {
        HttpResponse<String> response = request("/users/" + userId, "DELETE", null);
        return response.statusCode() == 204;
    }
    
    // Task endpoints
    public List<JsonNode> getTasks(int page, int perPage, String sort, String status) 
            throws IOException, InterruptedException {
        String endpoint = String.format("/tasks?_page=%d&_perPage=%d", page, perPage);
        if (sort != null && !sort.isEmpty()) {
            endpoint += "&_sort=" + sort;
        }
        if (status != null && !status.isEmpty()) {
            endpoint += "&taskStatus=" + status;
        }
        
        HttpResponse<String> response = request(endpoint, "GET", null);
        JsonNode rootNode = handleResponse(response);
        
        List<JsonNode> tasks = new ArrayList<>();
        if (rootNode != null && rootNode.has("tasks")) {
            JsonNode tasksNode = rootNode.get("tasks");
            if (tasksNode.isArray()) {
                for (JsonNode task : tasksNode) {
                    tasks.add(task);
                }
            }
        }
        
        return tasks;
    }
    
    public JsonNode getTaskById(int taskId) throws IOException, InterruptedException {
        String endpoint = "/tasks/" + taskId;
        HttpResponse<String> response = request(endpoint, "GET", null);
        return handleResponse(response);
    }
    
    public JsonNode createTask(int userId, String title, String description, 
                              String status, String dueDate, int warningOffset) 
            throws IOException, InterruptedException {
        ObjectNode taskNode = objectMapper.createObjectNode();
        taskNode.put("userId", userId);
        taskNode.put("taskTitle", title);
        
        if (description != null && !description.isEmpty()) {
            taskNode.put("taskDescription", description);
        }
        
        if (status != null && !status.isEmpty()) {
            taskNode.put("taskStatus", status);
        }
        
        taskNode.put("dueDate", dueDate);
        taskNode.put("warningOffset", warningOffset);
        
        String jsonBody = objectMapper.writeValueAsString(taskNode);
        HttpResponse<String> response = request("/tasks", "POST", jsonBody);
        return handleResponse(response);
    }
    
    public JsonNode updateTask(int taskId, Map<String, Object> updates) 
            throws IOException, InterruptedException {
        ObjectNode updateNode = objectMapper.createObjectNode();
        for (Map.Entry<String, Object> entry : updates.entrySet()) {
            String key = entry.getKey();
            Object value = entry.getValue();
            
            if (value instanceof String) {
                updateNode.put(key, (String) value);
            } else if (value instanceof Integer) {
                updateNode.put(key, (Integer) value);
            } else if (value instanceof Boolean) {
                updateNode.put(key, (Boolean) value);
            }
        }
        
        String jsonBody = objectMapper.writeValueAsString(updateNode);
        HttpResponse<String> response = request("/tasks/" + taskId, "PATCH", jsonBody);
        return handleResponse(response);
    }
    
    public boolean deleteTask(int taskId) throws IOException, InterruptedException {
        HttpResponse<String> response = request("/tasks/" + taskId, "DELETE", null);
        return response.statusCode() == 204;
    }
}
```

### Usage example

```java
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.fasterxml.jackson.databind.JsonNode;

public class TaskApiExample {
    public static void main(String[] args) {
        TaskApiClient apiClient = new TaskApiClient("http://localhost:3000", "YOUR_TOKEN");
        
        try {
            // User example
            userExample(apiClient);
            
            // Task example
            taskExample(apiClient);
            
        } catch (Exception e) {
            System.err.println("Error: " + e.getMessage());
            e.printStackTrace();
        }
    }
    
    private static void userExample(TaskApiClient apiClient) throws IOException, InterruptedException {
        System.out.println("===== User Management Example =====");
        
        // Create a user
        System.out.println("\nCreating a user...");
        JsonNode newUser = apiClient.createUser("John", "Java", "john.java@example.com");
        System.out.println("User created: " + newUser);
        
        int userId = newUser.get("userId").asInt();
        
        // Get all users
        System.out.println("\nGetting all users...");
        List<JsonNode> users = apiClient.getUsers(0, 10, null);
        System.out.println("Found " + users.size() + " users");
        
        // Update user
        System.out.println("\nUpdating user...");
        Map<String, String> updates = new HashMap<>();
        updates.put("contactEmail", "john.updated@example.com");
        
        JsonNode updatedUser = apiClient.updateUser(userId, updates);
        System.out.println("User updated: " + updatedUser);
        
        // Get user by ID
        System.out.println("\nGetting user by ID...");
        JsonNode user = apiClient.getUserById(userId);
        System.out.println("User details: " + user);
        
        // We'll delete the user after the task example
    }
    
    private static void taskExample(TaskApiClient apiClient) throws IOException, InterruptedException {
        System.out.println("\n===== Task Management Example =====");
        
        // Create a user for tasks
        JsonNode user = apiClient.createUser("Task", "Owner", "task.java@example.com");
        int userId = user.get("userId").asInt();
        
        // Calculate due date (7 days from now)
        LocalDateTime dueDate = LocalDateTime.now().plusDays(7);
        String dueDateStr = dueDate.format(DateTimeFormatter.ISO_DATE_TIME);
        
        // Create a task
        System.out.println("\nCreating a task...");
        JsonNode newTask = apiClient.createTask(
            userId,
            "Java Example Task",
            "This is an example task created with Java",
            "NOT_STARTED",
            dueDateStr,
            60 // 1 hour warning
        );
        System.out.println("Task created: " + newTask);
        
        int taskId = newTask.get("taskId").asInt();
        
        // Get all tasks
        System.out.println("\nGetting all tasks...");
        List<JsonNode> tasks = apiClient.getTasks(0, 10, null, null);
        System.out.println("Found " + tasks.size() + " tasks");
        
        // Update task status
        System.out.println("\nUpdating task status...");
        Map<String, Object> taskUpdates = new HashMap<>();
        taskUpdates.put("taskStatus", "IN_PROGRESS");
        
        JsonNode updatedTask = apiClient.updateTask(taskId, taskUpdates);
        System.out.println("Task updated: " + updatedTask);
        
        // Get tasks by status
        System.out.println("\nGetting tasks by status...");
        List<JsonNode> inProgressTasks = apiClient.getTasks(0, 10, null, "IN_PROGRESS");
        System.out.println("Found " + inProgressTasks.size() + " in-progress tasks");
        
        // Complete the task
        System.out.println("\nCompleting the task...");
        taskUpdates.clear();
        taskUpdates.put("taskStatus", "COMPLETED");
        
        JsonNode completedTask = apiClient.updateTask(taskId, taskUpdates);
        System.out.println("Task completed: " + completedTask);
        
        // Delete the task
        System.out.println("\nDeleting the task...");
        boolean taskDeleted = apiClient.deleteTask(taskId);
        System.out.println("Task deleted: " + taskDeleted);
        
        // Delete the user
        System.out.println("\nDeleting the user...");
        boolean userDeleted = apiClient.deleteUser(userId);
        System.out.println("User deleted: " + userDeleted);
    }
}
```

## Additional examples and resources

For more examples and language implementations, refer to:

- [Getting started with users](../tutorials/getting-started-with-users.html)
- [Task management workflow](../tutorials/task-management-workflow.html)
- [GitHub repository](https://github.com/example/task-management-api-examples) with additional examples

### Testing examples

The examples provided are for illustration purposes. In a production environment, consider implementing:

- Proper error handling
- Logging
- Test coverage
- Configuration management
- Security best practices

For guidance on these topics, see the following documentation:

- [Error handling](../core-concepts/error-handling.html)
- [Security best practices](../advanced/security-best-practices.html)
- [Optimizing API usage](../advanced/optimizing-api-usage.html)

--- FILE: support/faq.md
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

--- FILE: support/troubleshooting.md
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

--- FILE: support/support-resources.md
---
title: "Support resources"
description: "How to get help with using the Task Management API, including contact information and community resources."
tags: ["support", "help"]
categories: ["support"]
importance: 3
ai-generated: false
navOrder: 3
---

# Support resources

This document provides information on how to get help with the Task Management API, including contact information, community resources, and self-service options.

## Getting help

<!-- This section should outline how to get help with the API -->

- Support contact information
- Available support channels 
- Support hours and response times
- Support request process
- Issue escalation procedures
- Severity level definitions

## Community resources

<!-- This section should list community resources -->

- Community forums
- Developer communities
- Social media channels
- User groups
- Open source contributions
- Community events

## Self-service resources

<!-- This section should cover self-service options -->

- Documentation overview
- API reference
- Tutorials and guides
- Knowledge base
- Video tutorials
- Sample applications
- Frequently asked questions

## Reporting issues

<!-- This section should explain how to report issues -->

- Bug reporting process
- Feature request submission
- Security vulnerability reporting
- Issue tracking system
- Required information for bug reports
- Issue statuses and lifecycle

## Service status

<!-- This section should cover service status information -->

- Status page
- Scheduled maintenance
- Incident reports
- Service level agreements
- Uptime guarantees
- Notification options for service interruptions

## Related resources

<!-- This section should link to related documentation -->

- API changelog
- Release notes
- Roadmap
- Terms of service
- Support policies
