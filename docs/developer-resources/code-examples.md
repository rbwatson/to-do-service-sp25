---
title: "Code examples"
description: "Example code for common operations in various programming languages including JavaScript, Python, and more."
tags: ["code", "examples"]
categories: ["developer-resources"]
importance: 7
parent: "developer-resources"
hasChildren: false
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "2025-05-13"
navOrder: "3"
layout: "default"
version: "v1.0.0"
lastUpdated: "2025-05-13"
---

# Code Examples

This page provides code examples for common operations with the Task Management API in different programming languages. Use these examples as a starting point for integrating the API into your applications.

## JavaScript / Node.js

### Setup

First, create a client for interacting with the API:

```javascript
const axios = require('axios');

class TaskManagementClient {
  constructor(apiKey, baseUrl = 'https://api.taskmanagement.example.com/v1') {
    this.apiKey = apiKey;
    this.baseUrl = baseUrl;
    this.client = axios.create({
      baseURL: this.baseUrl,
      headers: {
        'Authorization': `Bearer ${this.apiKey}`,
        'Content-Type': 'application/json'
      }
    });
  }

  // User operations
  async getUsers(params = {}) {
    const response = await this.client.get('/users', { params });
    return response.data;
  }

  async getUser(userId) {
    const response = await this.client.get(`/users/${userId}`);
    return response.data;
  }

  async createUser(userData) {
    const response = await this.client.post('/users', userData);
    return response.data;
  }

  async updateUser(userId, userData) {
    const response = await this.client.patch(`/users/${userId}`, userData);
    return response.data;
  }

  async deleteUser(userId) {
    await this.client.delete(`/users/${userId}`);
    return true;
  }

  // Task operations
  async getTasks(params = {}) {
    const response = await this.client.get('/tasks', { params });
    return response.data;
  }

  async getTask(taskId) {
    const response = await this.client.get(`/tasks/${taskId}`);
    return response.data;
  }

  async createTask(taskData) {
    const response = await this.client.post('/tasks', taskData);
    return response.data;
  }

  async updateTask(taskId, taskData) {
    const response = await this.client.patch(`/tasks/${taskId}`, taskData);
    return response.data;
  }

  async deleteTask(taskId) {
    await this.client.delete(`/tasks/${taskId}`);
    return true;
  }
}

// Example usage
const client = new TaskManagementClient('YOUR_API_KEY');

(async () => {
  try {
    // Create a user
    const user = await client.createUser({
      name: 'John Doe',
      email: 'john.doe@example.com',
      role: 'member'
    });
    console.log('User created:', user);
    
    // Create a task
    const task = await client.createTask({
      title: 'Complete API integration',
      description: 'Finish integrating with the Task Management API',
      priority: 'HIGH',
      assigneeId: user.id,
      dueDate: '2025-06-01T17:00:00Z'
    });
    console.log('Task created:', task);
    
    // Update task status
    const updatedTask = await client.updateTask(task.id, {
      status: 'IN_PROGRESS'
    });
    console.log('Task updated:', updatedTask.status);
    
    // List all tasks assigned to the user
    const tasks = await client.getTasks({ assigneeId: user.id });
    console.log('User tasks:', tasks.data.length);
  } catch (error) {
    console.error('Error:', error.response ? error.response.data : error.message);
  }
})();

