---
title: "Getting started with users"
description: "A practical guide to creating, listing, updating, and deleting users in the Task Management API."
tags: ["tutorial", "users"]
categories: ["tutorials"]
importance: 6
parent: "Tutorials & Guides"
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "2025-05-13"
nav_order: "1"
layout: "default"
version: "v1.0.0"
lastUpdated: "2025-05-13"
---

# Getting Started with Users

This tutorial provides a step-by-step guide to performing common operations with users in the Task Management API. You'll learn how to create, list, update, and delete users through practical examples.

## Prerequisites

Before you begin, make sure you have:

- An API key for the Task Management API
- Appropriate permissions to manage users
- A tool for making HTTP requests (we'll use cURL, JavaScript, and Python examples)

## 1. Creating a User

Let's start by creating a new user in the system.

### Request

Use the `POST /users` endpoint to create a new user:

```http
POST /users
Content-Type: application/json
Authorization: Bearer YOUR_API_KEY

{
  "name": "Jane Smith",
  "email": "jane.smith@example.com",
  "role": "manager"
}
```

### Response

```json
{
  "id": "user123",
  "name": "Jane Smith",
  "email": "jane.smith@example.com",
  "role": "manager",
  "createdAt": "2025-05-13T10:30:00Z",
  "updatedAt": "2025-05-13T10:30:00Z"
}
```

### Code Example

#### JavaScript

```javascript
async function createUser(name, email, role = 'member') {
  const response = await fetch('https://api.taskmanagement.example.com/v1/users', {
    method: 'POST',
    headers: {
      'Authorization': `Bearer ${API_KEY}`,
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({
      name,
      email,
      role
    })
  });
  
  if (!response.ok) {
    const errorData = await response.json();
    throw new Error(`Failed to create user: ${errorData.error.message}`);
  }
  
  return await response.json();
}

// Usage
try {
  const newUser = await createUser('Jane Smith', 'jane.smith@example.com', 'manager');
  console.log('User created:', newUser);
} catch (error) {
  console.error(error);
}
```

#### Python

```python
import requests

def create_user(api_key, name, email, role='member'):
    url = 'https://api.taskmanagement.example.com/v1/users'
    headers = {
        'Authorization': f'Bearer {api_key}',
        'Content-Type': 'application/json'
    }
    data = {
        'name': name,
        'email': email,
        'role': role
    }
    
    response = requests.post(url, json=data, headers=headers)
    
    if response.status_code == 201:
        return response.json()
    else:
        error_data = response.json()
        raise Exception(f"Failed to create user: {error_data['error']['message']}")

# Usage
try:
    api_key = 'YOUR_API_KEY'
    new_user = create_user(api_key, 'Jane Smith', 'jane.smith@example.com', 'manager')
    print('User created:')
    print(f"ID: {new_user['id']}")
    print(f"Name: {new_user['name']}")
    print(f"Email: {new_user['email']}")
    print(f"Role: {new_user['role']}")
except Exception as e:
    print(e)
```

## 2. Listing Users

Now let's retrieve a list of users from the API.

### Request

Use the `GET /users` endpoint to list users:

```http
GET /users?limit=10&offset=0&sort=name
Authorization: Bearer YOUR_API_KEY
```

### Response

```json
{
  "data": [
    {
      "id": "user456",
      "name": "John Doe",
      "email": "john.doe@example.com",
      "role": "admin",
      "createdAt": "2025-04-10T08:15:00Z",
      "updatedAt": "2025-05-01T13:45:00Z"
    },
    {
      "id": "user123",
      "name": "Jane Smith",
      "email": "jane.smith@example.com",
      "role": "manager",
      "createdAt": "2025-05-13T10:30:00Z",
      "updatedAt": "2025-05-13T10:30:00Z"
    },
    // More users...
  ],
  "pagination": {
    "total": 25,
    "limit": 10,
    "offset": 0,
    "hasMore": true
  }
}
```

### Code Example

#### JavaScript

```javascript
async function listUsers(options = {}) {
  // Build query string from options
  const params = new URLSearchParams();
  
  if (options.limit) params.append('limit', options.limit);
  if (options.offset) params.append('offset', options.offset);
  if (options.sort) params.append('sort', options.sort);
  if (options.name) params.append('name', options.name);
  if (options.role) params.append('role', options.role);
  
  const url = `https://api.taskmanagement.example.com/v1/users?${params}`;
  
  const response = await fetch(url, {
    headers: {
      'Authorization': `Bearer ${API_KEY}`
    }
  });
  
  if (!response.ok) {
    const errorData = await response.json();
    throw new Error(`Failed to list users: ${errorData.error.message}`);
  }
  
  return await response.json();
}

// Usage: List users sorted by name
try {
  const result = await listUsers({
    limit: 10,
    offset: 0,
    sort: 'name'
  });
  
  console.log(`Found ${result.pagination.total} users`);
  
  result.data.forEach(user => {
    console.log(`${user.name} (${user.email}) - ${user.role}`);
  });
  
  if (result.pagination.hasMore) {
    console.log('More users available. Increase limit or use pagination.');
  }
} catch (error) {
  console.error(error);
}
```

#### Python

```python
import requests

def list_users(api_key, limit=10, offset=0, sort=None, name=None, role=None):
    url = 'https://api.taskmanagement.example.com/v1/users'
    headers = {
        'Authorization': f'Bearer {api_key}'
    }
    
    # Build query parameters
    params = {
        'limit': limit,
        'offset': offset
    }
    
    if sort:
        params['sort'] = sort
    if name:
        params['name'] = name
    if role:
        params['role'] = role
    
    response = requests.get(url, params=params, headers=headers)
    
    if response.status_code == 200:
        return response.json()
    else:
        error_data = response.json()
        raise Exception(f"Failed to list users: {error_data['error']['message']}")

# Usage: List manager users
try:
    api_key = 'YOUR_API_KEY'
    result = list_users(api_key, role='manager', sort='name')
    
    print(f"Found {result['pagination']['total']} managers")
    
    for user in result['data']:
        print(f"{user['name']} ({user['email']})")
    
    if result['pagination']['hasMore']:
        print('More users available. Increase limit or use pagination.')
except Exception as e:
    print(e)
```

## 3. Getting a Specific User

Let's retrieve details about a specific user using their ID.

### Request

Use the `GET /users/{userId}` endpoint:

```http
GET /users/user123
Authorization: Bearer YOUR_API_KEY
```

### Response

```json
{
  "id": "user123",
  "name": "Jane Smith",
  "email": "jane.smith@example.com",
  "role": "manager",
  "createdAt": "2025-05-13T10:30:00Z",
  "updatedAt": "2025-05-13T10:30:00Z"
}
```

### Code Example

#### JavaScript

```javascript
async function getUserById(userId) {
  const response = await fetch(`https://api.taskmanagement.example.com/v1/users/${userId}`, {
    headers: {
      'Authorization': `Bearer ${API_KEY}`
    }
  });
  
  if (response.status === 404) {
    return null; // User not found
  }
  
  if (!response.ok) {
    const errorData = await response.json();
    throw new Error(`Failed to get user: ${errorData.error.message}`);
  }
  
  return await response.json();
}

// Usage
try {
  const userId = 'user123';
  const user = await getUserById(userId);
  
  if (user) {
    console.log('User found:');
    console.log(`Name: ${user.name}`);
    console.log(`Email: ${user.email}`);
    console.log(`Role: ${user.role}`);
  } else {
    console.log(`User with ID ${userId} not found`);
  }
} catch (error) {
  console.error(error);
}
```

#### Python

```python
import requests

def get_user_by_id(api_key, user_id):
    url = f'https://api.taskmanagement.example.com/v1/users/{user_id}'
    headers = {
        'Authorization': f'Bearer {api_key}'
    }
    
    response = requests.get(url, headers=headers)
    
    if response.status_code == 200:
        return response.json()
    elif response.status_code == 404:
        return None
    else:
        error_data = response.json()
        raise Exception(f"Failed to get user: {error_data['error']['message']}")

# Usage
try:
    api_key = 'YOUR_API_KEY'
    user_id = 'user123'
    user = get_user_by_id(api_key, user_id)
    
    if user:
        print('User found:')
        print(f"Name: {user['name']}")
        print(f"Email: {user['email']}")
        print(f"Role: {user['role']}")
    else:
        print(f"User with ID {user_id} not found")
except Exception as e:
    print(e)
```

## 4. Updating a User

Now let's update an existing user's information.

### Request

Use the `PATCH /users/{userId}` endpoint:

```http
PATCH /users/user123
Content-Type: application/json
Authorization: Bearer YOUR_API_KEY

{
  "name": "Jane Wilson",
  "role": "admin"
}
```

### Response

```json
{
  "id": "user123",
  "name": "Jane Wilson",
  "email": "jane.smith@example.com",
  "role": "admin",
  "createdAt": "2025-05-13T10:30:00Z",
  "updatedAt": "2025-05-13T11:45:00Z"
}
```

### Code Example

#### JavaScript

```javascript
async function updateUser(userId, updates) {
  const response = await fetch(`https://api.taskmanagement.example.com/v1/users/${userId}`, {
    method: 'PATCH',
    headers: {
      'Authorization': `Bearer ${API_KEY}`,
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(updates)
  });
  
  if (response.status === 404) {
    throw new Error(`User with ID ${userId} not found`);
  }
  
  if (!response.ok) {
    const errorData = await response.json();
    throw new Error(`Failed to update user: ${errorData.error.message}`);
  }
  
  return await response.json();
}

// Usage
try {
  const userId = 'user123';
  const updates = {
    name: 'Jane Wilson',
    role: 'admin'
  };
  
  const updatedUser = await updateUser(userId, updates);
  
  console.log('User updated:');
  console.log(`Name: ${updatedUser.name}`);
  console.log(`Email: ${updatedUser.email}`);
  console.log(`Role: ${updatedUser.role}`);
} catch (error) {
  console.error(error);
}
```

#### Python

```python
import requests

def update_user(api_key, user_id, **updates):
    url = f'https://api.taskmanagement.example.com/v1/users/{user_id}'
    headers = {
        'Authorization': f'Bearer {api_key}',
        'Content-Type': 'application/json'
    }
    
    # Remove None values from updates
    updates = {k: v for k, v in updates.items() if v is not None}
    
    response = requests.patch(url, json=updates, headers=headers)
    
    if response.status_code == 200:
        return response.json()
    elif response.status_code == 404:
        raise Exception(f"User with ID {user_id} not found")
    else:
        error_data = response.json()
        raise Exception(f"Failed to update user: {error_data['error']['message']}")

# Usage
try:
    api_key = 'YOUR_API_KEY'
    user_id = 'user123'
    
    updated_user = update_user(
        api_key, 
        user_id,
        name='Jane Wilson',
        role='admin'
    )
    
    print('User updated:')
    print(f"Name: {updated_user['name']}")
    print(f"Email: {updated_user['email']}")
    print(f"Role: {updated_user['role']}")
except Exception as e:
    print(e)
```

## 5. Deleting a User

Finally, let's learn how to delete a user.

### Request

Use the `DELETE /users/{userId}` endpoint:

```http
DELETE /users/user123
Authorization: Bearer YOUR_API_KEY
```

### Response

A successful deletion returns a `204 No Content` status with no response body.

### Code Example

#### JavaScript

```javascript
async function deleteUser(userId) {
  const response = await fetch(`https://api.taskmanagement.example.com/v1/users/${userId}`, {
    method: 'DELETE',
    headers: {
      'Authorization': `Bearer ${API_KEY}`
    }
  });
  
  if (response.status === 204) {
    return true; // Successfully deleted
  }
  
  if (response.status === 404) {
    throw new Error(`User with ID ${userId} not found`);
  }
  
  const errorData = await response.json();
  throw new Error(`Failed to delete user: ${errorData.error.message}`);
}

// Usage
try {
  const userId = 'user123';
  
  // Confirm before deleting
  const confirmDelete = confirm(`Are you sure you want to delete the user with ID ${userId}?`);
  
  if (confirmDelete) {
    await deleteUser(userId);
    console.log(`User ${userId} has been deleted`);
  } else {
    console.log('Deletion cancelled');
  }
} catch (error) {
  console.error(error);
}
```

#### Python

```python
import requests

def delete_user(api_key, user_id):
    url = f'https://api.taskmanagement.example.com/v1/users/{user_id}'
    headers = {
        'Authorization': f'Bearer {api_key}'
    }
    
    response = requests.delete(url, headers=headers)
    
    if response.status_code == 204:
        return True  # Successfully deleted
    elif response.status_code == 404:
        raise Exception(f"User with ID {user_id} not found")
    else:
        error_data = response.json()
        raise Exception(f"Failed to delete user: {error_data['error']['message']}")

# Usage
try:
    api_key = 'YOUR_API_KEY'
    user_id = 'user123'
    
    # Confirm before deleting
    confirm = input(f"Are you sure you want to delete the user with ID {user_id}? (yes/no): ")
    
    if confirm.lower() == 'yes':
        success = delete_user(api_key, user_id)
        if success:
            print(f"User {user_id} has been deleted")
    else:
        print('Deletion cancelled')
except Exception as e:
    print(e)
```

## 6. Putting It All Together

Here's a complete example of a user management workflow in JavaScript:

```javascript
// User Management Module
const userManagement = {
  API_KEY: 'YOUR_API_KEY',
  BASE_URL: 'https://api.taskmanagement.example.com/v1',
  
  async createUser(name, email, role = 'member') {
    const response = await fetch(`${this.BASE_URL}/users`, {
      method: 'POST',
      headers: {
        'Authorization': `Bearer ${this.API_KEY}`,
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({ name, email, role })
    });
    
    if (!response.ok) {
      const errorData = await response.json();
      throw new Error(`Failed to create user: ${errorData.error.message}`);
    }
    
    return await response.json();
  },
  
  async listUsers(options = {}) {
    const params = new URLSearchParams();
    
    if (options.limit) params.append('limit', options.limit);
    if (options.offset) params.append('offset', options.offset);
    if (options.sort) params.append('sort', options.sort);
    if (options.name) params.append('name', options.name);
    if (options.role) params.append('role', options.role);
    
    const response = await fetch(`${this.BASE_URL}/users?${params}`, {
      headers: {
        'Authorization': `Bearer ${this.API_KEY}`
      }
    });
    
    if (!response.ok) {
      const errorData = await response.json();
      throw new Error(`Failed to list users: ${errorData.error.message}`);
    }
    
    return await response.json();
  },
  
  async getUserById(userId) {
    const response = await fetch(`${this.BASE_URL}/users/${userId}`, {
      headers: {
        'Authorization': `Bearer ${this.API_KEY}`
      }
    });
    
    if (response.status === 404) {
      return null;
    }
    
    if (!response.ok) {
      const errorData = await response.json();
      throw new Error(`Failed to get user: ${errorData.error.message}`);
    }
    
    return await response.json();
  },
  
  async updateUser(userId, updates) {
    const response = await fetch(`${this.BASE_URL}/users/${userId}`, {
      method: 'PATCH',
      headers: {
        'Authorization': `Bearer ${this.API_KEY}`,
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(updates)
    });
    
    if (!response.ok) {
      const errorData = await response.json();
      throw new Error(`Failed to update user: ${errorData.error.message}`);
    }
    
    return await response.json();
  },
  
  async deleteUser(userId) {
    const response = await fetch(`${this.BASE_URL}/users/${userId}`, {
      method: 'DELETE',
      headers: {
        'Authorization': `Bearer ${this.API_KEY}`
      }
    });
    
    if (response.status === 204) {
      return true;
    }
    
    const errorData = await response.json();
    throw new Error(`Failed to delete user: ${errorData.error.message}`);
  }
};

// Example workflow
async function userManagementWorkflow() {
  try {
    // 1. Create a new user
    console.log('Creating a new user...');
    const newUser = await userManagement.createUser(
      'Alice Johnson',
      'alice.johnson@example.com',
      'member'
    );
    console.log('User created:', newUser);
    
    // 2. List users
    console.log('\nListing all users...');
    const userList = await userManagement.listUsers({
      limit: 10,
      sort: 'name'
    });
    console.log(`Found ${userList.pagination.total} users:`);
    userList.data.forEach(user => {
      console.log(`- ${user.name} (${user.role})`);
    });
    
    // 3. Update the user
    console.log('\nUpdating user...');
    const updatedUser = await userManagement.updateUser(
      newUser.id,
      { name: 'Alice Smith' }
    );
    console.log('User updated:', updatedUser);
    
    // 4. Get the updated user
    console.log('\nRetrieving updated user...');
    const retrievedUser = await userManagement.getUserById(newUser.id);
    console.log('Retrieved user:', retrievedUser);
    
    // 5. Delete the user
    console.log('\nDeleting user...');
    await userManagement.deleteUser(newUser.id);
    console.log('User deleted');
    
    // 6. Verify deletion
    console.log('\nVerifying deletion...');
    const deletedUser = await userManagement.getUserById(newUser.id);
    if (deletedUser === null) {
      console.log('User successfully deleted');
    } else {
      console.log('User was not deleted');
    }
    
  } catch (error) {
    console.error('Workflow failed:', error);
  }
}

// Run the workflow
userManagementWorkflow();
```

## Common Errors and Troubleshooting

Here are some common errors you might encounter when working with users:

### Email Already In Use

If you try to create a user with an email that already exists:

```json
{
  "error": {
    "code": "resource_conflict",
    "message": "Email address is already in use"
  }
}
```

**Solution**: Check if the user already exists before creating, or handle this error by suggesting a different email address.

### Permission Denied

If you try to perform an operation without sufficient permissions:

```json
{
  "error": {
    "code": "permission_denied",
    "message": "You don't have permission to perform this action"
  }
}
```

**Solution**: Use an API key with appropriate permissions, or request elevated privileges.

### User Not Found

If you try to retrieve, update, or delete a non-existent user:

```json
{
  "error": {
    "code": "resource_not_found",
    "message": "User with ID 'user123' not found"
  }
}
```

**Solution**: Verify the user ID is correct, and handle this error gracefully in your application.

## Best Practices

1. **Validate Input**: Validate user data before sending API requests to reduce errors.

2. **Handle Errors Gracefully**: Implement proper error handling for all API requests.

3. **Confirm Destructive Actions**: Always confirm with the user before performing destructive actions like deletion.

4. **Pagination**: Use pagination when listing users to improve performance and user experience.

5. **Role-Based Access Control**: Implement appropriate role checks in your application based on user roles.

6. **Email Validation**: Validate email formats client-side before creating or updating users.

7. **Consistent Error Handling**: Develop a consistent approach to handling and displaying API errors in your application.

## Next Steps

Now that you understand the basics of user management, you can:

1. Explore how to [assign tasks to users](/tutorials/task-management-workflow.md)
2. Learn about [task status transitions](/core-concepts/task-status-lifecycle.md)
3. Implement more advanced [user filtering and sorting](/api-reference/get-all-users.md)
4. Explore [security best practices](/advanced/security-best-practices.md) for your application

## Conclusion

In this tutorial, you've learned how to perform essential user management operations with the Task Management API. You now know how to create, list, retrieve, update, and delete users, which forms the foundation for building user management features in your application.


