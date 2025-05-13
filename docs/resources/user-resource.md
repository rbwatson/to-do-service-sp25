---
title: "User resource"
description: "Detailed information about the User resource, its properties, and related endpoints."
tags: ["user", "resource"]
categories: ["resources"]
importance: 9
parent: "resources"
related_pages: ["get-all-users", "create-user", "get-user-by-id", "update-user", "delete-user"]
api_endpoints: ["/users", "/users/{userId}"]
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "2025-05-13"
nav_order: "1"
layout: "default"
version: "v1.0.0"
lastUpdated: "2025-05-13"
---

# User Resource

The User resource represents individuals who can create and be assigned to tasks in the Task Management API. This page provides detailed information about the User resource, its properties, and related endpoints.

## Resource Properties

| Property | Type | Description | Required |
|----------|------|-------------|----------|
| `id` | String | Unique identifier for the user | Auto-generated |
| `name` | String | Full name of the user | Yes |
| `email` | String | Email address of the user (must be unique) | Yes |
| `role` | String | Role of the user (admin, manager, member) | No (default: "member") |
| `createdAt` | Date | When the user was created | Auto-generated |
| `updatedAt` | Date | When the user was last updated | Auto-generated |

## Resource Representation

### JSON Format

```json
{
  "id": "user123",
  "name": "John Doe",
  "email": "john.doe@example.com",
  "role": "member",
  "createdAt": "2025-05-01T10:30:00Z",
  "updatedAt": "2025-05-13T14:25:00Z"
}
```

## User Roles

The User resource supports the following roles:

| Role | Description | Permissions |
|------|-------------|-------------|
| `admin` | Administrator with full access | Can perform all operations |
| `manager` | Manager with elevated permissions | Can manage tasks and assign them to users |
| `member` | Regular team member | Can create and update their own tasks |

## Related Endpoints

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/users` | GET | [Get all users](/api-reference/get-all-users.md) |
| `/users` | POST | [Create a user](/api-reference/create-user.md) |
| `/users/{userId}` | GET | [Get user by ID](/api-reference/get-user-by-id.md) |
| `/users/{userId}` | PATCH | [Update a user](/api-reference/update-user.md) |
| `/users/{userId}` | DELETE | [Delete a user](/api-reference/delete-user.md) |

## Creating a User

To create a new user, send a `POST` request to the `/users` endpoint:

### Request

```http
POST /users
Content-Type: application/json

{
  "name": "Jane Smith",
  "email": "jane.smith@example.com",
  "role": "manager"
}
```

### Response

```http
HTTP/1.1 201 Created
Content-Type: application/json

{
  "id": "user456",
  "name": "Jane Smith",
  "email": "jane.smith@example.com",
  "role": "manager",
  "createdAt": "2025-05-13T15:30:00Z",
  "updatedAt": "2025-05-13T15:30:00Z"
}
```

## Updating a User

To update an existing user, send a `PATCH` request to the `/users/{userId}` endpoint:

### Request

```http
PATCH /users/user456
Content-Type: application/json

{
  "name": "Jane Williams",
  "role": "admin"
}
```

### Response

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "id": "user456",
  "name": "Jane Williams",
  "email": "jane.smith@example.com",
  "role": "admin",
  "createdAt": "2025-05-13T15:30:00Z",
  "updatedAt": "2025-05-13T15:45:00Z"
}
```

## Deleting a User

To delete a user, send a `DELETE` request to the `/users/{userId}` endpoint:

### Request

```http
DELETE /users/user456
```

### Response

```http
HTTP/1.1 204 No Content
```

## User and Task Relationships

Users are related to tasks in two ways:

1. **As creators**: A user can create multiple tasks. The `createdBy` field on the Task resource references the user who created it.

2. **As assignees**: A user can be assigned to multiple tasks. The `assigneeId` field on the Task resource references the assigned user.

## Code Examples

### Get a User by ID - JavaScript

```javascript
async function getUser(userId) {
  try {
    const response = await fetch(`https://api.taskmanagement.example.com/v1/users/${userId}`, {
      headers: {
        'Authorization': `Bearer ${API_KEY}`
      }
    });
    
    if (!response.ok) {
      throw new Error(`Failed to fetch user: ${response.status}`);
    }
    
    return await response.json();
  } catch (error) {
    console.error('Error fetching user:', error);
    return null;
  }
}
```

### Create a User - Python

```python
import requests

def create_user(api_key, name, email, role="member"):
    try:
        response = requests.post(
            "https://api.taskmanagement.example.com/v1/users",
            headers={
                "Authorization": f"Bearer {api_key}",
                "Content-Type": "application/json"
            },
            json={
                "name": name,
                "email": email,
                "role": role
            }
        )
        
        response.raise_for_status()
        return response.json()
    except requests.exceptions.RequestException as e:
        print(f"Error creating user: {e}")
        return None
```

### Get All Users Assigned to Tasks - cURL

```bash
curl -X GET "https://api.taskmanagement.example.com/v1/tasks?assigneeId=user123" \
  -H "Authorization: Bearer YOUR_API_KEY"
```

## Common Use Cases

- **User Management**: Creating and managing users in a task management system
- **Team Organization**: Organizing users by roles and permissions
- **User Profile**: Displaying user information in a profile page
- **Task Assignment**: Assigning tasks to specific users based on their skills or availability
- **Access Control**: Restricting access to certain features based on user roles

## Best Practices

1. **Email Uniqueness**: Ensure email addresses are unique across all users
2. **Role-Based Access Control**: Implement proper access controls based on user roles
3. **Data Validation**: Validate user data before sending it to the API
4. **User Privacy**: Handle user data in compliance with relevant privacy regulations
5. **Secure Storage**: Store API keys and user credentials securely

## See Also

- [Task Resource](/resources/task-resource.md)
- [Data Model](/core-concepts/data-model.md)
- [Getting Started with Users](/tutorials/getting-started-with-users.md)


