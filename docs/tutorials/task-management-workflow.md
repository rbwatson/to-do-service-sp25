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


