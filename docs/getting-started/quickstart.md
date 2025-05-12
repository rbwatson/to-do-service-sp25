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


