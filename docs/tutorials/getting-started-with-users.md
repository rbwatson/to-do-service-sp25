---
title: "Getting started with users"
description: "A practical guide to creating, listing, updating, and deleting users in the Task Management API."
tags: ["tutorial", "users"]
categories: ["tutorials"]
importance: 6
parent: "Tutorials & Guides" 
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 20, 2025"
nav_order: "1"
layout: "default"
version: "v1.0.0"
lastUpdated: "May 20, 2025"
---

# Getting started with users

This tutorial guides you through the basics of user management using the Task Management API. You'll learn how to create, list, update, and delete users.

## Prerequisites

Before you begin, make sure you have:

1. A bearer token for authentication
2. Access to the API endpoint (default: `http://localhost:3000`)
3. A tool for making HTTP requests (cURL, Postman, or code in your preferred language)

## Step 1: Create a user

Let's start by creating a new user in the system.

### Request

```javascript
// JavaScript example
fetch('http://localhost:3000/users', {
  method: 'POST',
  headers: {
    'Authorization': 'Bearer your-token-here',
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({
    firstName: 'Jane',
    lastName: 'Smith',
    contactEmail: 'jane.smith@example.com'
  })
})
.then(response => response.json())
.then(data => {
  console.log('User created:', data);
  // Store the userId for later use
  const userId = data.userId;
});
```

```python
# Python example
import requests

url = "http://localhost:3000/users"
headers = {
    "Authorization": "Bearer your-token-here",
    "Content-Type": "application/json"
}
data = {
    "firstName": "Jane",
    "lastName": "Smith",
    "contactEmail": "jane.smith@example.com"
}

response = requests.post(url, headers=headers, json=data)
user_data = response.json()
print("User created:", user_data)
# Store the userId for later use
user_id = user_data["userId"]
```

### Response

```json
{
  "userId": 1,
  "firstName": "Jane",
  "lastName": "Smith",
  "contactEmail": "jane.smith@example.com"
}
```

## Step 2: Create multiple users

Let's create a few more users to work with.

### Request

```javascript
// JavaScript example: Function to create multiple users
async function createMultipleUsers(users) {
  const createdUsers = [];
  
  for (const user of users) {
    try {
      const response = await fetch('http://localhost:3000/users', {
        method: 'POST',
        headers: {
          'Authorization': 'Bearer your-token-here',
          'Content-Type': 'application/json'
        },
        body: JSON.stringify(user)
      });
      
      if (!response.ok) {
        throw new Error(`Failed to create user: ${user.firstName} ${user.lastName}`);
      }
      
      const userData = await response.json();
      createdUsers.push(userData);
      console.log(`User created: ${userData.firstName} ${userData.lastName} (ID: ${userData.userId})`);
    } catch (error) {
      console.error(error);
    }
  }
  
  return createdUsers;
}

// Create multiple users
const usersToCreate = [
  {
    firstName: 'John',
    lastName: 'Doe',
    contactEmail: 'john.doe@example.com'
  },
  {
    firstName: 'Alice',
    lastName: 'Johnson',
    contactEmail: 'alice.johnson@example.com'
  },
  {
    firstName: 'Bob',
    lastName: 'Brown',
    contactEmail: 'bob.brown@example.com'
  }
];

createMultipleUsers(usersToCreate)
  .then(users => {
    console.log(`Created ${users.length} users successfully`);
  });
```

```python
# Python example: Function to create multiple users
def create_multiple_users(token, users):
    created_users = []
    
    for user in users:
        try:
            url = "http://localhost:3000/users"
            headers = {
                "Authorization": f"Bearer {token}",
                "Content-Type": "application/json"
            }
            
            response = requests.post(url, headers=headers, json=user)
            response.raise_for_status()
            
            user_data = response.json()
            created_users.append(user_data)
            print(f"User created: {user_data['firstName']} {user_data['lastName']} (ID: {user_data['userId']})")
        except Exception as e:
            print(f"Failed to create user: {user['firstName']} {user['lastName']}")
            print(f"Error: {str(e)}")
    
    return created_users

# Create multiple users
users_to_create = [
    {
        "firstName": "John",
        "lastName": "Doe",
        "contactEmail": "john.doe@example.com"
    },
    {
        "firstName": "Alice",
        "lastName": "Johnson",
        "contactEmail": "alice.johnson@example.com"
    },
    {
        "firstName": "Bob",
        "lastName": "Brown",
        "contactEmail": "bob.brown@example.com"
    }
]

created_users = create_multiple_users("your-token-here", users_to_create)
print(f"Created {len(created_users)} users successfully")
```

## Step 3: List all users

Now that we've created several users, let's retrieve all users from the system.

### Request

```javascript
// JavaScript example
fetch('http://localhost:3000/users', {
  headers: {
    'Authorization': 'Bearer your-token-here'
  }
})
.then(response => response.json())
.then(data => {
  console.log('All users:', data.users);
  console.log(`Retrieved ${data.users.length} users`);
});
```

```python
# Python example
import requests

url = "http://localhost:3000/users"
headers = {
    "Authorization": "Bearer your-token-here"
}

response = requests.get(url, headers=headers)
data = response.json()
print("All users:", data["users"])
print(f"Retrieved {len(data['users'])} users")
```

### Response

```json
{
  "users": [
    {
      "userId": 1,
      "firstName": "Jane",
      "lastName": "Smith",
      "contactEmail": "jane.smith@example.com"
    },
    {
      "userId": 2,
      "firstName": "John",
      "lastName": "Doe",
      "contactEmail": "john.doe@example.com"
    },
    {
      "userId": 3,
      "firstName": "Alice",
      "lastName": "Johnson",
      "contactEmail": "alice.johnson@example.com"
    },
    {
      "userId": 4,
      "firstName": "Bob",
      "lastName": "Brown",
      "contactEmail": "bob.brown@example.com"
    }
  ]
}
```

## Step 4: Get a specific user

Let's retrieve a specific user by their ID. We'll use the ID of the first user we created.

### Request

```javascript
// JavaScript example
const userId = 1; // Use the ID from the first created user

fetch(`http://localhost:3000/users/${userId}`, {
  headers: {
    'Authorization': 'Bearer your-token-here'
  }
})
.then(response => response.json())
.then(data => {
  console.log('User details:', data);
});
```

```python
# Python example
import requests

user_id = 1  # Use the ID from the first created user
url = f"http://localhost:3000/users/{user_id}"
headers = {
    "Authorization": "Bearer your-token-here"
}

response = requests.get(url, headers=headers)
user_data = response.json()
print("User details:", user_data)
```

### Response

```json
{
  "userId": 1,
  "firstName": "Jane",
  "lastName": "Smith",
  "contactEmail": "jane.smith@example.com"
}
```

## Step 5: Update a user

Now let's update the user's information.

### Request

```javascript
// JavaScript example
const userId = 1; // Use the ID from the first created user

fetch(`http://localhost:3000/users/${userId}`, {
  method: 'PATCH',
  headers: {
    'Authorization': 'Bearer your-token-here',
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({
    contactEmail: 'jane.updated@example.com'
  })
})
.then(response => response.json())
.then(data => {
  console.log('Updated user:', data);
});
```

```python
# Python example
import requests

user_id = 1  # Use the ID from the first created user
url = f"http://localhost:3000/users/{user_id}"
headers = {
    "Authorization": "Bearer your-token-here",
    "Content-Type": "application/json"
}
data = {
    "contactEmail": "jane.updated@example.com"
}

response = requests.patch(url, headers=headers, json=data)
updated_user = response.json()
print("Updated user:", updated_user)
```

### Response

```json
{
  "userId": 1,
  "firstName": "Jane",
  "lastName": "Smith",
  "contactEmail": "jane.updated@example.com"
}
```

## Step 6: Delete a user

Finally, let's delete one of the users we created.

### Request

```javascript
// JavaScript example
const userId = 4; // Let's delete the last user we created (Bob Brown)

fetch(`http://localhost:3000/users/${userId}`, {
  method: 'DELETE',
  headers: {
    'Authorization': 'Bearer your-token-here'
  }
})
.then(response => {
  if (response.status === 204) {
    console.log(`User with ID ${userId} deleted successfully`);
  } else {
    console.error(`Failed to delete user with ID ${userId}`);
  }
});
```

```python
# Python example
import requests

user_id = 4  # Let's delete the last user we created (Bob Brown)
url = f"http://localhost:3000/users/{user_id}"
headers = {
    "Authorization": "Bearer your-token-here"
}

response = requests.delete(url, headers=headers)
if response.status_code == 204:
    print(f"User with ID {user_id} deleted successfully")
else:
    print(f"Failed to delete user with ID {user_id}")
```

### Response

A successful deletion returns a 204 No Content status code with no response body.

## Step 7: Verify deletion

Let's verify that the user was deleted by listing all users again.

### Request

```javascript
// JavaScript example
fetch('http://localhost:3000/users', {
  headers: {
    'Authorization': 'Bearer your-token-here'
  }
})
.then(response => response.json())
.then(data => {
  console.log('Remaining users:', data.users);
  console.log(`There are now ${data.users.length} users in the system`);
  
  // Verify the user is no longer in the list
  const deletedUserExists = data.users.some(user => user.userId === 4);
  console.log(`User with ID 4 still exists: ${deletedUserExists}`);
});
```

```python
# Python example
import requests

url = "http://localhost:3000/users"
headers = {
    "Authorization": "Bearer your-token-here"
}

response = requests.get(url, headers=headers)
data = response.json()
print("Remaining users:", data["users"])
print(f"There are now {len(data['users'])} users in the system")

# Verify the user is no longer in the list
deleted_user_exists = any(user["userId"] == 4 for user in data["users"])
print(f"User with ID 4 still exists: {deleted_user_exists}")
```

## Complete code example

Here's a complete JavaScript example that performs all the steps in this tutorial:

```javascript
// Complete JavaScript example for user management
async function userManagementTutorial() {
  const baseUrl = 'http://localhost:3000';
  const token = 'your-token-here';
  const headers = {
    'Authorization': `Bearer ${token}`,
    'Content-Type': 'application/json'
  };
  
  try {
    // Step 1: Create a user
    console.log('Step 1: Creating a user');
    const createResponse = await fetch(`${baseUrl}/users`, {
      method: 'POST',
      headers,
      body: JSON.stringify({
        firstName: 'Jane',
        lastName: 'Smith',
        contactEmail: 'jane.smith@example.com'
      })
    });
    
    if (!createResponse.ok) {
      throw new Error('Failed to create user');
    }
    
    const firstUser = await createResponse.json();
    console.log('First user created:', firstUser);
    
    // Step 2: Create multiple users
    console.log('\nStep 2: Creating multiple users');
    const usersToCreate = [
      {
        firstName: 'John',
        lastName: 'Doe',
        contactEmail: 'john.doe@example.com'
      },
      {
        firstName: 'Alice',
        lastName: 'Johnson',
        contactEmail: 'alice.johnson@example.com'
      },
      {
        firstName: 'Bob',
        lastName: 'Brown',
        contactEmail: 'bob.brown@example.com'
      }
    ];
    
    const createdUsers = [];
    for (const user of usersToCreate) {
      const response = await fetch(`${baseUrl}/users`, {
        method: 'POST',
        headers,
        body: JSON.stringify(user)
      });
      
      if (response.ok) {
        const userData = await response.json();
        createdUsers.push(userData);
        console.log(`User created: ${userData.firstName} ${userData.lastName} (ID: ${userData.userId})`);
      } else {
        console.error(`Failed to create user: ${user.firstName} ${user.lastName}`);
      }
    }
    
    // Step 3: List all users
    console.log('\nStep 3: Listing all users');
    const listResponse = await fetch(`${baseUrl}/users`, {
      headers: { 'Authorization': headers.Authorization }
    });
    
    if (!listResponse.ok) {
      throw new Error('Failed to list users');
    }
    
    const usersList = await listResponse.json();
    console.log(`Retrieved ${usersList.users.length} users`);
    
    // Step 4: Get a specific user
    console.log('\nStep 4: Getting a specific user');
    const userId = firstUser.userId;
    const getResponse = await fetch(`${baseUrl}/users/${userId}`, {
      headers: { 'Authorization': headers.Authorization }
    });
    
    if (!getResponse.ok) {
      throw new Error(`Failed to get user with ID ${userId}`);
    }
    
    const userDetails = await getResponse.json();
    console.log('User details:', userDetails);
    
    // Step 5: Update a user
    console.log('\nStep 5: Updating a user');
    const updateResponse = await fetch(`${baseUrl}/users/${userId}`, {
      method: 'PATCH',
      headers,
      body: JSON.stringify({
        contactEmail: 'jane.updated@example.com'
      })
    });
    
    if (!updateResponse.ok) {
      throw new Error(`Failed to update user with ID ${userId}`);
    }
    
    const updatedUser = await updateResponse.json();
    console.log('Updated user:', updatedUser);
    
    // Step 6: Delete a user
    console.log('\nStep 6: Deleting a user');
    const userToDelete = createdUsers[2].userId; // Delete Bob Brown
    const deleteResponse = await fetch(`${baseUrl}/users/${userToDelete}`, {
      method: 'DELETE',
      headers: { 'Authorization': headers.Authorization }
    });
    
    if (deleteResponse.status === 204) {
      console.log(`User with ID ${userToDelete} deleted successfully`);
    } else {
      throw new Error(`Failed to delete user with ID ${userToDelete}`);
    }
    
    // Step 7: Verify deletion
    console.log('\nStep 7: Verifying deletion');
    const verifyResponse = await fetch(`${baseUrl}/users`, {
      headers: { 'Authorization': headers.Authorization }
    });
    
    if (!verifyResponse.ok) {
      throw new Error('Failed to list users for verification');
    }
    
    const updatedList = await verifyResponse.json();
    console.log(`There are now ${updatedList.users.length} users in the system`);
    
    const deletedUserExists = updatedList.users.some(user => user.userId === userToDelete);
    console.log(`User with ID ${userToDelete} still exists: ${deletedUserExists}`);
    
    console.log('\nUser management tutorial completed successfully!');
  } catch (error) {
    console.error('Error during tutorial:', error);
  }
}

// Run the tutorial
userManagementTutorial();
```

## Next steps

Now that you've learned the basics of user management, you can:

1. Create a user interface to manage users
2. Implement validation for user input
3. Set up error handling for API requests
4. Learn how to manage tasks by following the [Task management workflow](task-management-workflow.md) tutorial

## Related resources

- [User resource](../resources/user-resource.md)
- [API reference: User endpoints](../api-reference.md#user-endpoints)
- [Task management workflow](task-management-workflow.md)--- FILE: api-reference/delete-task.md ---
---
title: "Delete a task"
description: "API endpoint to remove a task from the system."
tags: ["tasks", "endpoint", "DELETE"]
categories: ["api-reference"]
importance: 7
api_endpoints: ["/tasks/{taskId}"]
related_pages: ["task-resource"]
parent: "API Reference" 
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 20, 2025"
nav_order: "11"
layout: "default"
version: "v1.0.0"
lastUpdated: "May 20, 2025"
---

# Delete a task

Removes a task from the system. This operation is irreversible.

## Endpoint

```
DELETE /tasks/{taskId}
```

## Path parameters

| Parameter | Type | Description | Required |
|-----------|------|-------------|----------|
| `taskId` | integer | The unique identifier of the task to delete | Yes |

## Request example

```bash
# cURL example
curl -X DELETE http://localhost:3000/tasks/1 \
  -H "Authorization: Bearer your-token-here"
```

```python
# Python example
import requests

url = "http://localhost:3000/tasks/1"
headers = {
    "Authorization": "Bearer your-token-here"
}

response = requests.delete(url, headers=headers)
print(response.status_code)
```

```javascript
// JavaScript example
fetch('http://localhost:3000/tasks/1', {
  method: 'DELETE',
  headers: {
    'Authorization': 'Bearer your-token-here'
  }
})
.then(response => {
  if (response.ok) {
    console.log('Task deleted successfully');
  } else {
    throw new Error('Failed to delete task');
  }
})
.catch(error => console.error(error));
```

## Response

### Success response (204 No Content)

A successful response returns an HTTP 204 status code with no content in the response body.

### Error responses

| Status code | Description | Error code |
|-------------|-------------|------------|
| 400 Bad Request | Invalid task ID format | `INVALID_FIELD` |
| 401 Unauthorized | Missing or invalid authentication | `UNAUTHORIZED` |
| 403 Forbidden | Insufficient permissions | `FORBIDDEN` |
| 404 Not Found | Task not found | `RESOURCE_NOT_FOUND` |
| 429 Too Many Requests | Rate limit exceeded | `RATE_LIMIT_EXCEEDED` |
| 500 Server Error | Unexpected server error | `SERVER_ERROR` |

See [Error responses](error-responses.md) for details on error response format.

## Authentication

This endpoint requires authentication using a bearer token:

```
Authorization: Bearer your-token-here
```

## Important considerations

- This operation is irreversible. Once a task is deleted, it cannot be recovered.
- The `taskId` must be a valid integer that corresponds to an existing task. If the specified task does not exist, the API will return a 404 Not Found response.
- The API will not return a response body on success, only an HTTP 204 status code.
- Only the user who owns the task or a user with appropriate permissions can delete a task.

## Best practices

- Implement a confirmation step in your application before sending the delete request to prevent accidental deletions.
- Consider implementing a soft delete mechanism in your application if you need the ability to recover deleted tasks.
- As an alternative to deletion, you might want to update the task status to `CANCELLED` to maintain a history of tasks.
- Update your application's state after a successful deletion to reflect the change.
- Handle the 404 Not Found response gracefully if the task has already been deleted.

## Code examples

### Delete a task with error handling

```javascript
// JavaScript example: Delete a task with error handling
async function deleteTask(taskId) {
  try {
    const response = await fetch(`http://localhost:3000/tasks/${taskId}`, {
      method: 'DELETE',
      headers: {
        'Authorization': 'Bearer your-token-here'
      }
    });
    
    if (!response.ok) {
      let errorMessage = `Failed to delete task with ID ${taskId}`;
      
      if (response.status === 404) {
        errorMessage = `Task with ID ${taskId} not found`;
      }
      
      // Try to get more detailed error information if available
      try {
        const errorData = await response.json();
        errorMessage = errorData.message || errorMessage;
      } catch (parseError) {
        // Unable to parse error response as JSON, use default message
      }
      
      throw new Error(errorMessage);
    }
    
    return true; // Successful deletion
  } catch (error) {
    console.error(`Error deleting task with ID ${taskId}:`, error);
    throw error;
  }
}

// Usage example
try {
  const success = await deleteTask(1);
  if (success) {
    console.log('Task deleted successfully');
    // Update application state to reflect deletion
    // E.g., remove the task from the tasks list in the UI
  }
} catch (error) {
  console.error('Failed to delete task:', error.message);
  // Show error message to the user
}
```

```python
# Python example: Delete a task with error handling
def delete_task(token, task_id):
    try:
        url = f"http://localhost:3000/tasks/{task_id}"
        headers = {
            "Authorization": f"Bearer {token}"
        }
        
        response = requests.delete(url, headers=headers)
        
        if response.status_code == 204:
            return True  # Successful deletion
        
        if response.status_code == 404:
            print(f"Task with ID {task_id} not found")
            return False
            
        # Handle other error responses
        try:
            error_data = response.json()
            print(f"API error: {error_data.get('message', f'Status code: {response.status_code}')}")
        except ValueError:
            # Could not parse error response as JSON
            print(f"Error deleting task. Status code: {response.status_code}")
        
        return False
    except Exception as e:
        print(f"Error deleting task: {str(e)}")
        return False

# Usage example
success = delete_task("your-token-here", 1)

if success:
    print("Task deleted successfully")
    # Update application state to reflect deletion
    # E.g., remove the task from the tasks list in the UI
else:
    print("Failed to delete task")
    # Show error message to the user
```

## Alternative approach: Cancel instead of delete

In some cases, you might want to maintain a history of tasks rather than deleting them. Here's an example of marking a task as cancelled instead of deleting it:

```javascript
// JavaScript example: Mark a task as cancelled instead of deleting
async function cancelTask(taskId) {
  try {
    const response = await fetch(`http://localhost:3000/tasks/${taskId}`, {
      method: 'PATCH',
      headers: {
        'Authorization': 'Bearer your-token-here',
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        taskStatus: 'CANCELLED'
      })
    });
    
    if (!response.ok) {
      const errorData = await response.json();
      throw new Error(errorData.message || `Failed to cancel task with ID ${taskId}`);
    }
    
    return await response.json();
  } catch (error) {
    console.error(`Error cancelling task with ID ${taskId}:`, error);
    throw error;
  }
}

// Usage example
try {
  const cancelledTask = await cancelTask(1);
  console.log(`Task "${cancelledTask.taskTitle}" cancelled successfully`);
} catch (error) {
  console.error('Failed to cancel task:', error.message);
}
```

## Related resources

- [Task resource](../resources/task-resource.md)

## See also

- [Get all tasks](get-all-tasks.md)
- [Create a task](create-task.md)
- [Get task by ID](get-task-by-id.md)
- [Update a task](update-task.md)--- FILE: api-reference/update-task.md ---
---
title: "Update a task"
description: "API endpoint to update an existing task's information, including changing its status."
tags: ["tasks", "endpoint", "PATCH"]
categories: ["api-reference"]
importance: 7
api_endpoints: ["/tasks/{taskId}"]
related_pages: ["task-resource", "task-status-lifecycle"]
parent: "API Reference" 
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 20, 2025"
nav_order: "10"
layout: "default"
version: "v1.0.0"
lastUpdated: "May 20, 2025"
---

# Update a task

Updates one or more properties of an existing task. The API supports partial updates, so you only need to include the fields you want to change.

## Endpoint

```
PATCH /tasks/{taskId}
```

## Path parameters

| Parameter | Type | Description | Required |
|-----------|------|-------------|----------|
| `taskId` | integer | The unique identifier of the task to update | Yes |

## Request body

| Property | Type | Description | Required | Constraints |
|----------|------|-------------|----------|------------|
| `userId` | integer | ID of the user who owns the task | No | Must reference a valid user |
| `taskTitle` | string | Short description of the task | No | 1-80 characters |
| `taskDescription` | string | Detailed description of the task | No | 1-255 characters |
| `taskStatus` | string | Current status of the task | No | Must be one of the predefined status values |
| `dueDate` | string (date-time) | When the task is due | No | ISO 8601 format |
| `warningOffset` | integer | Minutes before due date to send reminder | No | 0-64000 |

You must include at least one property in the request body.

Example request body:

```json
{
  "taskStatus": "COMPLETED"
}
```

## Request example

```bash
# cURL example
curl -X PATCH http://localhost:3000/tasks/1 \
  -H "Authorization: Bearer your-token-here" \
  -H "Content-Type: application/json" \
  -d '{
    "taskStatus": "COMPLETED"
  }'
```

```python
# Python example
import requests

url = "http://localhost:3000/tasks/1"
headers = {
    "Authorization": "Bearer your-token-here",
    "Content-Type": "application/json"
}
data = {
    "taskStatus": "COMPLETED"
}

response = requests.patch(url, headers=headers, json=data)
print(response.json())
```

```javascript
// JavaScript example
fetch('http://localhost:3000/tasks/1', {
  method: 'PATCH',
  headers: {
    'Authorization': 'Bearer your-token-here',
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({
    taskStatus: 'COMPLETED'
  })
})
.then(response => response.json())
.then(data => console.log(data));
```

## Response

### Success response (200 OK)

```json
{
  "taskId": 1,
  "userId": 1,
  "taskTitle": "Complete project proposal",
  "taskDescription": "Finish the proposal for the new client project",
  "taskStatus": "COMPLETED",
  "dueDate": "2025-06-15T17:00:00-05:00",
  "warningOffset": 120
}
```

### Error responses

| Status code | Description | Error code |
|-------------|-------------|------------|
| 400 Bad Request | Invalid request body or task ID | `INVALID_FIELD` |
| 401 Unauthorized | Missing or invalid authentication | `UNAUTHORIZED` |
| 403 Forbidden | Insufficient permissions | `FORBIDDEN` |
| 404 Not Found | Task not found | `RESOURCE_NOT_FOUND` |
| 429 Too Many Requests | Rate limit exceeded | `RATE_LIMIT_EXCEEDED` |
| 500 Server Error | Unexpected server error | `SERVER_ERROR` |

See [Error responses](error-responses.md) for details on error response format.

## Authentication

This endpoint requires authentication using a bearer token:

```
Authorization: Bearer your-token-here
```

## Important considerations

- You must include at least one property in the request body. If the request body is empty or doesn't contain any valid properties, the API will return a 400 Bad Request response.
- The `taskId` must be a valid integer that corresponds to an existing task. If the specified task does not exist, the API will return a 404 Not Found response.
- The `userId` must reference an existing user in the system if provided.
- The `taskStatus` must be one of the predefined status values if provided.
- The `dueDate` must be in ISO 8601 format if provided.
- String fields have minimum and maximum length constraints. If a field value is too short or too long, the API will return a 400 Bad Request response with an `INVALID_FIELD` error code.
- The response includes the complete task object with all properties, including those that weren't updated.

## Best practices

- Only include the fields you want to update in the request body to minimize payload size.
- When updating a task's status, follow the typical status transitions described in the [Task status lifecycle](../core-concepts/task-status-lifecycle.md) documentation.
- Validate user input on the client side before sending the request to reduce unnecessary API calls.
- Use this endpoint to mark tasks as completed by updating the `taskStatus` field to `COMPLETED`.
- Consider implementing optimistic updates in your UI to improve perceived performance.

## Code examples

### Update a task status with error handling

```javascript
// JavaScript example: Update a task status with error handling
async function updateTaskStatus(taskId, newStatus) {
  try {
    const response = await fetch(`http://localhost:3000/tasks/${taskId}`, {
      method: 'PATCH',
      headers: {
        'Authorization': 'Bearer your-token-here',
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        taskStatus: newStatus
      })
    });
    
    if (!response.ok) {
      const errorData = await response.json();
      
      // Handle specific error cases
      if (errorData.code === 'RESOURCE_NOT_FOUND') {
        throw new Error(`Task with ID ${taskId} not found`);
      }
      
      if (errorData.code === 'INVALID_FIELD') {
        const fieldErrors = {};
        
        if (errorData.details) {
          errorData.details.forEach(detail => {
            fieldErrors[detail.field] = detail.reason;
          });
        }
        
        throw {
          message: errorData.message,
          fieldErrors
        };
      }
      
      throw new Error(errorData.message || `Failed to update task with ID ${taskId}`);
    }
    
    return await response.json();
  } catch (error) {
    console.error(`Error updating task with ID ${taskId}:`, error);
    throw error;
  }
}

// Usage example
try {
  const updatedTask = await updateTaskStatus(1, 'COMPLETED');
  console.log('Task updated:', updatedTask);
  
  // Show success message based on the update
  if (updatedTask.taskStatus === 'COMPLETED') {
    console.log(`Task "${updatedTask.taskTitle}" marked as completed!`);
  }
} catch (error) {
  if (error.fieldErrors) {
    // Handle field-specific errors
    Object.entries(error.fieldErrors).forEach(([field, reason]) => {
      console.error(`Error in ${field}: ${reason}`);
      // Update UI to show error for this field
    });
  } else {
    // Handle general error
    console.error('Failed to update task:', error.message);
  }
}
```

```python
# Python example: Update a task status with error handling
def update_task_status(token, task_id, new_status):
    try:
        url = f"http://localhost:3000/tasks/{task_id}"
        headers = {
            "Authorization": f"Bearer {token}",
            "Content-Type": "application/json"
        }
        data = {
            "taskStatus": new_status
        }
        
        response = requests.patch(url, headers=headers, json=data)
        
        if response.status_code == 404:
            print(f"Task with ID {task_id} not found")
            return None
            
        response.raise_for_status()  # Raise exception for other 4XX/5XX status codes
        
        return response.json()
    except requests.exceptions.HTTPError as e:
        # Handle API errors
        try:
            error_data = e.response.json()
            
            # Handle field-specific errors
            if error_data.get("code") == "INVALID_FIELD":
                field_errors = {}
                
                if "details" in error_data:
                    for detail in error_data["details"]:
                        field_errors[detail["field"]] = detail["reason"]
                
                print(f"Validation error: {error_data['message']}")
                for field, reason in field_errors.items():
                    print(f"  - {field}: {reason}")
            else:
                print(f"API error: {error_data.get('message', str(e))}")
                
            return None
        except ValueError:
            # Could not parse error response as JSON
            print(f"Error updating task: {str(e)}")
            return None
    except Exception as e:
        print(f"Error updating task: {str(e)}")
        return None

# Usage example
updated_task = update_task_status("your-token-here", 1, "COMPLETED")

if updated_task:
    print(f"Task updated: {updated_task}")
    
    # Show success message based on the update
    if updated_task["taskStatus"] == "COMPLETED":
        print(f"Task \"{updated_task['taskTitle']}\" marked as completed!")
else:
    print("Failed to update task")
```

## Related resources

- [Task resource](../resources/task-resource.md)
- [Task status lifecycle](../core-concepts/task-status-lifecycle.md)

## See also

- [Get all tasks](get-all-tasks.md)
- [Create a task](create-task.md)
- [Get task by ID](get-task-by-id.md)
- [Delete a task](delete-task.md)

