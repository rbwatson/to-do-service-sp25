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


