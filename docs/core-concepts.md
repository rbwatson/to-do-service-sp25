---
title: "Core Concepts"
description: "Overview of fundamental concepts in the Task Management API, including data model, pagination, sorting, error handling, and task statuses."
tags: ["concepts", "overview"]
categories: ["core-concepts"]
importance: 9
has_toc: false
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 20, 2025"
nav_order: "3"
layout: "default"
version: "v1.0.0"
lastUpdated: "May 20, 2025"
---

# Core Concepts

This page explains the fundamental concepts that underpin the Task Management API. Understanding these concepts will help you use the API more effectively.

## Resources

The Task Management API is organized around two primary resources:

- **Users**: Individuals who can create and manage tasks
- **Tasks**: To-do items with titles, descriptions, due dates, and statuses

Each resource supports standard CRUD operations (Create, Read, Update, Delete) via RESTful endpoints.

## Data model

Understanding the data model is essential for using the API effectively:

- [Data model](core-concepts/data-model.md): Overview of the core resources and their relationships
- [User resource](resources/user-resource.md): Details of the User resource
- [Task resource](resources/task-resource.md): Details of the Task resource

## RESTful design

The API follows RESTful design principles:

- Resources are accessed via standard HTTP methods (GET, POST, PATCH, DELETE)
- HTTP status codes indicate the success or failure of requests
- Resources are identified by unique URLs
- Request and response bodies use JSON format

## Collections and pagination

When retrieving collections of resources (like all users or all tasks), the API supports pagination to manage large result sets:

- [Pagination](core-concepts/pagination.md): How to navigate through large collections of resources

## Sorting and filtering

The API supports sorting and filtering capabilities to help you find specific resources:

- [Sorting](core-concepts/sorting.md): How to sort API results
- Filtering: Tasks can be filtered by status using the `taskStatus` query parameter

## Task lifecycle

Tasks in the system follow a defined lifecycle with various status values:

- [Task status lifecycle](core-concepts/task-status-lifecycle.md): Understanding the various status values that tasks can have

## Error handling

The API uses consistent error formats to help you understand and resolve issues:

- [Error handling](core-concepts/error-handling.md): Common error patterns and best practices

## Next steps

Explore each core concept in detail by following the links above, or continue to the [API reference](api-reference.md) for detailed endpoint documentation.


