---
layout: default
nav_order: 5
has_children: true
has_toc: false
# tags used by AI files
title: `user` resource
description: Information about the `user` resource
tags: [api]
categories: [api-reference]
ai_relevance: high
importance: 8
prerequisites: []
related_pages: [/tutorials/enroll-a-new-user]
examples: []
api_endpoints: [/users]
version: "v1.0"
last_updated: "2025-05-10"
---
# User Resource

The User resource represents an individual who can create and manage tasks in the Task Management system. Each user has a unique identifier and contact information. Users must be created before they can create or own tasks in the system.

## Resource Structure

| Property | Type | Description |
|----------|------|-------------|
| `userId` | integer | The unique identifier for the user (system-generated) |
| `firstName` | string | The user's first name (1-100 characters) |
| `lastName` | string | The user's last name (1-100 characters) |
| `contactEmail` | string | The user's email address (3-255 characters, must be unique) |

## Example

```json
{
  "userId": 1,
  "firstName": "Ferdinand",
  "lastName": "Smith",
  "contactEmail": "f.smith@example.com"
}
```

## Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | [/users](get-all-users.md) | Retrieve a list of all users |
| POST | [/users](create-user.md) | Create a new user |
| GET | [/users/{userId}](get-user-by-id.md) | Retrieve a specific user by ID |
| PATCH | [/users/{userId}](update-user.md) | Update a user's information |
| DELETE | [/users/{userId}](delete-user.md) | Delete a user |

## Business Rules

1. **User Creation**: Only authenticated and authorized users can create new user accounts.

2. **Email Uniqueness**: Each user must have a unique `contactEmail`. Attempts to create a user with an email that already exists will fail.

3. **User Deletion**: When a user is deleted, their tasks remain in the system. These tasks are considered "orphaned" but can still be accessed by their `taskId`.

4. **Required Information**: All user properties (`firstName`, `lastName`, and `contactEmail`) are required when creating a user.

5. **Validation**: 
   - `firstName` and `lastName` must be between 1 and 100 characters
   - `contactEmail` must be a valid email format and between 3 and 255 characters

## Related Resources

- [Task Resource](task-resource.md) - Tasks are associated with users via the `userId` property

## Common Use Cases

1. **User Registration**: Create a new user account in the system.

2. **User Lookup**: Retrieve user information by ID or list all users.

3. **Profile Updates**: Change a user's contact information.

4. **User Removal**: Remove a user from the system while preserving their tasks.

5. **Task Assignment**: Associate tasks with specific users for ownership and responsibility tracking.

## Notes

- The API does not directly handle user authentication or authorization. These functions are provided by the application using the Task Management API.

- There is no limit to the number of tasks a user can own.

- User IDs are assigned by the system and cannot be specified during creation or modified later.

- The system does not support user search by name or email. To find a specific user, you should retrieve all users and filter client-side, or keep track of user IDs in your application.
