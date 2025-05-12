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


