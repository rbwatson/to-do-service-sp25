---
title: "Quick start guide"
description: "Get up and running with the Task Management API in minutes."
tags: ["quick start", "tutorial"]
categories: ["getting-started"]
importance: 9
parent: "Getting Started with the Task Management API"
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "2025-05-13"
nav_order: "2"
layout: "default"
version: "v1.0.0"
lastUpdated: "2025-05-13"
---

# Quick Start Guide

This guide will help you make your first request to the Task Management API in minutes. We'll cover the basic steps to authenticate, create a user, and create a task.

## Prerequisites

Before you begin, you'll need:

- An API key (get one by [registering for an account](https://taskmanagement.example.com/signup))
- A tool to make HTTP requests (cURL, Postman, or an HTTP client in your preferred programming language)

## Step 1: Authenticate

All requests to the API require authentication using a bearer token. Include your API key in the `Authorization` header:

```
Authorization: Bearer YOUR_API_KEY
```

## Step 2: Create a User

Let's start by creating a user:

### Request

```bash
curl -X POST https://api.taskmanagement.example.com/v1/users \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "John Doe",
    "email": "john.doe@example.com"
  }'
```

### Response

```json
{
  "id": "user123",
  "name": "John Doe",
  "email": "john.doe@example.com",
  "createdAt": "2025-05-13T10:30:00Z",
  "updatedAt": "2025-05-13T10:30:00Z"
}
```

## Step 3: Create a Task

Now, let's create a task and assign it to the user we just created:

### Request

```bash
curl -X POST https://api.taskmanagement.example.com/v1/tasks \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "title": "Complete API integration",
    "description": "Finish integrating with the Task Management API",
    "status": "TODO",
    "dueDate": "2025-05-20T17:00:00Z",
    "assigneeId": "user123"
  }'
```

### Response

```json
{
  "id": "task456",
  "title": "Complete API integration",
  "description": "Finish integrating with the Task Management API",
  "status": "TODO",
  "dueDate": "2025-05-20T17:00:00Z",
  "assigneeId": "user123",
  "createdAt": "2025-05-13T10:35:00Z",
  "updatedAt": "2025-05-13T10:35:00Z"
}
```

## Step 4: Retrieve Tasks

Let's retrieve all tasks to verify our task was created:

### Request

```bash
curl -X GET https://api.taskmanagement.example.com/v1/tasks \
  -H "Authorization: Bearer YOUR_API_KEY"
```

### Response

```json
{
  "data": [
    {
      "id": "task456",
      "title": "Complete API integration",
      "description": "Finish integrating with the Task Management API",
      "status": "TODO",
      "dueDate": "2025-05-20T17:00:00Z",
      "assigneeId": "user123",
      "createdAt": "2025-05-13T10:35:00Z",
      "updatedAt": "2025-05-13T10:35:00Z"
    }
  ],
  "pagination": {
    "total": 1,
    "limit": 10,
    "offset": 0,
    "hasMore": false
  }
}
```

## Code Examples

### JavaScript/Node.js

```javascript
const axios = require('axios');

const API_KEY = 'YOUR_API_KEY';
const BASE_URL = 'https://api.taskmanagement.example.com/v1';

// Create a user
async function createUser() {
  try {
    const response = await axios.post(`${BASE_URL}/users`, {
      name: 'John Doe',
      email: 'john.doe@example.com'
    }, {
      headers: {
        'Authorization': `Bearer ${API_KEY}`,
        'Content-Type': 'application/json'
      }
    });
    
    return response.data;
  } catch (error) {
    console.error('Error creating user:', error.response.data);
  }
}

// Create a task
async function createTask(userId) {
  try {
    const response = await axios.post(`${BASE_URL}/tasks`, {
      title: 'Complete API integration',
      description: 'Finish integrating with the Task Management API',
      status: 'TODO',
      dueDate: '2025-05-20T17:00:00Z',
      assigneeId: userId
    }, {
      headers: {
        'Authorization': `Bearer ${API_KEY}`,
        'Content-Type': 'application/json'
      }
    });
    
    return response.data;
  } catch (error) {
    console.error('Error creating task:', error.response.data);
  }
}

// Run the example
async function run() {
  const user = await createUser();
  if (user && user.id) {
    const task = await createTask(user.id);
    console.log('Task created:', task);
  }
}

run();
```

### Python

```python
import requests

API_KEY = 'YOUR_API_KEY'
BASE_URL = 'https://api.taskmanagement.example.com/v1'

headers = {
    'Authorization': f'Bearer {API_KEY}',
    'Content-Type': 'application/json'
}

# Create a user
def create_user():
    data = {
        'name': 'John Doe',
        'email': 'john.doe@example.com'
    }
    
    response = requests.post(f'{BASE_URL}/users', json=data, headers=headers)
    response.raise_for_status()
    return response.json()

# Create a task
def create_task(user_id):
    data = {
        'title': 'Complete API integration',
        'description': 'Finish integrating with the Task Management API',
        'status': 'TODO',
        'dueDate': '2025-05-20T17:00:00Z',
        'assigneeId': user_id
    }
    
    response = requests.post(f'{BASE_URL}/tasks', json=data, headers=headers)
    response.raise_for_status()
    return response.json()

# Run the example
try:
    user = create_user()
    task = create_task(user['id'])
    print('Task created:', task)
except requests.exceptions.RequestException as e:
    print('Error:', e)
```

## Next Steps

Now that you've made your first API requests, you can:

1. Learn more about [Authentication](../getting-started/authentication.md)
2. Explore the [User Resource](../resources/user-resource.md) and [Task Resource](../resources/task-resource.md)
3. Check out [API Reference](../api-reference.md) for all available endpoints
4. Try the [Task Management Workflow](../tutorials/task-management-workflow.md) tutorial
