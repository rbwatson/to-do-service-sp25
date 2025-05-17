---
title: "Frequently asked questions"
description: "Common questions and answers about using the Task Management API."
tags: ["faq", "help"]
categories: ["support"]
importance: 4
parent: "Support & FAQ"
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "2025-05-13"
nav_order: "1"
layout: "default"
version: "v1.0.0"
lastUpdated: "2025-05-13"
---

# Frequently Asked Questions

This page answers common questions about the Task Management API to help you get the most out of the service.

## General Questions

### What is the Task Management API?

The Task Management API is a RESTful web service that lets you manage tasks and users programmatically. You can create, read, update, and delete tasks and users, assign tasks to specific users, and track the status of tasks throughout their lifecycle.

### What can I do with the Task Management API?

With the Task Management API, you can:
- Create and manage users
- Create, update, and delete tasks
- Assign tasks to specific users
- Track task status (TODO, IN_PROGRESS, REVIEW, DONE, CANCELED)
- Set priorities for tasks
- Set due dates and reminders
- Add tags to tasks for better organization
- Retrieve and filter tasks based on various criteria

### What format does the API use for requests and responses?

The API uses JSON (JavaScript Object Notation) for both request bodies and responses. All requests should include the header `Content-Type: application/json` when sending data.

### Is there a rate limit for the API?

Yes, the API has rate limits to ensure fair usage. The specific limits depend on your account tier. If you exceed the rate limit, the API will return a `429 Too Many Requests` status code. You can find more details in the [Rate Limiting](../getting-started/rate-limiting.md) documentation.

## Authentication

### How do I authenticate with the API?

The API uses bearer token authentication. Include your API key in the `Authorization` header of each request:

```
Authorization: Bearer YOUR_API_KEY
```

### Where do I get an API key?

You can get an API key by:
1. Creating an account on our platform
2. Navigating to the Developer Settings in your account dashboard
3. Generating a new API key

### Can I use the same API key for development and production?

We recommend using separate API keys for development and production environments. This allows you to:
- Revoke access independently if a key is compromised
- Apply different rate limits for development and production
- Monitor usage separately for each environment

### What happens if my API key is exposed?

If your API key is exposed:
1. Revoke the compromised key immediately in your account dashboard
2. Generate a new API key
3. Update your applications with the new key

## Tasks

### What are the possible task statuses?

Tasks can have the following statuses:
- `TODO`: Task has been created but work hasn't started
- `IN_PROGRESS`: Work on the task has begun but is not yet complete
- `REVIEW`: Task is completed and awaiting review
- `DONE`: Task has been completed and approved
- `CANCELED`: Task has been canceled and won't be completed

### Can I create custom task statuses?

No, the API uses a fixed set of task statuses to ensure consistency. However, you can use tags to categorize tasks according to your own system.

### Are there restrictions on changing task status?

Yes, there are rules for valid status transitions:
- From `TODO`: Can move to `IN_PROGRESS` or `CANCELED`
- From `IN_PROGRESS`: Can move to `REVIEW` or `CANCELED`
- From `REVIEW`: Can move to `DONE`, `IN_PROGRESS`, or `CANCELED`
- From `DONE`: Can move to `CANCELED`
- From `CANCELED`: Cannot transition to any other status

See the [Task Status Lifecycle](../core-concepts/task-status-lifecycle.md) page for details.

### Can a task be assigned to multiple users?

No, a task can only be assigned to one user at a time. If you need to assign a task to multiple people, you'll need to create separate tasks for each user.

### What formats are accepted for due dates?

Task due dates should be provided in ISO 8601 format:
```
YYYY-MM-DDTHH:MM:SSZ
```

For example: `2025-06-15T14:30:00Z` for June 15, 2025, at 2:30 PM UTC.

## Users

### What user roles are available?

The API supports three user roles:
- `admin`: Has full access to all resources
- `manager`: Can manage tasks and has limited user management capabilities
- `member`: Can manage their own tasks and view assigned tasks

### Can I change a user's email address?

Yes, you can update a user's email address using the PATCH method on the user resource. Note that email addresses must be unique across all users.

### What happens to a user's tasks if I delete the user?

By default, you cannot delete a user who has assigned tasks. You have two options:
1. Reassign the tasks to other users before deleting the user
2. Use the `force=true` query parameter, which will unassign all tasks from the user before deletion

## API Usage

### How do I filter tasks by status?

To filter tasks by status, use the `status` query parameter when calling the `GET /tasks` endpoint:

```
GET /tasks?status=TODO,IN_PROGRESS
```

This will return all tasks with a status of either "TODO" or "IN_PROGRESS".

### How can I search for specific tasks?

You can use various query parameters to filter tasks:
- `status`: Filter by task status
- `priority`: Filter by priority level
- `assigneeId`: Filter by assigned user
- `createdBy`: Filter by creator
- `tags`: Filter by tags
- `dueDate[lt]` and `dueDate[gt]`: Filter by due date range

For example:
```
GET /tasks?status=TODO&priority=HIGH&assigneeId=user123
```

### How do I paginate through large result sets?

Use the `limit` and `offset` parameters to control pagination:
```
GET /tasks?limit=10&offset=20
```

This will return 10 tasks, starting from the 21st result.

### Can I sort the results?

Yes, use the `sort` parameter followed by the field name. Prefix with `-` for descending order or `+` for ascending (default is ascending):
```
GET /tasks?sort=-dueDate
```

This sorts tasks by due date in descending order (newest first).

### What's the maximum number of items I can retrieve in a single request?

The maximum limit for pagination is 100 items per request. If you need to retrieve more items, you'll need to make multiple requests with appropriate offset values.

## Error Handling

### What HTTP status codes does the API use?

The API uses standard HTTP status codes:
- 2xx: Success (200 OK, 201 Created, 204 No Content)
- 4xx: Client errors (400 Bad Request, 401 Unauthorized, 403 Forbidden, 404 Not Found)
- 5xx: Server errors (500 Internal Server Error)

### How are errors returned?

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

### How should I handle rate limiting?

When you exceed the rate limit, you'll receive a `429 Too Many Requests` response with headers that indicate the limit and when it resets. Implement exponential backoff with jitter for the best results:

```javascript
async function fetchWithBackoff(url, options, maxRetries = 3) {
  let retries = 0;
  
  while (true) {
    try {
      return await fetch(url, options);
    } catch (error) {
      if (retries >= maxRetries) {
        throw error;
      }
      
      // Exponential backoff with jitter
      const delay = Math.min(
        1000 * Math.pow(2, retries) + Math.random() * 1000,
        30000 // Max 30 seconds
      );
      
      await new Promise(resolve => setTimeout(resolve, delay));
      retries++;
    }
  }
}
```

## Technical Support

### Where can I get help if I'm having issues?

If you're having trouble with the API, you can:

1. Check the [Troubleshooting](../support/troubleshooting.md) guide for common issues
2. Visit our [developer forum](https://community.taskmanagement.example.com) to connect with other developers
3. Contact our support team at [support@taskmanagement.example.com](mailto:support@taskmanagement.example.com)

### Is there any sample code available?

Yes, we provide code examples in several languages. See the [Code Examples](../developer-resources/code-examples.md) page for ready-to-use snippets.

### Do you offer client libraries for the API?

We don't currently provide official client libraries, but the [Code Examples](../developer-resources/code-examples.md) page includes full client implementations in JavaScript and Python that you can use as a starting point.

### How do I report a bug or request a feature?

You can report bugs or request features by:
- Emailing [api-feedback@taskmanagement.example.com](mailto:api-feedback@taskmanagement.example.com)
- Submitting an issue on our [GitHub repository](https://github.com/taskmanagement/api/issues)
- Using the feedback form in your account dashboard

## Account and Billing

### Is there a free tier available?

Yes, we offer a free tier with limited API calls that's suitable for testing and small projects. Check our [pricing page](https://taskmanagement.example.com/pricing) for details.

### How can I upgrade my account?

To upgrade your account:
1. Log in to your account dashboard
2. Navigate to the Billing section
3. Select your desired plan
4. Complete the payment process

### What happens if I exceed my plan's limits?

If you exceed your plan's rate limits, additional requests will be rejected with a `429 Too Many Requests` status code until the rate limit period resets.

If you consistently hit your limits, we recommend upgrading to a higher-tier plan with increased limits.

## Still Have Questions?

If your question isn't answered here, please check our [Troubleshooting](../support/troubleshooting.md) guide or contact our [support team](../support/support-resources.md) for assistance.


