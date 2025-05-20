---
title: "Quick start guide"
description: "Get up and running with the Task Management API in minutes."
tags: ["quick start", "tutorial"]
categories: ["getting-started"]
importance: 9
parent: "Getting Started"
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 20, 2025"
nav_order: "2"
layout: "default"
version: "v1.0.0"
lastUpdated: "May 20, 2025"
---

# Quick start guide

This guide will help you start using the Task Management API in just a few minutes. We'll walk through the process of creating a user, creating a task, and updating a task's status.

## Prerequisites

Before you begin, make sure you have:

- A bearer token for authentication
- Access to the API endpoint (default: `http://localhost:3000`)
- A tool for making HTTP requests (like cURL, Postman, or a programming language with HTTP capabilities)

## Step 1: Create a user

First, let's create a user who will own the tasks.

### Request

```bash
# cURL example
curl -X POST http://localhost:3000/users \
  -H "Authorization: Bearer your-token-here" \
  -H "Content-Type: application/json" \
  -d '{
    "firstName": "Jane",
    "lastName": "Smith",
    "contactEmail": "jane.smith@example.com"
  }'
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
print(response.json())
```

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
.then(data => console.log(data));
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

## Step 2: Create a task

Now, let's create a task for the user we just created.

### Request

```bash
# cURL example
curl -X POST http://localhost:3000/tasks \
  -H "Authorization: Bearer your-token-here" \
  -H "Content-Type: application/json" \
  -d '{
    "userId": 1,
    "taskTitle": "Complete project proposal",
    "taskDescription": "Finish the proposal for the new client project",
    "dueDate": "2025-06-15T17:00:00-05:00",
    "warningOffset": 120
  }'
```

```python
# Python example
import requests

url = "http://localhost:3000/tasks"
headers = {
    "Authorization": "Bearer your-token-here",
    "Content-Type": "application/json"
}
data = {
    "userId": 1,
    "taskTitle": "Complete project proposal",
    "taskDescription": "Finish the proposal for the new client project",
    "dueDate": "2025-06-15T17:00:00-05:00",
    "warningOffset": 120
}

response = requests.post(url, headers=headers, json=data)
print(response.json())
```

```javascript
// JavaScript example
fetch('http://localhost:3000/tasks', {
  method: 'POST',
  headers: {
    'Authorization': 'Bearer your-token-here',
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({
    userId: 1,
    taskTitle: 'Complete project proposal',
    taskDescription: 'Finish the proposal for the new client project',
    dueDate: '2025-06-15T17:00:00-05:00',
    warningOffset: 120
  })
})
.then(response => response.json())
.then(data => console.log(data));
```

### Response

```json
{
  "taskId": 1,
  "userId": 1,
  "taskTitle": "Complete project proposal",
  "taskDescription": "Finish the proposal for the new client project",
  "taskStatus": "NOT_STARTED",
  "dueDate": "2025-06-15T17:00:00-05:00",
  "warningOffset": 120
}
```

## Step 3: Update task status

As work progresses, let's update the task status to "IN_PROGRESS".

### Request

```bash
# cURL example
curl -X PATCH http://localhost:3000/tasks/1 \
  -H "Authorization: Bearer your-token-here" \
  -H "Content-Type: application/json" \
  -d '{
    "taskStatus": "IN_PROGRESS"
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
    "taskStatus": "IN_PROGRESS"
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
    taskStatus: 'IN_PROGRESS'
  })
})
.then(response => response.json())
.then(data => console.log(data));
```

### Response

```json
{
  "taskId": 1,
  "userId": 1,
  "taskTitle": "Complete project proposal",
  "taskDescription": "Finish the proposal for the new client project",
  "taskStatus": "IN_PROGRESS",
  "dueDate": "2025-06-15T17:00:00-05:00",
  "warningOffset": 120
}
```

## Step 4: Retrieve all tasks

Finally, let's retrieve all tasks for our user.

### Request

```bash
# cURL example
curl -X GET http://localhost:3000/tasks \
  -H "Authorization: Bearer your-token-here"
```

```python
# Python example
import requests

url = "http://localhost:3000/tasks"
headers = {
    "Authorization": "Bearer your-token-here"
}

response = requests.get(url, headers=headers)
print(response.json())
```

```javascript
// JavaScript example
fetch('http://localhost:3000/tasks', {
  headers: {
    'Authorization': 'Bearer your-token-here'
  }
})
.then(response => response.json())
.then(data => console.log(data));
```

### Response

```json
{
  "tasks": [
    {
      "taskId": 1,
      "userId": 1,
      "taskTitle": "Complete project proposal",
      "taskDescription": "Finish the proposal for the new client project",
      "taskStatus": "IN_PROGRESS",
      "dueDate": "2025-06-15T17:00:00-05:00",
      "warningOffset": 120
    }
  ]
}
```

## Next steps

Congratulations! You've successfully created a user, created a task, updated its status, and retrieved all tasks. Here are some next steps to explore:

- Learn about [authentication](authentication.md) in detail
- Explore the [User resource](../resources/user-resource.md)
- Learn about [task statuses](../core-concepts/task-status-lifecycle.md)
- Check out the [API reference](../api-reference.md) for all available endpoints


