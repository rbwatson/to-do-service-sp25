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


