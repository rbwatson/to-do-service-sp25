---
title: "API Resources"
description: "Detailed information about the core resources available in the Task Management API."
tags: ["resources", "overview"]
categories: ["resources"]
importance: 9
has_toc: false
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 20, 2025"
nav_order: "4"
layout: "default"
version: "v1.0.0"
lastUpdated: "May 20, 2025"
---

# API Resources

The Task Management API is built around two primary resources: Users and Tasks. This page provides an overview of these resources and links to detailed documentation for each.

## User resource

The User resource represents an individual who can create and manage tasks in the system. Each user has a unique identifier, name information, and a contact email.

### Key properties

- `userId`: Unique identifier for the user
- `firstName`: User's first name
- `lastName`: User's last name
- `contactEmail`: User's email address

### Related operations

- `GET /users`: Retrieve all users
- `POST /users`: Create a new user
- `GET /users/{userId}`: Retrieve a specific user
- `PATCH /users/{userId}`: Update a user
- `DELETE /users/{userId}`: Delete a user

For detailed information, see the [User resource documentation](resources/user-resource.md).

## Task resource

The Task resource represents a to-do item that belongs to a user. Each task has a unique identifier, title, description, status, due date, and warning offset.

### Key properties

- `taskId`: Unique identifier for the task
- `userId`: ID of the user who owns the task
- `taskTitle`: Short description of the task
- `taskDescription`: Detailed description of the task
- `taskStatus`: Current status of the task (e.g., NOT_STARTED, IN_PROGRESS, COMPLETED)
- `dueDate`: When the task is due
- `warningOffset`: Minutes before due date to send reminder

### Related operations

- `GET /tasks`: Retrieve all tasks
- `POST /tasks`: Create a new task
- `GET /tasks/{taskId}`: Retrieve a specific task
- `PATCH /tasks/{taskId}`: Update a task
- `DELETE /tasks/{taskId}`: Delete a task

For detailed information, see the [Task resource documentation](resources/task-resource.md).

## Resource relationships

The relationship between Users and Tasks is a one-to-many relationship:

- A User can have multiple Tasks
- Each Task belongs to exactly one User

This relationship is enforced by the `userId` field on the Task resource, which references the User who owns the task.

## Resource representations

All resources in the API are represented using JSON format. Here are examples of the User and Task resources:

### User representation

```json
{
  "userId": 1,
  "firstName": "John",
  "lastName": "Doe",
  "contactEmail": "john.doe@example.com"
}
```

### Task representation

```json
{
  "taskId": 1,
  "userId": 1,
  "taskTitle": "Complete project proposal",
  "taskDescription": "Finish the proposal for the new client project",
  "taskStatus": "IN_PROGRESS",
  "dueDate": "2025-06-15T17:00:00-05:00",
  "warningOffset": 120
}
```

## Next steps

- Explore the [User resource documentation](resources/user-resource.md) in detail
- Explore the [Task resource documentation](resources/task-resource.md) in detail
- Learn about [core concepts](core-concepts.md) like pagination, sorting, and error handling
- Check out the [API reference](api-reference.md) for detailed endpoint documentation


