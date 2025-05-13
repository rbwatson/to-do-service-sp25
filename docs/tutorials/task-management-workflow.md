---
title: "Task management workflow"
description: "A guide to implementing a complete task management workflow using the API, from creation to completion."
tags: ["tutorial", "tasks", "workflow"]
categories: ["tutorials"]
importance: 6
parent: "Tutorials & Guides"
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "2025-05-13"
nav_order: "2"
layout: "default"
version: "v1.0.0"
lastUpdated: "2025-05-13"
---

# Task Management Workflow

This tutorial guides you through implementing a complete task management workflow using the Task Management API. You'll learn how to create tasks, assign them to users, update their status through the full lifecycle, and track their completion.

## Overview

A typical task management workflow involves these stages:

1. **Task Creation**: Create a new task with title, description, and priority
2. **Task Assignment**: Assign the task to a user
3. **Task Progress Tracking**: Update the task's status as work progresses
4. **Task Completion**: Mark the task as done when completed
5. **Task Reporting**: Generate insights on task completion and performance

This tutorial will walk you through each stage with practical code examples.

## Prerequisites

Before you begin, make sure you have:

- An API key for the Task Management API
- Appropriate permissions to work with tasks
- A basic understanding of the [Task Status Lifecycle](/core-concepts/task-status-lifecycle.md)

## 1. Task Creation

First, let's create a new task using the `POST /tasks` endpoint.

### Request

```http
POST /tasks
Content-Type: application/json
Authorization: Bearer YOUR_API_KEY

{
  "title": "Implement user authentication",
  "description": "Add token-based authentication to the web application",
  "priority": "HIGH",
  "dueDate": "2025-06-01T17:00:00Z",
  "tags": ["authentication", "security"]
}
```

### Response

```json
{
  "id": "task123",
  "title": "Implement user authentication",
  "description": "Add token-based authentication to the web application",
  "status": "TODO",
  "priority": "HIGH",
  "createdBy": "user456",
  "assigneeId": null,
  "dueDate": "2025-06-01T17:00:00Z",
  "tags": ["authentication", "security"],
  "createdAt": "2025-05-13T10:30:00Z",
  "updatedAt": "2025-05-13T10:30:00Z"
}
```

### Code Example

```javascript
async function createTask(taskData) {
  const response = await fetch('https://api.taskmanagement.example.com/v1/tasks', {
    method: 'POST',
    headers: {
      'Authorization': `Bearer ${API_KEY}`,
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(taskData)
  });
  
  if (!response.ok) {
    const errorData = await response.json();
    throw new Error(`Failed to create task: ${errorData.error.message}`);
  }
  
  return await response.json();
}

// Example usage
const newTask = await createTask({
  title: 'Implement user authentication',
  description: 'Add token-based authentication to the web application',
  priority: 'HIGH',
  dueDate: '2025-06-01T17:00:00Z',
  tags: ['authentication', 'security']
});

console.log(`Task created with ID: ${newTask.id}`);
```

## 2. Task Assignment

Now that we have created a task, let's assign it to a specific user.

### Request

```http
PATCH /tasks/task123
Content-Type: application/json
Authorization: Bearer YOUR_API_KEY

{
  "assigneeId": "user789"
}
```

### Response

```json
{
  "id": "task123",
  "title": "Implement user authentication",
  "description": "Add token-based authentication to the web application",
  "status": "TODO",
  "priority": "HIGH",
  "createdBy": "user456",
  "assigneeId": "user789",
  "dueDate": "2025-06-01T17:00:00Z",
  "tags": ["authentication", "security"],
  "createdAt": "2025-05-13T10:30:00Z",
  "updatedAt": "2025-05-13T10:45:00Z"
}
```

### Code Example

```javascript
async function assignTask(taskId, userId) {
  const response = await fetch(`https://api.taskmanagement.example.com/v1/tasks/${taskId}`, {
    method: 'PATCH',
    headers: {
      'Authorization': `Bearer ${API_KEY}`,
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({
      assigneeId: userId
    })
  });
  
  if (!response.ok) {
    const errorData = await response.json();
    throw new Error(`Failed to assign task: ${errorData.error.message}`);
  }
  
  return await response.json();
}

// Example usage
const updatedTask = await assignTask('task123', 'user789');
console.log(`Task assigned to user: ${updatedTask.assigneeId}`);
```

## 3. Starting Work on a Task

When the assigned user begins working on the task, update its status to "IN_PROGRESS".

### Request

```http
PATCH /tasks/task123
Content-Type: application/json
Authorization: Bearer YOUR_API_KEY

{
  "status": "IN_PROGRESS"
}
```

### Response

```json
{
  "id": "task123",
  "title": "Implement user authentication",
  "description": "Add token-based authentication to the web application",
  "status": "IN_PROGRESS",
  "priority": "HIGH",
  "createdBy": "user456",
  "assigneeId": "user789",
  "dueDate": "2025-06-01T17:00:00Z",
  "tags": ["authentication", "security"],
  "createdAt": "2025-05-13T10:30:00Z",
  "updatedAt": "2025-05-13T11:00:00Z"
}
```

### Code Example

```javascript
async function updateTaskStatus(taskId, status) {
  const response = await fetch(`https://api.taskmanagement.example.com/v1/tasks/${taskId}`, {
    method: 'PATCH',
    headers: {
      'Authorization': `Bearer ${API_KEY}`,
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({
      status: status
    })
  });
  
  if (!response.ok) {
    const errorData = await response.json();
    throw new Error(`Failed to update task status: ${errorData.error.message}`);
  }
  
  return await response.json();
}

// Example usage
const inProgressTask = await updateTaskStatus('task123', 'IN_PROGRESS');
console.log(`Task status updated to: ${inProgressTask.status}`);
```

## 4. Submitting a Task for Review

When the work is complete, the task can be moved to the "REVIEW" status to indicate it's ready for review.

### Request

```http
PATCH /tasks/task123
Content-Type: application/json
Authorization: Bearer YOUR_API_KEY

{
  "status": "REVIEW"
}
```

### Response

```json
{
  "id": "task123",
  "title": "Implement user authentication",
  "description": "Add token-based authentication to the web application",
  "status": "REVIEW",
  "priority": "HIGH",
  "createdBy": "user456",
  "assigneeId": "user789",
  "dueDate": "2025-06-01T17:00:00Z",
  "tags": ["authentication", "security"],
  "createdAt": "2025-05-13T10:30:00Z",
  "updatedAt": "2025-05-13T14:30:00Z"
}
```

### Code Example

```javascript
// Using the updateTaskStatus function from the previous step
const reviewTask = await updateTaskStatus('task123', 'REVIEW');
console.log(`Task has been submitted for review`);
```

## 5. Completing a Task

Once the review is successful, mark the task as "DONE".

### Request

```http
PATCH /tasks/task123
Content-Type: application/json
Authorization: Bearer YOUR_API_KEY

{
  "status": "DONE"
}
```

### Response

```json
{
  "id": "task123",
  "title": "Implement user authentication",
  "description": "Add token-based authentication to the web application",
  "status": "DONE",
  "priority": "HIGH",
  "createdBy": "user456",
  "assigneeId": "user789",
  "dueDate": "2025-06-01T17:00:00Z",
  "tags": ["authentication", "security"],
  "createdAt": "2025-05-13T10:30:00Z",
  "updatedAt": "2025-05-13T15:00:00Z"
}
```

### Code Example

```javascript
// Using the updateTaskStatus function from the previous steps
const completedTask = await updateTaskStatus('task123', 'DONE');
console.log(`Task has been completed`);
```

## 6. Handling Rejected Tasks

If a task fails review, it can be moved back to "IN_PROGRESS" with feedback.

### Request

```http
PATCH /tasks/task123
Content-Type: application/json
Authorization: Bearer YOUR_API_KEY

{
  "status": "IN_PROGRESS",
  "description": "Add token-based authentication to the web application. Feedback: Please add unit tests and improve error handling."
}
```

### Response

```json
{
  "id": "task123",
  "title": "Implement user authentication",
  "description": "Add token-based authentication to the web application. Feedback: Please add unit tests and improve error handling.",
  "status": "IN_PROGRESS",
  "priority": "HIGH",
  "createdBy": "user456",
  "assigneeId": "user789",
  "dueDate": "2025-06-01T17:00:00Z",
  "tags": ["authentication", "security"],
  "createdAt": "2025-05-13T10:30:00Z",
  "updatedAt": "2025-05-13T14:45:00Z"
}
```

### Code Example

```javascript
async function rejectTask(taskId, feedback) {
  const response = await fetch(`https://api.taskmanagement.example.com/v1/tasks/${taskId}`, {
    method: 'PATCH',
    headers: {
      'Authorization': `Bearer ${API_KEY}`,
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({
      status: 'IN_PROGRESS',
      description: `${feedback.originalDescription}\nFeedback: ${feedback.comments}`
    })
  });
  
  if (!response.ok) {
    const errorData = await response.json();
    throw new Error(`Failed to reject task: ${errorData.error.message}`);
  }
  
  return await response.json();
}

// Example usage
const rejectedTask = await rejectTask('task123', {
  originalDescription: 'Add token-based authentication to the web application',
  comments: 'Please add unit tests and improve error handling'
});

console.log(`Task rejected and moved back to ${rejectedTask.status}`);
```

## 7. Canceling a Task

If a task is no longer needed, it can be canceled.

### Request

```http
PATCH /tasks/task123
Content-Type: application/json
Authorization: Bearer YOUR_API_KEY

{
  "status": "CANCELED",
  "description": "Add token-based authentication to the web application. Canceled: Authentication will be handled by a third-party service instead."
}
```

### Response

```json
{
  "id": "task123",
  "title": "Implement user authentication",
  "description": "Add token-based authentication to the web application. Canceled: Authentication will be handled by a third-party service instead.",
  "status": "CANCELED",
  "priority": "HIGH",
  "createdBy": "user456",
  "assigneeId": "user789",
  "dueDate": "2025-06-01T17:00:00Z",
  "tags": ["authentication", "security"],
  "createdAt": "2025-05-13T10:30:00Z",
  "updatedAt": "2025-05-13T16:00:00Z"
}
```

### Code Example

```javascript
async function cancelTask(taskId, reason) {
  // First, get the current task details
  const getResponse = await fetch(`https://api.taskmanagement.example.com/v1/tasks/${taskId}`, {
    headers: {
      'Authorization': `Bearer ${API_KEY}`
    }
  });
  
  if (!getResponse.ok) {
    const errorData = await getResponse.json();
    throw new Error(`Failed to get task: ${errorData.error.message}`);
  }
  
  const task = await getResponse.json();
  
  // Update the task with canceled status and reason
  const updateResponse = await fetch(`https://api.taskmanagement.example.com/v1/tasks/${taskId}`, {
    method: 'PATCH',
    headers: {
      'Authorization': `Bearer ${API_KEY}`,
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({
      status: 'CANCELED',
      description: `${task.description}\nCanceled: ${reason}`
    })
  });
  
  if (!updateResponse.ok) {
    const errorData = await updateResponse.json();
    throw new Error(`Failed to cancel task: ${errorData.error.message}`);
  }
  
  return await updateResponse.json();
}

// Example usage
const canceledTask = await cancelTask('task123', 'Authentication will be handled by a third-party service instead');
console.log(`Task has been canceled`);
```

## 8. Task Reporting

Let's build a simple report of task statuses for a team.

### Request

```http
GET /tasks?assigneeId=user789&sort=-updatedAt&limit=100
Authorization: Bearer YOUR_API_KEY
```

### Code Example

```javascript
async function generateTaskReport(assigneeId) {
  // Get all tasks for this assignee
  const response = await fetch(`https://api.taskmanagement.example.com/v1/tasks?assigneeId=${assigneeId}&limit=100`, {
    headers: {
      'Authorization': `Bearer ${API_KEY}`
    }
  });
  
  if (!response.ok) {
    const errorData = await response.json();
    throw new Error(`Failed to generate report: ${errorData.error.message}`);
  }
  
  const result = await response.json();
  const tasks = result.data;
  
  // Count tasks by status
  const statusCounts = {
    'TODO': 0,
    'IN_PROGRESS': 0,
    'REVIEW': 0,
    'DONE': 0,
    'CANCELED': 0
  };
  
  tasks.forEach(task => {
    statusCounts[task.status]++;
  });
  
  // Count tasks by priority
  const priorityCounts = {
    'LOW': 0,
    'MEDIUM': 0,
    'HIGH': 0,
    'URGENT': 0
  };
  
  tasks.forEach(task => {
    priorityCounts[task.priority]++;
  });
  
  // Check for overdue tasks
  const now = new Date();
  const overdueTasks = tasks.filter(task => {
    const dueDate = new Date(task.dueDate);
    return dueDate < now && task.status !== 'DONE' && task.status !== 'CANCELED';
  });
  
  // Generate the report
  const report = {
    totalTasks: tasks.length,
    byStatus: statusCounts,
    byPriority: priorityCounts,
    overdueTasks: overdueTasks.map(task => ({
      id: task.id,
      title: task.title,
      dueDate: task.dueDate,
      status: task.status
    })),
    completionRate: tasks.length > 0 ? (statusCounts.DONE / tasks.length * 100).toFixed(2) + '%' : '0%'
  };
  
  return report;
}

// Example usage
const report = await generateTaskReport('user789');
console.log('Task Report:', report);
```

## 9. Implementing a Complete Workflow

Now, let's put everything together to implement a complete task management workflow:

```javascript
async function completeTaskWorkflow() {
  try {
    // 1. Create a new task
    console.log('Creating a new task...');
    const newTask = await createTask({
      title: 'Implement user authentication',
      description: 'Add token-based authentication to the web application',
      priority: 'HIGH',
      dueDate: '2025-06-01T17:00:00Z',
      tags: ['authentication', 'security']
    });
    
    console.log(`Task created with ID: ${newTask.id}`);
    
    // 2. Assign the task to a user
    console.log('\nAssigning the task...');
    const assignedTask = await assignTask(newTask.id, 'user789');
    console.log(`Task assigned to user: ${assignedTask.assigneeId}`);
    
    // 3. Start working on the task
    console.log('\nStarting work on the task...');
    const inProgressTask = await updateTaskStatus(newTask.id, 'IN_PROGRESS');
    console.log(`Task status updated to: ${inProgressTask.status}`);
    
    // 4. Submit the task for review
    console.log('\nSubmitting the task for review...');
    const reviewTask = await updateTaskStatus(newTask.id, 'REVIEW');
    console.log(`Task submitted for review`);
    
    // 5. Simulate a review process
    console.log('\nSimulating review process...');
    const reviewPassed = Math.random() > 0.3; // 70% chance of passing review
    
    if (reviewPassed) {
      // 6a. Mark the task as done
      console.log('Review passed. Completing the task...');
      const completedTask = await updateTaskStatus(newTask.id, 'DONE');
      console.log(`Task completed!`);
    } else {
      // 6b. Reject the task with feedback
      console.log('Review failed. Sending back with feedback...');
      const rejectedTask = await rejectTask(newTask.id, {
        originalDescription: newTask.description,
        comments: 'Please add unit tests and improve error handling'
      });
      console.log(`Task rejected and moved back to ${rejectedTask.status}`);
      
      // 7. Make improvements and resubmit
      console.log('\nMaking improvements and resubmitting...');
      await updateTaskStatus(newTask.id, 'REVIEW');
      console.log('Task resubmitted for review');
      
      // 8. Pass the review this time
      console.log('\nReview passed on second attempt. Completing the task...');
      const completedTask = await updateTaskStatus(newTask.id, 'DONE');
      console.log(`Task completed!`);
    }
    
    // 9. Generate a report
    console.log('\nGenerating task report for user...');
    const report = await generateTaskReport('user789');
    console.log('Task Report:', report);
    
  } catch (error) {
    console.error('Workflow failed:', error);
  }
}

// Run the complete workflow
completeTaskWorkflow();
```

## Best Practices for Task Management

Here are some best practices to consider when implementing a task management workflow:

### 1. Clear Task Descriptions

Write clear and detailed task descriptions that specify:
- What needs to be done
- Any specific requirements or constraints
- The expected outcome or deliverables
- Links to relevant resources or documentation

### 2. Appropriate Priority Levels

Use priority levels consistently:
- **LOW**: Tasks that are not time-sensitive
- **MEDIUM**: Standard tasks (default)
- **HIGH**: Important tasks that should be prioritized
- **URGENT**: Critical tasks that require immediate attention

### 3. Realistic Due Dates

Set realistic due dates that:
- Allow sufficient time for completion
- Account for dependencies on other tasks
- Consider the assignee's workload
- Include buffer time for reviews and revisions

### 4. Regular Status Updates

Encourage regular status updates by:
- Updating task status as soon as work begins or changes
- Adding comments or updates to the description when relevant
- Notifying stakeholders of significant changes

### 5. Proper Task Transitions

Follow the proper task status lifecycle:
- Only use valid status transitions
- Don't skip intermediate statuses
- Provide feedback when rejecting tasks

### 6. Task Categorization

Use tags effectively to categorize tasks:
- Create a consistent tagging system
- Use meaningful, descriptive tags
- Limit the number of tags per task
- Create task views filtered by relevant tags

### 7. Actionable Task Titles

Write task titles that are:
- Action-oriented (start with a verb)
- Specific and descriptive
- Concise but informative
- Unique and easily identifiable

## Common Challenges and Solutions

### Challenge: Tasks Getting Stuck in Review

**Solution**: Implement a notification system that alerts reviewers when tasks are in the REVIEW status, and set a maximum time for review before escalation.

### Challenge: Overdue Tasks Not Being Addressed

**Solution**: Create an "Overdue Tasks" view that prominently displays tasks past their due date, and implement a regular review process for these tasks.

### Challenge: Unclear Task Requirements

**Solution**: Use a standardized template for task descriptions that includes sections for requirements, acceptance criteria, and resources.

### Challenge: Difficulty Tracking Task Progress

**Solution**: Add custom fields or use the description to track percentage complete or milestone achievements throughout the IN_PROGRESS status.

### Challenge: Too Many Tasks in TODO Status

**Solution**: Implement a work-in-progress limit that restricts the number of tasks in TODO status, encouraging prioritization.

## Conclusion

In this tutorial, you've learned how to implement a complete task management workflow using the Task Management API. You now know how to create tasks, assign them to users, track their progress through the status lifecycle, and generate reports on task completion.

By following the best practices outlined in this guide, you can build a robust task management system that helps your team stay organized, focused, and productive.

## Next Steps

- Learn more about [Task Status Lifecycle](/core-concepts/task-status-lifecycle.md)
- Explore [Implementing Reminders](/tutorials/implementing-reminders.md) for upcoming tasks
- Discover advanced [Task Filtering](/api-reference/get-all-tasks.md) techniques
- Check out [Optimizing API Usage](/advanced/optimizing-api-usage.md) for performance tips


