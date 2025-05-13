--- FILE: index.md
---
title: "Task Management API Documentation"
description: "Comprehensive guide to the Task Management API, including usage, endpoints, and best practices."
tags: ["API", "documentation", "task management"]
categories: ["overview"]
importance: 10
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "2025-05-13"
navOrder: "1"
layout: "default"
version: "v1.0.0"
lastUpdated: "2025-05-13"
---

# Task Management API Documentation

Welcome to the Task Management API documentation. This comprehensive guide provides all the information you need to integrate and work with our Task Management service.

## Overview

The Task Management API allows you to create, read, update, and delete tasks and users in a task management system. With this API, you can:

- Manage users who can create and be assigned to tasks
- Create and manage tasks with various properties including title, description, status, and due dates
- Track task status throughout its lifecycle
- Set reminders for upcoming tasks

## Key Features

- **RESTful API Design**: Consistent and predictable resource-oriented URLs
- **JSON Format**: All requests and responses use JSON format
- **Authentication**: Secure your API access with bearer token authentication
- **Pagination**: Navigate through large collections of resources efficiently
- **Sorting**: Order resources by various properties
- **Error Handling**: Comprehensive error responses with clear messages

## Getting Started

To get started with the Task Management API:

1. Check out the [Getting Started Guide](getting-started.md) for a quick introduction
2. Understand the [Core Concepts](core-concepts.md) behind the API
3. Explore the available [API Resources](resources.md)
4. Reference the [API Endpoints](api-reference.md) for detailed implementation
5. Follow our [Tutorials & Guides](tutorials.md) for common use cases

## API Base URL

All API requests should be made to: `https://api.taskmanagement.example.com/v1`

## API Support

If you need assistance with the API:

- Check our [Support & FAQ](support.md) section
- Review [Troubleshooting](support/troubleshooting.md) for common issues
- Contact our support team through the [Support Resources](support/support-resources.md)

--- FILE: getting-started.md
---
title: "Getting Started with the Task Management API"
description: "Introduction to getting started with the Task Management API, including setup, authentication, and basic concepts."
tags: ["introduction", "overview", "getting-started"]
categories: ["getting-started"]
importance: 10
hasChildren: true
hasToc: false
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "2025-05-13"
navOrder: "2"
layout: "default"
version: "v1.0.0"
lastUpdated: "2025-05-13"
---

# Getting Started with the Task Management API

This section introduces you to the Task Management API and provides essential information to help you start making API requests quickly and effectively.

## What is the Task Management API?

The Task Management API is a RESTful service that enables you to create and manage tasks and users programmatically. It provides endpoints for creating, reading, updating, and deleting task and user resources, along with additional functionality for managing task statuses and user roles.

## In This Section

The Getting Started section covers the following topics:

| Topic | Description |
|-------|-------------|
| [Introduction](getting-started/introduction.md) | Overview of the API capabilities, features, and use cases |
| [Quick Start Guide](getting-started/quickstart.md) | Step-by-step guide to make your first API request |
| [Authentication](getting-started/authentication.md) | How to authenticate your requests using bearer tokens |
| [Rate Limiting](getting-started/rate-limiting.md) | Understanding API rate limits and how to handle them |

## Prerequisites

Before you start using the Task Management API, you should have:

- Basic knowledge of REST APIs and HTTP methods
- An API key or credentials for authentication
- Familiarity with JSON for request and response formatting
- A tool for making HTTP requests (curl, Postman, or an HTTP library for your programming language)

## Base URL

All API requests should be made to the following base URL:

```
https://api.taskmanagement.example.com/v1
```

## Next Steps

1. Start with the [Introduction](getting-started/introduction.md) to get an overview of the API
2. Follow the [Quick Start Guide](getting-started/quickstart.md) to make your first API request
3. Learn about [Authentication](getting-started/authentication.md) to secure your API calls
4. After understanding the basics, explore the [Core Concepts](core-concepts.md) section to deepen your knowledge

--- FILE: core-concepts.md
---
title: "Core Concepts"
description: "Overview of fundamental concepts in the Task Management API, including data model, pagination, sorting, error handling, and task statuses."
tags: ["concepts", "overview"]
categories: ["core-concepts"]
importance: 9
hasChildren: true
hasToc: false
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "2025-05-13"
navOrder: "3"
layout: "default"
version: "v1.0.0"
lastUpdated: "2025-05-13"
---

# Core Concepts

This section covers the fundamental concepts and patterns used throughout the Task Management API. Understanding these concepts will help you work with the API more effectively.

## In This Section

The Core Concepts section contains the following topics:

| Topic | Description |
|-------|-------------|
| [Data Model](core-concepts/data-model.md) | Overview of the core resources and their relationships |
| [Pagination](core-concepts/pagination.md) | How to navigate through large collections of resources |
| [Sorting](core-concepts/sorting.md) | How to sort API results using sort parameters |
| [Error Handling](core-concepts/error-handling.md) | Common error patterns and how to handle them |
| [Task Status Lifecycle](core-concepts/task-status-lifecycle.md) | Understanding task statuses and transitions |

## API Design Principles

The Task Management API follows these design principles:

- **RESTful Resources**: The API is organized around resources with standard HTTP methods
- **JSON Formatting**: All requests and responses use JSON format
- **Consistent Patterns**: Similar patterns are used across different endpoints for a consistent developer experience
- **Clear Error Messages**: Error responses include detailed information to help you troubleshoot issues
- **Stateless Operation**: Each request contains all the information needed to complete the operation

## Resources

The Task Management API centers around two main resources:

1. **Users**: Individuals who can create and be assigned to tasks
2. **Tasks**: Work items that have various properties like title, description, status, and deadlines

Each resource has its own set of endpoints for creating, reading, updating, and deleting instances.

## Next Steps

After understanding these core concepts, you can:

- Explore the detailed [API Resources](resources.md) documentation
- Check out the [API Reference](api-reference.md) for specific endpoint details
- Try out the concepts in our [Tutorials & Guides](tutorials.md)

--- FILE: resources.md
---
title: "API Resources"
description: "Detailed information about the core resources available in the Task Management API."
tags: ["resources", "overview"]
categories: ["resources"]
importance: 9
hasChildren: true
hasToc: false
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "2025-05-13"
navOrder: "4"
layout: "default"
version: "v1.0.0"
lastUpdated: "2025-05-13"
---

# API Resources

The Task Management API provides access to resources that represent the core entities in the system. This section details these resources and their properties.

## In This Section

The Resources section covers the following topics:

| Resource | Description |
|----------|-------------|
| [User Resource](resources/user-resource.md) | Detailed information about the User resource |
| [Task Resource](resources/task-resource.md) | Detailed information about the Task resource |

## Resource Relationships

The main resources in the Task Management API are related in the following ways:

- **Users** can create and be assigned to **Tasks**
- **Tasks** can be assigned to one or more **Users**
- **Tasks** have a status and lifecycle that determines their progress

## Common Resource Properties

All resources in the API share some common properties:

- `id`: A unique identifier for the resource
- `createdAt`: Timestamp when the resource was created
- `updatedAt`: Timestamp when the resource was last updated

## Resource Collections

When retrieving multiple resources (e.g., all users or all tasks), the API returns a collection that includes:

- The resources themselves as an array
- Pagination information
- Metadata about the collection

## Next Steps

To learn more about the specific resources:

- Read about the [User Resource](resources/user-resource.md)
- Explore the [Task Resource](resources/task-resource.md)
- Check out the [API Reference](api-reference.md) for endpoint-specific details
- Review [Core Concepts](core-concepts.md) for fundamental API patterns

--- FILE: api-reference.md
---
title: "API Reference"
description: "Comprehensive reference documentation for all endpoints in the Task Management API."
tags: ["reference", "endpoints", "api"]
categories: ["api-reference"]
importance: 8
hasChildren: true
hasToc: false
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "2025-05-13"
navOrder: "5"
layout: "default"
version: "v1.0.0"
lastUpdated: "2025-05-13"
---

# API Reference

This section provides comprehensive reference documentation for all endpoints available in the Task Management API. Each endpoint is documented with request formats, response examples, and usage guidelines.

## Base URL

All API endpoints should be prefixed with the base URL:

```
https://api.taskmanagement.example.com/v1
```

## Available Endpoints

### User Endpoints

| Endpoint | Method | Description |
|----------|--------|-------------|
| [Get All Users](/api-reference/get-all-users.md) | GET | Retrieve a list of all users |
| [Create a User](/api-reference/create-user.md) | POST | Create a new user |
| [Get User by ID](/api-reference/get-user-by-id.md) | GET | Retrieve a specific user by ID |
| [Update a User](/api-reference/update-user.md) | PATCH | Update an existing user |
| [Delete a User](/api-reference/delete-user.md) | DELETE | Remove a user from the system |

### Task Endpoints

| Endpoint | Method | Description |
|----------|--------|-------------|
| [Get All Tasks](/api-reference/get-all-tasks.md) | GET | Retrieve a list of all tasks |
| [Create a Task](/api-reference/create-task.md) | POST | Create a new task |
| [Get Task by ID](/api-reference/get-task-by-id.md) | GET | Retrieve a specific task by ID |
| [Update a Task](/api-reference/update-task.md) | PATCH | Update an existing task |
| [Delete a Task](/api-reference/delete-task.md) | DELETE | Remove a task from the system |

### Error Handling

For information about error responses, see the [Error Responses](/api-reference/error-responses.md) page.

## Authentication

All API endpoints require authentication using a bearer token. For more information, see the [Authentication](/getting-started/authentication.md) guide.

## Request Format

Unless otherwise specified, all request bodies should be in JSON format with the `Content-Type: application/json` header.

## Response Format

All responses are returned in JSON format. Successful responses include the requested data, while error responses include an error message and additional information to help troubleshoot the issue.

--- FILE: tutorials.md
---
title: "Tutorials & Guides"
description: "Step-by-step tutorials and practical guides for working with the Task Management API."
tags: ["tutorials", "guides", "how-to"]
categories: ["tutorials"]
importance: 7
hasChildren: true
hasToc: false
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "2025-05-13"
navOrder: "6"
layout: "default"
version: "v1.0.0"
lastUpdated: "2025-05-13"
---

# Tutorials & Guides

This section provides practical, step-by-step tutorials and guides to help you implement common use cases with the Task Management API.

## Available Tutorials

| Tutorial | Description |
|----------|-------------|
| [Getting Started with Users](/tutorials/getting-started-with-users.md) | Learn how to create, list, update, and delete users |
| [Task Management Workflow](/tutorials/task-management-workflow.md) | Implement a complete task management workflow |
| [Implementing Reminders](/tutorials/implementing-reminders.md) | Use the warningOffset property to set up task reminders |
| [Integration Patterns](/tutorials/integration-patterns.md) | Common patterns for integrating with other systems |

## Use Case Examples

These tutorials cover common use cases that you might encounter when working with the Task Management API:

- Setting up a new user account
- Creating and assigning tasks to users
- Tracking task progress through status updates
- Implementing deadline reminders for approaching tasks
- Integrating task management with calendars or project management tools

## Skill Level

The tutorials in this section are primarily designed for developers who are new to the Task Management API but have some experience with REST APIs in general. More advanced topics are covered in the [Advanced Topics](/advanced.md) section.

## Tools Used

The tutorials use standard tools for working with REST APIs:

- Command-line examples using cURL
- Code examples in JavaScript and Python
- Tool-specific examples using Postman

## Next Steps

After working through these tutorials, you can:

- Explore the [API Reference](/api-reference.md) for detailed endpoint documentation
- Check out [Advanced Topics](/advanced.md) for more complex use cases
- Review [Developer Resources](/developer-resources.md) for additional tools and code examples

--- FILE: advanced.md
---
title: "Advanced Topics"
description: "Advanced considerations for working with the Task Management API, including optimization, security, and data consistency."
tags: ["advanced", "optimization", "security"]
categories: ["advanced"]
importance: 6
hasChildren: true
hasToc: false
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "2025-05-13"
navOrder: "7"
layout: "default"
version: "v1.0.0"
lastUpdated: "2025-05-13"
---

# Advanced Topics

This section covers advanced topics and considerations for working with the Task Management API. These topics are intended for experienced users who are already familiar with the basics of the API.

## In This Section

The Advanced Topics section covers the following areas:

| Topic | Description |
|-------|-------------|
| [Optimizing API Usage](/advanced/optimizing-api-usage.md) | Best practices for efficient API usage |
| [Security Best Practices](/advanced/security-best-practices.md) | Advanced security considerations |
| [Handling Data Consistency](/advanced/handling-data-consistency.md) | Strategies for maintaining data consistency |

## When to Use These Advanced Topics

Consider exploring these advanced topics when:

- You're implementing a production application that needs to be highly optimized
- You need to handle large volumes of tasks or users
- You require high availability or need to implement caching strategies
- You're concerned about security beyond basic authentication
- You need to handle concurrent updates to resources

## Prerequisites

Before diving into these advanced topics, you should already:

- Be familiar with the basic API concepts and endpoints
- Have experience working with the User and Task resources
- Understand authentication and error handling in the API
- Have implemented at least a basic integration with the API

## Next Steps

After reviewing these advanced topics, you may want to:

- Check out [Developer Resources](/developer-resources.md) for additional tools
- Review our [Integration Patterns](/tutorials/integration-patterns.md) for system integration guidance
- Explore the [Support & FAQ](/support.md) section for troubleshooting help

--- FILE: developer-resources.md
---
title: "Developer Resources"
description: "Additional resources for developers working with the Task Management API, including changelogs, tooling, and code examples."
tags: ["resources", "developers", "tools"]
categories: ["developer-resources"]
importance: 5
hasChildren: true
hasToc: false
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "2025-05-13"
navOrder: "8"
layout: "default"
version: "v1.0.0"
lastUpdated: "2025-05-13"
---

# Developer Resources

This section provides additional resources to help developers working with the Task Management API, including developer tools, code examples, and version information.

## In This Section

The Developer Resources section includes the following topics:

| Resource | Description |
|----------|-------------|
| [API Changelog](/developer-resources/api-changelog.md) | History of changes to the API across versions |
| [Postman Collection](/developer-resources/postman-collection.md) | How to use the Postman collection for testing |
| [Code Examples](/developer-resources/code-examples.md) | Example code in various programming languages |

## Development Tools

The following tools can help you develop and test with the Task Management API:

- **API Key Management Console**: Manage your API keys and access
- **Request Logs**: View logs of your recent API requests
- **API Status Dashboard**: Check the current status of the API
- **OpenAPI Specification**: Download the OpenAPI spec for use in code generation tools

## Community Resources

Connect with other developers working with the Task Management API:

- **Developer Forum**: Discuss implementation approaches and ask questions
- **GitHub Repository**: Find open source tools and libraries
- **Stack Overflow**: Find answers to common questions (tagged with 'task-management-api')

## SDK Libraries

Official client libraries for common programming languages:

- JavaScript/Node.js
- Python
- Java
- Ruby
- PHP

## Next Steps

After exploring these developer resources, you might want to:

- Check the [API Reference](/api-reference.md) for detailed endpoint specifications
- Review [Advanced Topics](/advanced.md) for optimization and security best practices
- Visit the [Support & FAQ](/support.md) section if you need assistance

--- FILE: support.md
---
title: "Support & FAQ"
description: "Support resources, frequently asked questions, and troubleshooting information for the Task Management API."
tags: ["support", "faq", "help", "troubleshooting"]
categories: ["support"]
importance: 4
hasChildren: true
hasToc: false
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "2025-05-13"
navOrder: "9"
layout: "default"
version: "v1.0.0"
lastUpdated: "2025-05-13"
---

# Support & FAQ

This section provides support resources, frequently asked questions, and troubleshooting information to help you resolve common issues when working with the Task Management API.

## In This Section

The Support & FAQ section includes the following topics:

| Topic | Description |
|-------|-------------|
| [Frequently Asked Questions](/support/faq.md) | Common questions and answers |
| [Troubleshooting](/support/troubleshooting.md) | Solutions to common issues |
| [Support Resources](/support/support-resources.md) | How to get help and contact information |

## Common Questions

Here are quick answers to some of the most common questions about the Task Management API:

**Q: What is the rate limit for API requests?**  
A: Standard accounts have a limit of 100 requests per minute. For higher limits, please contact support.

**Q: How do I reset my API key?**  
A: You can reset your API key in the developer dashboard under "API Keys & Security."

**Q: Is there a sandbox environment for testing?**  
A: Yes, use the base URL `https://sandbox-api.taskmanagement.example.com/v1` for testing.

**Q: How do I report an API bug?**  
A: Please send details to api-support@taskmanagement.example.com or use the support portal.

## Getting Help

If you're experiencing issues with the API, we recommend the following steps:

1. Check the [Troubleshooting](/support/troubleshooting.md) guide for common issues
2. Review the [API Reference](/api-reference.md) to ensure you're using the endpoints correctly
3. Search the [FAQ](/support/faq.md) for answers to common questions
4. Contact support using the information in [Support Resources](/support/support-resources.md)

## Service Status

You can check the current status of the API at:
[status.taskmanagement.example.com](https://status.taskmanagement.example.com)

--- FILE: getting-started/introduction.md
---
title: "Introduction to the Task Management API"
description: "Overview of the Task Management API capabilities, features, and use cases."
tags: ["introduction", "overview"]
categories: ["getting-started"]
importance: 10
parent: "getting-started"
hasChildren: false
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "2025-05-13"
navOrder: "1"
layout: "default"
version: "v1.0.0"
lastUpdated: "2025-05-13"
---

# Introduction to the Task Management API

The Task Management API provides a powerful, flexible interface for creating and managing tasks and users in your applications. This introduction will help you understand what the API offers and how it can be used.

## What is the Task Management API?

The Task Management API is a RESTful service that allows you to programmatically create, read, update, and delete tasks and users. It's designed to be simple to integrate with while providing robust features for task management workflows.

## Key Features

- **User Management**: Create and manage users who can create and be assigned to tasks
- **Task Creation and Management**: Create tasks with titles, descriptions, due dates, and other properties
- **Status Tracking**: Track task progress through defined status stages
- **Assignment**: Assign tasks to specific users
- **Deadlines and Reminders**: Set due dates and configure reminder notifications
- **Filtering and Sorting**: Find tasks based on various criteria including status, assignee, and due date
- **Pagination**: Handle large collections of tasks and users efficiently
- **Secure Access**: Protect your data with bearer token authentication

## Common Use Cases

The Task Management API is well-suited for a variety of applications, including:

- Project management tools
- Team collaboration software
- Personal productivity applications
- Workflow automation systems
- Customer support ticket systems
- Event planning applications
- Educational platforms with assignment tracking

## API Design Principles

The API follows these design principles:

- **RESTful Architecture**: Resources are accessed via standard HTTP methods
- **JSON Formatting**: All requests and responses use JSON
- **Consistent Patterns**: Similar patterns across endpoints for ease of use
- **Clear Documentation**: Comprehensive documentation with examples
- **Robust Error Handling**: Detailed error messages to help troubleshoot issues

## Getting Started

To start working with the API:

1. [Create an account](https://taskmanagement.example.com/signup) to get your API credentials
2. Follow our [Quick Start Guide](/getting-started/quickstart.md) to make your first API request
3. Learn about [Authentication](/getting-started/authentication.md) to secure your API calls
4. Explore the [API Reference](/api-reference.md) for detailed endpoint information

## Next Steps

After understanding the basics of the Task Management API, you can:

- Check out the [Quick Start Guide](/getting-started/quickstart.md) to make your first API call
- Learn about [Core Concepts](/core-concepts.md) to understand the API's foundations
- Explore the [Resources](/resources.md) to understand the data model
- Try our [Tutorials](/tutorials.md) for practical examples

--- FILE: getting-started/quickstart.md
---
title: "Quick start guide"
description: "Get up and running with the Task Management API in minutes."
tags: ["quick start", "tutorial"]
categories: ["getting-started"]
importance: 9
parent: "getting-started"
hasChildren: false
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "2025-05-13"
navOrder: "2"
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

1. Learn more about [Authentication](/getting-started/authentication.md)
2. Explore the [User Resource](/resources/user-resource.md) and [Task Resource](/resources/task-resource.md)
3. Check out [API Reference](/api-reference.md) for all available endpoints
4. Try the [Task Management Workflow](/tutorials/task-management-workflow.md) tutorial

--- FILE: getting-started/authentication.md
---
title: "Authentication"
description: "Learn how to authenticate your requests to the Task Management API using bearer tokens."
tags: ["authentication", "security", "bearer token"]
categories: ["getting-started"]
importance: 8
parent: "getting-started"
hasChildren: false
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "2025-05-13"
navOrder: "3"
layout: "default"
version: "v1.0.0"
lastUpdated: "2025-05-13"
---

# Authentication

All requests to the Task Management API must be authenticated using bearer token authentication. This guide explains how to authenticate your requests and manage your API keys.

## Bearer Token Authentication

The Task Management API uses bearer token authentication. To authenticate your requests, include your API key in the `Authorization` header of each request:

```
Authorization: Bearer YOUR_API_KEY
```

## Getting an API Key

To get an API key:

1. [Create an account](https://taskmanagement.example.com/signup) on the Task Management platform
2. Navigate to the Developer Settings or API section in your account dashboard
3. Generate a new API key

## API Key Security Best Practices

Follow these best practices to keep your API key secure:

- **Keep it secret**: Never share your API key in public repositories, client-side code, or public forums
- **Use environment variables**: Store your API key in environment variables instead of hardcoding it
- **Restrict permissions**: Use the principle of least privilege when assigning permissions to API keys
- **Rotate regularly**: Rotate your API keys periodically, especially after team member changes
- **Monitor usage**: Regularly check the usage logs for any suspicious activity

## Authentication Errors

If your authentication is invalid, you'll receive a `401 Unauthorized` response:

```json
{
  "error": {
    "code": "unauthorized",
    "message": "Invalid or missing API key"
  }
}
```

Common authentication errors include:

- Missing the `Authorization` header
- Incorrect format of the `Authorization` header
- Invalid or expired API key
- API key without sufficient permissions for the requested operation

## Authentication in Code Examples

### cURL

```bash
curl -X GET https://api.taskmanagement.example.com/v1/tasks \
  -H "Authorization: Bearer YOUR_API_KEY"
```

### JavaScript

```javascript
const axios = require('axios');

const apiKey = 'YOUR_API_KEY';
const baseUrl = 'https://api.taskmanagement.example.com/v1';

async function getTasks() {
  try {
    const response = await axios.get(`${baseUrl}/tasks`, {
      headers: {
        'Authorization': `Bearer ${apiKey}`
      }
    });
    
    return response.data;
  } catch (error) {
    console.error('Authentication error:', error.response.data);
  }
}
```

### Python

```python
import requests

api_key = 'YOUR_API_KEY'
base_url = 'https://api.taskmanagement.example.com/v1'

def get_tasks():
    headers = {
        'Authorization': f'Bearer {api_key}'
    }
    
    response = requests.get(f'{base_url}/tasks', headers=headers)
    
    if response.status_code == 401:
        print('Authentication error:', response.json())
        return None
    
    response.raise_for_status()
    return response.json()
```

## API Key Management

The Task Management platform provides several features for managing your API keys:

- **Key rotation**: Generate new keys and deprecate old ones
- **Permission scopes**: Limit what each key can access
- **Usage monitoring**: Track how and when your keys are being used
- **IP restrictions**: Limit API access to specific IP addresses

## Next Steps

Now that you understand authentication, you can:

- Continue to [Rate Limiting](/getting-started/rate-limiting.md) to learn about API request limits
- Explore the [API Reference](/api-reference.md) for details on available endpoints
- Check out [Security Best Practices](/advanced/security-best-practices.md) for more advanced security considerations

## See Also

- [Quick Start Guide](/getting-started/quickstart.md)
- [Error Handling](/core-concepts/error-handling.md)
- [Security Best Practices](/advanced/security-best-practices.md)

--- FILE: getting-started/rate-limiting.md
---
title: "Rate limiting"
description: "Understand the API's rate limits and how to handle rate limiting responses."
tags: ["rate limiting", "throttling"]
categories: ["getting-started"]
importance: 7
parent: "getting-started"
hasChildren: false
ai-generated: false
navOrder: "4"
layout: "default"
version: "v1.0.0"
lastUpdated: "2025-05-13"
---

# Rate Limiting

## Overview

This document outlines the rate limiting policies for the Task Management API, how to recognize when you've hit a rate limit, and strategies for handling rate limiting in your applications.

## Content Outline

### 1. Introduction to Rate Limiting
- Purpose of rate limiting (protect API infrastructure, ensure fair usage)
- How rate limits are structured (requests per minute, per hour, etc.)
- Different rate limit tiers by account type

### 2. Rate Limit Headers
- X-RateLimit-Limit header explanation
- X-RateLimit-Remaining header explanation
- X-RateLimit-Reset header explanation
- Example response headers

### 3. Rate Limit Response Codes
- 429 Too Many Requests response
- Sample rate limit error response
- Retry-After header usage

### 4. Best Practices for Handling Rate Limits
- Implementing exponential backoff
- Monitoring rate limit headers preemptively
- Optimizing requests to reduce API calls
- Caching strategies to reduce request volume

### 5. Rate Limits by Endpoint
- Table of endpoints with their specific rate limits
- Special considerations for high-volume endpoints

### 6. Requesting Rate Limit Increases
- Process for requesting higher rate limits
- Requirements and considerations
- Contact information for support

## Suggested Content

- **Diagram**: Visual representation of exponential backoff algorithm
- **Code Examples**: Sample code showing proper rate limit handling in different languages
- **Table**: Comparison of rate limits across different account tiers

## Related Topics
- [Error Handling](/core-concepts/error-handling.md)
- [Authentication](/getting-started/authentication.md)
- [Optimizing API Usage](/advanced/optimizing-api-usage.md)

--- FILE: core-concepts/data-model.md
---
title: "Data model"
description: "Overview of the core resources in the Task Management API and their relationships."
tags: ["data model", "resources", "schema"]
categories: ["core-concepts"]
importance: 9
parent: "core-concepts"
hasChildren: false
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "2025-05-13"
navOrder: "1"
layout: "default"
version: "v1.0.0"
lastUpdated: "2025-05-13"
---

# Data Model

The Task Management API is built around two primary resources: Users and Tasks. This page explains these resources, their properties, and how they relate to each other.

## Core Resources

### Users

Users represent individuals who can create and be assigned to tasks. Each user has the following properties:

| Property | Type | Description |
|----------|------|-------------|
| `id` | String | Unique identifier for the user |
| `name` | String | Full name of the user |
| `email` | String | Email address of the user (must be unique) |
| `role` | String | Role of the user (default: "member") |
| `createdAt` | Date | When the user was created |
| `updatedAt` | Date | When the user was last updated |

### Tasks

Tasks represent work items that need to be completed. Each task has the following properties:

| Property | Type | Description |
|----------|------|-------------|
| `id` | String | Unique identifier for the task |
| `title` | String | Title of the task |
| `description` | String | Detailed description of the task (optional) |
| `status` | String | Current status of the task (e.g., "TODO", "IN_PROGRESS", "DONE") |
| `priority` | String | Priority level (e.g., "LOW", "MEDIUM", "HIGH") |
| `createdBy` | String | ID of the user who created the task |
| `assigneeId` | String | ID of the user assigned to the task (optional) |
| `dueDate` | Date | When the task is due (optional) |
| `warningOffset` | Number | Hours before due date to send a reminder (optional) |
| `tags` | Array | Array of string tags associated with the task (optional) |
| `createdAt` | Date | When the task was created |
| `updatedAt` | Date | When the task was last updated |

## Resource Relationships

The relationships between resources in the Task Management API are as follows:

1. **User to Tasks (Creation)**: A user can create multiple tasks. Each task has a `createdBy` field that references the user who created it.

2. **User to Tasks (Assignment)**: A user can be assigned to multiple tasks. Each task has an optional `assigneeId` field that references the assigned user.

3. **Task to User**: A task can be assigned to at most one user at a time. The `assigneeId` field references the assigned user's ID.

## Data Model Diagram

```
┌───────────────────┐        ┌───────────────────┐
│      User         │        │       Task        │
├───────────────────┤        ├───────────────────┤
│ id                │        │ id                │
│ name              │        │ title             │
│ email             │        │ description       │
│ role              │◄───────┤ createdBy         │
│ createdAt         │        │ assigneeId        │◄─┐
│ updatedAt         │        │ status            │  │
└───────────────────┘        │ priority          │  │
         ▲                   │ dueDate           │  │
         │                   │ warningOffset     │  │
         │                   │ tags              │  │
         │                   │ createdAt         │  │
         │                   │ updatedAt         │  │
         └───────────────────────────────────────┘  │
                             │                      │
                             └──────────────────────┘
```

## Enumerations

### Task Status

Task status represents the current state of a task in its lifecycle:

- `TODO`: Task has been created but work hasn't started
- `IN_PROGRESS`: Work on the task has begun
- `REVIEW`: Task is completed and awaiting review
- `DONE`: Task has been completed and approved
- `CANCELED`: Task has been canceled and won't be completed

### Task Priority

Priority indicates the importance level of a task:

- `LOW`: Low priority task
- `MEDIUM`: Medium priority task (default)
- `HIGH`: High priority task
- `URGENT`: Urgent task requiring immediate attention

### User Role

User roles determine the permissions a user has:

- `admin`: Can perform all operations
- `manager`: Can manage tasks and assign them to users
- `member`: Can create and update their own tasks (default)

## Important Notes

- All IDs are automatically generated by the API and are guaranteed to be unique.
- Timestamps (`createdAt` and `updatedAt`) are automatically managed by the API.
- When creating a task, the `createdBy` field is automatically set to the authenticated user's ID.
- The `email` field on the User resource must be unique across all users.

## See Also

- [User Resource](/resources/user-resource.md)
- [Task Resource](/resources/task-resource.md)
- [Task Status Lifecycle](/core-concepts/task-status-lifecycle.md)

--- FILE: core-concepts/pagination.md
---
title: "Pagination"
description: "How to navigate through large collections of resources using pagination parameters."
tags: ["pagination", "collection"]
categories: ["core-concepts"]
importance: 7
parent: "core-concepts"
hasChildren: false
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "2025-05-13"
navOrder: "2"
layout: "default"
version: "v1.0.0"
lastUpdated: "2025-05-13"
---

# Pagination

The Task Management API uses pagination to control the number of items returned in list responses. This helps improve performance and keeps response sizes manageable when working with large collections of resources.

## How Pagination Works

When you make a request to an endpoint that returns multiple resources (like `/users` or `/tasks`), the API will return a subset of the results along with pagination information to help you navigate through all available resources.

## Pagination Parameters

You can control pagination using the following query parameters:

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `limit` | Integer | 10 | Number of items to return per page (max: 100) |
| `offset` | Integer | 0 | Number of items to skip before starting to collect the result set |

## Example Request with Pagination

```http
GET /tasks?limit=5&offset=10
```

This request will:
- Skip the first 10 tasks (offset=10)
- Return the next 5 tasks (limit=5)

## Pagination Response Format

The API returns pagination information in the response body. Here's an example response for a paginated list of tasks:

```json
{
  "data": [
    {
      "id": "task123",
      "title": "Complete API documentation",
      "status": "IN_PROGRESS",
      // other task properties...
    },
    // more tasks...
  ],
  "pagination": {
    "total": 42,       // Total number of items across all pages
    "limit": 5,        // Number of items per page
    "offset": 10,      // Current offset
    "hasMore": true    // Whether there are more items beyond this page
  }
}
```

## Pagination Links

For convenience, the API also includes pagination links in the response headers using the `Link` header:

```
Link: <https://api.taskmanagement.example.com/v1/tasks?limit=5&offset=15>; rel="next",
      <https://api.taskmanagement.example.com/v1/tasks?limit=5&offset=5>; rel="prev",
      <https://api.taskmanagement.example.com/v1/tasks?limit=5&offset=0>; rel="first",
      <https://api.taskmanagement.example.com/v1/tasks?limit=5&offset=40>; rel="last"
```

These links provide URLs for the next, previous, first, and last pages of results.

## Handling Pagination in Code

### JavaScript Example

```javascript
async function getAllTasks() {
  const allTasks = [];
  let hasMore = true;
  let offset = 0;
  const limit = 20;
  
  while (hasMore) {
    const response = await fetch(`https://api.taskmanagement.example.com/v1/tasks?limit=${limit}&offset=${offset}`, {
      headers: {
        'Authorization': `Bearer ${API_KEY}`
      }
    });
    
    const result = await response.json();
    
    // Add the current page of results to our array
    allTasks.push(...result.data);
    
    // Update pagination variables for next iteration
    offset += limit;
    hasMore = result.pagination.hasMore;
  }
  
  return allTasks;
}
```

### Python Example

```python
import requests

def get_all_tasks(api_key):
    all_tasks = []
    has_more = True
    offset = 0
    limit = 20
    
    while has_more:
        response = requests.get(
            f"https://api.taskmanagement.example.com/v1/tasks?limit={limit}&offset={offset}",
            headers={
                'Authorization': f'Bearer {api_key}'
            }
        )
        
        result = response.json()
        
        # Add the current page of results to our list
        all_tasks.extend(result['data'])
        
        # Update pagination variables for next iteration
        offset += limit
        has_more = result['pagination']['hasMore']
    
    return all_tasks
```

## Best Practices

1. **Use reasonable page sizes**: Start with the default limit of 10 and adjust based on your needs. Using very large limits can impact performance.

2. **Cache results when appropriate**: If you're making multiple requests for the same data, consider caching the results to reduce API calls.

3. **Handle empty results**: When the offset exceeds the total number of items, the API will return an empty data array with `hasMore` set to `false`.

4. **Use the provided pagination links**: Instead of calculating offsets manually, use the pagination links provided in the `Link` header when available.

5. **Consider using cursor-based pagination for real-time data**: For frequently updated collections, consider using cursor-based pagination if available to avoid missing or duplicating items.

## See Also

- [Sorting](/core-concepts/sorting.md)
- [Get All Tasks](/api-reference/get-all-tasks.md)
- [Get All Users](/api-reference/get-all-users.md)

--- FILE: core-concepts/sorting.md
---
title: "Sorting"
description: "How to sort API results using sort parameters."
tags: ["sorting", "collection"]
categories: ["core-concepts"]
importance: 6
parent: "core-concepts"
hasChildren: false
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "2025-05-13"
navOrder: "3"
layout: "default"
version: "v1.0.0"
lastUpdated: "2025-05-13"
---

# Sorting

The Task Management API allows you to sort collections of resources using the `sort` query parameter. This page explains how to use sorting to organize and retrieve resources in a specific order.

## Basic Sorting

To sort resources, use the `sort` query parameter with a field name:

```
GET /tasks?sort=dueDate
```

By default, sorting is done in ascending order (A to Z, oldest to newest, etc.).

## Sort Direction

To specify the sort direction, prefix the field name with a plus (`+`) for ascending order or a minus (`-`) for descending order:

```
GET /tasks?sort=-dueDate   # Sort by due date, newest first
GET /tasks?sort=+title     # Sort by title, alphabetically A-Z
```

## Multiple Sort Fields

You can sort by multiple fields by separating them with commas:

```
GET /tasks?sort=-priority,dueDate
```

This example sorts tasks by priority in descending order (high to low) and then by due date in ascending order (earliest first) when priorities are the same.

## Sortable Fields

### User Resource

| Field | Type | Description |
|-------|------|-------------|
| `name` | String | User's full name |
| `email` | String | User's email address |
| `createdAt` | Date | When the user was created |
| `updatedAt` | Date | When the user was last updated |

### Task Resource

| Field | Type | Description |
|-------|------|-------------|
| `title` | String | Task title |
| `status` | String | Task status |
| `priority` | String | Task priority |
| `dueDate` | Date | Task due date |
| `createdAt` | Date | When the task was created |
| `updatedAt` | Date | When the task was last updated |

## Example Requests

### Sort Tasks by Due Date (Earliest First)

```http
GET /tasks?sort=dueDate
```

### Sort Tasks by Priority (Highest First) and Due Date (Earliest First)

```http
GET /tasks?sort=-priority,dueDate
```

### Sort Users by Name (Alphabetical)

```http
GET /users?sort=name
```

### Sort Users by Creation Date (Newest First)

```http
GET /users?sort=-createdAt
```

## Combining with Other Parameters

Sorting can be combined with other query parameters like pagination and filtering:

```http
GET /tasks?status=IN_PROGRESS&sort=-priority&limit=10&offset=0
```

This request retrieves:
- Tasks with status "IN_PROGRESS"
- Sorted by priority (highest first)
- Limited to 10 results
- Starting from the first result (offset 0)

## Sorting Response Format

The sorting parameters don't change the structure of the response, only the order of items in the `data` array:

```json
{
  "data": [
    {
      "id": "task123",
      "title": "High priority task",
      "priority": "HIGH",
      "dueDate": "2025-05-15T10:00:00Z",
      // other properties...
    },
    {
      "id": "task456",
      "title": "Medium priority task",
      "priority": "MEDIUM",
      "dueDate": "2025-05-14T10:00:00Z",
      // other properties...
    },
    // more tasks...
  ],
  "pagination": {
    "total": 42,
    "limit": 10,
    "offset": 0,
    "hasMore": true
  }
}
```

## Handling Sort in Code

### JavaScript Example

```javascript
async function getTasksSortedByPriorityAndDueDate() {
  try {
    const response = await fetch('https://api.taskmanagement.example.com/v1/tasks?sort=-priority,dueDate', {
      headers: {
        'Authorization': `Bearer ${API_KEY}`
      }
    });
    
    const result = await response.json();
    return result.data;
  } catch (error) {
    console.error('Error fetching sorted tasks:', error);
    return [];
  }
}
```

### Python Example

```python
import requests

def get_tasks_sorted_by_priority_and_due_date(api_key):
    try:
        response = requests.get(
            'https://api.taskmanagement.example.com/v1/tasks?sort=-priority,dueDate',
            headers={
                'Authorization': f'Bearer {api_key}'
            }
        )
        
        response.raise_for_status()
        result = response.json()
        return result['data']
    except requests.exceptions.RequestException as e:
        print(f'Error fetching sorted tasks: {e}')
        return []
```

## Best Practices

1. **Combine with pagination**: When sorting large collections, always use pagination to improve performance.

2. **Default sorting**: If no sorting is specified, resources are typically sorted by `createdAt` in descending order (newest first).

3. **Custom sorting**: For more complex sorting needs, consider using filtering and then sorting the results client-side.

4. **Sorting null values**: Fields with null values typically appear last in ascending sorts and first in descending sorts.

## See Also

- [Pagination](/core-concepts/pagination.md)
- [Get All Tasks](/api-reference/get-all-tasks.md)
- [Get All Users](/api-reference/get-all-users.md)

--- FILE: core-concepts/error-handling.md
---
title: "Error handling"
description: "Common error patterns and best practices for handling errors in the Task Management API."
tags: ["errors", "troubleshooting"]
categories: ["core-concepts"]
importance: 8
parent: "core-concepts"
hasChildren: false
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "2025-05-13"
navOrder: "4"
layout: "default"
version: "v1.0.0"
lastUpdated: "2025-05-13"
---

# Error Handling

The Task Management API uses conventional HTTP response codes and a consistent error response format to indicate the success or failure of API requests. This page explains how errors are structured and provides best practices for handling them in your code.

## HTTP Status Codes

The API uses the following HTTP status codes to indicate the result of a request:

| Status Code | Description |
|-------------|-------------|
| 200 - OK | The request was successful |
| 201 - Created | The resource was successfully created |
| 400 - Bad Request | The request was invalid or improperly formatted |
| 401 - Unauthorized | Authentication is required or failed |
| 403 - Forbidden | The authenticated user lacks permission for the requested operation |
| 404 - Not Found | The requested resource does not exist |
| 409 - Conflict | The request conflicts with the current state of the resource |
| 422 - Unprocessable Entity | The request is properly formatted but contains semantic errors |
| 429 - Too Many Requests | The client has exceeded rate limits |
| 500 - Internal Server Error | Something went wrong on the server |

## Error Response Format

All error responses follow a consistent format:

```json
{
  "error": {
    "code": "error_code",
    "message": "A human-readable error message",
    "details": {
      // Additional error details if available
    }
  }
}
```

The `details` field is optional and may contain additional information about the error, such as specific validation errors for each field.

## Common Error Codes

| Error Code | HTTP Status | Description |
|------------|-------------|-------------|
| `invalid_request` | 400 | The request is malformed or missing required fields |
| `unauthorized` | 401 | Invalid or missing authentication |
| `forbidden` | 403 | The user doesn't have permission for this action |
| `not_found` | 404 | The requested resource doesn't exist |
| `conflict` | 409 | The request conflicts with the current state |
| `validation_error` | 422 | The request contains invalid data |
| `rate_limit_exceeded` | 429 | The client has sent too many requests |
| `server_error` | 500 | An unexpected error occurred on the server |

## Validation Error Example

When a request fails validation, the response includes details about each invalid field:

```json
{
  "error": {
    "code": "validation_error",
    "message": "The request contains invalid data",
    "details": {
      "title": "Title is required",
      "dueDate": "Due date must be in the future",
      "status": "Status must be one of: TODO, IN_PROGRESS, REVIEW, DONE, CANCELED"
    }
  }
}
```

## Error Handling Best Practices

### 1. Check HTTP Status Codes

Always check the HTTP status code before processing the response body:

```javascript
// JavaScript example
if (response.status >= 200 && response.status < 300) {
  // Success - process the response
} else {
  // Error - handle according to status code
}
```

### 2. Extract Error Information

Parse the error response to get detailed information:

```javascript
// JavaScript example
async function handleApiError(response) {
  try {
    const errorData = await response.json();
    console.error(`API Error (${response.status}): ${errorData.error.message}`);
    
    // Handle specific error codes
    if (errorData.error.code === 'validation_error') {
      handleValidationErrors(errorData.error.details);
    }
    
    return errorData.error;
  } catch (e) {
    console.error(`Failed to parse error response: ${e}`);
    return { code: 'unknown_error', message: 'An unknown error occurred' };
  }
}
```

### 3. Implement Retry Logic for Certain Errors

For transient errors like rate limiting (429), implement retry logic with exponential backoff:

```javascript
// JavaScript example
async function fetchWithRetry(url, options, maxRetries = 3) {
  let retries = 0;
  
  while (retries < maxRetries) {
    const response = await fetch(url, options);
    
    if (response.status !== 429) {
      return response;
    }
    
    // Get retry-after header or use exponential backoff
    const retryAfter = response.headers.get('Retry-After') || Math.pow(2, retries);
    const delay = parseInt(retryAfter, 10) * 1000;
    
    console.log(`Rate limited, retrying after ${delay}ms (retry ${retries + 1}/${maxRetries})`);
    await new Promise(resolve => setTimeout(resolve, delay));
    
    retries++;
  }
  
  // If we've exhausted all retries
  const response = await fetch(url, options);
  return response;
}
```

### 4. Gracefully Handle 404 Errors

Handle 404 errors gracefully, especially for `GET` requests:

```javascript
// JavaScript example
async function getTask(taskId) {
  const response = await fetch(`https://api.taskmanagement.example.com/v1/tasks/${taskId}`, {
    headers: { 'Authorization': `Bearer ${API_KEY}` }
  });
  
  if (response.status === 404) {
    console.warn(`Task ${taskId} not found`);
    return null;
  } else if (!response.ok) {
    throw await handleApiError(response);
  }
  
  return response.json();
}
```

### 5. Validate Input Before Sending

Validate user input client-side before sending requests to reduce validation errors:

```javascript
// JavaScript example
function validateTask(task) {
  const errors = {};
  
  if (!task.title || task.title.trim() === '') {
    errors.title = 'Title is required';
  }
  
  if (task.dueDate && new Date(task.dueDate) <= new Date()) {
    errors.dueDate = 'Due date must be in the future';
  }
  
  const validStatuses = ['TODO', 'IN_PROGRESS', 'REVIEW', 'DONE', 'CANCELED'];
  if (task.status && !validStatuses.includes(task.status)) {
    errors.status = `Status must be one of: ${validStatuses.join(', ')}`;
  }
  
  return Object.keys(errors).length > 0 ? errors : null;
}
```

## Language-Specific Examples

### Python

```python
import requests

def handle_api_error(response):
    try:
        error_data = response.json()
        print(f"API Error ({response.status_code}): {error_data['error']['message']}")
        return error_data['error']
    except Exception as e:
        print(f"Failed to parse error response: {e}")
        return {"code": "unknown_error", "message": "An unknown error occurred"}

def get_task(api_key, task_id):
    response = requests.get(
        f"https://api.taskmanagement.example.com/v1/tasks/{task_id}",
        headers={"Authorization": f"Bearer {api_key}"}
    )
    
    if response.status_code == 404:
        print(f"Task {task_id} not found")
        return None
    elif not response.ok:
        raise Exception(handle_api_error(response))
    
    return response.json()
```

### cURL

When using cURL, you'll need to handle errors manually by checking the response:

```bash
response=$(curl -s -w "\n%{http_code}" https://api.taskmanagement.example.com/v1/tasks/non-existent-id \
  -H "Authorization: Bearer YOUR_API_KEY")

http_code=$(echo "$response" | tail -n1)
body=$(echo "$response" | sed '$d')

if [ "$http_code" -ge 400 ]; then
  echo "Error (HTTP $http_code):"
  echo "$body" | jq .
else
  echo "Success:"
  echo "$body" | jq .
fi
```

## See Also

- [API Reference - Error Responses](/api-reference/error-responses.md)
- [Rate Limiting](/getting-started/rate-limiting.md)
- [Troubleshooting](/support/troubleshooting.md)

--- FILE: core-concepts/task-status-lifecycle.md
---
title: "Task status lifecycle"
description: "Understanding the various status values that tasks can have and their transitions."
tags: ["task status", "workflow"]
categories: ["core-concepts"]
importance: 7
parent: "core-concepts"
hasChildren: false
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "2025-05-13"
navOrder: "5"
layout: "default"
version: "v1.0.0"
lastUpdated: "2025-05-13"
---

# Task Status Lifecycle

Tasks in the Task Management API move through a series of statuses throughout their lifecycle. This page explains the different status values, valid transitions between them, and how to implement a task lifecycle in your application.

## Task Status Values

The Task Management API supports the following status values for tasks:

| Status | Description |
|--------|-------------|
| `TODO` | The task has been created but work hasn't started yet |
| `IN_PROGRESS` | Work on the task has begun but is not yet complete |
| `REVIEW` | The task is completed and waiting for review or approval |
| `DONE` | The task has been completed and approved |
| `CANCELED` | The task has been canceled and won't be completed |

## Task Status Lifecycle Diagram

```
┌─────────┐     ┌─────────────┐     ┌────────┐     ┌──────┐
│   TODO  │────►│ IN_PROGRESS │────►│ REVIEW │────►│ DONE │
└─────────┘     └─────────────┘     └────────┘     └──────┘
     │                 │                │              │
     │                 │                │              │
     │                 ▼                ▼              ▼
     └───────────────►┌──────────┐◄─────────────────────
                      │ CANCELED │
                      └──────────┘
```

## Valid Status Transitions

Not all status transitions are valid. The following table shows the allowed transitions:

| Current Status | Valid Next Statuses |
|----------------|---------------------|
| `TODO` | `IN_PROGRESS`, `CANCELED` |
| `IN_PROGRESS` | `REVIEW`, `CANCELED` |
| `REVIEW` | `DONE`, `IN_PROGRESS`, `CANCELED` |
| `DONE` | `CANCELED` |
| `CANCELED` | None (terminal state) |

Attempting to make an invalid status transition will result in a `422 Unprocessable Entity` error.

## Implementing Status Transitions

To update a task's status, use the `PATCH` method on the task resource:

```http
PATCH /tasks/{taskId}
Content-Type: application/json

{
  "status": "IN_PROGRESS"
}
```

### Example Response

```json
{
  "id": "task123",
  "title": "Implement authentication",
  "description": "Add token-based authentication to the application",
  "status": "IN_PROGRESS",
  "priority": "HIGH",
  "createdBy": "user456",
  "assigneeId": "user789",
  "dueDate": "2025-06-01T17:00:00Z",
  "createdAt": "2025-05-01T10:30:00Z",
  "updatedAt": "2025-05-13T14:25:00Z"
}
```

## Status-Based Filtering

You can filter tasks by status when listing them:

```http
GET /tasks?status=IN_PROGRESS
```

You can also filter by multiple statuses:

```http
GET /tasks?status=TODO,IN_PROGRESS
```

This is useful for creating views like "Open Tasks" (TODO, IN_PROGRESS, REVIEW) or "Closed Tasks" (DONE, CANCELED).

## Status Workflow Automation

Here are some common automation practices for task status transitions:

### 1. Automatic Assignment

When a task moves from `TODO` to `IN_PROGRESS`, it often requires an assignee:

```javascript
// JavaScript example
async function startTask(taskId, assigneeId) {
  const response = await fetch(`https://api.taskmanagement.example.com/v1/tasks/${taskId}`, {
    method: 'PATCH',
    headers: {
      'Authorization': `Bearer ${API_KEY}`,
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({
      status: 'IN_PROGRESS',
      assigneeId: assigneeId
    })
  });
  
  return response.json();
}
```

### 2. Notifications on Status Change

You might want to notify relevant users when a task's status changes:

```python
# Python example
def update_task_status(api_key, task_id, new_status):
    # First, get the current task data
    response = requests.get(
        f"https://api.taskmanagement.example.com/v1/tasks/{task_id}",
        headers={"Authorization": f"Bearer {api_key}"}
    )
    
    current_task = response.json()
    old_status = current_task["status"]
    
    # Update the status
    response = requests.patch(
        f"https://api.taskmanagement.example.com/v1/tasks/{task_id}",
        headers={
            "Authorization": f"Bearer {api_key}",
            "Content-Type": "application/json"
        },
        json={"status": new_status}
    )
    
    updated_task = response.json()
    
    # Send notifications based on the transition
    if old_status == "TODO" and new_status == "IN_PROGRESS":
        notify_task_started(updated_task)
    elif old_status == "IN_PROGRESS" and new_status == "REVIEW":
        notify_task_ready_for_review(updated_task)
    elif new_status == "DONE":
        notify_task_completed(updated_task)
    elif new_status == "CANCELED":
        notify_task_canceled(updated_task)
    
    return updated_task
```

### 3. Implementing a Review Process

If your workflow requires formal review, you might implement a process like this:

```javascript
// JavaScript example
async function completeTaskWorkflow(taskId, reviewerId) {
  // 1. Developer marks task as ready for review
  await fetch(`https://api.taskmanagement.example.com/v1/tasks/${taskId}`, {
    method: 'PATCH',
    headers: {
      'Authorization': `Bearer ${API_KEY}`,
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({
      status: 'REVIEW'
    })
  });
  
  // 2. Assign the reviewer
  await fetch(`https://api.taskmanagement.example.com/v1/tasks/${taskId}`, {
    method: 'PATCH',
    headers: {
      'Authorization': `Bearer ${API_KEY}`,
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({
      assigneeId: reviewerId
    })
  });
  
  // In a real application, the reviewer would review and then update the status
  // to either DONE or back to IN_PROGRESS
}
```

## Best Practices

1. **Validate transitions**: Always validate status transitions before making API requests to avoid errors.

2. **Track status history**: If you need a history of status changes, consider implementing your own tracking as the API only provides the current status.

3. **Use webhooks if available**: If the API provides webhooks, subscribe to status change events to keep your application in sync.

4. **Consider user permissions**: Different users might have different permissions for status transitions. For example, only a reviewer might be able to move a task from `REVIEW` to `DONE`.

5. **Implement intuitive UI**: Design your user interface to make the task lifecycle clear, perhaps showing available actions based on the current status.

## See Also

- [Task Resource](/resources/task-resource.md)
- [Update Task](/api-reference/update-task.md)
- [Task Management Workflow](/tutorials/task-management-workflow.md)

--- FILE: resources/user-resource.md
---
title: "User resource"
description: "Detailed information about the User resource, its properties, and related endpoints."
tags: ["user", "resource"]
categories: ["resources"]
importance: 9
parent: "resources"
hasChildren: false
related_pages: ["get-all-users", "create-user", "get-user-by-id", "update-user", "delete-user"]
api_endpoints: ["/users", "/users/{userId}"]
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "2025-05-13"
navOrder: "1"
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

--- FILE: resources/task-resource.md
---
title: "Task resource"
description: "Detailed information about the Task resource, its properties, and related endpoints."
tags: ["task", "resource"]
categories: ["resources"]
importance: 9
parent: "resources"
hasChildren: false
related_pages: ["get-all-tasks", "create-task", "get-task-by-id", "update-task", "delete-task"]
api_endpoints: ["/tasks", "/tasks/{taskId}"]
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "2025-05-13"
navOrder: "2"
layout: "default"
version: "v1.0.0"
lastUpdated: "2025-05-13"
---

# Task Resource

The Task resource represents a unit of work that needs to be completed within the Task Management API. This page provides detailed information about the Task resource, its properties, and related endpoints.

## Resource Properties

| Property | Type | Description | Required |
|----------|------|-------------|----------|
| `id` | String | Unique identifier for the task | Auto-generated |
| `title` | String | Title of the task | Yes |
| `description` | String | Detailed description of the task | No |
| `status` | String | Current status of the task | No (default: "TODO") |
| `priority` | String | Priority level of the task | No (default: "MEDIUM") |
| `createdBy` | String | ID of the user who created the task | Auto-generated |
| `assigneeId` | String | ID of the user assigned to the task | No |
| `dueDate` | Date | When the task is due | No |
| `warningOffset` | Number | Hours before due date to send a reminder | No |
| `tags` | Array | Array of string tags associated with the task | No |
| `createdAt` | Date | When the task was created | Auto-generated |
| `updatedAt` | Date | When the task was last updated | Auto-generated |

## Resource Representation

### JSON Format

```json
{
  "id": "task123",
  "title": "Implement authentication",
  "description": "Add token-based authentication to the application",
  "status": "IN_PROGRESS",
  "priority": "HIGH",
  "createdBy": "user456",
  "assigneeId": "user789",
  "dueDate": "2025-06-01T17:00:00Z",
  "warningOffset": 24,
  "tags": ["authentication", "security", "api"],
  "createdAt": "2025-05-01T10:30:00Z",
  "updatedAt": "2025-05-13T14:25:00Z"
}
```

## Task Status Values

The Task resource supports the following status values:

| Status | Description |
|--------|-------------|
| `TODO` | Task has been created but work hasn't started (default) |
| `IN_PROGRESS` | Work on the task has begun but is not yet complete |
| `REVIEW` | Task is completed and awaiting review or approval |
| `DONE` | Task has been completed and approved |
| `CANCELED` | Task has been canceled and won't be completed |

For more details on task status transitions, see [Task Status Lifecycle](/core-concepts/task-status-lifecycle.md).

## Task Priority Levels

The Task resource supports the following priority levels:

| Priority | Description |
|----------|-------------|
| `LOW` | Low priority task |
| `MEDIUM` | Medium priority task (default) |
| `HIGH` | High priority task |
| `URGENT` | Urgent task requiring immediate attention |

## Related Endpoints

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/tasks` | GET | [Get all tasks](/api-reference/get-all-tasks.md) |
| `/tasks` | POST | [Create a task](/api-reference/create-task.md) |
| `/tasks/{taskId}` | GET | [Get task by ID](/api-reference/get-task-by-id.md) |
| `/tasks/{taskId}` | PATCH | [Update a task](/api-reference/update-task.md) |
| `/tasks/{taskId}` | DELETE | [Delete a task](/api-reference/delete-task.md) |

## Creating a Task

To create a new task, send a `POST` request to the `/tasks` endpoint:

### Request

```http
POST /tasks
Content-Type: application/json

{
  "title": "Create API documentation",
  "description": "Write comprehensive API documentation for developers",
  "priority": "HIGH",
  "assigneeId": "user456",
  "dueDate": "2025-05-30T17:00:00Z",
  "tags": ["documentation", "api"]
}
```

### Response

```http
HTTP/1.1 201 Created
Content-Type: application/json

{
  "id": "task789",
  "title": "Create API documentation",
  "description": "Write comprehensive API documentation for developers",
  "status": "TODO",
  "priority": "HIGH",
  "createdBy": "user123",
  "assigneeId": "user456",
  "dueDate": "2025-05-30T17:00:00Z",
  "tags": ["documentation", "api"],
  "createdAt": "2025-05-13T15:30:00Z",
  "updatedAt": "2025-05-13T15:30:00Z"
}
```

## Updating a Task

To update an existing task, send a `PATCH` request to the `/tasks/{taskId}` endpoint:

### Request

```http
PATCH /tasks/task789
Content-Type: application/json

{
  "status": "IN_PROGRESS",
  "description": "Write comprehensive API documentation for developers, including examples and best practices"
}
```

### Response

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "id": "task789",
  "title": "Create API documentation",
  "description": "Write comprehensive API documentation for developers, including examples and best practices",
  "status": "IN_PROGRESS",
  "priority": "HIGH",
  "createdBy": "user123",
  "assigneeId": "user456",
  "dueDate": "2025-05-30T17:00:00Z",
  "tags": ["documentation", "api"],
  "createdAt": "2025-05-13T15:30:00Z",
  "updatedAt": "2025-05-13T15:45:00Z"
}
```

## Deleting a Task

To delete a task, send a `DELETE` request to the `/tasks/{taskId}` endpoint:

### Request

```http
DELETE /tasks/task789
```

### Response

```http
HTTP/1.1 204 No Content
```

## Task and User Relationships

Tasks are related to users in two ways:

1. **Created by**: Each task has a `createdBy` field that references the user who created it.

2. **Assigned to**: Each task can optionally have an `assigneeId` field that references the user assigned to complete it.

## Filtering Tasks

The `/tasks` endpoint supports various filtering parameters:

| Parameter | Description | Example |
|-----------|-------------|---------|
| `status` | Filter by task status | `/tasks?status=IN_PROGRESS` |
| `priority` | Filter by task priority | `/tasks?priority=HIGH` |
| `assigneeId` | Filter by assigned user | `/tasks?assigneeId=user456` |
| `createdBy` | Filter by creator | `/tasks?createdBy=user123` |
| `dueDate[lt]` | Tasks due before date | `/tasks?dueDate[lt]=2025-05-30T00:00:00Z` |
| `dueDate[gt]` | Tasks due after date | `/tasks?dueDate[gt]=2025-05-01T00:00:00Z` |
| `tags` | Filter by tags | `/tasks?tags=documentation,api` |

Multiple filters can be combined using the `&` operator:

```
/tasks?status=TODO,IN_PROGRESS&priority=HIGH,URGENT&assigneeId=user456
```

## Code Examples

### Get All Tasks - JavaScript

```javascript
async function getAllTasks() {
  try {
    const response = await fetch('https://api.taskmanagement.example.com/v1/tasks', {
      headers: {
        'Authorization': `Bearer ${API_KEY}`
      }
    });
    
    if (!response.ok) {
      throw new Error(`Failed to fetch tasks: ${response.status}`);
    }
    
    return await response.json();
  } catch (error) {
    console.error('Error fetching tasks:', error);
    return { data: [] };
  }
}
```

### Create a Task - Python

```python
import requests

def create_task(api_key, title, description=None, priority="MEDIUM", assignee_id=None, due_date=None):
    try:
        task_data = {
            "title": title,
            "priority": priority
        }
        
        if description:
            task_data["description"] = description
            
        if assignee_id:
            task_data["assigneeId"] = assignee_id
            
        if due_date:
            task_data["dueDate"] = due_date
        
        response = requests.post(
            "https://api.taskmanagement.example.com/v1/tasks",
            headers={
                "Authorization": f"Bearer {api_key}",
                "Content-Type": "application/json"
            },
            json=task_data
        )
        
        response.raise_for_status()
        return response.json()
    except requests.exceptions.RequestException as e:
        print(f"Error creating task: {e}")
        return None
```

### Update Task Status - cURL

```bash
curl -X PATCH "https://api.taskmanagement.example.com/v1/tasks/task123" \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "status": "DONE"
  }'
```

## Common Use Cases

- **Task Creation**: Creating new tasks for team members to work on
- **Task Assignment**: Assigning tasks to specific users
- **Task Tracking**: Tracking task progress through status updates
- **Due Date Management**: Setting and managing task deadlines
- **Priority Management**: Organizing tasks by priority level
- **Task Filtering**: Finding tasks based on various criteria

## Best Practices

1. **Set Clear Titles**: Use clear, concise titles that describe the task
2. **Provide Detailed Descriptions**: Include all necessary information in the task description
3. **Set Realistic Due Dates**: Assign reasonable deadlines for task completion
4. **Use Appropriate Priorities**: Reserve high and urgent priorities for truly important tasks
5. **Update Status Regularly**: Keep task status up-to-date to reflect current progress
6. **Use Tags for Organization**: Apply consistent tags to group related tasks
7. **Clean Up Completed Tasks**: Delete or archive tasks that are no longer needed

## See Also

- [User Resource](/resources/user-resource.md)
- [Task Status Lifecycle](/core-concepts/task-status-lifecycle.md)
- [Task Management Workflow](/tutorials/task-management-workflow.md)

--- FILE: api-reference/error-responses.md
---
title: "Error responses"
description: "Reference documentation for all error responses returned by the API."
tags: ["errors", "reference"]
categories: ["api-reference"]
importance: 8
parent: "api-reference"
hasChildren: false
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "2025-05-13"
navOrder: "1"
layout: "default"
version: "v1.0.0"
lastUpdated: "2025-05-13"
---

# Error Responses

The Task Management API returns consistent error responses across all endpoints. This page documents the error response format, common error codes, and provides examples for each type of error.

## Error Response Format

All error responses follow this standard format:

```json
{
  "error": {
    "code": "error_code",
    "message": "A human-readable error message",
    "details": {
      // Additional error details (optional)
    }
  }
}
```

* `code`: A string identifier for the type of error
* `message`: A human-readable description of the error
* `details`: An optional object with additional information about the error

## HTTP Status Codes

The API uses standard HTTP status codes to indicate the general category of error:

| Status Code | Category | Description |
|-------------|----------|-------------|
| 400 | Bad Request | The request is malformed or contains invalid parameters |
| 401 | Unauthorized | Authentication is missing or invalid |
| 403 | Forbidden | The authenticated user lacks permission for this operation |
| 404 | Not Found | The requested resource does not exist |
| 409 | Conflict | The request conflicts with the current state of the resource |
| 422 | Unprocessable Entity | The request is well-formed but contains semantic errors |
| 429 | Too Many Requests | The client has sent too many requests in a given time |
| 500 | Internal Server Error | An unexpected error occurred on the server |

## Common Error Codes

### Authentication Errors

| Error Code | HTTP Status | Description |
|------------|-------------|-------------|
| `missing_authentication` | 401 | No authentication credentials were provided |
| `invalid_authentication` | 401 | The provided authentication credentials are invalid |
| `expired_token` | 401 | The authentication token has expired |

### Permission Errors

| Error Code | HTTP Status | Description |
|------------|-------------|-------------|
| `permission_denied` | 403 | The authenticated user does not have permission for this action |
| `insufficient_scope` | 403 | The token does not have the required scope for this action |

### Resource Errors

| Error Code | HTTP Status | Description |
|------------|-------------|-------------|
| `resource_not_found` | 404 | The requested resource does not exist |
| `resource_conflict` | 409 | The request conflicts with the current state of the resource |
| `resource_gone` | 410 | The resource existed previously but has been removed |

### Validation Errors

| Error Code | HTTP Status | Description |
|------------|-------------|-------------|
| `validation_error` | 422 | The request contains invalid data |
| `invalid_parameters` | 400 | One or more query parameters are invalid |
| `invalid_format` | 400 | The request body format is invalid (e.g., malformed JSON) |
| `missing_required_field` | 422 | A required field is missing from the request |
| `invalid_field_value` | 422 | A field value is invalid (e.g., wrong type or out of range) |
| `invalid_status_transition` | 422 | The requested status transition is not allowed |

### Rate Limiting Errors

| Error Code | HTTP Status | Description |
|------------|-------------|-------------|
| `rate_limit_exceeded` | 429 | The client has exceeded their rate limit |
| `daily_limit_exceeded` | 429 | The client has exceeded their daily request limit |

### Server Errors

| Error Code | HTTP Status | Description |
|------------|-------------|-------------|
| `server_error` | 500 | An unexpected error occurred on the server |
| `service_unavailable` | 503 | The service is temporarily unavailable |
| `database_error` | 500 | An error occurred while accessing the database |

## Error Examples

### Authentication Error

```http
HTTP/1.1 401 Unauthorized
Content-Type: application/json

{
  "error": {
    "code": "invalid_authentication",
    "message": "The provided API key is invalid or has been revoked"
  }
}
```

### Resource Not Found Error

```http
HTTP/1.1 404 Not Found
Content-Type: application/json

{
  "error": {
    "code": "resource_not_found",
    "message": "The requested task with ID 'task123' does not exist"
  }
}
```

### Validation Error

```http
HTTP/1.1 422 Unprocessable Entity
Content-Type: application/json

{
  "error": {
    "code": "validation_error",
    "message": "The request contains invalid data",
    "details": {
      "title": "Title is required",
      "dueDate": "Due date must be in the future",
      "status": "Status must be one of: TODO, IN_PROGRESS, REVIEW, DONE, CANCELED"
    }
  }
}
```

### Rate Limit Error

```http
HTTP/1.1 429 Too Many Requests
Content-Type: application/json
Retry-After: 60

{
  "error": {
    "code": "rate_limit_exceeded",
    "message": "You have exceeded the rate limit of 100 requests per minute",
    "details": {
      "limit": 100,
      "remaining": 0,
      "resetAt": "2025-05-13T15:45:00Z"
    }
  }
}
```

## Common Error Scenarios

### Missing or Invalid Authentication

If you receive a `401 Unauthorized` error, check that:
- You are including the `Authorization` header with your requests
- The format is correct: `Authorization: Bearer YOUR_API_KEY`
- Your API key is valid and has not expired

### Permission Denied

If you receive a `403 Forbidden` error, check that:
- The authenticated user has the necessary permissions for the action
- The user's role has access to the requested resource
- For task operations, the user may need to be the creator or assignee of the task

### Resource Not Found

If you receive a `404 Not Found` error, check that:
- The resource ID is correct
- The resource has not been deleted
- You are using the correct endpoint URL

### Validation Errors

If you receive a `422 Unprocessable Entity` error:
- Check the `details` field for specific validation errors
- Ensure all required fields are provided
- Verify that field values match the expected format and constraints
- For status updates, ensure the transition is valid (see [Task Status Lifecycle](/core-concepts/task-status-lifecycle.md))

## Handling Errors in Code

### JavaScript Example

```javascript
async function handleApiRequest(url, options) {
  try {
    const response = await fetch(url, options);
    
    if (!response.ok) {
      const errorData = await response.json();
      
      // Handle specific error types
      switch (errorData.error.code) {
        case 'rate_limit_exceeded':
          console.error('Rate limit exceeded. Try again later.');
          // Maybe implement retry with backoff
          break;
        case 'validation_error':
          console.error('Validation error:', errorData.error.details);
          // Maybe highlight form fields with errors
          break;
        default:
          console.error(`API Error (${response.status}):`, errorData.error.message);
      }
      
      throw new Error(errorData.error.message);
    }
    
    return await response.json();
  } catch (error) {
    // Handle network errors or other exceptions
    console.error('Request failed:', error);
    throw error;
  }
}
```

### Python Example

```python
import requests

def handle_api_request(url, method="GET", data=None, headers=None):
    try:
        if method == "GET":
            response = requests.get(url, headers=headers)
        elif method == "POST":
            response = requests.post(url, json=data, headers=headers)
        elif method == "PATCH":
            response = requests.patch(url, json=data, headers=headers)
        elif method == "DELETE":
            response = requests.delete(url, headers=headers)
        else:
            raise ValueError(f"Unsupported method: {method}")
        
        # Check if the request was successful
        response.raise_for_status()
        
        # For non-204 responses, return the JSON data
        if response.status_code != 204:
            return response.json()
        return None
        
    except requests.exceptions.HTTPError as e:
        # Handle API errors
        error_data = e.response.json()
        error_code = error_data.get("error", {}).get("code", "unknown_error")
        error_message = error_data.get("error", {}).get("message", "Unknown error")
        error_details = error_data.get("error", {}).get("details", {})
        
        print(f"API Error ({e.response.status_code}): {error_message}")
        
        if error_code == "validation_error" and error_details:
            print("Validation errors:")
            for field, error in error_details.items():
                print(f"  {field}: {error}")
        
        # Re-raise the exception with more context
        raise Exception(f"{error_code}: {error_message}") from e
        
    except requests.exceptions.RequestException as e:
        # Handle network errors
        print(f"Request failed: {e}")
        raise
```

## See Also

- [Core Concepts - Error Handling](/core-concepts/error-handling.md)
- [Getting Started - Authentication](/getting-started/authentication.md)
- [Rate Limiting](/getting-started/rate-limiting.md)
- [Troubleshooting](/support/troubleshooting.md)

--- FILE: api-reference/get-all-users.md
---
title: "Get all users"
description: "API endpoint to retrieve a list of all users with pagination and sorting support."
tags: ["users", "endpoint", "GET"]
categories: ["api-reference"]
importance: 7
api_endpoints: ["/users"]
related_pages: ["user-resource", "pagination", "sorting"]
parent: "api-reference"
hasChildren: false
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "2025-05-13"
navOrder: "2"
layout: "default"
version: "v1.0.0"
lastUpdated: "2025-05-13"
---

# Get All Users

## Endpoint

```
GET /users
```

This endpoint retrieves a paginated list of users. It supports pagination, sorting, and filtering options to help you find specific users or navigate through large user collections.

## Request Parameters

The following query parameters can be used to filter, sort, and paginate the results:

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `limit` | Integer | 10 | Number of items to return per page (max: 100) |
| `offset` | Integer | 0 | Number of items to skip before starting to collect the result set |
| `sort` | String | `createdAt` | Field to sort by, optionally prefixed with `+` (ascending) or `-` (descending) |
| `email` | String | - | Filter by email (exact match) |
| `name` | String | - | Filter by name (partial match) |
| `role` | String | - | Filter by role (multiple roles can be separated by commas) |

## Request Example

### Basic Request

```http
GET /users
Authorization: Bearer YOUR_API_KEY
```

### Request with Pagination and Sorting

```http
GET /users?limit=5&offset=10&sort=-createdAt
Authorization: Bearer YOUR_API_KEY
```

This request will:
- Return up to 5 users per page
- Skip the first 10 users
- Sort the results by creation date in descending order (newest first)

### Request with Filtering

```http
GET /users?role=admin,manager&name=Smith
Authorization: Bearer YOUR_API_KEY
```

This request will return users:
- With roles "admin" or "manager"
- Whose name contains "Smith"

## Response

### Success Response (200 OK)

```json
{
  "data": [
    {
      "id": "user123",
      "name": "John Smith",
      "email": "john.smith@example.com",
      "role": "admin",
      "createdAt": "2025-04-01T10:00:00Z",
      "updatedAt": "2025-05-10T14:30:00Z"
    },
    {
      "id": "user456",
      "name": "Jane Smith",
      "email": "jane.smith@example.com",
      "role": "manager",
      "createdAt": "2025-04-15T09:30:00Z",
      "updatedAt": "2025-05-09T11:45:00Z"
    },
    // More users...
  ],
  "pagination": {
    "total": 42,    // Total number of users matching the filter
    "limit": 5,     // Number of users per page
    "offset": 10,   // Current offset
    "hasMore": true // Whether there are more users to fetch
  }
}
```

### Error Responses

| Status Code | Description |
|-------------|-------------|
| 400 | Bad request (e.g., invalid parameters) |
| 401 | Unauthorized (missing or invalid authentication) |
| 403 | Forbidden (insufficient permissions) |

For details on error responses, see [Error Responses](/api-reference/error-responses.md).

## Authentication

This endpoint requires authentication using a bearer token. Include your API key in the `Authorization` header:

```
Authorization: Bearer YOUR_API_KEY
```

The authenticated user must have appropriate permissions to view users based on their role:
- `admin` users can see all users
- `manager` users can see all users except admins
- `member` users can only see their own user information

## Important Considerations

- The user list is paginated. By default, only 10 users are returned per request.
- For large user collections, implement pagination to navigate through all users efficiently.
- Email addresses are unique across all users. If you're searching by email, use exact matches.
- Name searches are partial and case-insensitive (e.g., "smith" will match "John Smith").
- Multiple roles can be specified as a comma-separated list (e.g., `role=admin,manager`).

## Best Practices

- Use pagination to avoid loading too many users at once, especially for large organizations.
- Be specific with filtering to reduce the number of results and improve performance.
- Consider caching user data that doesn't change frequently to reduce API calls.
- When listing all users, sort by a relevant field (e.g., name for alphabetical listing, createdAt for newest users).
- Use the user IDs returned by this endpoint when creating tasks or specifying assignees.

## Code Examples

### JavaScript

```javascript
async function getAllUsers(options = {}) {
  // Default parameters
  const queryParams = {
    limit: options.limit || 10,
    offset: options.offset || 0,
    sort: options.sort || '-createdAt',
    ...options.filters
  };
  
  // Build query string
  const queryString = Object.entries(queryParams)
    .map(([key, value]) => `${key}=${encodeURIComponent(value)}`)
    .join('&');
  
  try {
    const response = await fetch(`https://api.taskmanagement.example.com/v1/users?${queryString}`, {
      headers: {
        'Authorization': `Bearer ${API_KEY}`
      }
    });
    
    if (!response.ok) {
      const errorData = await response.json();
      throw new Error(`Error fetching users: ${errorData.error.message}`);
    }
    
    return await response.json();
  } catch (error) {
    console.error('Failed to fetch users:', error);
    throw error;
  }
}

// Example usage
const adminUsers = await getAllUsers({
  filters: { role: 'admin' },
  limit: 20
});

console.log(`Found ${adminUsers.pagination.total} admin users`);
adminUsers.data.forEach(user => console.log(`${user.name} (${user.email})`));
```

### Python

```python
import requests

def get_all_users(api_key, limit=10, offset=0, sort='-createdAt', **filters):
    """
    Retrieve a list of users with optional filtering, sorting, and pagination.
    
    Args:
        api_key (str): API key for authentication
        limit (int): Number of users to return per page
        offset (int): Number of users to skip
        sort (str): Field to sort by (prefix with - for descending)
        **filters: Additional filters (role, name, email)
    
    Returns:
        dict: Response containing users and pagination info
    """
    params = {
        'limit': limit,
        'offset': offset,
        'sort': sort,
        **filters
    }
    
    response = requests.get(
        'https://api.taskmanagement.example.com/v1/users',
        params=params,
        headers={
            'Authorization': f'Bearer {api_key}'
        }
    )
    
    if response.status_code != 200:
        error_data = response.json()
        raise Exception(f"Error fetching users: {error_data['error']['message']}")
    
    return response.json()

# Example usage
try:
    # Get managers with "Johnson" in their name
    managers = get_all_users(
        api_key='YOUR_API_KEY',
        role='manager',
        name='Johnson',
        limit=5
    )
    
    print(f"Found {managers['pagination']['total']} managers matching the criteria")
    
    for user in managers['data']:
        print(f"{user['name']} ({user['email']}) - {user['role']}")
        
except Exception as e:
    print(f"Failed to retrieve users: {e}")
```

### cURL

```bash
# Basic request to get all users (first page)
curl -X GET "https://api.taskmanagement.example.com/v1/users" \
  -H "Authorization: Bearer YOUR_API_KEY"

# Request with pagination, sorting, and filtering
curl -X GET "https://api.taskmanagement.example.com/v1/users?limit=5&offset=10&sort=-createdAt&role=admin,manager&name=Smith" \
  -H "Authorization: Bearer YOUR_API_KEY"
```

## Related Resources

- [User Resource](/resources/user-resource.md) - Detailed information about the User resource
- [Create a User](/api-reference/create-user.md) - Create a new user
- [Get User by ID](/api-reference/get-user-by-id.md) - Retrieve a specific user by ID

## See Also

- [Pagination](/core-concepts/pagination.md) - How to navigate through large collections of resources
- [Sorting](/core-concepts/sorting.md) - How to sort API results using sort parameters
- [Authentication](/getting-started/authentication.md) - How to authenticate your API requests

--- FILE: api-reference/create-user.md
---
title: "Create a user"
description: "API endpoint to create a new user in the system."
tags: ["users", "endpoint", "POST"]
categories: ["api-reference"]
importance: 7
api_endpoints: ["/users"]
related_pages: ["user-resource"]
parent: "api-reference"
hasChildren: false
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "2025-05-13"
navOrder: "3"
layout: "default"
version: "v1.0.0"
lastUpdated: "2025-05-13"
---

# Create a User

## Endpoint

```
POST /users
```

This endpoint creates a new user in the system. The new user can be assigned tasks and will have permissions based on their assigned role.

## Path Parameters

None.

## Request Body

The request body should be a JSON object with the following properties:

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `name` | String | Yes | Full name of the user |
| `email` | String | Yes | Email address of the user (must be unique) |
| `role` | String | No | Role of the user: "admin", "manager", or "member" (default: "member") |

### Example Request Body

```json
{
  "name": "John Doe",
  "email": "john.doe@example.com",
  "role": "manager"
}
```

## Request Example

```http
POST /users
Content-Type: application/json
Authorization: Bearer YOUR_API_KEY

{
  "name": "John Doe",
  "email": "john.doe@example.com",
  "role": "manager"
}
```

## Response

### Success Response (201 Created)

```json
{
  "id": "user123",
  "name": "John Doe",
  "email": "john.doe@example.com",
  "role": "manager",
  "createdAt": "2025-05-13T10:30:00Z",
  "updatedAt": "2025-05-13T10:30:00Z"
}
```

### Error Responses

| Status Code | Description |
|-------------|-------------|
| 400 | Bad request (e.g., malformed request body) |
| 401 | Unauthorized (missing or invalid authentication) |
| 403 | Forbidden (insufficient permissions to create users) |
| 409 | Conflict (e.g., email already exists) |
| 422 | Unprocessable entity (e.g., validation errors) |

#### Example Error Response

```json
{
  "error": {
    "code": "validation_error",
    "message": "The request contains invalid data",
    "details": {
      "email": "Email address is already in use"
    }
  }
}
```

For details on error responses, see [Error Responses](/api-reference/error-responses.md).

## Authentication

This endpoint requires authentication using a bearer token. Include your API key in the `Authorization` header:

```
Authorization: Bearer YOUR_API_KEY
```

The authenticated user must have appropriate permissions to create users:
- `admin` users can create users with any role
- `manager` users can create users with "member" role only
- `member` users cannot create new users

## Important Considerations

- **Email Uniqueness**: Each user must have a unique email address. Attempting to create a user with an email that's already in use will result in a `409 Conflict` error.

- **User Roles**: Valid roles are "admin", "manager", and "member". If no role is specified, "member" is assigned by default.

- **Permissions**: The newly created user's permissions will be based on their role:
  - `admin`: Full access to all API endpoints
  - `manager`: Can manage users and tasks but with some restrictions
  - `member`: Limited access, primarily to their own resources

- **Auto-Generated Fields**: The `id`, `createdAt`, and `updatedAt` fields are automatically generated and cannot be specified in the request.

## Best Practices

- Validate the email format client-side before making the API request
- Use strong, unique passwords for each user (managed outside this API)
- Assign the least privileged role necessary for the user's needs
- Store the returned user ID for future operations involving this user
- Implement proper error handling for duplicate email addresses

## Code Examples

### JavaScript

```javascript
async function createUser(name, email, role = 'member') {
  try {
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
  } catch (error) {
    console.error('Error creating user:', error);
    throw error;
  }
}

// Example usage
try {
  const newUser = await createUser(
    'Jane Smith',
    'jane.smith@example.com',
    'manager'
  );
  
  console.log(`User created with ID: ${newUser.id}`);
} catch (error) {
  // Handle error
  if (error.message.includes('already in use')) {
    console.error('Email address is already registered');
  } else {
    console.error('Failed to create user:', error);
  }
}
```

### Python

```python
import requests

def create_user(api_key, name, email, role='member'):
    """
    Create a new user in the system.
    
    Args:
        api_key (str): API key for authentication
        name (str): Full name of the user
        email (str): Email address of the user
        role (str, optional): User role (admin, manager, or member). Defaults to 'member'.
        
    Returns:
        dict: The created user object
        
    Raises:
        Exception: If the API request fails
    """
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
    elif response.status_code == 409:
        error_data = response.json()
        raise Exception(f"User creation failed: Email already exists")
    else:
        error_data = response.json()
        raise Exception(f"User creation failed: {error_data['error']['message']}")

# Example usage
try:
    user = create_user(
        api_key='YOUR_API_KEY',
        name='Alex Johnson',
        email='alex.johnson@example.com',
        role='member'
    )
    
    print(f"User created successfully:")
    print(f"ID: {user['id']}")
    print(f"Name: {user['name']}")
    print(f"Email: {user['email']}")
    print(f"Role: {user['role']}")
    
except Exception as e:
    print(f"Error: {e}")
```

### cURL

```bash
curl -X POST "https://api.taskmanagement.example.com/v1/users" \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "John Doe",
    "email": "john.doe@example.com",
    "role": "manager"
  }'
```

## Related Resources

- [User Resource](/resources/user-resource.md) - Detailed information about the User resource
- [Get All Users](/api-reference/get-all-users.md) - Retrieve a list of all users
- [Get User by ID](/api-reference/get-user-by-id.md) - Retrieve a specific user by ID

## See Also

- [Data Model](/core-concepts/data-model.md) - Overview of the core resources and their relationships
- [Authentication](/getting-started/authentication.md) - How to authenticate your API requests
- [Getting Started with Users](/tutorials/getting-started-with-users.md) - Guide to working with users

--- FILE: api-reference/get-user-by-id.md
---
title: "Get user by ID"
description: "API endpoint to retrieve a specific user by their unique identifier."
tags: ["users", "endpoint", "GET"]
categories: ["api-reference"]
importance: 7
api_endpoints: ["/users/{userId}"]
related_pages: ["user-resource"]
parent: "api-reference"
hasChildren: false
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "2025-05-13"
navOrder: "4"
layout: "default"
version: "v1.0.0"
lastUpdated: "2025-05-13"
---

# Get User by ID

## Endpoint

```
GET /users/{userId}
```

This endpoint retrieves a specific user by their unique identifier.

## Path Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `userId` | String | Unique identifier of the user to retrieve |

## Request Example

```http
GET /users/user123
Authorization: Bearer YOUR_API_KEY
```

## Response

### Success Response (200 OK)

```json
{
  "id": "user123",
  "name": "John Doe",
  "email": "john.doe@example.com",
  "role": "manager",
  "createdAt": "2025-04-01T10:00:00Z",
  "updatedAt": "2025-05-10T14:30:00Z"
}
```

### Error Responses

| Status Code | Description |
|-------------|-------------|
| 401 | Unauthorized (missing or invalid authentication) |
| 403 | Forbidden (insufficient permissions to view this user) |
| 404 | Not Found (user with the specified ID does not exist) |

#### Example Error Response (404 Not Found)

```json
{
  "error": {
    "code": "resource_not_found",
    "message": "User with ID 'user123' not found"
  }
}
```

For details on error responses, see [Error Responses](/api-reference/error-responses.md).

## Authentication

This endpoint requires authentication using a bearer token. Include your API key in the `Authorization` header:

```
Authorization: Bearer YOUR_API_KEY
```

The authenticated user must have appropriate permissions to view the requested user:
- `admin` users can view any user
- `manager` users can view all users except admins
- `member` users can only view their own user information

## Important Considerations

- **User ID Format**: User IDs are auto-generated strings assigned by the system when the user is created.

- **Permission Restrictions**: If a user attempts to access a user they don't have permission to view, a `403 Forbidden` error will be returned rather than a `404 Not Found`, for security reasons.

- **Data Sensitivity**: User information may contain sensitive data. Ensure appropriate access controls are in place in your application.

## Best Practices

- Cache user data when appropriate to reduce API calls, particularly for frequently accessed users.

- Handle 404 errors gracefully in your application, providing a user-friendly message when a user is not found.

- Verify that the returned user is the one you intended to retrieve by checking the email or other properties.

- Use the returned user ID in subsequent API calls involving this user, such as assigning tasks.

## Code Examples

### JavaScript

```javascript
async function getUserById(userId) {
  try {
    const response = await fetch(`https://api.taskmanagement.example.com/v1/users/${userId}`, {
      headers: {
        'Authorization': `Bearer ${API_KEY}`
      }
    });
    
    if (response.status === 404) {
      console.warn(`User with ID ${userId} not found`);
      return null;
    }
    
    if (!response.ok) {
      const errorData = await response.json();
      throw new Error(`Error retrieving user: ${errorData.error.message}`);
    }
    
    return await response.json();
  } catch (error) {
    console.error(`Failed to get user ${userId}:`, error);
    throw error;
  }
}

// Example usage
try {
  const user = await getUserById('user123');
  
  if (user) {
    console.log(`User found: ${user.name} (${user.email})`);
    
    // Use the user data for something
    if (user.role === 'manager') {
      // Perform manager-specific operations
    }
  } else {
    console.log('User not found');
  }
} catch (error) {
  console.error('Error fetching user:', error);
}
```

### Python

```python
import requests

def get_user_by_id(api_key, user_id):
    """
    Retrieve a specific user by their ID.
    
    Args:
        api_key (str): API key for authentication
        user_id (str): The unique identifier of the user
    
    Returns:
        dict: User data if found, None if not found
        
    Raises:
        Exception: For API errors other than 404 Not Found
    """
    url = f'https://api.taskmanagement.example.com/v1/users/{user_id}'
    headers = {
        'Authorization': f'Bearer {api_key}'
    }
    
    response = requests.get(url, headers=headers)
    
    if response.status_code == 200:
        return response.json()
    elif response.status_code == 404:
        print(f"User with ID {user_id} not found")
        return None
    elif response.status_code == 403:
        print(f"You don't have permission to view this user")
        return None
    else:
        error_data = response.json()
        raise Exception(f"API error: {error_data['error']['message']}")

# Example usage
try:
    user = get_user_by_id('YOUR_API_KEY', 'user123')
    
    if user:
        print(f"User: {user['name']}")
        print(f"Email: {user['email']}")
        print(f"Role: {user['role']}")
        
        # Use the user information
        if user['role'] == 'admin':
            print("This user has administrative privileges")
    else:
        print("User could not be retrieved")
        
except Exception as e:
    print(f"Error: {e}")
```

### cURL

```bash
curl -X GET "https://api.taskmanagement.example.com/v1/users/user123" \
  -H "Authorization: Bearer YOUR_API_KEY"
```

## Related Resources

- [User Resource](/resources/user-resource.md) - Detailed information about the User resource
- [Get All Users](/api-reference/get-all-users.md) - Retrieve a list of all users
- [Update a User](/api-reference/update-user.md) - Update an existing user's information
- [Delete a User](/api-reference/delete-user.md) - Remove a user from the system

## See Also

- [Data Model](/core-concepts/data-model.md) - Overview of the core resources and their relationships
- [Authentication](/getting-started/authentication.md) - How to authenticate your API requests
- [Getting Started with Users](/tutorials/getting-started-with-users.md) - Guide to working with users

--- FILE: api-reference/update-user.md
---
title: "Update a user"
description: "API endpoint to update an existing user's information."
tags: ["users", "endpoint", "PATCH"]
categories: ["api-reference"]
importance: 7
api_endpoints: ["/users/{userId}"]
related_pages: ["user-resource"]
parent: "api-reference"
hasChildren: false
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "2025-05-13"
navOrder: "5"
layout: "default"
version: "v1.0.0"
lastUpdated: "2025-05-13"
---

# Update a User

## Endpoint

```
PATCH /users/{userId}
```

This endpoint updates an existing user's information. You can update one or more properties of the user resource.

## Path Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `userId` | String | Unique identifier of the user to update |

## Request Body

The request body should be a JSON object containing the properties you want to update. You can include one or more of the following properties:

| Property | Type | Description |
|----------|------|-------------|
| `name` | String | Full name of the user |
| `email` | String | Email address of the user (must be unique) |
| `role` | String | Role of the user: "admin", "manager", or "member" |

### Example Request Body

```json
{
  "name": "John Smith",
  "role": "admin"
}
```

## Request Example

```http
PATCH /users/user123
Content-Type: application/json
Authorization: Bearer YOUR_API_KEY

{
  "name": "John Smith",
  "role": "admin"
}
```

## Response

### Success Response (200 OK)

```json
{
  "id": "user123",
  "name": "John Smith",
  "email": "john.doe@example.com",
  "role": "admin",
  "createdAt": "2025-04-01T10:00:00Z",
  "updatedAt": "2025-05-13T15:30:00Z"
}
```

### Error Responses

| Status Code | Description |
|-------------|-------------|
| 400 | Bad request (e.g., malformed request body) |
| 401 | Unauthorized (missing or invalid authentication) |
| 403 | Forbidden (insufficient permissions to update this user) |
| 404 | Not Found (user with the specified ID does not exist) |
| 409 | Conflict (e.g., email already exists) |
| 422 | Unprocessable entity (e.g., validation errors) |

#### Example Error Response (409 Conflict)

```json
{
  "error": {
    "code": "resource_conflict",
    "message": "Email address is already in use by another user"
  }
}
```

For details on error responses, see [Error Responses](/api-reference/error-responses.md).

## Authentication

This endpoint requires authentication using a bearer token. Include your API key in the `Authorization` header:

```
Authorization: Bearer YOUR_API_KEY
```

The authenticated user must have appropriate permissions to update the requested user:
- `admin` users can update any user, including changing roles
- `manager` users can update users with "member" role but cannot change roles to "admin"
- `member` users can only update their own information and cannot change their role

## Important Considerations

- **Partial Updates**: This endpoint supports partial updates. You only need to include the properties you want to change in the request body.

- **Email Uniqueness**: If you update the email address, it must be unique across all users. Attempting to use an email that's already associated with another user will result in a `409 Conflict` error.

- **Role Restrictions**: There are restrictions on who can change roles:
  - Only admins can promote users to the "admin" role
  - Managers can promote members to "manager" but cannot promote to "admin"
  - Users cannot change their own role

- **Read-Only Fields**: The `id`, `createdAt`, and `updatedAt` fields are read-only and cannot be updated. If included in the request, they will be ignored.

- **No Response Body for Empty Updates**: If the request body is empty or contains only read-only fields, the response will be a `204 No Content` status with no response body.

## Best Practices

- Only include the fields you want to update in the request body
- Validate email formats client-side before making the API request
- Handle email conflict errors gracefully in your application
- Implement proper authorization checks in your application before attempting role changes
- Consider the impact of role changes on user permissions and access

## Code Examples

### JavaScript

```javascript
async function updateUser(userId, updates) {
  try {
    const response = await fetch(`https://api.taskmanagement.example.com/v1/users/${userId}`, {
      method: 'PATCH',
      headers: {
        'Authorization': `Bearer ${API_KEY}`,
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(updates)
    });
    
    if (response.status === 204) {
      // No content response (empty update)
      return null;
    }
    
    if (!response.ok) {
      const errorData = await response.json();
      throw new Error(`Failed to update user: ${errorData.error.message}`);
    }
    
    return await response.json();
  } catch (error) {
    console.error(`Error updating user ${userId}:`, error);
    throw error;
  }
}

// Example usage
try {
  const updatedUser = await updateUser('user123', {
    name: 'John Smith',
    role: 'manager'
  });
  
  if (updatedUser) {
    console.log(`User updated: ${updatedUser.name} (${updatedUser.role})`);
  } else {
    console.log('User update returned no content');
  }
} catch (error) {
  if (error.message.includes('already in use')) {
    console.error('Email address is already taken by another user');
  } else if (error.message.includes('permission')) {
    console.error('You do not have permission to perform this update');
  } else {
    console.error('Failed to update user:', error);
  }
}
```

### Python

```python
import requests

def update_user(api_key, user_id, **updates):
    """
    Update an existing user's information.
    
    Args:
        api_key (str): API key for authentication
        user_id (str): The unique identifier of the user to update
        **updates: Keyword arguments for fields to update (name, email, role)
    
    Returns:
        dict: Updated user data if successful, None for empty updates
        
    Raises:
        Exception: If the API request fails
    """
    url = f'https://api.taskmanagement.example.com/v1/users/{user_id}'
    headers = {
        'Authorization': f'Bearer {api_key}',
        'Content-Type': 'application/json'
    }
    
    # Filter out None values
    update_data = {k: v for k, v in updates.items() if v is not None}
    
    if not update_data:
        return None  # No updates to make
    
    response = requests.patch(url, json=update_data, headers=headers)
    
    if response.status_code == 204:
        # No content response (empty update was accepted)
        return None
    elif response.status_code == 200:
        return response.json()
    elif response.status_code == 404:
        raise Exception(f"User with ID {user_id} not found")
    elif response.status_code == 409:
        raise Exception("Email address is already in use by another user")
    elif response.status_code == 403:
        raise Exception("You don't have permission to update this user")
    else:
        error_data = response.json()
        raise Exception(f"API error: {error_data['error']['message']}")

# Example usage
try:
    # Update just the name
    updated_user = update_user(
        api_key='YOUR_API_KEY',
        user_id='user123',
        name='Jane Wilson'
    )
    
    if updated_user:
        print(f"User updated successfully:")
        print(f"Name: {updated_user['name']}")
        print(f"Email: {updated_user['email']}")
        print(f"Role: {updated_user['role']}")
    else:
        print("No updates were made or no content was returned")
        
except Exception as e:
    print(f"Error updating user: {e}")
```

### cURL

```bash
# Update name and role
curl -X PATCH "https://api.taskmanagement.example.com/v1/users/user123" \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "John Smith",
    "role": "admin"
  }'

# Update just the email
curl -X PATCH "https://api.taskmanagement.example.com/v1/users/user123" \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "email": "john.smith@example.com"
  }'
```

## Related Resources

- [User Resource](/resources/user-resource.md) - Detailed information about the User resource
- [Get All Users](/api-reference/get-all-users.md) - Retrieve a list of all users
- [Get User by ID](/api-reference/get-user-by-id.md) - Retrieve a specific user by ID
- [Delete a User](/api-reference/delete-user.md) - Remove a user from the system

## See Also

- [Data Model](/core-concepts/data-model.md) - Overview of the core resources and their relationships
- [Authentication](/getting-started/authentication.md) - How to authenticate your API requests
- [Getting Started with Users](/tutorials/getting-started-with-users.md) - Guide to working with users

--- FILE: api-reference/delete-user.md
---
title: "Delete a user"
description: "API endpoint to remove a user from the system."
tags: ["users", "endpoint", "DELETE"]
categories: ["api-reference"]
importance: 7
api_endpoints: ["/users/{userId}"]
related_pages: ["user-resource"]
parent: "api-reference"
hasChildren: false
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "2025-05-13"
navOrder: "6"
layout: "default"
version: "v1.0.0"
lastUpdated: "2025-05-13"
---

# Delete a User

## Endpoint

```
DELETE /users/{userId}
```

This endpoint deletes a specific user from the system. Once deleted, the user can no longer log in, be assigned tasks, or be referenced in new API calls.

## Path Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `userId` | String | Unique identifier of the user to delete |

## Request Example

```http
DELETE /users/user123
Authorization: Bearer YOUR_API_KEY
```

## Response

### Success Response (204 No Content)

A successful deletion returns a `204 No Content` status code with no response body, indicating that the user has been successfully deleted.

### Error Responses

| Status Code | Description |
|-------------|-------------|
| 401 | Unauthorized (missing or invalid authentication) |
| 403 | Forbidden (insufficient permissions to delete this user) |
| 404 | Not Found (user with the specified ID does not exist) |
| 409 | Conflict (e.g., user has assigned tasks) |

#### Example Error Response (409 Conflict)

```json
{
  "error": {
    "code": "resource_conflict",
    "message": "Cannot delete user with assigned tasks",
    "details": {
      "assignedTaskCount": 5
    }
  }
}
```

For details on error responses, see [Error Responses](/api-reference/error-responses.md).

## Authentication

This endpoint requires authentication using a bearer token. Include your API key in the `Authorization` header:

```
Authorization: Bearer YOUR_API_KEY
```

The authenticated user must have appropriate permissions to delete the requested user:
- `admin` users can delete any user except themselves
- `manager` users can delete users with "member" role
- `member` users cannot delete any users

## Important Considerations

- **Permanent Operation**: Deletion is permanent and cannot be undone. Consider deactivating users instead of deleting them if you may need to restore access later.

- **Assigned Tasks**: By default, you cannot delete a user who has assigned tasks. You have two options:
  1. First reassign all tasks to other users
  2. Use the `force=true` query parameter to delete the user and unassign their tasks

- **Created Tasks**: Tasks created by the deleted user will remain in the system, but the `createdBy` field will be set to null.

- **Last Admin**: The system prevents deletion of the last admin user to ensure there's always at least one user with administrative privileges.

## Best Practices

- Before deleting a user, retrieve and reassign any tasks assigned to them
- Confirm the deletion with the user or administrator to prevent accidental data loss
- Consider implementing a "soft delete" in your application by deactivating users instead of deleting them
- Maintain an audit log of user deletions for security and compliance purposes
- Handle deletion errors gracefully in your application UI

## Code Examples

### JavaScript

```javascript
async function deleteUser(userId, forceDelete = false) {
  try {
    const url = forceDelete
      ? `https://api.taskmanagement.example.com/v1/users/${userId}?force=true`
      : `https://api.taskmanagement.example.com/v1/users/${userId}`;
    
    const response = await fetch(url, {
      method: 'DELETE',
      headers: {
        'Authorization': `Bearer ${API_KEY}`
      }
    });
    
    if (response.status === 204) {
      return true; // Successful deletion
    }
    
    if (response.status === 409) {
      // Conflict - user has assigned tasks
      const errorData = await response.json();
      const taskCount = errorData.error.details?.assignedTaskCount || 'unknown';
      throw new Error(`User has ${taskCount} assigned tasks. Use forceDelete=true to delete anyway.`);
    }
    
    if (!response.ok) {
      const errorData = await response.json();
      throw new Error(`Failed to delete user: ${errorData.error.message}`);
    }
    
    return false; // Should not reach here if properly handled above
  } catch (error) {
    console.error(`Error deleting user ${userId}:`, error);
    throw error;
  }
}

// Example usage
try {
  // Try to delete without force first
  await deleteUser('user123');
  console.log('User successfully deleted');
} catch (error) {
  if (error.message.includes('assigned tasks')) {
    console.warn(error.message);
    
    // Ask for confirmation before force deletion
    const confirmForce = confirm('User has assigned tasks. Delete anyway and unassign tasks?');
    
    if (confirmForce) {
      try {
        await deleteUser('user123', true);
        console.log('User successfully deleted with force option');
      } catch (forceError) {
        console.error('Force deletion failed:', forceError);
      }
    }
  } else {
    console.error('Failed to delete user:', error);
  }
}
```

### Python

```python
import requests

def delete_user(api_key, user_id, force=False):
    """
    Delete a user from the system.
    
    Args:
        api_key (str): API key for authentication
        user_id (str): The unique identifier of the user to delete
        force (bool, optional): Whether to force deletion even if user has assigned tasks. Defaults to False.
    
    Returns:
        bool: True if user was successfully deleted
        
    Raises:
        Exception: If the API request fails
    """
    url = f'https://api.taskmanagement.example.com/v1/users/{user_id}'
    
    if force:
        url += '?force=true'
        
    headers = {
        'Authorization': f'Bearer {api_key}'
    }
    
    response = requests.delete(url, headers=headers)
    
    if response.status_code == 204:
        return True
    elif response.status_code == 409:
        error_data = response.json()
        task_count = error_data['error']['details'].get('assignedTaskCount', 'unknown')
        raise Exception(f"User has {task_count} assigned tasks. Set force=True to delete anyway.")
    elif response.status_code == 404:
        raise Exception(f"User with ID {user_id} not found")
    elif response.status_code == 403:
        raise Exception("You don't have permission to delete this user")
    else:
        error_data = response.json()
        raise Exception(f"API error: {error_data['error']['message']}")

# Example usage
try:
    # First try without force
    success = delete_user('YOUR_API_KEY', 'user123')
    
    if success:
        print("User successfully deleted")
        
except Exception as e:
    if "assigned tasks" in str(e):
        print(str(e))
        
        # Ask for confirmation
        force_delete = input("User has assigned tasks. Type 'yes' to delete anyway: ")
        
        if force_delete.lower() == 'yes':
            try:
                success = delete_user('YOUR_API_KEY', 'user123', force=True)
                print("User successfully deleted with force option")
            except Exception as force_error:
                print(f"Force deletion failed: {force_error}")
    else:
        print(f"Error deleting user: {e}")
```

### cURL

```bash
# Delete a user
curl -X DELETE "https://api.taskmanagement.example.com/v1/users/user123" \
  -H "Authorization: Bearer YOUR_API_KEY"

# Force delete a user with assigned tasks
curl -X DELETE "https://api.taskmanagement.example.com/v1/users/user123?force=true" \
  -H "Authorization: Bearer YOUR_API_KEY"
```

## Related Resources

- [User Resource](/resources/user-resource.md) - Detailed information about the User resource
- [Get All Users](/api-reference/get-all-users.md) - Retrieve a list of all users
- [Create a User](/api-reference/create-user.md) - Create a new user
- [Get User by ID](/api-reference/get-user-by-id.md) - Retrieve a specific user by ID

## See Also

- [Data Model](/core-concepts/data-model.md) - Overview of the core resources and their relationships
- [Update a Task](/api-reference/update-task.md) - Reassign tasks to another user
- [Getting Started with Users](/tutorials/getting-started-with-users.md) - Guide to working with users

--- FILE: api-reference/get-all-tasks.md
---
title: "Get all tasks"
description: "API endpoint to retrieve a list of all tasks with pagination, sorting, and filtering options."
tags: ["tasks", "endpoint", "GET"]
categories: ["api-reference"]
importance: 7
api_endpoints: ["/tasks"]
related_pages: ["task-resource", "pagination", "sorting", "task-status-lifecycle"]
parent: "api-reference"
hasChildren: false
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "2025-05-13"
navOrder: "7"
layout: "default"
version: "v1.0.0"
lastUpdated: "2025-05-13"
---

# Get All Tasks

## Endpoint

```
GET /tasks
```

This endpoint retrieves a paginated list of tasks. It supports comprehensive filtering, sorting, and pagination options to help you find specific tasks or navigate through large task collections.

## Request Parameters

The following query parameters can be used to filter, sort, and paginate the results:

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `limit` | Integer | 10 | Number of items to return per page (max: 100) |
| `offset` | Integer | 0 | Number of items to skip before starting to collect the result set |
| `sort` | String | `-createdAt` | Field to sort by, optionally prefixed with `+` (ascending) or `-` (descending) |
| `status` | String | - | Filter by task status (comma-separated for multiple values) |
| `priority` | String | - | Filter by task priority (comma-separated for multiple values) |
| `assigneeId` | String | - | Filter by assigned user ID |
| `createdBy` | String | - | Filter by creator user ID |
| `tags` | String | - | Filter by tags (comma-separated for multiple values) |
| `dueDate[gt]` | String | - | Filter tasks due after this date (ISO format) |
| `dueDate[lt]` | String | - | Filter tasks due before this date (ISO format) |
| `dueDate[exists]` | Boolean | - | Filter tasks that have (true) or don't have (false) a due date |
| `search` | String | - | Search in task title and description (minimum 3 characters) |

## Request Example

### Basic Request

```http
GET /tasks
Authorization: Bearer YOUR_API_KEY
```

### Request with Pagination and Sorting

```http
GET /tasks?limit=5&offset=10&sort=-dueDate
Authorization: Bearer YOUR_API_KEY
```

This request will:
- Return up to 5 tasks per page
- Skip the first 10 tasks
- Sort the results by due date in descending order (tasks due sooner appear first)

### Request with Filtering

```http
GET /tasks?status=TODO,IN_PROGRESS&priority=HIGH,URGENT&assigneeId=user123&dueDate[lt]=2025-06-01T00:00:00Z
Authorization: Bearer YOUR_API_KEY
```

This request will return tasks:
- With status "TODO" or "IN_PROGRESS"
- With priority "HIGH" or "URGENT"
- Assigned to user with ID "user123"
- Due before June 1, 2025

## Response

### Success Response (200 OK)

```json
{
  "data": [
    {
      "id": "task123",
      "title": "Implement authentication",
      "description": "Add token-based authentication to the application",
      "status": "IN_PROGRESS",
      "priority": "HIGH",
      "createdBy": "user456",
      "assigneeId": "user123",
      "dueDate": "2025-05-20T17:00:00Z",
      "tags": ["authentication", "security"],
      "createdAt": "2025-05-01T10:30:00Z",
      "updatedAt": "2025-05-13T14:25:00Z"
    },
    {
      "id": "task456",
      "title": "Design user interface",
      "description": "Create wireframes for the new dashboard",
      "status": "TODO",
      "priority": "MEDIUM",
      "createdBy": "user789",
      "assigneeId": "user123",
      "dueDate": "2025-05-25T17:00:00Z",
      "tags": ["design", "ui"],
      "createdAt": "2025-05-05T09:15:00Z",
      "updatedAt": "2025-05-05T09:15:00Z"
    },
    // More tasks...
  ],
  "pagination": {
    "total": 42,    // Total number of tasks matching the filter
    "limit": 5,     // Number of tasks per page
    "offset": 10,   // Current offset
    "hasMore": true // Whether there are more tasks to fetch
  }
}
```

### Error Responses

| Status Code | Description |
|-------------|-------------|
| 400 | Bad request (e.g., invalid parameters) |
| 401 | Unauthorized (missing or invalid authentication) |
| 403 | Forbidden (insufficient permissions) |

For details on error responses, see [Error Responses](/api-reference/error-responses.md).

## Authentication

This endpoint requires authentication using a bearer token. Include your API key in the `Authorization` header:

```
Authorization: Bearer YOUR_API_KEY
```

The authenticated user's role affects which tasks they can view:
- `admin` users can see all tasks
- `manager` users can see all tasks
- `member` users can only see tasks they created or are assigned to

## Important Considerations

- **Task Visibility**: By default, users only see tasks they have access to based on their role. There is no need to filter by `createdBy` or `assigneeId` for member users as they will only see their own tasks.

- **Date Filtering**: When filtering by dates, use the ISO 8601 format (YYYY-MM-DDTHH:MM:SSZ). You can use `dueDate[gt]` and `dueDate[lt]` together to find tasks due within a specific range.

- **Status Values**: Valid status values are "TODO", "IN_PROGRESS", "REVIEW", "DONE", and "CANCELED".

- **Priority Values**: Valid priority values are "LOW", "MEDIUM", "HIGH", and "URGENT".

- **Performance**: For large task collections, use appropriate filtering to limit the result set. Using specific filters improves API performance.

## Best Practices

- **Use Pagination**: Always implement pagination for task lists to handle large numbers of tasks efficiently.

- **Filter Appropriately**: Apply relevant filters to get only the tasks you need. This reduces response size and improves performance.

- **Combine Filters**: For complex queries, combine multiple filters (e.g., status + priority + assignee).

- **Status Grouping**: For typical task views, group statuses logically:
  - Active tasks: `status=TODO,IN_PROGRESS,REVIEW`
  - Completed tasks: `status=DONE`
  - Archived tasks: `status=CANCELED`

- **Due Date Handling**: To find overdue tasks, use `dueDate[lt]=` with the current date and filter for non-completed statuses.

## Code Examples

### JavaScript

```javascript
async function getTasks(filters = {}, pagination = {}, sort = '-dueDate') {
  // Build query parameters
  const queryParams = new URLSearchParams();
  
  // Add pagination parameters
  if (pagination.limit) queryParams.append('limit', pagination.limit);
  if (pagination.offset) queryParams.append('offset', pagination.offset);
  
  // Add sort parameter
  queryParams.append('sort', sort);
  
  // Add filter parameters
  for (const [key, value] of Object.entries(filters)) {
    if (Array.isArray(value)) {
      queryParams.append(key, value.join(','));
    } else if (value !== null && value !== undefined) {
      queryParams.append(key, value);
    }
  }
  
  try {
    const response = await fetch(`https://api.taskmanagement.example.com/v1/tasks?${queryParams}`, {
      headers: {
        'Authorization': `Bearer ${API_KEY}`
      }
    });
    
    if (!response.ok) {
      const errorData = await response.json();
      throw new Error(`Error fetching tasks: ${errorData.error.message}`);
    }
    
    return await response.json();
  } catch (error) {
    console.error('Failed to fetch tasks:', error);
    throw error;
  }
}

// Example usage: Get high priority tasks due soon
const today = new Date();
const nextWeek = new Date(today);
nextWeek.setDate(today.getDate() + 7);

try {
  const result = await getTasks({
    status: ['TODO', 'IN_PROGRESS'],
    priority: ['HIGH', 'URGENT'],
    'dueDate[gt]': today.toISOString(),
    'dueDate[lt]': nextWeek.toISOString()
  }, {
    limit: 10,
    offset: 0
  }, '-priority');
  
  console.log(`Found ${result.pagination.total} high priority tasks due in the next week`);
  result.data.forEach(task => {
    console.log(`${task.title} (${task.priority}) - Due: ${new Date(task.dueDate).toLocaleDateString()}`);
  });
} catch (error) {
  console.error('Error:', error);
}
```

### Python

```python
import requests
from datetime import datetime, timedelta

def get_tasks(api_key, filters=None, pagination=None, sort='-dueDate'):
    """
    Retrieve a list of tasks with optional filtering, sorting, and pagination.
    
    Args:
        api_key (str): API key for authentication
        filters (dict, optional): Filters to apply
        pagination (dict, optional): Pagination parameters (limit, offset)
        sort (str, optional): Field to sort by
    
    Returns:
        dict: Response containing tasks and pagination info
    """
    url = 'https://api.taskmanagement.example.com/v1/tasks'
    
    # Build query parameters
    params = {}
    
    # Add pagination parameters
    if pagination:
        params.update(pagination)
    
    # Add sort parameter
    params['sort'] = sort
    
    # Add filter parameters
    if filters:
        for key, value in filters.items():
            if isinstance(value, list):
                params[key] = ','.join(value)
            elif value is not None:
                params[key] = value
    
    response = requests.get(
        url,
        params=params,
        headers={
            'Authorization': f'Bearer {api_key}'
        }
    )
    
    if response.status_code != 200:
        error_data = response.json()
        raise Exception(f"Error fetching tasks: {error_data['error']['message']}")
    
    return response.json()

# Example usage: Get tasks assigned to a specific user that are due this month
try:
    # Calculate date range for this month
    today = datetime.now()
    start_of_month = datetime(today.year, today.month, 1).isoformat()
    next_month = today.replace(day=28) + timedelta(days=4)
    end_of_month = next_month.replace(day=1) - timedelta(days=1)
    end_of_month = end_of_month.replace(hour=23, minute=59, second=59).isoformat()
    
    result = get_tasks(
        api_key='YOUR_API_KEY',
        filters={
            'assigneeId': 'user123',
            'status': ['TODO', 'IN_PROGRESS', 'REVIEW'],
            'dueDate[gt]': start_of_month,
            'dueDate[lt]': end_of_month
        },
        pagination={
            'limit': 20,
            'offset': 0
        },
        sort='dueDate'  # Ascending by due date (earliest first)
    )
    
    print(f"Found {result['pagination']['total']} tasks due this month")
    
    for task in result['data']:
        due_date = datetime.fromisoformat(task['dueDate'].replace('Z', '+00:00'))
        print(f"{task['title']} ({task['status']}) - Due: {due_date.strftime('%Y-%m-%d')}")
        
except Exception as e:
    print(f"Failed to retrieve tasks: {e}")
```

### cURL

```bash
# Basic request to get all tasks (first page)
curl -X GET "https://api.taskmanagement.example.com/v1/tasks" \
  -H "Authorization: Bearer YOUR_API_KEY"

# Request with pagination, sorting, and filtering
curl -X GET "https://api.taskmanagement.example.com/v1/tasks?limit=5&offset=0&sort=-priority&status=TODO,IN_PROGRESS&assigneeId=user123&dueDate[lt]=2025-06-01T00:00:00Z" \
  -H "Authorization: Bearer YOUR_API_KEY"
```

## Related Resources

- [Task Resource](/resources/task-resource.md) - Detailed information about the Task resource
- [Create a Task](/api-reference/create-task.md) - Create a new task
- [Get Task by ID](/api-reference/get-task-by-id.md) - Retrieve a specific task by ID

## See Also

- [Pagination](/core-concepts/pagination.md) - How to navigate through large collections of resources
- [Sorting](/core-concepts/sorting.md) - How to sort API results using sort parameters
- [Task Status Lifecycle](/core-concepts/task-status-lifecycle.md) - Understanding task statuses and transitions

--- FILE: api-reference/create-task.md
---
title: "Create a task"
description: "API endpoint to create a new task in the system."
tags: ["tasks", "endpoint", "POST"]
categories: ["api-reference"]
importance: 7
api_endpoints: ["/tasks"]
related_pages: ["task-resource", "task-status-lifecycle"]
parent: "api-reference"
hasChildren: false
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "2025-05-13"
navOrder: "8"
layout: "default"
version: "v1.0.0"
lastUpdated: "2025-05-13"
---

# Create a Task

## Endpoint

```
POST /tasks
```

This endpoint creates a new task in the system. The task can include a title, description, priority, assignment to a user, due date, and other properties.

## Path Parameters

None.

## Request Body

The request body should be a JSON object with the following properties:

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `title` | String | Yes | Title of the task |
| `description` | String | No | Detailed description of the task |
| `status` | String | No | Initial status of the task (default: "TODO") |
| `priority` | String | No | Priority level: "LOW", "MEDIUM", "HIGH", "URGENT" (default: "MEDIUM") |
| `assigneeId` | String | No | ID of the user assigned to the task |
| `dueDate` | String | No | When the task is due (ISO 8601 format) |
| `warningOffset` | Number | No | Hours before due date to send a reminder |
| `tags` | Array | No | Array of string tags associated with the task |

### Example Request Body

```json
{
  "title": "Implement authentication",
  "description": "Add token-based authentication to the application",
  "status": "TODO",
  "priority": "HIGH",
  "assigneeId": "user123",
  "dueDate": "2025-06-01T17:00:00Z",
  "warningOffset": 24,
  "tags": ["authentication", "security", "api"]
}
```

## Request Example

```http
POST /tasks
Content-Type: application/json
Authorization: Bearer YOUR_API_KEY

{
  "title": "Implement authentication",
  "description": "Add token-based authentication to the application",
  "status": "TODO",
  "priority": "HIGH",
  "assigneeId": "user123",
  "dueDate": "2025-06-01T17:00:00Z",
  "warningOffset": 24,
  "tags": ["authentication", "security", "api"]
}
```

## Response

### Success Response (201 Created)

```json
{
  "id": "task789",
  "title": "Implement authentication",
  "description": "Add token-based authentication to the application",
  "status": "TODO",
  "priority": "HIGH",
  "createdBy": "user456",
  "assigneeId": "user123",
  "dueDate": "2025-06-01T17:00:00Z",
  "warningOffset": 24,
  "tags": ["authentication", "security", "api"],
  "createdAt": "2025-05-13T15:30:00Z",
  "updatedAt": "2025-05-13T15:30:00Z"
}
```

### Error Responses

| Status Code | Description |
|-------------|-------------|
| 400 | Bad request (e.g., malformed request body) |
| 401 | Unauthorized (missing or invalid authentication) |
| 403 | Forbidden (insufficient permissions to create tasks) |
| 404 | Not Found (e.g., referenced assignee does not exist) |
| 422 | Unprocessable entity (e.g., validation errors) |

#### Example Error Response

```json
{
  "error": {
    "code": "validation_error",
    "message": "The request contains invalid data",
    "details": {
      "title": "Title is required",
      "dueDate": "Due date must be in the future",
      "assigneeId": "Assignee with ID 'user123' does not exist"
    }
  }
}
```

For details on error responses, see [Error Responses](/api-reference/error-responses.md).

## Authentication

This endpoint requires authentication using a bearer token. Include your API key in the `Authorization` header:

```
Authorization: Bearer YOUR_API_KEY
```

All authenticated users can create tasks, but there may be restrictions on certain fields:
- Only `admin` and `manager` users can assign tasks to any user
- `member` users can only assign tasks to themselves

## Important Considerations

- **Auto-Generated Fields**: The `id`, `createdBy`, `createdAt`, and `updatedAt` fields are automatically generated and cannot be specified in the request.

- **CreatedBy Field**: The `createdBy` field is automatically set to the ID of the authenticated user who creates the task.

- **Status Restrictions**: If `status` is specified, it must be a valid task status. If omitted, "TODO" is used as the default initial status.

- **Priority Levels**: Valid priority values are "LOW", "MEDIUM", "HIGH", and "URGENT". If omitted, "MEDIUM" is used as the default.

- **Date Format**: The `dueDate` must be specified in ISO 8601 format (YYYY-MM-DDTHH:MM:SSZ) and should be in the future.

- **Warning Offset**: If `warningOffset` is specified, it defines the number of hours before the due date when a reminder should be sent. This requires a valid `dueDate` to be set.

- **Tags Limitations**: Each tag must be a string. The maximum number of tags per task is 10, and each tag can be at most 50 characters long.

## Best Practices

- Provide clear, descriptive titles and detailed descriptions to make tasks easy to understand
- Set appropriate priority levels to help team members prioritize their work
- Assign due dates that allow sufficient time for task completion
- Use consistent tags to categorize and filter tasks effectively
- Consider setting warning offsets for important tasks to provide timely reminders
- Validate input client-side before sending to reduce validation errors

## Code Examples

### JavaScript

```javascript
async function createTask(taskData) {
  try {
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
  } catch (error) {
    console.error('Error creating task:', error);
    throw error;
  }
}

// Example usage
try {
  // Set the due date to 2 weeks from now
  const dueDate = new Date();
  dueDate.setDate(dueDate.getDate() + 14);
  
  const newTask = await createTask({
    title: 'Create API documentation',
    description: 'Write comprehensive API documentation for developers',
    priority: 'HIGH',
    assigneeId: 'user123',
    dueDate: dueDate.toISOString(),
    warningOffset: 24, // Reminder 24 hours before due date
    tags: ['documentation', 'api']
  });
  
  console.log(`Task created with ID: ${newTask.id}`);
  console.log(`Due date: ${new Date(newTask.dueDate).toLocaleDateString()}`);
} catch (error) {
  // Handle validation errors specifically
  if (error.message.includes('validation_error')) {
    console.error('Please correct the following errors:');
    // Extract and display specific validation errors
    const errorDetails = JSON.parse(error.message.split(': ')[1]);
    Object.entries(errorDetails).forEach(([field, message]) => {
      console.error(`- ${field}: ${message}`);
    });
  } else {
    console.error('Failed to create task:', error);
  }
}
```

### Python

```python
import requests
from datetime import datetime, timedelta

def create_task(api_key, title, description=None, status='TODO', priority='MEDIUM', assignee_id=None, due_date=None, warning_offset=None, tags=None):
    """
    Create a new task in the system.
    
    Args:
        api_key (str): API key for authentication
        title (str): Title of the task
        description (str, optional): Detailed description of the task
        status (str, optional): Initial status of the task. Defaults to 'TODO'.
        priority (str, optional): Priority level. Defaults to 'MEDIUM'.
        assignee_id (str, optional): ID of the user assigned to the task
        due_date (datetime or str, optional): When the task is due
        warning_offset (int, optional): Hours before due date to send a reminder
        tags (list, optional): List of tags associated with the task
        
    Returns:
        dict: Created task object
        
    Raises:
        Exception: If the API request fails
    """
    url = 'https://api.taskmanagement.example.com/v1/tasks'
    headers = {
        'Authorization': f'Bearer {api_key}',
        'Content-Type': 'application/json'
    }
    
    # Build request data
    data = {
        'title': title,
        'status': status,
        'priority': priority
    }
    
    if description:
        data['description'] = description
        
    if assignee_id:
        data['assigneeId'] = assignee_id
        
    if due_date:
        # Convert datetime to ISO string if needed
        if isinstance(due_date, datetime):
            data['dueDate'] = due_date.isoformat()
        else:
            data['dueDate'] = due_date
            
    if warning_offset is not None:
        data['warningOffset'] = warning_offset
        
    if tags:
        data['tags'] = tags
    
    response = requests.post(url, json=data, headers=headers)
    
    if response.status_code == 201:
        return response.json()
    else:
        error_data = response.json()
        
        if response.status_code == 422 and 'details' in error_data['error']:
            error_details = error_data['error']['details']
            raise Exception(f"Validation error: {error_details}")
        else:
            raise Exception(f"Task creation failed: {error_data['error']['message']}")

# Example usage
try:
    # Set due date to 1 week from now
    due_date = datetime.now() + timedelta(days=7)
    
    task = create_task(
        api_key='YOUR_API_KEY',
        title='Prepare quarterly report',
        description='Compile and analyze Q2 2025 financial data',
        priority='HIGH',
        assignee_id='user456',
        due_date=due_date,
        warning_offset=48,  # 2 days before deadline
        tags=['finance', 'reporting', 'quarterly']
    )
    
    print(f"Task created successfully:")
    print(f"ID: {task['id']}")
    print(f"Title: {task['title']}")
    print(f"Assigned to: {task['assigneeId']}")
    print(f"Due date: {task['dueDate']}")
    
except Exception as e:
    print(f"Error: {e}")
```

### cURL

```bash
curl -X POST "https://api.taskmanagement.example.com/v1/tasks" \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "title": "Implement authentication",
    "description": "Add token-based authentication to the application",
    "priority": "HIGH",
    "assigneeId": "user123",
    "dueDate": "2025-06-01T17:00:00Z",
    "tags": ["authentication", "security", "api"]
  }'
```

## Related Resources

- [Task Resource](/resources/task-resource.md) - Detailed information about the Task resource
- [Get All Tasks](/api-reference/get-all-tasks.md) - Retrieve a list of all tasks
- [Get Task by ID](/api-reference/get-task-by-id.md) - Retrieve a specific task by ID

## See Also

- [Task Status Lifecycle](/core-concepts/task-status-lifecycle.md) - Understanding task statuses and transitions
- [Data Model](/core-concepts/data-model.md) - Overview of the core resources and their relationships
- [Task Management Workflow](/tutorials/task-management-workflow.md) - Guide to implementing a task management workflow

--- FILE: api-reference/get-task-by-id.md
---
title: "Get task by ID"
description: "API endpoint to retrieve a specific task by its unique identifier."
tags: ["tasks", "endpoint", "GET"]
categories: ["api-reference"]
importance: 7
api_endpoints: ["/tasks/{taskId}"]
related_pages: ["task-resource"]
parent: "api-reference"
hasChildren: false
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "2025-05-13"
navOrder: "9"
layout: "default"
version: "v1.0.0"
lastUpdated: "2025-05-13"
---

# Get Task by ID

## Endpoint

```
GET /tasks/{taskId}
```

This endpoint retrieves a specific task by its unique identifier.

## Path Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `taskId` | String | Unique identifier of the task to retrieve |

## Request Example

```http
GET /tasks/task123
Authorization: Bearer YOUR_API_KEY
```

## Response

### Success Response (200 OK)

```json
{
  "id": "task123",
  "title": "Implement authentication",
  "description": "Add token-based authentication to the application",
  "status": "IN_PROGRESS",
  "priority": "HIGH",
  "createdBy": "user456",
  "assigneeId": "user789",
  "dueDate": "2025-06-01T17:00:00Z",
  "warningOffset": 24,
  "tags": ["authentication", "security", "api"],
  "createdAt": "2025-05-01T10:30:00Z",
  "updatedAt": "2025-05-13T14:25:00Z"
}
```

### Error Responses

| Status Code | Description |
|-------------|-------------|
| 401 | Unauthorized (missing or invalid authentication) |
| 403 | Forbidden (insufficient permissions to view this task) |
| 404 | Not Found (task with the specified ID does not exist) |

#### Example Error Response (404 Not Found)

```json
{
  "error": {
    "code": "resource_not_found",
    "message": "Task with ID 'task123' not found"
  }
}
```

For details on error responses, see [Error Responses](/api-reference/error-responses.md).

## Authentication

This endpoint requires authentication using a bearer token. Include your API key in the `Authorization` header:

```
Authorization: Bearer YOUR_API_KEY
```

The authenticated user must have appropriate permissions to view the requested task:
- `admin` and `manager` users can view any task
- `member` users can only view tasks they created or are assigned to

## Important Considerations

- **Task ID Format**: Task IDs are auto-generated strings assigned by the system when the task is created.

- **Permission Restrictions**: If a user attempts to access a task they don't have permission to view, a `403 Forbidden` error will be returned rather than a `404 Not Found`, for security reasons.

- **Date Format**: The `dueDate` and timestamp fields (`createdAt`, `updatedAt`) are returned in ISO 8601 format (YYYY-MM-DDTHH:MM:SSZ).

- **Referenced Users**: The `createdBy` and `assigneeId` fields contain user IDs. To get the full user details, you'll need to make additional API calls to the user endpoints.

## Best Practices

- Cache task data when appropriate to reduce API calls, especially for frequently accessed tasks.

- Handle 404 errors gracefully in your application, providing a user-friendly message when a task is not found.

- Use the task information to build detailed task views in your application, showing all relevant properties.

- Check the task's status and due date to highlight tasks that need attention, such as overdue tasks or tasks in specific statuses.

## Code Examples

### JavaScript

```javascript
async function getTaskById(taskId) {
  try {
    const response = await fetch(`https://api.taskmanagement.example.com/v1/tasks/${taskId}`, {
      headers: {
        'Authorization': `Bearer ${API_KEY}`
      }
    });
    
    if (response.status === 404) {
      console.warn(`Task with ID ${taskId} not found`);
      return null;
    }
    
    if (!response.ok) {
      const errorData = await response.json();
      throw new Error(`Error retrieving task: ${errorData.error.message}`);
    }
    
    return await response.json();
  } catch (error) {
    console.error(`Failed to get task ${taskId}:`, error);
    throw error;
  }
}

// Example usage
try {
  const task = await getTaskById('task123');
  
  if (task) {
    console.log(`Task: ${task.title}`);
    console.log(`Status: ${task.status}`);
    console.log(`Priority: ${task.priority}`);
    
    if (task.dueDate) {
      const dueDate = new Date(task.dueDate);
      const now = new Date();
      
      // Check if task is overdue
      if (task.status !== 'DONE' && task.status !== 'CANCELED' && dueDate < now) {
        console.log(`⚠️ OVERDUE by ${Math.floor((now - dueDate) / (1000 * 60 * 60 * 24))} days`);
      } else {
        console.log(`Due: ${dueDate.toLocaleDateString()}`);
      }
    }
    
    if (task.tags && task.tags.length > 0) {
      console.log(`Tags: ${task.tags.join(', ')}`);
    }
  } else {
    console.log('Task not found');
  }
} catch (error) {
  console.error('Error fetching task:', error);
}
```

### Python

```python
import requests
from datetime import datetime

def get_task_by_id(api_key, task_id):
    """
    Retrieve a specific task by its ID.
    
    Args:
        api_key (str): API key for authentication
        task_id (str): The unique identifier of the task
    
    Returns:
        dict: Task data if found, None if not found
        
    Raises:
        Exception: For API errors other than 404 Not Found
    """
    url = f'https://api.taskmanagement.example.com/v1/tasks/{task_id}'
    headers = {
        'Authorization': f'Bearer {api_key}'
    }
    
    response = requests.get(url, headers=headers)
    
    if response.status_code == 200:
        return response.json()
    elif response.status_code == 404:
        print(f"Task with ID {task_id} not found")
        return None
    elif response.status_code == 403:
        print(f"You don't have permission to view this task")
        return None
    else:
        error_data = response.json()
        raise Exception(f"API error: {error_data['error']['message']}")

# Example usage
try:
    task = get_task_by_id('YOUR_API_KEY', 'task123')
    
    if task:
        print(f"Task: {task['title']}")
        print(f"Status: {task['status']}")
        print(f"Priority: {task['priority']}")
        
        if 'dueDate' in task and task['dueDate']:
            # Parse the ISO date string
            due_date = datetime.fromisoformat(task['dueDate'].replace('Z', '+00:00'))
            now = datetime.now()
            
            # Check if task is overdue
            if task['status'] not in ['DONE', 'CANCELED'] and due_date < now:
                days_overdue = (now - due_date).days
                print(f"⚠️ OVERDUE by {days_overdue} days")
            else:
                print(f"Due: {due_date.strftime('%Y-%m-%d')}")
        
        if 'assigneeId' in task and task['assigneeId']:
            print(f"Assigned to: {task['assigneeId']}")
            
        if 'tags' in task and task['tags']:
            print(f"Tags: {', '.join(task['tags'])}")
    else:
        print("Task could not be retrieved")
        
except Exception as e:
    print(f"Error: {e}")
```

### cURL

```bash
curl -X GET "https://api.taskmanagement.example.com/v1/tasks/task123" \
  -H "Authorization: Bearer YOUR_API_KEY"
```

## Related Resources

- [Task Resource](/resources/task-resource.md) - Detailed information about the Task resource
- [Get All Tasks](/api-reference/get-all-tasks.md) - Retrieve a list of all tasks
- [Update a Task](/api-reference/update-task.md) - Update an existing task's information
- [Delete a Task](/api-reference/delete-task.md) - Remove a task from the system

## See Also

- [Data Model](/core-concepts/data-model.md) - Overview of the core resources and their relationships
- [Task Status Lifecycle](/core-concepts/task-status-lifecycle.md) - Understanding task statuses and transitions
- [Task Management Workflow](/tutorials/task-management-workflow.md) - Guide to implementing a task management workflow

--- FILE: api-reference/update-task.md
---
title: "Update a task"
description: "API endpoint to update an existing task's information, including changing its status."
tags: ["tasks", "endpoint", "PATCH"]
categories: ["api-reference"]
importance: 7
api_endpoints: ["/tasks/{taskId}"]
related_pages: ["task-resource", "task-status-lifecycle"]
parent: "api-reference"
hasChildren: false
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "2025-05-13"
navOrder: "10"
layout: "default"
version: "v1.0.0"
lastUpdated: "2025-05-13"
---

# Update a Task

## Endpoint

```
PATCH /tasks/{taskId}
```

This endpoint updates an existing task's information. You can update one or more properties of the task resource, including its status, priority, assignee, and other fields.

## Path Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `taskId` | String | Unique identifier of the task to update |

## Request Body

The request body should be a JSON object containing the properties you want to update. You can include one or more of the following properties:

| Property | Type | Description |
|----------|------|-------------|
| `title` | String | Title of the task |
| `description` | String | Detailed description of the task |
| `status` | String | Status of the task: "TODO", "IN_PROGRESS", "REVIEW", "DONE", "CANCELED" |
| `priority` | String | Priority level: "LOW", "MEDIUM", "HIGH", "URGENT" |
| `assigneeId` | String | ID of the user assigned to the task |
| `dueDate` | String | When the task is due (ISO 8601 format) |
| `warningOffset` | Number | Hours before due date to send a reminder |
| `tags` | Array | Array of string tags associated with the task |

### Example Request Body

```json
{
  "status": "IN_PROGRESS",
  "description": "Add token-based authentication to the application. Use JWT for stateless authentication.",
  "priority": "HIGH"
}
```

## Request Example

```http
PATCH /tasks/task123
Content-Type: application/json
Authorization: Bearer YOUR_API_KEY

{
  "status": "IN_PROGRESS",
  "description": "Add token-based authentication to the application. Use JWT for stateless authentication.",
  "priority": "HIGH"
}
```

## Response

### Success Response (200 OK)

```json
{
  "id": "task123",
  "title": "Implement authentication",
  "description": "Add token-based authentication to the application. Use JWT for stateless authentication.",
  "status": "IN_PROGRESS",
  "priority": "HIGH",
  "createdBy": "user456",
  "assigneeId": "user789",
  "dueDate": "2025-06-01T17:00:00Z",
  "warningOffset": 24,
  "tags": ["authentication", "security", "api"],
  "createdAt": "2025-05-01T10:30:00Z",
  "updatedAt": "2025-05-13T15:45:00Z"
}
```

### Error Responses

| Status Code | Description |
|-------------|-------------|
| 400 | Bad request (e.g., malformed request body) |
| 401 | Unauthorized (missing or invalid authentication) |
| 403 | Forbidden (insufficient permissions to update this task) |
| 404 | Not Found (task with the specified ID does not exist) |
| 409 | Conflict (e.g., invalid status transition) |
| 422 | Unprocessable entity (e.g., validation errors) |

#### Example Error Response (422 Unprocessable Entity)

```json
{
  "error": {
    "code": "invalid_status_transition",
    "message": "Cannot transition from status 'DONE' to 'IN_PROGRESS'",
    "details": {
      "currentStatus": "DONE",
      "requestedStatus": "IN_PROGRESS",
      "allowedTransitions": ["CANCELED"]
    }
  }
}
```

For details on error responses, see [Error Responses](/api-reference/error-responses.md).

## Authentication

This endpoint requires authentication using a bearer token. Include your API key in the `Authorization` header:

```
Authorization: Bearer YOUR_API_KEY
```

The authenticated user must have appropriate permissions to update the requested task:
- `admin` users can update any task
- `manager` users can update any task
- `member` users can only update tasks they created or are assigned to

## Important Considerations

- **Partial Updates**: This endpoint supports partial updates. You only need to include the properties you want to change in the request body.

- **Status Transitions**: When updating the task status, only certain transitions are allowed based on the current status. See [Task Status Lifecycle](/core-concepts/task-status-lifecycle.md) for valid transitions.

- **Assignment Restrictions**: There may be restrictions on who can be assigned to a task:
  - `admin` and `manager` users can assign tasks to any user
  - `member` users may only be able to assign tasks to themselves

- **Read-Only Fields**: The `id`, `createdBy`, `createdAt`, and `updatedAt` fields are read-only and cannot be updated. If included in the request, they will be ignored.

- **Due Date Format**: When updating the `dueDate`, it must be specified in ISO 8601 format (YYYY-MM-DDTHH:MM:SSZ) and should be in the future.

- **Setting Fields to Null**: To remove an optional field, set its value to `null` in the request body.

## Best Practices

- Only include the fields you want to update in the request body
- Verify that status transitions are valid before attempting to update the status
- Validate due dates to ensure they are in the future
- Implement proper error handling for invalid status transitions
- Consider the impact of status changes on task workflows and notifications

## Code Examples

### JavaScript

```javascript
async function updateTask(taskId, updates) {
  try {
    const response = await fetch(`https://api.taskmanagement.example.com/v1/tasks/${taskId}`, {
      method: 'PATCH',
      headers: {
        'Authorization': `Bearer ${API_KEY}`,
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(updates)
    });
    
    if (!response.ok) {
      const errorData = await response.json();
      throw new Error(`Failed to update task: ${errorData.error.message}`);
    }
    
    return await response.json();
  } catch (error) {
    console.error(`Error updating task ${taskId}:`, error);
    throw error;
  }
}

// Example usage: Update task status and assignee
try {
  const updatedTask = await updateTask('task123', {
    status: 'IN_PROGRESS',
    assigneeId: 'user456'
  });
  
  console.log(`Task updated: ${updatedTask.title}`);
  console.log(`New status: ${updatedTask.status}`);
  console.log(`Assigned to: ${updatedTask.assigneeId}`);
  
  // You can check if the response matches the requested updates
  if (updatedTask.status !== 'IN_PROGRESS') {
    console.warn('Status was not updated as requested');
  }
} catch (error) {
  if (error.message.includes('invalid_status_transition')) {
    console.error('Cannot transition to the requested status. Check the task status lifecycle.');
  } else {
    console.error('Failed to update task:', error);
  }
}
```

### Python

```python
import requests

def update_task(api_key, task_id, **updates):
    """
    Update an existing task's information.
    
    Args:
        api_key (str): API key for authentication
        task_id (str): The unique identifier of the task to update
        **updates: Keyword arguments for fields to update
    
    Returns:
        dict: Updated task data if successful
        
    Raises:
        Exception: If the API request fails
    """
    url = f'https://api.taskmanagement.example.com/v1/tasks/{task_id}'
    headers = {
        'Authorization': f'Bearer {api_key}',
        'Content-Type': 'application/json'
    }
    
    # Filter out None values
    update_data = {k: v for k, v in updates.items() if v is not None}
    
    if not update_data:
        return None  # No updates to make
    
    response = requests.patch(url, json=update_data, headers=headers)
    
    if response.status_code == 200:
        return response.json()
    elif response.status_code == 404:
        raise Exception(f"Task with ID {task_id} not found")
    elif response.status_code == 422:
        error_data = response.json()
        if error_data['error']['code'] == 'invalid_status_transition':
            current = error_data['error']['details']['currentStatus']
            requested = error_data['error']['details']['requestedStatus']
            allowed = error_data['error']['details']['allowedTransitions']
            raise Exception(f"Cannot change status from '{current}' to '{requested}'. Allowed transitions: {', '.join(allowed)}")
        else:
            raise Exception(f"Validation error: {error_data['error']['message']}")
    else:
        error_data = response.json()
        raise Exception(f"API error: {error_data['error']['message']}")

# Example usage: Update task status and priority
try:
    task = update_task(
        api_key='YOUR_API_KEY',
        task_id='task123',
        status='REVIEW',
        priority='HIGH',
        description='Updated task description with additional details'
    )
    
    if task:
        print(f"Task '{task['title']}' updated successfully")
        print(f"Status: {task['status']}")
        print(f"Priority: {task['priority']}")
        print(f"Last updated: {task['updatedAt']}")
        
except Exception as e:
    print(f"Error updating task: {e}")
```

### cURL

```bash
# Update task status and priority
curl -X PATCH "https://api.taskmanagement.example.com/v1/tasks/task123" \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "status": "IN_PROGRESS",
    "priority": "HIGH"
  }'

# Update task due date and assignee
curl -X PATCH "https://api.taskmanagement.example.com/v1/tasks/task123" \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "dueDate": "2025-06-15T17:00:00Z",
    "assigneeId": "user456"
  }'
```

## Related Resources

- [Task Resource](/resources/task-resource.md) - Detailed information about the Task resource
- [Get Task by ID](/api-reference/get-task-by-id.md) - Retrieve a specific task by ID
- [Get All Tasks](/api-reference/get-all-tasks.md) - Retrieve a list of all tasks
- [Delete a Task](/api-reference/delete-task.md) - Remove a task from the system

## See Also

- [Task Status Lifecycle](/core-concepts/task-status-lifecycle.md) - Understanding valid status transitions
- [Data Model](/core-concepts/data-model.md) - Overview of the core resources and their relationships
- [Task Management Workflow](/tutorials/task-management-workflow.md) - Guide to implementing a task management workflow

--- FILE: api-reference/delete-task.md
---
title: "Delete a task"
description: "API endpoint to remove a task from the system."
tags: ["tasks", "endpoint", "DELETE"]
categories: ["api-reference"]
importance: 7
api_endpoints: ["/tasks/{taskId}"]
related_pages: ["task-resource"]
parent: "api-reference"
hasChildren: false
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "2025-05-13"
navOrder: "11"
layout: "default"
version: "v1.0.0"
lastUpdated: "2025-05-13"
---

# Delete a Task

## Endpoint

```
DELETE /tasks/{taskId}
```

This endpoint deletes a specific task from the system. Once deleted, the task cannot be recovered.

## Path Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `taskId` | String | Unique identifier of the task to delete |

## Request Example

```http
DELETE /tasks/task123
Authorization: Bearer YOUR_API_KEY
```

## Response

### Success Response (204 No Content)

A successful deletion returns a `204 No Content` status code with no response body, indicating that the task has been successfully deleted.

### Error Responses

| Status Code | Description |
|-------------|-------------|
| 401 | Unauthorized (missing or invalid authentication) |
| 403 | Forbidden (insufficient permissions to delete this task) |
| 404 | Not Found (task with the specified ID does not exist) |

#### Example Error Response (403 Forbidden)

```json
{
  "error": {
    "code": "permission_denied",
    "message": "You don't have permission to delete this task"
  }
}
```

For details on error responses, see [Error Responses](/api-reference/error-responses.md).

## Authentication

This endpoint requires authentication using a bearer token. Include your API key in the `Authorization` header:

```
Authorization: Bearer YOUR_API_KEY
```

The authenticated user must have appropriate permissions to delete the requested task:
- `admin` users can delete any task
- `manager` users can delete any task
- `member` users can only delete tasks they created (and possibly tasks assigned to them, depending on system configuration)

## Important Considerations

- **Permanent Operation**: Deletion is permanent and cannot be undone. Consider updating the task status to "CANCELED" instead if you might need to reference the task later.

- **Related Records**: When a task is deleted, any records that directly reference it may also be affected. For example, if you have a comments system linked to tasks, comments on the deleted task might be deleted as well.

- **Alternative to Deletion**: If you need to keep a record of all tasks for audit or reporting purposes, consider implementing a "soft delete" in your application by changing the task status to "CANCELED" instead of using this endpoint.

- **Bulk Operations**: This endpoint only deletes a single task. For bulk deletions, you'll need to make multiple API calls.

## Best Practices

- Confirm deletion with the user before making the API request
- Consider using status updates instead of deletion for maintaining historical records
- Implement proper error handling in your application
- Keep track of deleted tasks in your application if needed for audit purposes
- Check task ownership and permissions in your application before attempting deletion

## Code Examples

### JavaScript

```javascript
async function deleteTask(taskId) {
  try {
    const response = await fetch(`https://api.taskmanagement.example.com/v1/tasks/${taskId}`, {
      method: 'DELETE',
      headers: {
        'Authorization': `Bearer ${API_KEY}`
      }
    });
    
    if (response.status === 204) {
      return true; // Successfully deleted
    }
    
    if (response.status === 404) {
      console.warn(`Task with ID ${taskId} not found`);
      return false;
    }
    
    if (!response.ok) {
      const errorData = await response.json();
      throw new Error(`Failed to delete task: ${errorData.error.message}`);
    }
    
    return false; // Should not reach here if properly handled above
  } catch (error) {
    console.error(`Error deleting task ${taskId}:`, error);
    throw error;
  }
}

// Example usage
try {
  // Confirm with the user before deletion
  const confirmDelete = confirm(`Are you sure you want to delete this task? This action cannot be undone.`);
  
  if (confirmDelete) {
    const result = await deleteTask('task123');
    
    if (result) {
      console.log('Task successfully deleted');
      // Update your UI to remove the task
      document.getElementById('task-123').remove();
    } else {
      console.log('Task was not deleted');
    }
  } else {
    console.log('Deletion canceled by user');
  }
} catch (error) {
  console.error('Failed to delete task:', error);
  // Show error message to the user
  displayErrorMessage(`Failed to delete task: ${error.message}`);
}
```

### Python

```python
import requests

def delete_task(api_key, task_id):
    """
    Delete a task from the system.
    
    Args:
        api_key (str): API key for authentication
        task_id (str): The unique identifier of the task to delete
    
    Returns:
        bool: True if task was successfully deleted
        
    Raises:
        Exception: If the API request fails
    """
    url = f'https://api.taskmanagement.example.com/v1/tasks/{task_id}'
    headers = {
        'Authorization': f'Bearer {api_key}'
    }
    
    response = requests.delete(url, headers=headers)
    
    if response.status_code == 204:
        return True
    elif response.status_code == 404:
        print(f"Task with ID {task_id} not found")
        return False
    elif response.status_code == 403:
        raise Exception(f"You don't have permission to delete this task")
    else:
        error_data = response.json()
        raise Exception(f"API error: {error_data['error']['message']}")

# Example usage
try:
    # Prompt for confirmation
    task_id = 'task123'
    confirm = input(f"Are you sure you want to delete task {task_id}? (yes/no): ")
    
    if confirm.lower() == 'yes':
        success = delete_task('YOUR_API_KEY', task_id)
        
        if success:
            print(f"Task {task_id} was successfully deleted")
            # Update your application state
        else:
            print(f"Task was not deleted")
    else:
        print("Deletion cancelled")
        
except Exception as e:
    print(f"Error deleting task: {e}")
```

### cURL

```bash
# Delete a task
curl -X DELETE "https://api.taskmanagement.example.com/v1/tasks/task123" \
  -H "Authorization: Bearer YOUR_API_KEY"
```

## Related Resources

- [Task Resource](/resources/task-resource.md) - Detailed information about the Task resource
- [Get All Tasks](/api-reference/get-all-tasks.md) - Retrieve a list of all tasks
- [Get Task by ID](/api-reference/get-task-by-id.md) - Retrieve a specific task by ID
- [Update a Task](/api-reference/update-task.md) - Update an existing task's information

## See Also

- [Data Model](/core-concepts/data-model.md) - Overview of the core resources and their relationships
- [Task Status Lifecycle](/core-concepts/task-status-lifecycle.md) - Understanding task statuses and transitions
- [Task Management Workflow](/tutorials/task-management-workflow.md) - Guide to implementing a task management workflow

--- FILE: tutorials/getting-started-with-users.md
---
title: "Getting started with users"
description: "A practical guide to creating, listing, updating, and deleting users in the Task Management API."
tags: ["tutorial", "users"]
categories: ["tutorials"]
importance: 6
parent: "tutorials"
hasChildren: false
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "2025-05-13"
navOrder: "1"
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

--- FILE: tutorials/task-management-workflow.md
---
title: "Task management workflow"
description: "A guide to implementing a complete task management workflow using the API, from creation to completion."
tags: ["tutorial", "tasks", "workflow"]
categories: ["tutorials"]
importance: 6
parent: "tutorials"
hasChildren: false
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "2025-05-13"
navOrder: "2"
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

--- FILE: tutorials/implementing-reminders.md
---
title: "Implementing reminders"
description: "How to use the warningOffset property to implement a reminder system for tasks approaching their due date."
tags: ["tutorial", "reminders"]
categories: ["tutorials"]
importance: 5
parent: "tutorials"
hasChildren: false
ai-generated: false
navOrder: "3"
layout: "default"
version: "v1.0.0"
lastUpdated: "2025-05-13"
---

# Implementing Reminders

## Overview

This document outlines how to implement a reminder system using the Task Management API's `warningOffset` property to notify users about approaching task deadlines.

## Content Outline

### 1. Understanding the warningOffset Property
- Purpose and functionality
- How the offset is calculated
- Default behavior when not specified

### 2. Setting Up Task Reminders
- Creating tasks with reminders
- Updating existing tasks to add reminders
- Best practices for setting appropriate warning times

### 3. Building a Reminder Detection System
- Polling for upcoming deadlines
- Calculating when reminders should be triggered
- Handling timezone considerations

### 4. Implementing Notification Mechanisms
- Email notifications
- In-app notifications
- Mobile push notifications
- Integration with calendar systems

### 5. User Preferences for Reminders
- Allowing users to customize reminder timing
- Setting default reminder preferences
- Managing notification channels

### 6. Advanced Reminder Patterns
- Escalating reminders (multiple reminders as deadline approaches)
- Team-wide reminders for shared tasks
- Reminder acknowledgment tracking

## Suggested Content

- **Code Examples**: Sample implementations in JavaScript and Python
- **Diagram**: Visual representation of the reminder timeline
- **Table**: Recommended warning offsets for different task priorities
- **Screenshots**: Example UI for reminder configuration

## Related Topics
- [Task Resource](/resources/task-resource.md)
- [Task Management Workflow](/tutorials/task-management-workflow.md)
- [Update a Task](/api-reference/update-task.md)

--- FILE: tutorials/integration-patterns.md
---
title: "Integration patterns"
description: "Common patterns for integrating the Task Management API with other systems and services."
tags: ["integration", "architecture"]
categories: ["tutorials"]
importance: 6
parent: "tutorials"
hasChildren: false
ai-generated: false
navOrder: "4"
layout: "default"
version: "v1.0.0"
lastUpdated: "2025-05-13"
---

# Integration Patterns

## Overview

This document presents common patterns, architectures, and best practices for integrating the Task Management API with other systems and services.

## Content Outline

### 1. Introduction to API Integration
- Integration objectives and benefits
- Common integration scenarios
- Planning your integration strategy

### 2. Synchronization Patterns
- One-way vs. two-way synchronization
- Real-time vs. batch synchronization
- Handling conflicts and data reconciliation

### 3. Integration with Project Management Tools
- Synchronizing with JIRA, Trello, Asana, etc.
- Mapping concepts between systems
- Best practices for maintaining data consistency

### 4. Calendar Integrations
- Adding tasks to calendar systems (Google Calendar, Outlook)
- Handling due date and reminder synchronization
- Event updates when task status changes

### 5. Notification System Integrations
- Integrating with Slack, Microsoft Teams, Discord
- Email notification systems
- Mobile push notification services
- Webhook implementation patterns

### 6. Authentication Integration Patterns
- Single Sign-On (SSO) implementation
- OAuth flows with third-party services
- Managing API keys securely

### 7. Data Warehouse and Reporting Integrations
- Exporting task data to analytics platforms
- Building custom dashboards
- ETL processes for task data

### 8. Advanced Integration Architectures
- Event-driven architectures using webhooks
- Using message queues for reliable integrations
- Microservices approaches for complex systems

## Suggested Content

- **Diagrams**: System integration architecture diagrams for different scenarios
- **Code Examples**: Sample integration code for popular tools and services
- **Decision Tree**: Helping readers select the right integration pattern
- **Case Studies**: Real-world examples of successful integrations

## Related Topics
- [Authentication](/getting-started/authentication.md)
- [Optimizing API Usage](/advanced/optimizing-api-usage.md)
- [Handling Data Consistency](/advanced/handling-data-consistency.md)

--- FILE: advanced/optimizing-api-usage.md
---
title: "Optimizing API usage"
description: "Best practices for efficient API usage, including caching, batch operations, and performance considerations."
tags: ["optimization", "performance"]
categories: ["advanced"]
importance: 5
parent: "advanced"
hasChildren: false
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "2025-05-13"
navOrder: "1"
layout: "default"
version: "v1.0.0"
lastUpdated: "2025-05-13"
---

# Optimizing API Usage

This guide covers advanced techniques for optimizing your use of the Task Management API, focusing on performance, efficiency, and resource utilization. By following these best practices, you can reduce latency, minimize API calls, and improve the overall performance of your applications.

## Understanding API Rate Limits

The Task Management API implements rate limiting to ensure fair usage and system stability. Understanding and working within these limits is essential for building reliable applications.

### Current Rate Limits

| Plan | Requests per Minute | Requests per Day |
|------|---------------------|------------------|
| Free | 60 | 10,000 |
| Standard | 120 | 50,000 |
| Professional | 300 | 150,000 |
| Enterprise | Custom | Custom |

### Identifying Rate Limiting

When you exceed rate limits, the API returns a `429 Too Many Requests` status code. The response includes headers that provide information about your current usage:

```
X-RateLimit-Limit: 60
X-RateLimit-Remaining: 0
X-RateLimit-Reset: 1715123456
Retry-After: 30
```

### Best Practices for Rate Limit Management

1. **Monitor rate limit headers**: Track the `X-RateLimit-Remaining` header in each response to stay aware of your remaining quota.

2. **Implement exponential backoff**: When rate limited, use the `Retry-After` header to determine when to retry, with exponential backoff for repeated failures.

3. **Distribute requests over time**: Avoid bursts of requests that might trigger rate limits. Space out non-urgent requests evenly.

4. **Prioritize critical operations**: Ensure that essential operations have priority access to your rate limit quota.

## Efficient Data Retrieval

Optimizing how you retrieve data can significantly reduce the number of API calls required and improve application performance.

### Use Pagination Effectively

The API uses offset-based pagination for list endpoints. To retrieve large datasets efficiently:

1. **Use appropriate page sizes**: Start with the default `limit` of 10 and adjust based on your needs. For UI displays, match the `limit` to your display size.

2. **Implement infinite scrolling or "load more"**: Instead of loading all data at once, fetch additional pages as the user scrolls or requests more items.

3. **Track total counts**: Use the `total` value in the pagination object to show progress indicators or determine when all data has been retrieved.

```javascript
async function getAllPages(endpoint, queryParams = {}) {
  let allData = [];
  let hasMore = true;
  let offset = 0;
  const limit = 100; // Maximum page size for bulk operations
  
  while (hasMore) {
    const params = new URLSearchParams({
      ...queryParams,
      limit,
      offset
    });
    
    const response = await fetch(`${API_BASE_URL}/${endpoint}?${params}`, {
      headers: { 'Authorization': `Bearer ${API_KEY}` }
    });
    
    const result = await response.json();
    allData = [...allData, ...result.data];
    
    // Update pagination variables
    offset += limit;
    hasMore = result.pagination.hasMore;
    
    // Optional: Add a delay to avoid rate limiting
    if (hasMore) {
      await new Promise(resolve => setTimeout(resolve, 100));
    }
  }
  
  return allData;
}
```

### Filter Data on the Server

Use query parameters to filter data on the server instead of retrieving all data and filtering client-side:

```javascript
// Inefficient: Retrieve all tasks and filter client-side
const allTasks = await getAllTasks();
const highPriorityTasks = allTasks.filter(task => task.priority === 'HIGH');

// Efficient: Use server-side filtering
const highPriorityTasks = await getTasks({ priority: 'HIGH' });
```

### Request Only What You Need

Some endpoints may support field selection in the future to limit the fields returned in the response. When available, use this feature to reduce payload size:

```
GET /tasks?fields=id,title,status,dueDate
```

## Implementing Caching Strategies

A well-designed caching strategy can dramatically reduce API calls and improve response times for your users.

### Client-Side Caching

1. **Cache frequently accessed data**: Store common lookups like user details and task status options in memory.

2. **Implement time-based cache expiry**: Set appropriate TTL (Time To Live) values based on how frequently the data changes.

3. **Use conditional requests with ETags**: When supported, use the `If-None-Match` header with ETags to validate if cached data is still current.

```javascript
class ApiCache {
  constructor(ttlSeconds = 300) {
    this.cache = new Map();
    this.ttlSeconds = ttlSeconds;
  }
  
  set(key, value) {
    const item = {
      value,
      expiry: Date.now() + (this.ttlSeconds * 1000)
    };
    this.cache.set(key, item);
  }
  
  get(key) {
    const item = this.cache.get(key);
    if (!item) return null;
    
    if (Date.now() > item.expiry) {
      this.cache.delete(key);
      return null;
    }
    
    return item.value;
  }
  
  delete(key) {
    this.cache.delete(key);
  }
  
  clear() {
    this.cache.clear();
  }
}

// Example usage
const apiCache = new ApiCache(60 * 5); // 5 minute cache

async function getUserWithCache(userId) {
  const cacheKey = `user:${userId}`;
  const cachedUser = apiCache.get(cacheKey);
  
  if (cachedUser) {
    return cachedUser;
  }
  
  const user = await getUser(userId);
  apiCache.set(cacheKey, user);
  return user;
}
```

### Cache Invalidation Strategies

1. **Time-based invalidation**: Set an expiry time appropriate to the data type:
   - User profiles: 1 hour
   - Task lists: 5 minutes
   - Task details: 1 minute

2. **Action-based invalidation**: Clear relevant cache entries when mutations occur:

```javascript
async function updateTask(taskId, updates) {
  const result = await apiRequest(`/tasks/${taskId}`, 'PATCH', updates);
  
  // Invalidate affected cache entries
  apiCache.delete(`task:${taskId}`);
  apiCache.delete('tasks:list');
  
  return result;
}
```

3. **Selective invalidation**: Only invalidate cache for affected items:

```javascript
function invalidateUserTasks(userId) {
  // Clear all cached data related to this user's tasks
  apiCache.delete(`user:${userId}:tasks`);
  
  // Find and delete individual task cache entries for this user
  for (const key of apiCache.cache.keys()) {
    if (key.startsWith('task:') && cachedTaskBelongsToUser(key, userId)) {
      apiCache.delete(key);
    }
  }
}
```

## Batch Operations

Reducing the number of API calls through batching can significantly improve performance.

### Client-Side Batching

While the API may not support native batch operations, you can implement client-side batching:

```javascript
async function batchCreateTasks(tasks, batchSize = 10) {
  const results = [];
  
  // Process in batches to avoid overwhelming the API
  for (let i = 0; i < tasks.length; i += batchSize) {
    const batch = tasks.slice(i, i + batchSize);
    
    // Create tasks in parallel
    const batchPromises = batch.map(task => createTask(task));
    const batchResults = await Promise.all(batchPromises);
    
    results.push(...batchResults);
    
    // Add a small delay between batches to avoid rate limiting
    if (i + batchSize < tasks.length) {
      await new Promise(resolve => setTimeout(resolve, 500));
    }
  }
  
  return results;
}
```

### Optimizing Parallel Requests

When making multiple independent requests, use `Promise.all()` to execute them in parallel:

```javascript
async function loadDashboardData(userId) {
  // Execute requests in parallel
  const [
    userDetails,
    assignedTasks,
    createdTasks,
    teamMembers
  ] = await Promise.all([
    getUser(userId),
    getTasks({ assigneeId: userId }),
    getTasks({ createdBy: userId }),
    getTeamMembers(userId)
  ]);
  
  return {
    user: userDetails,
    tasks: {
      assigned: assignedTasks,
      created: createdTasks
    },
    team: teamMembers
  };
}
```

Be careful not to exceed rate limits when making many parallel requests. Limit the number of concurrent requests based on your rate limit constraints.

## Optimizing Payload Size

Reducing the size of request and response payloads can improve network performance.

### Request Optimization

1. **Only send changed fields**: When updating resources, only include the fields that have changed:

```javascript
// Inefficient: Sending all fields
await updateTask(taskId, {
  title: task.title,
  description: task.description,
  status: 'IN_PROGRESS',
  priority: task.priority,
  dueDate: task.dueDate,
  tags: task.tags
});

// Efficient: Only sending the changed field
await updateTask(taskId, { status: 'IN_PROGRESS' });
```

2. **Compress large requests**: For very large payloads, use compression when supported by the API:

```javascript
const compressedData = await compressPayload(largeData);

fetch(url, {
  method: 'POST',
  headers: {
    'Content-Type': 'application/json',
    'Content-Encoding': 'gzip'
  },
  body: compressedData
});
```

### Response Optimization

1. **Use pagination wisely**: Only request the number of items you need.

2. **Filter server-side**: Use query parameters to reduce the amount of data returned.

3. **Request specific fields**: If supported, specify only the fields you need.

## Connection and Network Optimization

Optimizing network usage can improve performance, especially for mobile or slow connections.

### Connection Reuse

Use a single instance of your HTTP client to benefit from connection pooling and keep-alive:

```javascript
// Create a reusable client
const apiClient = axios.create({
  baseURL: 'https://api.taskmanagement.example.com/v1',
  headers: {
    'Authorization': `Bearer ${API_KEY}`,
    'Content-Type': 'application/json'
  },
  timeout: 10000
});

// Reuse the client for all requests
function getTasks(params) {
  return apiClient.get('/tasks', { params });
}

function createTask(task) {
  return apiClient.post('/tasks', task);
}
```

### Request Timeouts

Implement appropriate timeouts for API requests to avoid hanging operations:

```javascript
async function apiRequest(endpoint, method = 'GET', data = null, timeoutMs = 5000) {
  const controller = new AbortController();
  const timeoutId = setTimeout(() => controller.abort(), timeoutMs);
  
  try {
    const response = await fetch(`${API_BASE_URL}/${endpoint}`, {
      method,
      headers: {
        'Authorization': `Bearer ${API_KEY}`,
        'Content-Type': 'application/json'
      },
      body: data ? JSON.stringify(data) : undefined,
      signal: controller.signal
    });
    
    clearTimeout(timeoutId);
    
    if (!response.ok) {
      throw new Error(`API error: ${response.status}`);
    }
    
    return await response.json();
  } catch (error) {
    clearTimeout(timeoutId);
    
    if (error.name === 'AbortError') {
      throw new Error(`Request timed out after ${timeoutMs}ms`);
    }
    
    throw error;
  }
}
```

### Retry Strategies

Implement robust retry logic for handling transient failures:

```javascript
async function fetchWithRetry(url, options, maxRetries = 3) {
  let retries = 0;
  
  while (retries <= maxRetries) {
    try {
      return await fetch(url, options);
    } catch (error) {
      retries++;
      
      if (retries > maxRetries || !isRetryableError(error)) {
        throw error;
      }
      
      // Exponential backoff with jitter
      const delay = Math.min(
        1000 * Math.pow(2, retries) + Math.random() * 1000,
        30000 // Max 30 seconds
      );
      
      console.warn(`Retry ${retries}/${maxRetries} after ${Math.round(delay)}ms`);
      await new Promise(resolve => setTimeout(resolve, delay));
    }
  }
}

function isRetryableError(error) {
  // Retry network errors and server errors (500s)
  return error.name === 'TypeError' || 
         (error.response && error.response.status >= 500);
}
```

## Background Synchronization

For applications that need to work offline or in unreliable network conditions, implement background synchronization.

### Offline Queue

Implement a queue for operations performed offline:

```javascript
class OfflineQueue {
  constructor() {
    this.queue = [];
    this.isProcessing = false;
    
    // Attempt to process the queue when the app comes online
    window.addEventListener('online', () => this.processQueue());
  }
  
  addToQueue(operation) {
    this.queue.push({
      ...operation,
      timestamp: Date.now()
    });
    
    // Save queue to persistent storage
    this.saveQueue();
    
    // Try to process the queue if we're online
    if (navigator.onLine) {
      this.processQueue();
    }
  }
  
  async processQueue() {
    if (this.isProcessing || !navigator.onLine || this.queue.length === 0) {
      return;
    }
    
    this.isProcessing = true;
    
    try {
      while (this.queue.length > 0 && navigator.onLine) {
        const operation = this.queue[0];
        
        try {
          await this.executeOperation(operation);
          
          // Remove the successful operation from the queue
          this.queue.shift();
          this.saveQueue();
        } catch (error) {
          // If the operation failed but is retryable, keep it in the queue
          if (isRetryableError(error)) {
            console.warn(`Operation failed, will retry later:`, error);
            break;
          }
          
          // Otherwise, remove it from the queue
          console.error(`Operation failed and won't be retried:`, error);
          this.queue.shift();
          this.saveQueue();
        }
      }
    } finally {
      this.isProcessing = false;
    }
  }
  
  async executeOperation(operation) {
    // Execute the operation based on type
    switch (operation.type) {
      case 'CREATE_TASK':
        return await createTask(operation.data);
      case 'UPDATE_TASK':
        return await updateTask(operation.id, operation.data);
      case 'DELETE_TASK':
        return await deleteTask(operation.id);
      default:
        throw new Error(`Unknown operation type: ${operation.type}`);
    }
  }
  
  saveQueue() {
    localStorage.setItem('offlineQueue', JSON.stringify(this.queue));
  }
  
  loadQueue() {
    const saved = localStorage.getItem('offlineQueue');
    this.queue = saved ? JSON.parse(saved) : [];
  }
}

// Example usage
const offlineQueue = new OfflineQueue();
offlineQueue.loadQueue();

// When creating a task offline
function createTaskOfflineSupport(taskData) {
  if (navigator.onLine) {
    return createTask(taskData);
  }
  
  // Store in offline queue
  offlineQueue.addToQueue({
    type: 'CREATE_TASK',
    data: taskData
  });
  
  // Return a placeholder result for UI updates
  return {
    ...taskData,
    id: `offline-${Date.now()}`, // Temporary ID
    status: 'PENDING_SYNC',
    createdAt: new Date().toISOString(),
    updatedAt: new Date().toISOString()
  };
}
```

## Performance Monitoring

Implement monitoring to identify bottlenecks and opportunities for optimization.

### Track API Metrics

Monitor key performance indicators:

```javascript
class ApiMetrics {
  constructor() {
    this.metrics = {
      totalRequests: 0,
      successfulRequests: 0,
      failedRequests: 0,
      averageResponseTime: 0,
      requestsByEndpoint: {}
    };
  }
  
  startRequest(endpoint) {
    const startTime = performance.now();
    this.metrics.totalRequests++;
    
    if (!this.metrics.requestsByEndpoint[endpoint]) {
      this.metrics.requestsByEndpoint[endpoint] = {
        count: 0,
        totalTime: 0,
        averageTime: 0,
        failures: 0
      };
    }
    
    this.metrics.requestsByEndpoint[endpoint].count++;
    
    return startTime;
  }
  
  endRequest(endpoint, startTime, success) {
    const endTime = performance.now();
    const duration = endTime - startTime;
    
    if (success) {
      this.metrics.successfulRequests++;
    } else {
      this.metrics.failedRequests++;
      this.metrics.requestsByEndpoint[endpoint].failures++;
    }
    
    // Update average response time for this endpoint
    const endpointMetrics = this.metrics.requestsByEndpoint[endpoint];
    endpointMetrics.totalTime += duration;
    endpointMetrics.averageTime = endpointMetrics.totalTime / endpointMetrics.count;
    
    // Update overall average response time
    const totalTime = Object.values(this.metrics.requestsByEndpoint)
      .reduce((sum, metrics) => sum + metrics.totalTime, 0);
    this.metrics.averageResponseTime = totalTime / this.metrics.totalRequests;
    
    return duration;
  }
  
  getMetrics() {
    return { ...this.metrics };
  }
  
  getEndpointPerformance() {
    return Object.entries(this.metrics.requestsByEndpoint)
      .map(([endpoint, metrics]) => ({
        endpoint,
        requests: metrics.count,
        averageTime: metrics.averageTime.toFixed(2),
        failures: metrics.failures,
        successRate: ((metrics.count - metrics.failures) / metrics.count * 100).toFixed(1)
      }))
      .sort((a, b) => b.requests - a.requests);
  }
}

// Create a global metrics instance
const apiMetrics = new ApiMetrics();

// Wrap API requests with metrics
async function apiRequestWithMetrics(endpoint, method = 'GET', data = null) {
  const startTime = apiMetrics.startRequest(endpoint);
  let success = false;
  
  try {
    const result = await apiRequest(endpoint, method, data);
    success = true;
    return result;
  } finally {
    const duration = apiMetrics.endRequest(endpoint, startTime, success);
    console.debug(`${method} ${endpoint} took ${duration.toFixed(2)}ms`);
  }
}
```

### Log Slow Requests

Identify and log unusually slow operations:

```javascript
function logSlowRequests(endpoint, method, duration, threshold = 1000) {
  if (duration > threshold) {
    console.warn(`Slow request: ${method} ${endpoint} took ${duration.toFixed(2)}ms`);
    
    // You could also send this to your monitoring system
    if (typeof sendToMonitoring === 'function') {
      sendToMonitoring('slow_request', {
        endpoint,
        method,
        duration,
        timestamp: new Date().toISOString()
      });
    }
  }
}
```

## Best Practices Summary

1. **Respect rate limits**:
   - Monitor limit headers
   - Implement backoff strategies
   - Distribute requests over time

2. **Optimize data retrieval**:
   - Use pagination appropriately
   - Filter server-side
   - Request only what you need

3. **Implement caching**:
   - Cache frequently accessed data
   - Use appropriate cache invalidation strategies
   - Consider data freshness requirements

4. **Batch operations**:
   - Group related operations
   - Use parallel requests with Promise.all()
   - Limit the number of concurrent requests

5. **Optimize payload size**:
   - Only send necessary fields
   - Use compression for large payloads
   - Filter responses on the server

6. **Handle network issues gracefully**:
   - Implement timeouts
   - Use retry strategies
   - Support offline operations when possible

7. **Monitor performance**:
   - Track API metrics
   - Log slow requests
   - Analyze patterns to identify optimization opportunities

By applying these optimization techniques, you can build applications that use the Task Management API efficiently, providing better performance and reliability for your users.

## See Also

- [Rate Limiting](/getting-started/rate-limiting.md)
- [Pagination](/core-concepts/pagination.md)
- [Authentication](/getting-started/authentication.md)
- [Error Handling](/core-concepts/error-handling.md)

--- FILE: advanced/security-best-practices.md
---
title: "Security best practices"
description: "Advanced security considerations when working with the Task Management API."
tags: ["security", "best practices"]
categories: ["advanced"]
importance: 6
parent: "advanced"
hasChildren: false
ai-generated: false
navOrder: "2"
layout: "default"
version: "v1.0.0"
lastUpdated: "2025-05-13"
---

# Security Best Practices

## Overview

This document describes advanced security considerations and best practices when working with the Task Management API to ensure your integration remains secure and protected.

## Content Outline

### 1. API Key Management
- Secure storage and rotation practices
- Environment-specific API keys
- Key exposure detection and remediation
- Using API key scopes and least privilege

### 2. Authentication and Authorization
- Token-based authentication best practices
- Securely handling bearer tokens
- Role-based access control implementation
- Session management considerations

### 3. Secure Communication
- Transport Layer Security (TLS)
- Certificate validation
- API request signing
- Network security considerations

### 4. Protecting Sensitive Data
- Data classification for task information
- Handling personally identifiable information (PII)
- Data minimization practices
- Encryption strategies for sensitive fields

### 5. Input Validation and Sanitization
- Preventing injection attacks
- Content validation best practices
- Output encoding
- Handling user-generated content

### 6. Security in Distributed Systems
- Microservices security patterns
- Service-to-service authentication
- API gateways and security
- Container security considerations

### 7. Monitoring and Incident Response
- Security logging best practices
- Anomaly detection for API usage
- Incident response procedures
- Threat modeling for task management systems

### 8. Compliance Considerations
- Regulatory requirements for task data
- Audit trails and evidence collection
- Privacy regulations impact
- Security assessment procedures

## Suggested Content

- **Checklists**: Security review checklists for API integrations
- **Code Examples**: Secure implementation patterns in various languages
- **Flow Diagrams**: Secure authentication flows and threat mitigations
- **Case Studies**: Security incident examples and lessons learned

## Related Topics
- [Authentication](/getting-started/authentication.md)
- [Rate Limiting](/getting-started/rate-limiting.md)
- [Error Handling](/core-concepts/error-handling.md)

--- FILE: advanced/handling-data-consistency.md
---
title: "Handling data consistency"
description: "Strategies for maintaining data consistency when working with the API, including handling race conditions and concurrency."
tags: ["data consistency", "concurrency"]
categories: ["advanced"]
importance: 4
parent: "advanced"
hasChildren: false
ai-generated: false
navOrder: "3"
layout: "default"
version: "v1.0.0"
lastUpdated: "2025-05-13"
---

# Handling Data Consistency

## Overview

This document outlines strategies and patterns for maintaining data consistency when working with the Task Management API, with a focus on concurrency control, handling race conditions, and ensuring data integrity.

## Content Outline

### 1. Understanding Consistency Challenges
- Common data consistency issues in distributed systems
- Race conditions in task management
- Optimistic vs. pessimistic concurrency control
- Idempotency and its importance

### 2. Handling Concurrent Updates
- Using ETags and conditional requests
- Implementing optimistic locking
- Conflict detection and resolution strategies
- Last-write-wins vs. merge-based approaches

### 3. Transactional Operations
- Lack of true transactions in REST APIs
- Implementing compensating transactions
- Designing for eventual consistency
- Saga pattern for distributed transactions

### 4. Maintaining Cache Consistency
- Cache invalidation strategies
- Time-to-live (TTL) considerations
- Write-through and write-behind caching
- Cache coherence in distributed environments

### 5. Managing Task State Transitions
- Enforcing valid state transitions
- Handling conflicting state changes
- Implementing state machines for tasks
- Audit trails for state changes

### 6. Handling Partial Failures
- Recovery strategies for incomplete operations
- Implementing retry logic
- Circuit breakers and fallback mechanisms
- Monitoring and alerting for consistency issues

### 7. Testing for Consistency Issues
- Simulating race conditions in tests
- Load testing for concurrency issues
- Chaos testing for resilience
- Data consistency verification techniques

## Suggested Content

- **Sequence Diagrams**: Illustrating race conditions and their resolution
- **Code Examples**: Implementation patterns for handling concurrency
- **Decision Trees**: Choosing appropriate consistency strategies
- **Architectural Diagrams**: System designs that promote data consistency

## Related Topics
- [Task Status Lifecycle](/core-concepts/task-status-lifecycle.md)
- [Error Handling](/core-concepts/error-handling.md)
- [Optimizing API Usage](/advanced/optimizing-api-usage.md)

--- FILE: developer-resources/code-examples.md
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
