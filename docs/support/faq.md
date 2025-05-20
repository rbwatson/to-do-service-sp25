---
title: "Frequently asked questions"
description: "Common questions and answers about using the Task Management API."
tags: ["faq", "help"]
categories: ["support"]
importance: 4
parent: "Support & FAQ"
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 20, 2025"
nav_order: "1"
layout: "default"
version: "v1.0.0"
lastUpdated: "May 20, 2025"
---

# Frequently asked questions

This page provides answers to common questions about the Task Management API.

## General questions

### What is the Task Management API?

The Task Management API is a RESTful service that enables you to create, read, update, and delete users and tasks. It's designed to help you build task management features into your applications.

### What can I do with the Task Management API?

With the Task Management API, you can:
- Create and manage user accounts
- Create and track to-do tasks
- Update task statuses as they progress
- Set due dates and reminders for tasks
- Filter and sort tasks by various criteria

### Is the API free to use?

As this is a development API running on localhost, it's freely available for development and testing purposes. For production use, please check with your API provider for pricing and usage details.

### What programming languages can I use with the API?

The API is language-agnostic and can be used with any programming language that can make HTTP requests. We provide examples in JavaScript, Python, and cURL in our documentation.

## Authentication

### How do I authenticate API requests?

The API uses bearer token authentication. Include your token in the Authorization header of each request:

```
Authorization: Bearer your-token-here
```

For more details, see the [Authentication guide](../getting-started/authentication.md).

### What happens if my authentication fails?

If authentication fails, the API will return a 401 Unauthorized response with an error message. Make sure your token is valid and properly formatted in the Authorization header.

### How do I get a bearer token?

For this development API, bearer tokens would typically be provided by your system administrator or API provider. In a production environment, tokens are usually obtained through an authentication service.

## Tasks and users

### How many tasks can a user have?

There is no specific limit to the number of tasks a user can have in the system.

### What are the possible task statuses?

Tasks can have one of the following status values:
- NOT_STARTED: The task has not been started yet
- IN_PROGRESS: The task is currently being worked on
- BLOCKED: The task cannot proceed due to an external factor
- DEFERRED: The task has been postponed to a later time
- COMPLETED: The task has been finished
- CANCELLED: The task has been cancelled and will not be completed

### What is the warningOffset field for?

The `warningOffset` field specifies the number of minutes before a task's due date that a reminder should be sent. This can be used to implement reminder functionality in your application.

### Can I update multiple task fields at once?

Yes, you can update multiple fields in a single PATCH request. Simply include all the fields you want to update in the request body.

### What happens to tasks when a user is deleted?

When a user is deleted, all tasks associated with that user are also deleted (cascade delete).

## API usage

### Is there a rate limit?

Yes, the API implements rate limiting to prevent abuse. If you exceed the rate limit, you'll receive a 429 Too Many Requests response with a Retry-After header indicating how long to wait before making new requests.

### How do I handle pagination?

The API supports pagination through the `_page` and `_perPage` query parameters. For example:

```
GET /tasks?_page=0&_perPage=10
```

For more details, see the [Pagination documentation](../core-concepts/pagination.md).

### How do I sort results?

You can sort results using the `_sort` query parameter. To sort in ascending order, specify the field name; to sort in descending order, prefix the field name with a hyphen:

```
GET /tasks?_sort=dueDate    # Ascending order
GET /tasks?_sort=-dueDate   # Descending order
```

For more details, see the [Sorting documentation](../core-concepts/sorting.md).

### How do I filter tasks by status?

You can filter tasks by status using the `taskStatus` query parameter:

```
GET /tasks?taskStatus=IN_PROGRESS
```

### Can I combine pagination, sorting, and filtering?

Yes, you can combine these features in a single request:

```
GET /tasks?_page=0&_perPage=10&_sort=-dueDate&taskStatus=IN_PROGRESS
```

## Error handling

### What does a 400 Bad Request error mean?

A 400 Bad Request error indicates that there's an issue with your request, such as invalid parameters or missing required fields. Check the error response for specific details about what went wrong.

### How do I handle rate limiting errors?

When you receive a 429 Too Many Requests response, check the Retry-After header to determine how long to wait before retrying. Implement backoff logic in your application to handle rate limiting gracefully.

### What's the best way to handle errors in my application?

Implement error handling that checks for specific error codes and messages. Use the information in the error response to provide meaningful feedback to users and to recover gracefully from errors.

For detailed error handling examples, see the [Error handling documentation](../core-concepts/error-handling.md).

## Performance and optimization

### How can I optimize API performance?

To optimize API performance, consider:
- Implementing client-side caching
- Using pagination appropriately
- Minimizing the number of API requests
- Implementing batch operations when possible

For more details, see the [Optimizing API usage](../advanced/optimizing-api-usage.md) guide.

### When should I use caching?

Consider using caching for:
- User data that changes infrequently
- Task lists that don't need real-time updates
- Reference data (e.g., task status values)

Implement appropriate cache invalidation strategies to ensure users see the most current data.

## Still have questions?

If you can't find the answer to your question here, check out our other support resources:

- [Troubleshooting guide](troubleshooting.md)
- [Support resources](support-resources.md)
- [API reference](../api-reference.md)


