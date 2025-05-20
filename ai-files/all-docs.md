--- FILE: support.md ---
---
title: "Support & FAQ"
description: "Support resources, frequently asked questions, and troubleshooting information for the Task Management API."
tags: ["support", "faq", "help", "troubleshooting"]
categories: ["support"]
importance: 4
has_toc: false
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 20, 2025"
nav_order: "9"
layout: "default"
version: "v1.0.0"
lastUpdated: "May 20, 2025"
---

# Support & FAQ

This section provides resources to help you troubleshoot issues and find answers to common questions about the Task Management API.

## Frequently asked questions

Visit our [FAQ page](support/faq.md) for answers to common questions about:

- API usage
- Authentication
- Common errors
- Best practices
- Integration patterns

## Troubleshooting

If you're experiencing issues with the API, our [Troubleshooting guide](support/troubleshooting.md) can help you:

- Identify common error patterns
- Resolve authentication issues
- Fix request formatting problems
- Handle rate limiting
- Debug client-side errors

## Support resources

For additional support, check out our [Support resources](support/support-resources.md) page, which provides information on:

- How to contact support
- Documentation resources
- Community forums
- Bug reporting
- Feature requests

## Quick help reference

| Issue | Resource |
|-------|----------|
| Authentication problems | [Authentication guide](getting-started/authentication.md) |
| Error responses | [Error handling](core-concepts/error-handling.md) |
| Rate limiting | [Rate limiting guide](getting-started/rate-limiting.md) |
| API performance | [Optimizing API usage](advanced/optimizing-api-usage.md) |
| Common questions | [FAQ](support/faq.md) |

## Before contacting support

Before reaching out for support, please try these steps:

1. Check the [Troubleshooting guide](support/troubleshooting.md) for solutions to common issues
2. Review the [API reference](api-reference.md) to ensure your requests are correctly formatted
3. Check the [FAQ](support/faq.md) to see if your question has already been answered
4. Look for error messages in the API response and check the [Error responses](api-reference/error-responses.md) documentation

If you still need help after trying these steps, please contact us through the appropriate channels listed in the [Support resources](support/support-resources.md) page.

--- FILE: support/faq.md ---
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

--- FILE: support/troubleshooting.md ---
---
title: "Troubleshooting"
description: "Solutions to common issues encountered when using the Task Management API."
tags: ["troubleshooting", "errors"]
categories: ["support"]
importance: 5
parent: "Support & FAQ"
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 20, 2025"
nav_order: "2"
layout: "default"
version: "v1.0.0"
lastUpdated: "May 20, 2025"
---

# Troubleshooting

This guide helps you troubleshoot common issues when working with the Task Management API.

## Authentication issues

### Issue: 401 Unauthorized error

**Symptoms:**
- Receiving a 401 Unauthorized response
- Error message: "Authentication is required to access this resource"

**Possible causes:**
1. Missing Authorization header
2. Invalid or expired token
3. Incorrectly formatted Authorization header

**Solutions:**
1. Make sure the Authorization header is included in your request:
   ```
   Authorization: Bearer your-token-here
   ```
2. Check that your token is valid and hasn't expired
3. Verify the header format - it should be "Bearer" followed by a space and then your token
4. Ensure there are no extra spaces or characters in your token

### Issue: 403 Forbidden error

**Symptoms:**
- Receiving a 403 Forbidden response
- Error message: "You do not have permission to access this resource"

**Possible causes:**
1. Your token doesn't have permission to perform the requested operation
2. Attempting to access a resource that belongs to another user

**Solutions:**
1. Verify that your token has the necessary permissions
2. Make sure you're trying to access resources that belong to your user account
3. Contact your system administrator if you need additional permissions

## Request formatting issues

### Issue: 400 Bad Request error

**Symptoms:**
- Receiving a 400 Bad Request response
- Error message about invalid fields or missing required fields

**Possible causes:**
1. Missing required fields in the request body
2. Invalid field values (e.g., wrong format, out of range)
3. Malformed JSON in the request body

**Solutions:**
1. Check the error response for details about which fields are problematic:
   ```json
   {
     "code": "INVALID_FIELD",
     "message": "The field `contactEmail` must be a valid email address",
     "details": [
       {
         "field": "contactEmail",
         "reason": "Invalid format",
         "location": "body"
       }
     ]
   }
   ```
2. Verify that all required fields are included in your request
3. Make sure field values meet the constraints specified in the API documentation
4. Validate your JSON syntax before sending the request
5. Check that your Content-Type header is set to "application/json"

### Issue: Invalid date format

**Symptoms:**
- Receiving a 400 Bad Request response
- Error message about invalid date format

**Possible causes:**
1. Using an incorrect date format in the `dueDate` field
2. Missing timezone information in the date

**Solutions:**
1. Make sure dates are in ISO 8601 format (e.g., "2025-06-15T17:00:00-05:00")
2. Include timezone information in the date string
3. Use a date formatting library to ensure correct formatting:

```javascript
// JavaScript example
const dueDate = new Date();
dueDate.setDate(dueDate.getDate() + 7); // 7 days from now
const formattedDate = dueDate.toISOString();
```

```python
# Python example
from datetime import datetime, timedelta
import dateutil.parser

# Create a date 7 days from now
due_date = datetime.now() + timedelta(days=7)
formatted_date = due_date.isoformat()

# Parse a date string
parsed_date = dateutil.parser.parse("2025-06-15T17:00:00-05:00")
```

## Resource not found issues

### Issue: 404 Not Found error

**Symptoms:**
- Receiving a 404 Not Found response
- Error message: "The requested resource could not be found"

**Possible causes:**
1. The resource (user or task) doesn't exist
2. The resource has been deleted
3. Typo in the resource ID

**Solutions:**
1. Verify that the resource ID is correct
2. Check if the resource exists by making a GET request to the collection endpoint (e.g., `/users` or `/tasks`)
3. If you're trying to access a recently created resource, make sure the creation was successful
4. If you're using an ID from a previous response, check for any changes that might have occurred since then

## Rate limiting issues

### Issue: 429 Too Many Requests error

**Symptoms:**
- Receiving a 429 Too Many Requests response
- Error message: "Rate limit exceeded. Try again in X seconds"

**Possible causes:**
1. Making too many requests in a short period
2. Not respecting the Retry-After header in previous responses

**Solutions:**
1. Implement rate limiting handling with backoff logic:

```javascript
// JavaScript example
async function makeRequestWithRetry(url, options, maxRetries = 3) {
  let retries = 0;
  
  while (retries <= maxRetries) {
    try {
      const response = await fetch(url, options);
      
      if (response.status === 429) {
        retries++;
        
        // Get retry-after header or use exponential backoff
        const retryAfter = response.headers.get('Retry-After');
        const delay = retryAfter ? parseInt(retryAfter, 10) * 1000 : Math.pow(2, retries) * 1000;
        
        console.log(`Rate limited. Retrying in ${delay / 1000} seconds...`);
        
        // Wait before retrying
        await new Promise(resolve => setTimeout(resolve, delay));
        continue;
      }
      
      return response;
    } catch (error) {
      if (retries >= maxRetries) {
        throw error;
      }
      
      retries++;
      await new Promise(resolve => setTimeout(resolve, Math.pow(2, retries) * 1000));
    }
  }
}
```

```python
# Python example
import requests
import time

def make_request_with_retry(url, method="GET", headers=None, json=None, max_retries=3):
    headers = headers or {}
    retries = 0
    
    while retries <= max_retries:
        try:
            response = requests.request(method, url, headers=headers, json=json)
            
            if response.status_code == 429:
                retries += 1
                
                # Get retry-after header or use exponential backoff
                retry_after = response.headers.get('Retry-After')
                delay = int(retry_after) if retry_after else 2 ** retries
                
                print(f"Rate limited. Retrying in {delay} seconds...")
                
                # Wait before retrying
                time.sleep(delay)
                continue
                
            return response
            
        except requests.exceptions.RequestException as e:
            if retries >= max_retries:
                raise e
                
            retries += 1
            time.sleep(2 ** retries)
    
    return None
```

2. Space out non-critical requests to avoid hitting the rate limit
3. Implement caching to reduce the number of API requests
4. Consider using batch operations when possible

## Server errors

### Issue: 500 Server Error

**Symptoms:**
- Receiving a 500 Server Error response
- Error message: "An unexpected error occurred. Please try again later"

**Possible causes:**
1. Server-side issue unrelated to your request
2. Unexpected edge case not handled by the server

**Solutions:**
1. Wait and retry the request later
2. Implement retry logic with backoff for server errors:

```javascript
// JavaScript example
async function makeRequestWithServerErrorRetry(url, options, maxRetries = 3) {
  let retries = 0;
  
  while (retries <= maxRetries) {
    try {
      const response = await fetch(url, options);
      
      if (response.status >= 500) {
        retries++;
        
        if (retries > maxRetries) {
          return response; // Give up after max retries
        }
        
        const delay = Math.pow(2, retries) * 1000;
        console.log(`Server error. Retrying in ${delay / 1000} seconds...`);
        
        await new Promise(resolve => setTimeout(resolve, delay));
        continue;
      }
      
      return response;
    } catch (error) {
      if (retries >= maxRetries) {
        throw error;
      }
      
      retries++;
      await new Promise(resolve => setTimeout(resolve, Math.pow(2, retries) * 1000));
    }
  }
}
```

```python
# Python example
import requests
import time

def make_request_with_server_error_retry(url, method="GET", headers=None, json=None, max_retries=3):
    headers = headers or {}
    retries = 0
    
    while retries <= max_retries:
        try:
            response = requests.request(method, url, headers=headers, json=json)
            
            if response.status_code >= 500:
                retries += 1
                
                if retries > max_retries:
                    return response  # Give up after max retries
                
                delay = 2 ** retries
                print(f"Server error. Retrying in {delay} seconds...")
                
                time.sleep(delay)
                continue
                
            return response
            
        except requests.exceptions.RequestException as e:
            if retries >= max_retries:
                raise e
                
            retries += 1
            time.sleep(2 ** retries)
    
    return None
```

3. If the problem persists, contact support with details about the request that's causing the error

## Client-side issues

### Issue: Network connectivity problems

**Symptoms:**
- Connection timeouts
- Network errors
- Failed requests without server responses

**Possible causes:**
1. Poor internet connection
2. Firewall or proxy issues
3. DNS resolution problems

**Solutions:**
1. Check your internet connection
2. Verify that you can access the API URL in a browser or with a tool like curl
3. Check if any firewalls or proxies might be blocking your requests
4. Implement retry logic for network errors:

```javascript
// JavaScript example
async function makeRequestWithNetworkRetry(url, options, maxRetries = 3) {
  let retries = 0;
  
  while (retries <= maxRetries) {
    try {
      return await fetch(url, options);
    } catch (error) {
      if (retries >= maxRetries) {
        throw error;
      }
      
      retries++;
      console.log(`Network error. Retrying ${retries}/${maxRetries}...`);
      await new Promise(resolve => setTimeout(resolve, Math.pow(2, retries) * 1000));
    }
  }
}
```

```python
# Python example
import requests
import time

def make_request_with_network_retry(url, method="GET", headers=None, json=None, max_retries=3):
    headers = headers or {}
    retries = 0
    
    while retries <= max_retries:
        try:
            return requests.request(method, url, headers=headers, json=json)
        except requests.exceptions.RequestException as e:
            if retries >= max_retries:
                raise e
                
            retries += 1
            print(f"Network error. Retrying {retries}/{max_retries}...")
            time.sleep(2 ** retries)
    
    return None
```

### Issue: CORS problems (browser-based applications)

**Symptoms:**
- Console errors about CORS policy in browser applications
- Requests fail with "Access to fetch at 'X' from origin 'Y' has been blocked by CORS policy"

**Possible causes:**
1. API server doesn't have CORS configured to allow your domain
2. Preflight requests are failing
3. Missing required CORS headers in the server response

**Solutions:**
1. If you're developing locally, use a CORS proxy for testing
2. Check with your API provider about CORS configuration
3. If using a custom server, make sure it's configured to handle CORS properly

## Additional resources

- [Error responses reference](../api-reference/error-responses.md)
- [Error handling best practices](../core-concepts/error-handling.md)
- [Rate limiting guide](../getting-started/rate-limiting.md)
- [Support resources](support-resources.md)

If you're still experiencing issues after trying these solutions, please contact support with:
- A detailed description of the problem
- The exact request you're making (including headers and body)
- The full error response you're receiving
- Any steps you've already taken to troubleshoot

--- FILE: support/support-resources.md ---
---
title: "Support resources"
description: "How to get help with using the Task Management API, including contact information and community resources."
tags: ["support", "help"]
categories: ["support"]
importance: 3
parent: "Support & FAQ"
ai-generated: false
nav_order: "3"
layout: "default"
version: "v1.0.0"
lastUpdated: "May 20, 2025"
---

# Support resources

This page outlines the available support resources for the Task Management API. When you encounter issues or have questions, these resources can help you find the answers you need.

## Documentation resources

Before reaching out for direct support, please check the following documentation resources:

- [Getting started guide](../getting-started.md): Basic information to help you start using the API
- [API reference](../api-reference.md): Detailed endpoint documentation
- [Troubleshooting guide](troubleshooting.md): Solutions to common issues
- [FAQ](faq.md): Answers to frequently asked questions

## Community resources

Connect with other developers using the Task Management API:

- Community forums
- Developer discussion groups
- Social media channels

## Contact support

If you can't find the answer in our documentation or community resources, you can contact our support team:

- Email: support@example.com
- Support portal: [https://support.example.com](https://support.example.com)
- Live chat: Available during business hours (9 AM - 5 PM EST)

## Reporting bugs

If you believe you've found a bug in the API, please report it with the following information:

1. Detailed description of the issue
2. Steps to reproduce the problem
3. Expected behavior
4. Actual behavior
5. API endpoint and HTTP method
6. Request headers and body
7. Response status code and body
8. Any error messages or codes
9. Your environment details (client language, libraries, versions)

## Feature requests

Have an idea for improving the API? Submit a feature request with:

1. Description of the proposed feature
2. Use cases and benefits
3. How you're currently working around the lack of this feature
4. Any relevant examples or mockups

## Getting help

When contacting support, please provide as much detail as possible to help us address your issue quickly. Include:

- Your API client ID (if applicable)
- The specific endpoint you're having trouble with
- Complete request and response details
- Any error messages you're receiving
- Steps you've already taken to troubleshoot

## Support SLA

Our support team aims to respond to all inquiries within:

- Critical issues: 2 business hours
- High priority issues: 4 business hours
- Medium priority issues: 1 business day
- Low priority issues: 2 business days

## Training and consulting

For additional help with implementing the API, we offer:

- Training sessions
- Implementation consulting
- Code reviews
- Integration assistance

Contact our sales team for pricing and availability.--- FILE: developer-resources.md ---
---
title: "Developer Resources"
description: "Additional resources for developers working with the Task Management API, including changelogs, tooling, and code examples."
tags: ["resources", "developers", "tools"]
categories: ["developer-resources"]
importance: 5
has_toc: false
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 20, 2025"
nav_order: "8"
layout: "default"
version: "v1.0.0"
lastUpdated: "May 20, 2025"
---

# Developer Resources

This page provides additional resources to help you develop with the Task Management API more effectively.

## Code examples

The [Code examples](developer-resources/code-examples.md) page contains reusable code snippets and examples for common operations in multiple programming languages:

- JavaScript/Node.js
- Python
- cURL

These examples cover everything from authentication to advanced API usage patterns.

## API changelog

Stay updated on API changes by checking the [API changelog](developer-resources/api-changelog.md). This page documents:

- New features
- Bug fixes
- Breaking changes
- Deprecation notices

## Postman collection

For testing and exploring the API, use our [Postman collection](developer-resources/postman-collection.md). This resource provides:

- Ready-to-use API requests
- Environment variables for easy configuration
- Request examples with sample data
- Testing scripts

## Available resources

| Resource | Description | Format |
|----------|-------------|--------|
| [Code examples](developer-resources/code-examples.md) | Reusable code in multiple languages | Markdown, code snippets |
| [API changelog](developer-resources/api-changelog.md) | History of API changes | Markdown |
| [Postman collection](developer-resources/postman-collection.md) | Collection for API testing | Postman JSON |

## Community resources

While not officially supported, these community resources might be helpful:

- GitHub repositories with client libraries
- Blog posts about API integration
- Community forums

## Support resources

If you need additional help, check out the [Support & FAQ](support.md) section for:

- Frequently asked questions
- Troubleshooting guides
- Support contact information

--- FILE: developer-resources/code-examples.md ---
---
title: "Code examples"
description: "Example code for common operations in various programming languages including JavaScript, Python, and more."
tags: ["code", "examples"]
categories: ["developer-resources"]
importance: 7
parent: "Developer Resources"
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 20, 2025"
nav_order: "1"
layout: "default"
version: "v1.0.0"
lastUpdated: "May 20, 2025"
---

# Code examples

This page provides reusable code examples for common operations with the Task Management API in multiple programming languages.

## JavaScript/Node.js examples

### API client

A reusable API client class for JavaScript/Node.js applications:

```javascript
class TaskManagementClient {
  constructor(baseUrl, token) {
    this.baseUrl = baseUrl;
    this.token = token;
    this.headers = {
      'Authorization': `Bearer ${token}`,
      'Content-Type': 'application/json'
    };
  }

  // User operations
  async getUsers(page = 0, perPage = 20, sort = null) {
    let url = `${this.baseUrl}/users?_page=${page}&_perPage=${perPage}`;
    
    if (sort) {
      url += `&_sort=${sort}`;
    }
    
    const response = await fetch(url, {
      headers: this.headers
    });
    
    if (!response.ok) {
      throw new Error(`Failed to get users: ${response.status}`);
    }
    
    return response.json();
  }
  
  async getUser(userId) {
    const response = await fetch(`${this.baseUrl}/users/${userId}`, {
      headers: this.headers
    });
    
    if (!response.ok) {
      throw new Error(`Failed to get user ${userId}: ${response.status}`);
    }
    
    return response.json();
  }
  
  async createUser(userData) {
    const response = await fetch(`${this.baseUrl}/users`, {
      method: 'POST',
      headers: this.headers,
      body: JSON.stringify(userData)
    });
    
    if (!response.ok) {
      throw new Error(`Failed to create user: ${response.status}`);
    }
    
    return response.json();
  }
  
  async updateUser(userId, updates) {
    const response = await fetch(`${this.baseUrl}/users/${userId}`, {
      method: 'PATCH',
      headers: this.headers,
      body: JSON.stringify(updates)
    });
    
    if (!response.ok) {
      throw new Error(`Failed to update user ${userId}: ${response.status}`);
    }
    
    return response.json();
  }
  
  async deleteUser(userId) {
    const response = await fetch(`${this.baseUrl}/users/${userId}`, {
      method: 'DELETE',
      headers: {
        'Authorization': this.headers.Authorization
      }
    });
    
    if (!response.ok) {
      throw new Error(`Failed to delete user ${userId}: ${response.status}`);
    }
    
    return response.status === 204;
  }
  
  // Task operations
  async getTasks(options = {}) {
    const {
      page = 0,
      perPage = 20,
      sort = null,
      status = null
    } = options;
    
    let url = `${this.baseUrl}/tasks?_page=${page}&_perPage=${perPage}`;
    
    if (sort) {
      url += `&_sort=${sort}`;
    }
    
    if (status) {
      url += `&taskStatus=${status}`;
    }
    
    const response = await fetch(url, {
      headers: this.headers
    });
    
    if (!response.ok) {
      throw new Error(`Failed to get tasks: ${response.status}`);
    }
    
    return response.json();
  }
  
  async getTask(taskId) {
    const response = await fetch(`${this.baseUrl}/tasks/${taskId}`, {
      headers: this.headers
    });
    
    if (!response.ok) {
      throw new Error(`Failed to get task ${taskId}: ${response.status}`);
    }
    
    return response.json();
  }
  
  async createTask(taskData) {
    const response = await fetch(`${this.baseUrl}/tasks`, {
      method: 'POST',
      headers: this.headers,
      body: JSON.stringify(taskData)
    });
    
    if (!response.ok) {
      throw new Error(`Failed to create task: ${response.status}`);
    }
    
    return response.json();
  }
  
  async updateTask(taskId, updates) {
    const response = await fetch(`${this.baseUrl}/tasks/${taskId}`, {
      method: 'PATCH',
      headers: this.headers,
      body: JSON.stringify(updates)
    });
    
    if (!response.ok) {
      throw new Error(`Failed to update task ${taskId}: ${response.status}`);
    }
    
    return response.json();
  }
  
  async deleteTask(taskId) {
    const response = await fetch(`${this.baseUrl}/tasks/${taskId}`, {
      method: 'DELETE',
      headers: {
        'Authorization': this.headers.Authorization
      }
    });
    
    if (!response.ok) {
      throw new Error(`Failed to delete task ${taskId}: ${response.status}`);
    }
    
    return response.status === 204;
  }
  
  // Task status operations
  async updateTaskStatus(taskId, status) {
    return this.updateTask(taskId, { taskStatus: status });
  }
  
  async completeTask(taskId) {
    return this.updateTaskStatus(taskId, 'COMPLETED');
  }
  
  async startTask(taskId) {
    return this.updateTaskStatus(taskId, 'IN_PROGRESS');
  }
  
  async blockTask(taskId, reason) {
    const task = await this.getTask(taskId);
    
    return this.updateTask(taskId, {
      taskStatus: 'BLOCKED',
      taskDescription: reason ? 
        `${task.taskDescription || ''} BLOCKED: ${reason}`.trim() : 
        task.taskDescription
    });
  }
}

// Usage
const apiClient = new TaskManagementClient('http://localhost:3000', 'your-token-here');

// Example: Create a user and a task
async function createUserAndTask() {
  try {
    // Create a user
    const user = await apiClient.createUser({
      firstName: 'John',
      lastName: 'Doe',
      contactEmail: 'john.doe@example.com'
    });
    
    console.log('User created:', user);
    
    // Create a task for the user
    const task = await apiClient.createTask({
      userId: user.userId,
      taskTitle: 'Complete API integration',
      taskDescription: 'Integrate the Task Management API into our application',
      dueDate: '2025-07-01T12:00:00-05:00',
      warningOffset: 120
    });
    
    console.log('Task created:', task);
    
    // Start the task
    const startedTask = await apiClient.startTask(task.taskId);
    console.log('Task started:', startedTask);
    
    return { user, task: startedTask };
  } catch (error) {
    console.error('Error:', error.message);
    throw error;
  }
}

// Run the example
createUserAndTask()
  .then(result => console.log('Operation completed successfully'))
  .catch(error => console.error('Operation failed'));
```

### Error handling

Example of comprehensive error handling:

```javascript
// Error handling utility for API responses
async function handleApiResponse(response) {
  if (response.ok) {
    return response.status === 204 ? null : await response.json();
  }
  
  // Try to parse error response
  let errorData;
  try {
    errorData = await response.json();
  } catch (e) {
    // If parsing fails, create a generic error object
    errorData = {
      code: 'UNKNOWN_ERROR',
      message: `Request failed with status: ${response.status}`
    };
  }
  
  // Create custom error object
  const error = new Error(errorData.message || 'API request failed');
  error.status = response.status;
  error.code = errorData.code;
  error.details = errorData.details;
  error.requestId = errorData.requestId;
  
  throw error;
}

// Usage example
async function fetchTask(taskId) {
  try {
    const response = await fetch(`http://localhost:3000/tasks/${taskId}`, {
      headers: {
        'Authorization': 'Bearer your-token-here'
      }
    });
    
    return await handleApiResponse(response);
  } catch (error) {
    // Handle specific error types
    if (error.status === 404) {
      console.error(`Task ${taskId} not found`);
      // Handle missing task
    } else if (error.status === 401) {
      console.error('Authentication failed, please log in again');
      // Redirect to login
    } else {
      console.error(`Error fetching task: ${error.message}`);
      // Show generic error message
    }
    
    // Rethrow or return null/default value
    throw error;
  }
}
```

### Working with dates

Helper functions for handling dates and times:

```javascript
// Date utilities for task management
const TaskDateUtils = {
  // Format date for API requests
  formatForApi(date) {
    if (!(date instanceof Date)) {
      date = new Date(date);
    }
    
    return date.toISOString();
  },
  
  // Create a due date a specific number of days in the future
  createDueDate(daysFromNow, hour = 17, minute = 0) {
    const date = new Date();
    date.setDate(date.getDate() + daysFromNow);
    date.setHours(hour, minute, 0, 0);
    
    return date;
  },
  
  // Check if a task is due soon (within the warning period)
  isTaskDueSoon(task) {
    const dueDate = new Date(task.dueDate);
    const now = new Date();
    
    // Calculate warning time (dueDate minus warningOffset minutes)
    const warningTime = new Date(dueDate);
    warningTime.setMinutes(warningTime.getMinutes() - task.warningOffset);
    
    // Task is due soon if current time is after warning time but before due date
    return now >= warningTime && now < dueDate;
  },
  
  // Check if a task is overdue
  isTaskOverdue(task) {
    const dueDate = new Date(task.dueDate);
    const now = new Date();
    
    return now > dueDate && task.taskStatus !== 'COMPLETED' && task.taskStatus !== 'CANCELLED';
  },
  
  // Format due date for display
  formatDueDateForDisplay(task) {
    const dueDate = new Date(task.dueDate);
    const now = new Date();
    const tomorrow = new Date(now);
    tomorrow.setDate(tomorrow.getDate() + 1);
    
    // Today
    if (dueDate.toDateString() === now.toDateString()) {
      return `Today at ${dueDate.toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' })}`;
    }
    
    // Tomorrow
    if (dueDate.toDateString() === tomorrow.toDateString()) {
      return `Tomorrow at ${dueDate.toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' })}`;
    }
    
    // Within 7 days
    const sevenDays = new Date(now);
    sevenDays.setDate(sevenDays.getDate() + 7);
    
    if (dueDate < sevenDays) {
      const options = { weekday: 'long', hour: '2-digit', minute: '2-digit' };
      return dueDate.toLocaleString([], options);
    }
    
    // Default format
    const options = { weekday: 'short', month: 'short', day: 'numeric', hour: '2-digit', minute: '2-digit' };
    return dueDate.toLocaleString([], options);
  }
};

// Usage examples
console.log('API Date:', TaskDateUtils.formatForApi(new Date()));
console.log('Due date (3 days from now at 5 PM):', TaskDateUtils.createDueDate(3));

const task = {
  taskId: 1,
  taskTitle: 'Example Task',
  dueDate: '2025-06-10T17:00:00-05:00',
  warningOffset: 120,
  taskStatus: 'IN_PROGRESS'
};

console.log('Is task due soon?', TaskDateUtils.isTaskDueSoon(task));
console.log('Is task overdue?', TaskDateUtils.isTaskOverdue(task));
console.log('Formatted due date:', TaskDateUtils.formatDueDateForDisplay(task));
```

## Python examples

### API client

A comprehensive API client class for Python applications:

```python
import requests
from datetime import datetime, timedelta
import json

class TaskManagementClient:
    def __init__(self, base_url, token):
        self.base_url = base_url
        self.token = token
        self.headers = {
            'Authorization': f'Bearer {token}',
            'Content-Type': 'application/json'
        }
    
    # User operations
    def get_users(self, page=0, per_page=20, sort=None):
        url = f"{self.base_url}/users?_page={page}&_perPage={per_page}"
        
        if sort:
            url += f"&_sort={sort}"
        
        response = requests.get(url, headers=self.headers)
        response.raise_for_status()
        
        return response.json()
    
    def get_user(self, user_id):
        url = f"{self.base_url}/users/{user_id}"
        response = requests.get(url, headers=self.headers)
        response.raise_for_status()
        
        return response.json()
    
    def create_user(self, user_data):
        url = f"{self.base_url}/users"
        response = requests.post(url, headers=self.headers, json=user_data)
        response.raise_for_status()
        
        return response.json()
    
    def update_user(self, user_id, updates):
        url = f"{self.base_url}/users/{user_id}"
        response = requests.patch(url, headers=self.headers, json=updates)
        response.raise_for_status()
        
        return response.json()
    
    def delete_user(self, user_id):
        url = f"{self.base_url}/users/{user_id}"
        response = requests.delete(url, headers={
            'Authorization': self.headers['Authorization']
        })
        response.raise_for_status()
        
        return response.status_code == 204
    
    # Task operations
    def get_tasks(self, page=0, per_page=20, sort=None, status=None):
        url = f"{self.base_url}/tasks?_page={page}&_perPage={per_page}"
        
        if sort:
            url += f"&_sort={sort}"
        
        if status:
            url += f"&taskStatus={status}"
        
        response = requests.get(url, headers=self.headers)
        response.raise_for_status()
        
        return response.json()
    
    def get_task(self, task_id):
        url = f"{self.base_url}/tasks/{task_id}"
        response = requests.get(url, headers=self.headers)
        response.raise_for_status()
        
        return response.json()
    
    def create_task(self, task_data):
        url = f"{self.base_url}/tasks"
        response = requests.post(url, headers=self.headers, json=task_data)
        response.raise_for_status()
        
        return response.json()
    
    def update_task(self, task_id, updates):
        url = f"{self.base_url}/tasks/{task_id}"
        response = requests.patch(url, headers=self.headers, json=updates)
        response.raise_for_status()
        
        return response.json()
    
    def delete_task(self, task_id):
        url = f"{self.base_url}/tasks/{task_id}"
        response = requests.delete(url, headers={
            'Authorization': self.headers['Authorization']
        })
        response.raise_for_status()
        
        return response.status_code == 204
    
    # Task status operations
    def update_task_status(self, task_id, status):
        return self.update_task(task_id, {'taskStatus': status})
    
    def complete_task(self, task_id):
        return self.update_task_status(task_id, 'COMPLETED')
    
    def start_task(self, task_id):
        return self.update_task_status(task_id, 'IN_PROGRESS')
    
    def block_task(self, task_id, reason=None):
        task = self.get_task(task_id)
        
        updates = {'taskStatus': 'BLOCKED'}
        
        if reason:
            description = task.get('taskDescription', '')
            updates['taskDescription'] = f"{description} BLOCKED: {reason}".strip()
        
        return self.update_task(task_id, updates)

# Usage
api_client = TaskManagementClient('http://localhost:3000', 'your-token-here')

# Example: Create a user and a task
def create_user_and_task():
    try:
        # Create a user
        user = api_client.create_user({
            'firstName': 'John',
            'lastName': 'Doe',
            'contactEmail': 'john.doe@example.com'
        })
        
        print('User created:', user)
        
        # Create a task for the user
        due_date = (datetime.now() + timedelta(days=7)).isoformat()
        
        task = api_client.create_task({
            'userId': user['userId'],
            'taskTitle': 'Complete API integration',
            'taskDescription': 'Integrate the Task Management API into our application',
            'dueDate': due_date,
            'warningOffset': 120
        })
        
        print('Task created:', task)
        
        # Start the task
        started_task = api_client.start_task(task['taskId'])
        print('Task started:', started_task)
        
        return {'user': user, 'task': started_task}
    except requests.exceptions.RequestException as e:
        print('Error:', str(e))
        raise

# Run the example
if __name__ == '__main__':
    try:
        result = create_user_and_task()
        print('Operation completed successfully')
    except Exception as e:
        print('Operation failed:', str(e))
```

### Error handling

Example of error handling with exception classes:

```python
import requests
import json

# Custom exceptions
class ApiError(Exception):
    """Base exception for API errors"""
    
    def __init__(self, message, status_code=None, error_code=None, details=None, request_id=None):
        super().__init__(message)
        self.status_code = status_code
        self.error_code = error_code
        self.details = details
        self.request_id = request_id

class ResourceNotFoundError(ApiError):
    """Raised when a resource is not found (404)"""
    pass

class ValidationError(ApiError):
    """Raised when validation fails (400 with specific error codes)"""
    pass

class AuthenticationError(ApiError):
    """Raised when authentication fails (401)"""
    pass

class AuthorizationError(ApiError):
    """Raised when authorization fails (403)"""
    pass

class RateLimitError(ApiError):
    """Raised when rate limit is exceeded (429)"""
    
    def __init__(self, message, status_code=429, error_code=None, details=None, request_id=None, retry_after=None):
        super().__init__(message, status_code, error_code, details, request_id)
        self.retry_after = retry_after

class ServerError(ApiError):
    """Raised when server error occurs (500)"""
    pass

# Error handler function
def handle_api_response(response):
    """Handle API response and raise appropriate exceptions for errors"""
    
    if response.ok:
        if response.status_code == 204:
            return None
        else:
            return response.json()
    
    # Try to parse error response
    try:
        error_data = response.json()
        error_code = error_data.get('code')
        message = error_data.get('message', f'API request failed with status: {response.status_code}')
        details = error_data.get('details')
        request_id = error_data.get('requestId')
    except (json.JSONDecodeError, ValueError):
        # If parsing fails, create generic error info
        error_code = 'UNKNOWN_ERROR'
        message = f'API request failed with status: {response.status_code}'
        details = None
        request_id = None
    
    # Raise appropriate exception based on status code
    if response.status_code == 404:
        raise ResourceNotFoundError(message, response.status_code, error_code, details, request_id)
    elif response.status_code == 400:
        if error_code in ['INVALID_FIELD', 'MISSING_REQUIRED_FIELD']:
            raise ValidationError(message, response.status_code, error_code, details, request_id)
        else:
            raise ApiError(message, response.status_code, error_code, details, request_id)
    elif response.status_code == 401:
        raise AuthenticationError(message, response.status_code, error_code, details, request_id)
    elif response.status_code == 403:
        raise AuthorizationError(message, response.status_code, error_code, details, request_id)
    elif response.status_code == 429:
        retry_after = response.headers.get('Retry-After')
        if retry_after:
            try:
                retry_after = int(retry_after)
            except ValueError:
                retry_after = None
        
        raise RateLimitError(message, response.status_code, error_code, details, request_id, retry_after)
    elif response.status_code >= 500:
        raise ServerError(message, response.status_code, error_code, details, request_id)
    else:
        raise ApiError(message, response.status_code, error_code, details, request_id)

# Usage example
def fetch_task(task_id):
    try:
        response = requests.get(
            f'http://localhost:3000/tasks/{task_id}',
            headers={'Authorization': 'Bearer your-token-here'}
        )
        
        return handle_api_response(response)
    except ResourceNotFoundError:
        print(f'Task {task_id} not found')
        # Handle missing task
    except AuthenticationError:
        print('Authentication failed, please log in again')
        # Handle authentication failure
    except RateLimitError as e:
        retry_seconds = e.retry_after or 5
        print(f'Rate limit exceeded. Retrying in {retry_seconds} seconds...')
        # Implement retry logic
    except ApiError as e:
        print(f'API error ({e.status_code}): {str(e)}')
        # Handle other API errors
    except Exception as e:
        print(f'Unexpected error: {str(e)}')
        # Handle unexpected errors
    
    # Return None or raise exception based on your error handling strategy
    return None

# Try fetching a task
task = fetch_task(1)
if task:
    print('Task found:', task)
```

### Date utilities

Helper functions for handling dates and times:

```python
from datetime import datetime, timedelta

class TaskDateUtils:
    @staticmethod
    def format_for_api(dt):
        """Format a datetime object for API requests"""
        if isinstance(dt, str):
            # Try to parse string to datetime
            dt = datetime.fromisoformat(dt.replace('Z', '+00:00'))
        
        return dt.isoformat()
    
    @staticmethod
    def create_due_date(days_from_now, hour=17, minute=0):
        """Create a due date a specific number of days in the future"""
        dt = datetime.now() + timedelta(days=days_from_now)
        dt = dt.replace(hour=hour, minute=minute, second=0, microsecond=0)
        
        return dt
    
    @staticmethod
    def is_task_due_soon(task):
        """Check if a task is due soon (within the warning period)"""
        due_date = datetime.fromisoformat(task['dueDate'].replace('Z', '+00:00'))
        now = datetime.now()
        
        # Calculate warning time (dueDate minus warningOffset minutes)
        warning_offset = task.get('warningOffset', 0)
        warning_time = due_date - timedelta(minutes=warning_offset)
        
        # Task is due soon if current time is after warning time but before due date
        return now >= warning_time and now < due_date
    
    @staticmethod
    def is_task_overdue(task):
        """Check if a task is overdue"""
        due_date = datetime.fromisoformat(task['dueDate'].replace('Z', '+00:00'))
        now = datetime.now()
        
        completed_statuses = ['COMPLETED', 'CANCELLED']
        
        return now > due_date and task.get('taskStatus') not in completed_statuses
    
    @staticmethod
    def format_due_date_for_display(task):
        """Format due date for display"""
        due_date = datetime.fromisoformat(task['dueDate'].replace('Z', '+00:00'))
        now = datetime.now()
        tomorrow = now + timedelta(days=1)
        
        # Set time components to midnight for date comparisons
        now_date = now.replace(hour=0, minute=0, second=0, microsecond=0)
        tomorrow_date = tomorrow.replace(hour=0, minute=0, second=0, microsecond=0)
        due_date_day = due_date.replace(hour=0, minute=0, second=0, microsecond=0)
        
        # Today
        if due_date_day == now_date:
            return f"Today at {due_date.strftime('%I:%M %p')}"
        
        # Tomorrow
        if due_date_day == tomorrow_date:
            return f"Tomorrow at {due_date.strftime('%I:%M %p')}"
        
        # Within 7 days
        seven_days = now + timedelta(days=7)
        seven_days_date = seven_days.replace(hour=0, minute=0, second=0, microsecond=0)
        
        if due_date_day < seven_days_date:
            return due_date.strftime('%A at %I:%M %p')
        
        # Default format
        return due_date.strftime('%a, %b %d at %I:%M %p')

# Usage examples
print('API Date:', TaskDateUtils.format_for_api(datetime.now()))
print('Due date (3 days from now at 5 PM):', TaskDateUtils.create_due_date(3))

task = {
    'taskId': 1,
    'taskTitle': 'Example Task',
    'dueDate': '2025-06-10T17:00:00-05:00',
    'warningOffset': 120,
    'taskStatus': 'IN_PROGRESS'
}

print('Is task due soon?', TaskDateUtils.is_task_due_soon(task))
print('Is task overdue?', TaskDateUtils.is_task_overdue(task))
print('Formatted due date:', TaskDateUtils.format_due_date_for_display(task))
```

## cURL examples

### User operations

#### Create a user

```bash
curl -X POST http://localhost:3000/users \
  -H "Authorization: Bearer your-token-here" \
  -H "Content-Type: application/json" \
  -d '{
    "firstName": "John",
    "lastName": "Doe",
    "contactEmail": "john.doe@example.com"
  }'
```

#### Get all users

```bash
curl -X GET "http://localhost:3000/users?_page=0&_perPage=10&_sort=lastName" \
  -H "Authorization: Bearer your-token-here"
```

#### Get a user by ID

```bash
curl -X GET http://localhost:3000/users/1 \
  -H "Authorization: Bearer your-token-here"
```

#### Update a user

```bash
curl -X PATCH http://localhost:3000/users/1 \
  -H "Authorization: Bearer your-token-here" \
  -H "Content-Type: application/json" \
  -d '{
    "contactEmail": "john.updated@example.com"
  }'
```

#### Delete a user

```bash
curl -X DELETE http://localhost:3000/users/1 \
  -H "Authorization: Bearer your-token-here"
```

### Task operations

#### Create a task

```bash
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

#### Get all tasks

```bash
curl -X GET "http://localhost:3000/tasks?_page=0&_perPage=10&_sort=-dueDate&taskStatus=IN_PROGRESS" \
  -H "Authorization: Bearer your-token-here"
```

#### Get a task by ID

```bash
curl -X GET http://localhost:3000/tasks/1 \
  -H "Authorization: Bearer your-token-here"
```

#### Update a task

```bash
curl -X PATCH http://localhost:3000/tasks/1 \
  -H "Authorization: Bearer your-token-here" \
  -H "Content-Type: application/json" \
  -d '{
    "taskStatus": "COMPLETED"
  }'
```

#### Delete a task

```bash
curl -X DELETE http://localhost:3000/tasks/1 \
  -H "Authorization: Bearer your-token-here"
```

### Batch operations script

A shell script to perform batch operations:

```bash
#!/bin/bash

# Configuration
API_URL="http://localhost:3000"
TOKEN="your-token-here"
AUTH_HEADER="Authorization: Bearer $TOKEN"

# Function to create a user
create_user() {
  local first_name=$1
  local last_name=$2
  local email=$3
  
  echo "Creating user: $first_name $last_name ($email)..."
  
  local response=$(curl -s -X POST "$API_URL/users" \
    -H "$AUTH_HEADER" \
    -H "Content-Type: application/json" \
    -d "{
      \"firstName\": \"$first_name\",
      \"lastName\": \"$last_name\",
      \"contactEmail\": \"$email\"
    }")
  
  local user_id=$(echo $response | jq -r '.userId')
  echo "User created with ID: $user_id"
  
  echo $user_id
}

# Function to create a task for user
create_task() {
  local user_id=$1
  local title=$2
  local description=$3
  local due_date=$4
  local warning_offset=$5
  
  echo "Creating task: $title for user $user_id..."
  
  local response=$(curl -s -X POST "$API_URL/tasks" \
    -H "$AUTH_HEADER" \
    -H "Content-Type: application/json" \
    -d "{
      \"userId\": $user_id,
      \"taskTitle\": \"$title\",
      \"taskDescription\": \"$description\",
      \"dueDate\": \"$due_date\",
      \"warningOffset\": $warning_offset
    }")
  
  local task_id=$(echo $response | jq -r '.taskId')
  echo "Task created with ID: $task_id"
  
  echo $task_id
}

# Function to update task status
update_task_status() {
  local task_id=$1
  local status=$2
  
  echo "Updating task $task_id status to $status..."
  
  curl -s -X PATCH "$API_URL/tasks/$task_id" \
    -H "$AUTH_HEADER" \
    -H "Content-Type: application/json" \
    -d "{
      \"taskStatus\": \"$status\"
    }" > /dev/null
  
  echo "Task $task_id status updated to $status"
}

# Create users
echo "=== Creating Users ==="
user1_id=$(create_user "Jane" "Smith" "jane.smith@example.com")
user2_id=$(create_user "John" "Doe" "john.doe@example.com")
echo ""

# Create tasks
echo "=== Creating Tasks ==="

# Create tasks for user 1
task1_id=$(create_task $user1_id "Complete project proposal" "Finish the proposal for the new client project" "2025-06-15T17:00:00-05:00" 120)
task2_id=$(create_task $user1_id "Schedule team meeting" "Set up weekly sync-up with the development team" "2025-06-10T10:00:00-05:00" 60)

# Create tasks for user 2
task3_id=$(create_task $user2_id "Review contract terms" "Go through the contract and identify any potential issues" "2025-06-20T12:00:00-05:00" 120)
task4_id=$(create_task $user2_id "Prepare for client presentation" "Create slides for the upcoming client presentation" "2025-06-25T15:00:00-05:00" 1440)
echo ""

# Update task statuses
echo "=== Updating Task Statuses ==="
update_task_status $task1_id "IN_PROGRESS"
update_task_status $task2_id "COMPLETED"
update_task_status $task3_id "BLOCKED"
echo ""

# Retrieve all tasks
echo "=== Retrieving All Tasks ==="
curl -s -X GET "$API_URL/tasks" \
  -H "$AUTH_HEADER" | jq '.tasks | map({id: .taskId, title: .taskTitle, status: .taskStatus})'
echo ""

echo "Batch operations completed successfully!"
```

## Next steps

After exploring these code examples, you might want to:

1. **Create a client library**: Build a reusable client library for your specific programming language
2. **Implement a UI**: Use these examples as a foundation for a user interface
3. **Integrate with your application**: Adapt these examples to fit your application's architecture
4. **Explore advanced techniques**: Check out the [Advanced topics](../advanced.md) section for more sophisticated implementation patterns

## Related resources

- [API reference](../api-reference.md)
- [Task management workflow](../tutorials/task-management-workflow.md)
- [Optimizing API usage](../advanced/optimizing-api-usage.md)--- FILE: advanced.md ---
---
title: "Advanced Topics"
description: "Advanced considerations for working with the Task Management API, including optimization, security, and data consistency."
tags: ["advanced", "optimization", "security"]
categories: ["advanced"]
importance: 6
has_toc: false
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 20, 2025"
nav_order: "7"
layout: "default"
version: "v1.0.0"
lastUpdated: "May 20, 2025"
---

# Advanced Topics

This section covers advanced considerations for working with the Task Management API. These topics are intended for developers who are already familiar with the API basics and want to optimize their implementation.

## Performance optimization

Performance optimization is critical for providing a responsive user experience. The [Optimizing API usage](advanced/optimizing-api-usage.md) guide covers techniques for reducing latency and minimizing server load:

- Implementing client-side caching
- Using pagination effectively
- Minimizing the number of API requests
- Batch operations best practices

## Security

Security is a crucial aspect of any API integration. The [Security best practices](advanced/security-best-practices.md) guide provides recommendations for keeping your implementation secure:

- Secure token handling
- Authorization best practices
- Input validation
- Handling sensitive data
- Preventing common vulnerabilities

## Data consistency

Maintaining data consistency is important for providing a reliable user experience. The [Handling data consistency](advanced/handling-data-consistency.md) guide covers strategies for dealing with concurrency issues:

- Optimistic vs. pessimistic concurrency control
- Handling race conditions
- Implementing retry logic
- Conflict resolution strategies

## Available advanced guides

| Guide | Description | Key topics |
|-------|-------------|-----------|
| [Optimizing API usage](advanced/optimizing-api-usage.md) | Best practices for efficient API usage | Caching, batching, performance |
| [Security best practices](advanced/security-best-practices.md) | Advanced security considerations | Authentication, authorization, input validation |
| [Handling data consistency](advanced/handling-data-consistency.md) | Strategies for maintaining data consistency | Concurrency, race conditions, conflict resolution |

## Further reading

After exploring these advanced topics, you might want to check out:

- [Developer resources](developer-resources.md) for additional tools and examples
- [API reference](api-reference.md) for detailed endpoint documentation
- [Support resources](support/support-resources.md) if you encounter advanced issues

--- FILE: advanced/optimizing-api-usage.md ---
---
title: "Optimizing API usage"
description: "Best practices for efficient API usage, including caching, batch operations, and performance considerations."
tags: ["optimization", "performance"]
categories: ["advanced"]
importance: 5
parent: "Advanced Topics" 
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 20, 2025"
nav_order: "1"
layout: "default"
version: "v1.0.0"
lastUpdated: "May 20, 2025"
---

# Optimizing API usage

This guide covers best practices for optimizing your use of the Task Management API, helping you create responsive, efficient applications while minimizing server load.

## Understanding API performance factors

Several factors can affect API performance:

1. **Network latency**: The time it takes for data to travel between the client and server
2. **Server processing time**: How long the server takes to process the request
3. **Payload size**: The amount of data transferred in requests and responses
4. **Request frequency**: How often your application makes API calls
5. **Concurrency**: How many simultaneous requests your application makes

Optimization strategies target one or more of these factors.

## Client-side caching

Implementing client-side caching can significantly reduce the number of API requests and improve application responsiveness.

### What to cache

- User data that changes infrequently
- Task lists that don't need real-time updates
- Reference data (e.g., task status values)

### Caching implementation

Here's a simple example of implementing a basic cache in JavaScript:

```javascript
// Simple cache implementation
class ApiCache {
  constructor(ttlInSeconds = 300) {
    this.cache = {};
    this.ttl = ttlInSeconds * 1000; // Convert to milliseconds
  }
  
  set(key, value) {
    this.cache[key] = {
      value,
      timestamp: Date.now()
    };
  }
  
  get(key) {
    const item = this.cache[key];
    if (!item) return null;
    
    // Check if item has expired
    if (Date.now() - item.timestamp > this.ttl) {
      delete this.cache[key];
      return null;
    }
    
    return item.value;
  }
  
  invalidate(key) {
    delete this.cache[key];
  }
  
  clear() {
    this.cache = {};
  }
}

// Usage with the API
const apiCache = new ApiCache(300); // 5-minute cache

async function getUser(userId) {
  const cacheKey = `user-${userId}`;
  
  // Check cache first
  const cachedUser = apiCache.get(cacheKey);
  if (cachedUser) {
    console.log('User data retrieved from cache');
    return cachedUser;
  }
  
  // If not in cache, fetch from API
  const response = await fetch(`http://localhost:3000/users/${userId}`, {
    headers: {
      'Authorization': 'Bearer your-token-here'
    }
  });
  
  if (!response.ok) {
    throw new Error(`Failed to fetch user: ${response.status}`);
  }
  
  const userData = await response.json();
  
  // Store in cache
  apiCache.set(cacheKey, userData);
  
  return userData;
}

// Invalidate cache when user is updated
async function updateUser(userId, updates) {
  const response = await fetch(`http://localhost:3000/users/${userId}`, {
    method: 'PATCH',
    headers: {
      'Authorization': 'Bearer your-token-here',
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(updates)
  });
  
  if (!response.ok) {
    throw new Error(`Failed to update user: ${response.status}`);
  }
  
  const updatedUser = await response.json();
  
  // Invalidate cache after update
  apiCache.invalidate(`user-${userId}`);
  
  return updatedUser;
}
```

### Cache invalidation strategies

To ensure users see the most current data, implement these cache invalidation strategies:

1. **Time-based expiration**: Set an appropriate TTL (time to live) for cached items
2. **Write-through invalidation**: Invalidate cached items when they are modified
3. **Bulk invalidation**: Clear related cache entries when performing batch operations

## Efficient pagination

Proper use of pagination is essential for handling large datasets efficiently.

### Pagination best practices

1. **Use reasonable page sizes**: Request 10-50 items per page for most use cases
2. **Implement cursor-based pagination in UIs**: Only load the next page when needed (e.g., "Load more" button or infinite scroll)
3. **Pre-fetch next page**: For better perceived performance, fetch the next page before the user requests it
4. **Cache paginated results**: Store previous pages to reduce redundant requests

### Implementation example

```javascript
// Paginated task list with caching
class TaskList {
  constructor(pageSize = 20, token) {
    this.pageSize = pageSize;
    this.token = token;
    this.currentPage = 0;
    this.cache = {};
    this.hasMorePages = true;
  }
  
  async getPage(page) {
    // Check cache first
    if (this.cache[page]) {
      return this.cache[page];
    }
    
    const url = `http://localhost:3000/tasks?_page=${page}&_perPage=${this.pageSize}`;
    const response = await fetch(url, {
      headers: {
        'Authorization': `Bearer ${this.token}`
      }
    });
    
    if (!response.ok) {
      throw new Error(`Failed to fetch tasks: ${response.status}`);
    }
    
    const data = await response.json();
    const tasks = data.tasks;
    
    // Update hasMorePages flag
    this.hasMorePages = tasks.length === this.pageSize;
    
    // Cache the result
    this.cache[page] = tasks;
    
    return tasks;
  }
  
  async getNextPage() {
    if (!this.hasMorePages) {
      return [];
    }
    
    const tasks = await this.getPage(this.currentPage);
    this.currentPage++;
    
    // Pre-fetch next page if there might be more
    if (this.hasMorePages) {
      this.prefetchNextPage();
    }
    
    return tasks;
  }
  
  async prefetchNextPage() {
    try {
      await this.getPage(this.currentPage);
    } catch (error) {
      console.error('Error pre-fetching next page:', error);
    }
  }
  
  invalidateCache() {
    this.cache = {};
    this.currentPage = 0;
    this.hasMorePages = true;
  }
}

// Usage
const taskList = new TaskList(20, 'your-token-here');

// Display first page
async function displayTasks() {
  const tasks = await taskList.getNextPage();
  
  if (tasks.length === 0) {
    console.log('No more tasks to display');
    return;
  }
  
  console.log(`Displaying ${tasks.length} tasks`);
  
  // Render tasks in UI
  tasks.forEach(task => {
    console.log(`Task: ${task.taskTitle} (${task.taskStatus})`);
  });
}

// Call when user clicks "Load More" button
async function loadMoreTasks() {
  await displayTasks();
}
```

## Minimizing request frequency

Reducing the number of API requests can significantly improve application performance.

### Strategies to reduce request frequency

1. **Batch related operations**: Combine multiple operations into a single request when possible
2. **Implement debouncing**: Delay API calls when input is rapidly changing (e.g., search fields)
3. **Use optimistic updates**: Update UI immediately before API confirmation for better perceived performance
4. **Poll efficiently**: For real-time updates, use appropriate polling intervals or consider WebSockets if supported

### Debouncing example

```javascript
// Debouncing function for search input
function debounce(func, wait) {
  let timeout;
  
  return function(...args) {
    const context = this;
    clearTimeout(timeout);
    
    timeout = setTimeout(() => {
      func.apply(context, args);
    }, wait);
  };
}

// Usage with search
const searchInput = document.getElementById('search-input');
const searchResults = document.getElementById('search-results');

const searchTasks = async (query) => {
  if (!query || query.length < 2) {
    searchResults.innerHTML = '';
    return;
  }
  
  try {
    // Note: This is a simulated search since the API doesn't have a search endpoint
    // In a real implementation, you would use a search endpoint
    const response = await fetch(`http://localhost:3000/tasks?_sort=dueDate`, {
      headers: {
        'Authorization': 'Bearer your-token-here'
      }
    });
    
    const data = await response.json();
    
    // Client-side filtering (in a real app, the server would handle this)
    const filteredTasks = data.tasks.filter(task => 
      task.taskTitle.toLowerCase().includes(query.toLowerCase()) ||
      task.taskDescription.toLowerCase().includes(query.toLowerCase())
    );
    
    // Update UI with results
    searchResults.innerHTML = filteredTasks.length > 0
      ? filteredTasks.map(task => `<div>${task.taskTitle}</div>`).join('')
      : '<div>No results found</div>';
  } catch (error) {
    console.error('Search failed:', error);
    searchResults.innerHTML = '<div>Search failed. Please try again.</div>';
  }
};

// Debounce the search function with a 300ms delay
const debouncedSearch = debounce(searchTasks, 300);

// Add event listener
searchInput.addEventListener('input', (e) => {
  debouncedSearch(e.target.value);
});
```

## Optimistic updates

Implementing optimistic updates can improve perceived performance by updating the UI immediately before API confirmation.

### Implementation example

```javascript
// Optimistic update for completing a task
async function completeTask(taskId, taskData) {
  // Store original state for rollback
  const originalState = { ...taskData };
  
  try {
    // Update UI immediately (optimistically)
    updateTaskInUI(taskId, {
      ...taskData,
      taskStatus: 'COMPLETED'
    });
    
    // Make API call
    const response = await fetch(`http://localhost:3000/tasks/${taskId}`, {
      method: 'PATCH',
      headers: {
        'Authorization': 'Bearer your-token-here',
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        taskStatus: 'COMPLETED'
      })
    });
    
    if (!response.ok) {
      throw new Error(`Failed to complete task: ${response.status}`);
    }
    
    // Update with actual server response
    const updatedTask = await response.json();
    updateTaskInUI(taskId, updatedTask);
    
    return updatedTask;
  } catch (error) {
    console.error('Error completing task:', error);
    
    // Rollback UI to original state on error
    updateTaskInUI(taskId, originalState);
    
    // Re-throw for caller to handle
    throw error;
  }
}

// Helper function to update task in UI
function updateTaskInUI(taskId, taskData) {
  // This would be implemented based on your UI framework
  console.log(`Updating UI for task ${taskId}:`, taskData);
  
  // Example: Update DOM directly
  const taskElement = document.getElementById(`task-${taskId}`);
  if (taskElement) {
    taskElement.querySelector('.task-status').textContent = taskData.taskStatus;
    taskElement.classList.remove('status-not-started', 'status-in-progress', 'status-completed');
    taskElement.classList.add(`status-${taskData.taskStatus.toLowerCase().replace('_', '-')}`);
  }
}
```

## Handling rate limits

The API implements rate limiting to prevent abuse. Understanding how to handle rate limits is important for optimizing your implementation.

### Best practices for rate limit handling

1. **Implement backoff**: When rate limited, wait before retrying
2. **Distribute requests**: Space out non-urgent requests
3. **Prioritize important operations**: Ensure critical operations succeed even when near rate limits
4. **Monitor usage**: Track your API usage to stay within limits

### Implementation example

```javascript
// API client with rate limit handling
class ApiClient {
  constructor(baseUrl, token) {
    this.baseUrl = baseUrl;
    this.token = token;
    this.retryDelay = 1000; // Start with 1 second delay
    this.maxRetries = 3;
  }
  
  async request(endpoint, options = {}) {
    const url = `${this.baseUrl}${endpoint}`;
    const headers = {
      'Authorization': `Bearer ${this.token}`,
      ...options.headers
    };
    
    if (options.body && typeof options.body === 'object') {
      headers['Content-Type'] = 'application/json';
      options.body = JSON.stringify(options.body);
    }
    
    let retries = 0;
    
    while (retries <= this.maxRetries) {
      try {
        const response = await fetch(url, {
          ...options,
          headers
        });
        
        // Handle rate limiting
        if (response.status === 429) {
          retries++;
          
          // Get retry-after header or use exponential backoff
          const retryAfter = response.headers.get('Retry-After');
          const delay = retryAfter ? parseInt(retryAfter, 10) * 1000 : this.retryDelay * Math.pow(2, retries - 1);
          
          console.log(`Rate limited. Retrying in ${delay / 1000} seconds...`);
          
          // Wait before retrying
          await new Promise(resolve => setTimeout(resolve, delay));
          continue;
        }
        
        // Reset retry delay on success
        this.retryDelay = 1000;
        
        // For successful responses, return JSON or null for 204
        if (response.ok) {
          return response.status === 204 ? null : await response.json();
        }
        
        // Handle other errors
        const error = await response.json();
        throw new Error(error.message || `Request failed with status ${response.status}`);
      } catch (error) {
        if (retries >= this.maxRetries) {
          throw error;
        }
        
        retries++;
        const delay = this.retryDelay * Math.pow(2, retries - 1);
        console.log(`Request failed. Retrying in ${delay / 1000} seconds...`);
        
        await new Promise(resolve => setTimeout(resolve, delay));
      }
    }
  }
  
  // Convenience methods for common operations
  async get(endpoint) {
    return this.request(endpoint);
  }
  
  async post(endpoint, data) {
    return this.request(endpoint, {
      method: 'POST',
      body: data
    });
  }
  
  async patch(endpoint, data) {
    return this.request(endpoint, {
      method: 'PATCH',
      body: data
    });
  }
  
  async delete(endpoint) {
    return this.request(endpoint, {
      method: 'DELETE'
    });
  }
}

// Usage
const api = new ApiClient('http://localhost:3000', 'your-token-here');

async function fetchUser(userId) {
  try {
    return await api.get(`/users/${userId}`);
  } catch (error) {
    console.error(`Failed to fetch user ${userId}:`, error);
    throw error;
  }
}

async function createTask(taskData) {
  try {
    return await api.post('/tasks', taskData);
  } catch (error) {
    console.error('Failed to create task:', error);
    throw error;
  }
}
```

## Performance monitoring

Implementing performance monitoring helps identify bottlenecks and opportunities for optimization.

### What to monitor

1. **Response times**: Track how long API requests take
2. **Error rates**: Monitor failed requests
3. **Cache hit rates**: Measure how effective your caching is
4. **API usage patterns**: Identify frequently used endpoints

### Simple monitoring implementation

```javascript
// API client with performance monitoring
class MonitoredApiClient {
  constructor(baseUrl, token) {
    this.baseUrl = baseUrl;
    this.token = token;
    this.metrics = {
      requests: 0,
      errors: 0,
      totalResponseTime: 0
    };
    
    // Initialize performance data by endpoint
    this.endpointMetrics = {};
  }
  
  async request(endpoint, options = {}) {
    this.metrics.requests++;
    
    // Initialize endpoint metrics if not exists
    if (!this.endpointMetrics[endpoint]) {
      this.endpointMetrics[endpoint] = {
        requests: 0,
        errors: 0,
        totalResponseTime: 0
      };
    }
    
    this.endpointMetrics[endpoint].requests++;
    
    const url = `${this.baseUrl}${endpoint}`;
    const headers = {
      'Authorization': `Bearer ${this.token}`,
      ...options.headers
    };
    
    if (options.body && typeof options.body === 'object') {
      headers['Content-Type'] = 'application/json';
      options.body = JSON.stringify(options.body);
    }
    
    const startTime = performance.now();
    
    try {
      const response = await fetch(url, {
        ...options,
        headers
      });
      
      const responseTime = performance.now() - startTime;
      this.metrics.totalResponseTime += responseTime;
      this.endpointMetrics[endpoint].totalResponseTime += responseTime;
      
      if (!response.ok) {
        this.metrics.errors++;
        this.endpointMetrics[endpoint].errors++;
        
        const error = await response.json();
        throw new Error(error.message || `Request failed with status ${response.status}`);
      }
      
      return response.status === 204 ? null : await response.json();
    } catch (error) {
      this.metrics.errors++;
      this.endpointMetrics[endpoint].errors++;
      throw error;
    }
  }
  
  // Calculate average response time
  getAverageResponseTime() {
    return this.metrics.requests > 0
      ? this.metrics.totalResponseTime / this.metrics.requests
      : 0;
  }
  
  // Calculate error rate
  getErrorRate() {
    return this.metrics.requests > 0
      ? (this.metrics.errors / this.metrics.requests) * 100
      : 0;
  }
  
  // Get metrics for a specific endpoint
  getEndpointMetrics(endpoint) {
    const metrics = this.endpointMetrics[endpoint];
    
    if (!metrics) {
      return null;
    }
    
    return {
      requests: metrics.requests,
      errors: metrics.errors,
      averageResponseTime: metrics.requests > 0
        ? metrics.totalResponseTime / metrics.requests
        : 0,
      errorRate: metrics.requests > 0
        ? (metrics.errors / metrics.requests) * 100
        : 0
    };
  }
  
  // Get all metrics
  getAllMetrics() {
    const endpointStats = {};
    
    for (const [endpoint, metrics] of Object.entries(this.endpointMetrics)) {
      endpointStats[endpoint] = {
        requests: metrics.requests,
        errors: metrics.errors,
        averageResponseTime: metrics.requests > 0
          ? metrics.totalResponseTime / metrics.requests
          : 0,
        errorRate: metrics.requests > 0
          ? (metrics.errors / metrics.requests) * 100
          : 0
      };
    }
    
    return {
      overall: {
        requests: this.metrics.requests,
        errors: this.metrics.errors,
        averageResponseTime: this.getAverageResponseTime(),
        errorRate: this.getErrorRate()
      },
      endpoints: endpointStats
    };
  }
  
  // Convenience methods
  async get(endpoint) {
    return this.request(endpoint);
  }
  
  async post(endpoint, data) {
    return this.request(endpoint, {
      method: 'POST',
      body: data
    });
  }
  
  async patch(endpoint, data) {
    return this.request(endpoint, {
      method: 'PATCH',
      body: data
    });
  }
  
  async delete(endpoint) {
    return this.request(endpoint, {
      method: 'DELETE'
    });
  }
}

// Usage
const api = new MonitoredApiClient('http://localhost:3000', 'your-token-here');

// After making several API calls, get performance metrics
function logPerformanceMetrics() {
  const metrics = api.getAllMetrics();
  console.log('API Performance Metrics:');
  console.log(`Total Requests: ${metrics.overall.requests}`);
  console.log(`Error Rate: ${metrics.overall.errorRate.toFixed(2)}%`);
  console.log(`Average Response Time: ${metrics.overall.averageResponseTime.toFixed(2)}ms`);
  
  console.log('\nEndpoint Performance:');
  for (const [endpoint, stats] of Object.entries(metrics.endpoints)) {
    console.log(`\n${endpoint}:`);
    console.log(`  Requests: ${stats.requests}`);
    console.log(`  Error Rate: ${stats.errorRate.toFixed(2)}%`);
    console.log(`  Average Response Time: ${stats.averageResponseTime.toFixed(2)}ms`);
  }
}
```

## Summary of optimization strategies

| Strategy | Benefits | Implementation complexity |
|----------|----------|---------------------------|
| Client-side caching | Reduces requests, improves responsiveness | Medium |
| Efficient pagination | Handles large datasets, improves load times | Low |
| Request minimization | Reduces server load, improves responsiveness | Medium |
| Optimistic updates | Improves perceived performance | Medium |
| Rate limit handling | Ensures reliability under load | Medium |
| Performance monitoring | Identifies optimization opportunities | Medium |

## Next steps

After implementing these optimization strategies, consider:

1. **Load testing**: Measure your application's performance under heavy load
2. **User experience testing**: Gather feedback on perceived performance
3. **Advanced caching**: Implement more sophisticated caching strategies like LRU (Least Recently Used) caching
4. **Offline capabilities**: Add offline support for critical functionality

## Related resources

- [Task management workflow](../tutorials/task-management-workflow.md)
- [Pagination](../core-concepts/pagination.md)
- [Sorting](../core-concepts/sorting.md)
- [API reference](../api-reference.md)--- FILE: tutorials/task-management-workflow.md ---
---
title: "Task management workflow"
description: "A guide to implementing a complete task management workflow using the API, from creation to completion."
tags: ["tutorial", "tasks", "workflow"]
categories: ["tutorials"]
importance: 6
parent: "Tutorials & Guides" 
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 20, 2025"
nav_order: "2"
layout: "default"
version: "v1.0.0"
lastUpdated: "May 20, 2025"
---

# Task management workflow

This tutorial walks you through implementing a complete task management workflow using the Task Management API. You'll learn how to create, track, update, and complete tasks.

## Prerequisites

Before you begin, make sure you have:

1. A bearer token for authentication
2. Access to the API endpoint (default: `http://localhost:3000`)
3. At least one user in the system (see [Getting started with users](getting-started-with-users.md))
4. A tool for making HTTP requests (cURL, Postman, or code in your preferred language)

## Understanding the task lifecycle

Tasks in the system follow a lifecycle represented by their `taskStatus` value:

1. **NOT_STARTED**: Initial state for new tasks
2. **IN_PROGRESS**: The task is actively being worked on
3. **BLOCKED**: The task cannot proceed due to an external factor
4. **DEFERRED**: The task has been postponed to a later time
5. **COMPLETED**: The task has been finished
6. **CANCELLED**: The task has been cancelled and will not be completed

This tutorial will guide you through moving a task through various stages of this lifecycle.

## Step 1: Create a task

Let's start by creating a new task for a user.

### Request

```javascript
// JavaScript example
const userId = 1; // Replace with an actual user ID

fetch('http://localhost:3000/tasks', {
  method: 'POST',
  headers: {
    'Authorization': 'Bearer your-token-here',
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({
    userId: userId,
    taskTitle: 'Complete project proposal',
    taskDescription: 'Finish the proposal for the new client project',
    dueDate: '2025-06-15T17:00:00-05:00',
    warningOffset: 120 // 2 hours before due date
  })
})
.then(response => response.json())
.then(data => {
  console.log('Task created:', data);
  // Store the taskId for later use
  const taskId = data.taskId;
});
```

```python
# Python example
import requests
from datetime import datetime, timedelta

user_id = 1  # Replace with an actual user ID

# Create a due date 2 weeks from now
due_date = datetime.now() + timedelta(days=14)
due_date_str = due_date.strftime("%Y-%m-%dT%H:%M:%S-05:00")

url = "http://localhost:3000/tasks"
headers = {
    "Authorization": "Bearer your-token-here",
    "Content-Type": "application/json"
}
data = {
    "userId": user_id,
    "taskTitle": "Complete project proposal",
    "taskDescription": "Finish the proposal for the new client project",
    "dueDate": due_date_str,
    "warningOffset": 120  # 2 hours before due date
}

response = requests.post(url, headers=headers, json=data)
task_data = response.json()
print("Task created:", task_data)
# Store the taskId for later use
task_id = task_data["taskId"]
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

Notice that the `taskStatus` is automatically set to `NOT_STARTED` since we didn't specify it in the request.

## Step 2: Start working on the task

Now let's update the task status to indicate that work has begun.

### Request

```javascript
// JavaScript example
const taskId = 1; // Use the ID from the created task

fetch(`http://localhost:3000/tasks/${taskId}`, {
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
.then(data => {
  console.log('Task updated:', data);
});
```

```python
# Python example
import requests

task_id = 1  # Use the ID from the created task
url = f"http://localhost:3000/tasks/{task_id}"
headers = {
    "Authorization": "Bearer your-token-here",
    "Content-Type": "application/json"
}
data = {
    "taskStatus": "IN_PROGRESS"
}

response = requests.patch(url, headers=headers, json=data)
updated_task = response.json()
print("Task updated:", updated_task)
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

## Step 3: Encounter a blocker

Let's simulate encountering a blocker that prevents progress on the task.

### Request

```javascript
// JavaScript example
const taskId = 1;

fetch(`http://localhost:3000/tasks/${taskId}`, {
  method: 'PATCH',
  headers: {
    'Authorization': 'Bearer your-token-here',
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({
    taskStatus: 'BLOCKED',
    taskDescription: 'Finish the proposal for the new client project. BLOCKED: Waiting for client requirements.'
  })
})
.then(response => response.json())
.then(data => {
  console.log('Task blocked:', data);
});
```

```python
# Python example
import requests

task_id = 1
url = f"http://localhost:3000/tasks/{task_id}"
headers = {
    "Authorization": "Bearer your-token-here",
    "Content-Type": "application/json"
}
data = {
    "taskStatus": "BLOCKED",
    "taskDescription": "Finish the proposal for the new client project. BLOCKED: Waiting for client requirements."
}

response = requests.patch(url, headers=headers, json=data)
blocked_task = response.json()
print("Task blocked:", blocked_task)
```

### Response

```json
{
  "taskId": 1,
  "userId": 1,
  "taskTitle": "Complete project proposal",
  "taskDescription": "Finish the proposal for the new client project. BLOCKED: Waiting for client requirements.",
  "taskStatus": "BLOCKED",
  "dueDate": "2025-06-15T17:00:00-05:00",
  "warningOffset": 120
}
```

Notice that we've updated both the `taskStatus` and the `taskDescription` to add information about why the task is blocked.

## Step 4: Resume work on the task

Let's assume the blocker has been resolved, and we can resume work on the task.

### Request

```javascript
// JavaScript example
const taskId = 1;

fetch(`http://localhost:3000/tasks/${taskId}`, {
  method: 'PATCH',
  headers: {
    'Authorization': 'Bearer your-token-here',
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({
    taskStatus: 'IN_PROGRESS',
    taskDescription: 'Finish the proposal for the new client project. Client requirements received.'
  })
})
.then(response => response.json())
.then(data => {
  console.log('Task resumed:', data);
});
```

```python
# Python example
import requests

task_id = 1
url = f"http://localhost:3000/tasks/{task_id}"
headers = {
    "Authorization": "Bearer your-token-here",
    "Content-Type": "application/json"
}
data = {
    "taskStatus": "IN_PROGRESS",
    "taskDescription": "Finish the proposal for the new client project. Client requirements received."
}

response = requests.patch(url, headers=headers, json=data)
resumed_task = response.json()
print("Task resumed:", resumed_task)
```

### Response

```json
{
  "taskId": 1,
  "userId": 1,
  "taskTitle": "Complete project proposal",
  "taskDescription": "Finish the proposal for the new client project. Client requirements received.",
  "taskStatus": "IN_PROGRESS",
  "dueDate": "2025-06-15T17:00:00-05:00",
  "warningOffset": 120
}
```

## Step 5: Complete the task

Now that the work is done, let's mark the task as completed.

### Request

```javascript
// JavaScript example
const taskId = 1;

fetch(`http://localhost:3000/tasks/${taskId}`, {
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
.then(data => {
  console.log('Task completed:', data);
});
```

```python
# Python example
import requests

task_id = 1
url = f"http://localhost:3000/tasks/{task_id}"
headers = {
    "Authorization": "Bearer your-token-here",
    "Content-Type": "application/json"
}
data = {
    "taskStatus": "COMPLETED"
}

response = requests.patch(url, headers=headers, json=data)
completed_task = response.json()
print("Task completed:", completed_task)
```

### Response

```json
{
  "taskId": 1,
  "userId": 1,
  "taskTitle": "Complete project proposal",
  "taskDescription": "Finish the proposal for the new client project. Client requirements received.",
  "taskStatus": "COMPLETED",
  "dueDate": "2025-06-15T17:00:00-05:00",
  "warningOffset": 120
}
```

## Step 6: View task history

Let's retrieve the task to verify its final state.

### Request

```javascript
// JavaScript example
const taskId = 1;

fetch(`http://localhost:3000/tasks/${taskId}`, {
  headers: {
    'Authorization': 'Bearer your-token-here'
  }
})
.then(response => response.json())
.then(data => {
  console.log('Task details:', data);
});
```

```python
# Python example
import requests

task_id = 1
url = f"http://localhost:3000/tasks/{task_id}"
headers = {
    "Authorization": "Bearer your-token-here"
}

response = requests.get(url, headers=headers)
task_details = response.json()
print("Task details:", task_details)
```

### Response

```json
{
  "taskId": 1,
  "userId": 1,
  "taskTitle": "Complete project proposal",
  "taskDescription": "Finish the proposal for the new client project. Client requirements received.",
  "taskStatus": "COMPLETED",
  "dueDate": "2025-06-15T17:00:00-05:00",
  "warningOffset": 120
}
```

## Step 7: Create multiple tasks

In a real-world scenario, you'll likely have multiple tasks at different stages of the workflow. Let's create a few more tasks for our user.

### Request

```javascript
// JavaScript example
async function createMultipleTasks(userId, tasks) {
  const createdTasks = [];
  
  for (const task of tasks) {
    try {
      // Add userId to each task
      const taskWithUserId = {
        ...task,
        userId: userId
      };
      
      const response = await fetch('http://localhost:3000/tasks', {
        method: 'POST',
        headers: {
          'Authorization': 'Bearer your-token-here',
          'Content-Type': 'application/json'
        },
        body: JSON.stringify(taskWithUserId)
      });
      
      if (!response.ok) {
        throw new Error(`Failed to create task: ${task.taskTitle}`);
      }
      
      const taskData = await response.json();
      createdTasks.push(taskData);
      console.log(`Task created: ${taskData.taskTitle} (ID: ${taskData.taskId})`);
    } catch (error) {
      console.error(error);
    }
  }
  
  return createdTasks;
}

// Create multiple tasks with different statuses
const userId = 1;
const tasksToCreate = [
  {
    taskTitle: 'Prepare for client meeting',
    taskDescription: 'Create slides and talking points for the upcoming client presentation',
    taskStatus: 'NOT_STARTED',
    dueDate: '2025-06-20T10:00:00-05:00',
    warningOffset: 60 // 1 hour before
  },
  {
    taskTitle: 'Review contract terms',
    taskDescription: 'Go through the contract and identify any potential issues',
    taskStatus: 'IN_PROGRESS',
    dueDate: '2025-06-10T12:00:00-05:00',
    warningOffset: 120 // 2 hours before
  },
  {
    taskTitle: 'Schedule team retrospective',
    taskDescription: 'Set up a meeting for the team to discuss the project outcomes',
    taskStatus: 'DEFERRED',
    dueDate: '2025-06-30T15:00:00-05:00',
    warningOffset: 1440 // 24 hours before
  }
];

createMultipleTasks(userId, tasksToCreate)
  .then(tasks => {
    console.log(`Created ${tasks.length} tasks successfully`);
  });
```

```python
# Python example
import requests
from datetime import datetime, timedelta

def create_multiple_tasks(token, user_id, tasks):
    created_tasks = []
    
    for task in tasks:
        try:
            # Add userId to each task
            task_with_user_id = task.copy()
            task_with_user_id["userId"] = user_id
            
            url = "http://localhost:3000/tasks"
            headers = {
                "Authorization": f"Bearer {token}",
                "Content-Type": "application/json"
            }
            
            response = requests.post(url, headers=headers, json=task_with_user_id)
            response.raise_for_status()
            
            task_data = response.json()
            created_tasks.append(task_data)
            print(f"Task created: {task_data['taskTitle']} (ID: {task_data['taskId']})")
        except Exception as e:
            print(f"Failed to create task: {task['taskTitle']}")
            print(f"Error: {str(e)}")
    
    return created_tasks

# Helper function to create a future date string
def future_date_str(days_from_now, hour=12, minute=0):
    future_date = datetime.now() + timedelta(days=days_from_now)
    future_date = future_date.replace(hour=hour, minute=minute)
    return future_date.strftime("%Y-%m-%dT%H:%M:%S-05:00")

# Create multiple tasks with different statuses
user_id = 1
tasks_to_create = [
    {
        "taskTitle": "Prepare for client meeting",
        "taskDescription": "Create slides and talking points for the upcoming client presentation",
        "taskStatus": "NOT_STARTED",
        "dueDate": future_date_str(10, 10, 0),  # 10 days from now at 10:00 AM
        "warningOffset": 60  # 1 hour before
    },
    {
        "taskTitle": "Review contract terms",
        "taskDescription": "Go through the contract and identify any potential issues",
        "taskStatus": "IN_PROGRESS",
        "dueDate": future_date_str(5, 12, 0),  # 5 days from now at 12:00 PM
        "warningOffset": 120  # 2 hours before
    },
    {
        "taskTitle": "Schedule team retrospective",
        "taskDescription": "Set up a meeting for the team to discuss the project outcomes",
        "taskStatus": "DEFERRED",
        "dueDate": future_date_str(20, 15, 0),  # 20 days from now at 3:00 PM
        "warningOffset": 1440  # 24 hours before
    }
]

created_tasks = create_multiple_tasks("your-token-here", user_id, tasks_to_create)
print(f"Created {len(created_tasks)} tasks successfully")
```

## Step 8: View all tasks by status

Let's retrieve all tasks for a specific status to see what needs attention.

### Request

```javascript
// JavaScript example
const status = 'IN_PROGRESS';

fetch(`http://localhost:3000/tasks?taskStatus=${status}`, {
  headers: {
    'Authorization': 'Bearer your-token-here'
  }
})
.then(response => response.json())
.then(data => {
  console.log(`Tasks with status ${status}:`, data.tasks);
  console.log(`Found ${data.tasks.length} tasks with status ${status}`);
});
```

```python
# Python example
import requests

status = "IN_PROGRESS"
url = "http://localhost:3000/tasks"
headers = {
    "Authorization": "Bearer your-token-here"
}
params = {
    "taskStatus": status
}

response = requests.get(url, headers=headers, params=params)
data = response.json()
print(f"Tasks with status {status}:", data["tasks"])
print(f"Found {len(data['tasks'])} tasks with status {status}")
```

### Response

```json
{
  "tasks": [
    {
      "taskId": 3,
      "userId": 1,
      "taskTitle": "Review contract terms",
      "taskDescription": "Go through the contract and identify any potential issues",
      "taskStatus": "IN_PROGRESS",
      "dueDate": "2025-06-10T12:00:00-05:00",
      "warningOffset": 120
    }
  ]
}
```

## Step 9: Cancel a task

Sometimes tasks need to be cancelled. Let's cancel one of our tasks.

### Request

```javascript
// JavaScript example
const taskId = 4; // Task "Schedule team retrospective"

fetch(`http://localhost:3000/tasks/${taskId}`, {
  method: 'PATCH',
  headers: {
    'Authorization': 'Bearer your-token-here',
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({
    taskStatus: 'CANCELLED',
    taskDescription: 'Set up a meeting for the team to discuss the project outcomes. CANCELLED: No longer needed as feedback gathered during the project.'
  })
})
.then(response => response.json())
.then(data => {
  console.log('Task cancelled:', data);
});
```

```python
# Python example
import requests

task_id = 4  # Task "Schedule team retrospective"
url = f"http://localhost:3000/tasks/{task_id}"
headers = {
    "Authorization": "Bearer your-token-here",
    "Content-Type": "application/json"
}
data = {
    "taskStatus": "CANCELLED",
    "taskDescription": "Set up a meeting for the team to discuss the project outcomes. CANCELLED: No longer needed as feedback gathered during the project."
}

response = requests.patch(url, headers=headers, json=data)
cancelled_task = response.json()
print("Task cancelled:", cancelled_task)
```

### Response

```json
{
  "taskId": 4,
  "userId": 1,
  "taskTitle": "Schedule team retrospective",
  "taskDescription": "Set up a meeting for the team to discuss the project outcomes. CANCELLED: No longer needed as feedback gathered during the project.",
  "taskStatus": "CANCELLED",
  "dueDate": "2025-06-30T15:00:00-05:00",
  "warningOffset": 1440
}
```

## Step 10: Get tasks sorted by due date

To prioritize work effectively, let's retrieve all tasks sorted by due date (ascending).

### Request

```javascript
// JavaScript example
fetch('http://localhost:3000/tasks?_sort=dueDate', {
  headers: {
    'Authorization': 'Bearer your-token-here'
  }
})
.then(response => response.json())
.then(data => {
  console.log('Tasks sorted by due date:', data.tasks);
  
  // Display tasks in a user-friendly format
  data.tasks.forEach(task => {
    const dueDate = new Date(task.dueDate).toLocaleDateString();
    console.log(`[${task.taskStatus}] ${task.taskTitle} - Due: ${dueDate}`);
  });
});
```

```python
# Python example
import requests
from datetime import datetime

url = "http://localhost:3000/tasks"
headers = {
    "Authorization": "Bearer your-token-here"
}
params = {
    "_sort": "dueDate"
}

response = requests.get(url, headers=headers, params=params)
data = response.json()
print("Tasks sorted by due date:", data["tasks"])

# Display tasks in a user-friendly format
for task in data["tasks"]:
    due_date = datetime.fromisoformat(task["dueDate"].replace("Z", "+00:00"))
    due_date_str = due_date.strftime("%Y-%m-%d")
    print(f"[{task['taskStatus']}] {task['taskTitle']} - Due: {due_date_str}")
```

### Response

```json
{
  "tasks": [
    {
      "taskId": 3,
      "userId": 1,
      "taskTitle": "Review contract terms",
      "taskDescription": "Go through the contract and identify any potential issues",
      "taskStatus": "IN_PROGRESS",
      "dueDate": "2025-06-10T12:00:00-05:00",
      "warningOffset": 120
    },
    {
      "taskId": 1,
      "userId": 1,
      "taskTitle": "Complete project proposal",
      "taskDescription": "Finish the proposal for the new client project. Client requirements received.",
      "taskStatus": "COMPLETED",
      "dueDate": "2025-06-15T17:00:00-05:00",
      "warningOffset": 120
    },
    {
      "taskId": 2,
      "userId": 1,
      "taskTitle": "Prepare for client meeting",
      "taskDescription": "Create slides and talking points for the upcoming client presentation",
      "taskStatus": "NOT_STARTED",
      "dueDate": "2025-06-20T10:00:00-05:00",
      "warningOffset": 60
    },
    {
      "taskId": 4,
      "userId": 1,
      "taskTitle": "Schedule team retrospective",
      "taskDescription": "Set up a meeting for the team to discuss the project outcomes. CANCELLED: No longer needed as feedback gathered during the project.",
      "taskStatus": "CANCELLED",
      "dueDate": "2025-06-30T15:00:00-05:00",
      "warningOffset": 1440
    }
  ]
}
```

## Complete code example

Here's a complete JavaScript example that performs the entire task management workflow:

```javascript
// Complete JavaScript example for task management workflow
async function taskManagementWorkflow() {
  const baseUrl = 'http://localhost:3000';
  const token = 'your-token-here';
  const headers = {
    'Authorization': `Bearer ${token}`,
    'Content-Type': 'application/json'
  };
  const userId = 1; // Replace with an actual user ID
  
  try {
    // Step 1: Create a task
    console.log('Step 1: Creating a task');
    const createResponse = await fetch(`${baseUrl}/tasks`, {
      method: 'POST',
      headers,
      body: JSON.stringify({
        userId: userId,
        taskTitle: 'Complete project proposal',
        taskDescription: 'Finish the proposal for the new client project',
        dueDate: '2025-06-15T17:00:00-05:00',
        warningOffset: 120
      })
    });
    
    if (!createResponse.ok) {
      throw new Error('Failed to create task');
    }
    
    const task = await createResponse.json();
    console.log('Task created:', task);
    const taskId = task.taskId;
    
    // Step 2: Start working on the task
    console.log('\nStep 2: Starting work on the task');
    const startResponse = await fetch(`${baseUrl}/tasks/${taskId}`, {
      method: 'PATCH',
      headers,
      body: JSON.stringify({
        taskStatus: 'IN_PROGRESS'
      })
    });
    
    if (!startResponse.ok) {
      throw new Error(`Failed to update task status to IN_PROGRESS`);
    }
    
    const startedTask = await startResponse.json();
    console.log('Task started:', startedTask);
    
    // Step 3: Encounter a blocker
    console.log('\nStep 3: Encountering a blocker');
    const blockResponse = await fetch(`${baseUrl}/tasks/${taskId}`, {
      method: 'PATCH',
      headers,
      body: JSON.stringify({
        taskStatus: 'BLOCKED',
        taskDescription: 'Finish the proposal for the new client project. BLOCKED: Waiting for client requirements.'
      })
    });
    
    if (!blockResponse.ok) {
      throw new Error(`Failed to update task status to BLOCKED`);
    }
    
    const blockedTask = await blockResponse.json();
    console.log('Task blocked:', blockedTask);
    
    // Step 4: Resume work on the task
    console.log('\nStep 4: Resuming work on the task');
    const resumeResponse = await fetch(`${baseUrl}/tasks/${taskId}`, {
      method: 'PATCH',
      headers,
      body: JSON.stringify({
        taskStatus: 'IN_PROGRESS',
        taskDescription: 'Finish the proposal for the new client project. Client requirements received.'
      })
    });
    
    if (!resumeResponse.ok) {
      throw new Error(`Failed to update task status back to IN_PROGRESS`);
    }
    
    const resumedTask = await resumeResponse.json();
    console.log('Task resumed:', resumedTask);
    
    // Step 5: Complete the task
    console.log('\nStep 5: Completing the task');
    const completeResponse = await fetch(`${baseUrl}/tasks/${taskId}`, {
      method: 'PATCH',
      headers,
      body: JSON.stringify({
        taskStatus: 'COMPLETED'
      })
    });
    
    if (!completeResponse.ok) {
      throw new Error(`Failed to update task status to COMPLETED`);
    }
    
    const completedTask = await completeResponse.json();
    console.log('Task completed:', completedTask);
    
    // Step 6: View task history
    console.log('\nStep 6: Viewing task history');
    const historyResponse = await fetch(`${baseUrl}/tasks/${taskId}`, {
      headers: { 'Authorization': headers.Authorization }
    });
    
    if (!historyResponse.ok) {
      throw new Error(`Failed to get task history`);
    }
    
    const taskHistory = await historyResponse.json();
    console.log('Task history:', taskHistory);
    
    // Step 7: Create multiple tasks
    console.log('\nStep 7: Creating multiple tasks');
    const tasksToCreate = [
      {
        taskTitle: 'Prepare for client meeting',
        taskDescription: 'Create slides and talking points for the upcoming client presentation',
        taskStatus: 'NOT_STARTED',
        dueDate: '2025-06-20T10:00:00-05:00',
        warningOffset: 60
      },
      {
        taskTitle: 'Review contract terms',
        taskDescription: 'Go through the contract and identify any potential issues',
        taskStatus: 'IN_PROGRESS',
        dueDate: '2025-06-10T12:00:00-05:00',
        warningOffset: 120
      },
      {
        taskTitle: 'Schedule team retrospective',
        taskDescription: 'Set up a meeting for the team to discuss the project outcomes',
        taskStatus: 'DEFERRED',
        dueDate: '2025-06-30T15:00:00-05:00',
        warningOffset: 1440
      }
    ];
    
    const createdTasks = [];
    for (const task of tasksToCreate) {
      const response = await fetch(`${baseUrl}/tasks`, {
        method: 'POST',
        headers,
        body: JSON.stringify({
          ...task,
          userId: userId
        })
      });
      
      if (response.ok) {
        const taskData = await response.json();
        createdTasks.push(taskData);
        console.log(`Task created: ${taskData.taskTitle} (ID: ${taskData.taskId})`);
      } else {
        console.error(`Failed to create task: ${task.taskTitle}`);
      }
    }
    
    // Step 8: View all tasks by status
    console.log('\nStep 8: Viewing all tasks by status');
    const status = 'IN_PROGRESS';
    const statusResponse = await fetch(`${baseUrl}/tasks?taskStatus=${status}`, {
      headers: { 'Authorization': headers.Authorization }
    });
    
    if (!statusResponse.ok) {
      throw new Error(`Failed to get tasks by status`);
    }
    
    const statusTasks = await statusResponse.json();
    console.log(`Tasks with status ${status}:`, statusTasks.tasks);
    console.log(`Found ${statusTasks.tasks.length} tasks with status ${status}`);
    
    // Step 9: Cancel a task
    console.log('\nStep 9: Cancelling a task');
    const taskToCancel = createdTasks[2].taskId; // "Schedule team retrospective"
    const cancelResponse = await fetch(`${baseUrl}/tasks/${taskToCancel}`, {
      method: 'PATCH',
      headers,
      body: JSON.stringify({
        taskStatus: 'CANCELLED',
        taskDescription: 'Set up a meeting for the team to discuss the project outcomes. CANCELLED: No longer needed as feedback gathered during the project.'
      })
    });
    
    if (!cancelResponse.ok) {
      throw new Error(`Failed to cancel task`);
    }
    
    const cancelledTask = await cancelResponse.json();
    console.log('Task cancelled:', cancelledTask);
    
    // Step 10: Get tasks sorted by due date
    console.log('\nStep 10: Getting tasks sorted by due date');
    const sortResponse = await fetch(`${baseUrl}/tasks?_sort=dueDate`, {
      headers: { 'Authorization': headers.Authorization }
    });
    
    if (!sortResponse.ok) {
      throw new Error(`Failed to get sorted tasks`);
    }
    
    const sortedTasks = await sortResponse.json();
    console.log('Tasks sorted by due date:');
    
    // Display tasks in a user-friendly format
    sortedTasks.tasks.forEach(task => {
      const dueDate = new Date(task.dueDate).toLocaleDateString();
      console.log(`[${task.taskStatus}] ${task.taskTitle} - Due: ${dueDate}`);
    });
    
    console.log('\nTask management workflow tutorial completed successfully!');
  } catch (error) {
    console.error('Error during tutorial:', error);
  }
}

// Run the workflow
taskManagementWorkflow();
```

## Best practices for task management

1. **Clear task titles**: Create task titles that are concise but descriptive.
2. **Detailed descriptions**: Include enough detail in the description for someone to understand what needs to be done.
3. **Realistic due dates**: Set due dates that allow enough time for completion.
4. **Appropriate warning offsets**: Set warning offsets based on the task's importance and complexity.
5. **Regular status updates**: Update task statuses as they change to keep the system current.
6. **Document blockers**: When a task is blocked, update the description to include why it's blocked.
7. **Prioritize by due date**: Use sorting by due date to focus on the most urgent tasks.
8. **Filter by status**: Use status filtering to create views for different workflow stages.

## Next steps

Now that you've learned the core task management workflow, you can:

1. Build a user interface to visualize and manage tasks
2. Implement reminder notifications using the `warningOffset` field
3. Create custom views for different task statuses
4. Add task prioritization to your workflow
5. Explore the [Implementing reminders](implementing-reminders.md) tutorial to create a reminder system

## Related resources

- [Task resource](../resources/task-resource.md)
- [Task status lifecycle](../core-concepts/task-status-lifecycle.md)
- [API reference: Task endpoints](../api-reference.md#task-endpoints)
- [Getting started with users](getting-started-with-users.md)--- FILE: tutorials.md ---
---
title: "Tutorials & Guides"
description: "Step-by-step tutorials and practical guides for working with the Task Management API."
tags: ["tutorials", "guides", "how-to"]
categories: ["tutorials"]
importance: 7
has_toc: false
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 20, 2025"
nav_order: "6"
layout: "default"
version: "v1.0.0"
lastUpdated: "May 20, 2025"
---

# Tutorials & Guides

This section provides step-by-step tutorials and practical guides to help you quickly start using the Task Management API in common scenarios.

## Getting started tutorials

These tutorials guide you through basic operations with the API:

- [Getting started with users](tutorials/getting-started-with-users.md): Learn how to create, list, update, and delete users
- [Task management workflow](tutorials/task-management-workflow.md): Implement a complete task management workflow from creation to completion

## Implementation guides

These guides help you implement specific features using the API:

- [Implementing reminders](tutorials/implementing-reminders.md): Use the `warningOffset` property to implement a reminder system
- [Integration patterns](tutorials/integration-patterns.md): Common patterns for integrating the API with other systems

## Available tutorials

| Tutorial | Description | Level |
|----------|-------------|-------|
| [Getting started with users](tutorials/getting-started-with-users.md) | Create, list, update, and delete users | Beginner |
| [Task management workflow](tutorials/task-management-workflow.md) | Implement a complete task management workflow | Beginner |
| [Implementing reminders](tutorials/implementing-reminders.md) | Create a reminder system using warningOffset | Intermediate |
| [Integration patterns](tutorials/integration-patterns.md) | Integrate the API with other systems | Advanced |

## Tips for success

- Start with the [Getting started guide](getting-started.md) before diving into specific tutorials
- Understand the [core concepts](core-concepts.md) to make the most of the API
- Reference the [API documentation](api-reference.md) for detailed endpoint information
- Check the [Support & FAQ](support.md) section if you encounter any issues

## Next steps

After working through these tutorials, you might want to explore:

- [Advanced topics](advanced.md): Learn about optimization, security, and data consistency
- [Developer resources](developer-resources.md): Find additional resources like changelogs and tools

--- FILE: tutorials/getting-started-with-users.md ---
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
--- FILE: api-reference/get-task-by-id.md ---
---
title: "Get task by ID"
description: "API endpoint to retrieve a specific task by its unique identifier."
tags: ["tasks", "endpoint", "GET"]
categories: ["api-reference"]
importance: 7
api_endpoints: ["/tasks/{taskId}"]
related_pages: ["task-resource"]
parent: "API Reference" 
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 20, 2025"
nav_order: "9"
layout: "default"
version: "v1.0.0"
lastUpdated: "May 20, 2025"
---

# Get task by ID

Retrieves a specific task by its unique identifier.

## Endpoint

```
GET /tasks/{taskId}
```

## Path parameters

| Parameter | Type | Description | Required |
|-----------|------|-------------|----------|
| `taskId` | integer | The unique identifier of the task to retrieve | Yes |

## Request example

```bash
# cURL example
curl -X GET http://localhost:3000/tasks/1 \
  -H "Authorization: Bearer your-token-here"
```

```python
# Python example
import requests

url = "http://localhost:3000/tasks/1"
headers = {
    "Authorization": "Bearer your-token-here"
}

response = requests.get(url, headers=headers)
print(response.json())
```

```javascript
// JavaScript example
fetch('http://localhost:3000/tasks/1', {
  headers: {
    'Authorization': 'Bearer your-token-here'
  }
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
  "taskStatus": "IN_PROGRESS",
  "dueDate": "2025-06-15T17:00:00-05:00",
  "warningOffset": 120
}
```

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

- The `taskId` must be a valid integer that corresponds to an existing task.
- If the specified task does not exist, the API will return a 404 Not Found response.
- This endpoint returns a single task object, not an array.

## Best practices

- Cache task details when appropriate to reduce API calls.
- Implement proper error handling to deal with cases where the task does not exist.
- Use this endpoint when you need detailed information about a specific task rather than filtering the GET /tasks endpoint.

## Code examples

### Retrieve a task by ID with error handling

```javascript
// JavaScript example: Retrieve a task by ID with error handling
async function getTaskById(taskId) {
  try {
    const response = await fetch(`http://localhost:3000/tasks/${taskId}`, {
      headers: {
        'Authorization': 'Bearer your-token-here'
      }
    });
    
    if (!response.ok) {
      const errorData = await response.json();
      
      if (response.status === 404) {
        throw new Error(`Task with ID ${taskId} not found`);
      }
      
      throw new Error(errorData.message || `Failed to retrieve task with ID ${taskId}`);
    }
    
    return await response.json();
  } catch (error) {
    console.error(`Error retrieving task with ID ${taskId}:`, error);
    throw error;
  }
}

// Usage example
try {
  const task = await getTaskById(1);
  console.log('Task details:', task);
  
  // Check if task is due soon
  const dueDate = new Date(task.dueDate);
  const now = new Date();
  const timeUntilDue = dueDate - now;
  const hoursUntilDue = timeUntilDue / (1000 * 60 * 60);
  
  if (hoursUntilDue < 24) {
    console.log(`Task "${task.taskTitle}" is due in less than 24 hours!`);
  }
} catch (error) {
  console.error('Failed to retrieve task:', error.message);
}
```

```python
# Python example: Retrieve a task by ID with error handling
from datetime import datetime
import requests

def get_task_by_id(token, task_id):
    try:
        url = f"http://localhost:3000/tasks/{task_id}"
        headers = {
            "Authorization": f"Bearer {token}"
        }
        
        response = requests.get(url, headers=headers)
        
        if response.status_code == 404:
            print(f"Task with ID {task_id} not found")
            return None
            
        response.raise_for_status()  # Raise exception for other 4XX/5XX status codes
        
        return response.json()
    except requests.exceptions.HTTPError as e:
        # Handle API errors
        try:
            error_data = e.response.json()
            print(f"API error: {error_data.get('message', str(e))}")
        except ValueError:
            # Could not parse error response as JSON
            print(f"Error retrieving task: {str(e)}")
        return None
    except Exception as e:
        print(f"Error retrieving task: {str(e)}")
        return None

# Usage example
task = get_task_by_id("your-token-here", 1)

if task:
    print(f"Task details: {task}")
    
    # Check if task is due soon
    due_date = datetime.fromisoformat(task["dueDate"].replace("Z", "+00:00"))
    now = datetime.now()
    time_until_due = due_date - now
    hours_until_due = time_until_due.total_seconds() / 3600
    
    if hours_until_due < 24:
        print(f"Task \"{task['taskTitle']}\" is due in less than 24 hours!")
else:
    print("Failed to retrieve task")
```

## Related resources

- [Task resource](../resources/task-resource.md)

## See also

- [Get all tasks](get-all-tasks.md)
- [Create a task](create-task.md)
- [Update a task](update-task.md)
- [Delete a task](delete-task.md)--- FILE: api-reference/create-task.md ---
---
title: "Create a task"
description: "API endpoint to create a new task in the system."
tags: ["tasks", "endpoint", "POST"]
categories: ["api-reference"]
importance: 7
api_endpoints: ["/tasks"]
related_pages: ["task-resource", "task-status-lifecycle"]
parent: "API Reference" 
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 20, 2025"
nav_order: "8"
layout: "default"
version: "v1.0.0"
lastUpdated: "May 20, 2025"
---

# Create a task

Creates a new task in the system. The API generates a unique identifier for the new task.

## Endpoint

```
POST /tasks
```

## Path parameters

None.

## Request body

| Property | Type | Description | Required | Constraints |
|----------|------|-------------|----------|------------|
| `userId` | integer | ID of the user who owns the task | Yes | Must reference a valid user |
| `taskTitle` | string | Short description of the task | Yes | 1-80 characters |
| `taskDescription` | string | Detailed description of the task | No | 1-255 characters |
| `taskStatus` | string | Current status of the task | No | Must be one of the predefined status values |
| `dueDate` | string (date-time) | When the task is due | Yes | ISO 8601 format |
| `warningOffset` | integer | Minutes before due date to send reminder | Yes | 0-64000 |

Example request body:

```json
{
  "userId": 1,
  "taskTitle": "Complete project proposal",
  "taskDescription": "Finish the proposal for the new client project",
  "dueDate": "2025-06-15T17:00:00-05:00",
  "warningOffset": 120
}
```

## Request example

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

## Response

### Success response (201 Created)

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

### Error responses

| Status code | Description | Error code |
|-------------|-------------|------------|
| 400 Bad Request | Invalid request body | `INVALID_FIELD`, `MISSING_REQUIRED_FIELD` |
| 401 Unauthorized | Missing or invalid authentication | `UNAUTHORIZED` |
| 403 Forbidden | Insufficient permissions | `FORBIDDEN` |
| 429 Too Many Requests | Rate limit exceeded | `RATE_LIMIT_EXCEEDED` |
| 500 Server Error | Unexpected server error | `SERVER_ERROR` |

See [Error responses](error-responses.md) for details on error response format.

## Authentication

This endpoint requires authentication using a bearer token:

```
Authorization: Bearer your-token-here
```

## Important considerations

- The `userId` must reference an existing user in the system. If the user doesn't exist, the API will return a 400 Bad Request response.
- The `taskId` is generated by the system and cannot be specified in the request.
- If `taskStatus` is not provided, it defaults to `NOT_STARTED`.
- The `dueDate` should be in the future when creating a task.
- The `dueDate` must be in ISO 8601 format (e.g., `2025-06-15T17:00:00-05:00`).
- The `warningOffset` is used to calculate when reminders should be sent (e.g., 120 minutes before the due date).
- All required fields must be included in the request. If any required field is missing, the API will return a 400 Bad Request response with a `MISSING_REQUIRED_FIELD` error code.
- String fields have minimum and maximum length constraints. If a field value is too short or too long, the API will return a 400 Bad Request response with an `INVALID_FIELD` error code.

## Best practices

- Validate user input on the client side before sending the request to reduce unnecessary API calls.
- Use appropriate task titles that clearly describe the task.
- Set realistic due dates to help users manage their time effectively.
- Choose appropriate warning offsets based on the nature and urgency of the task.
- Handle errors gracefully and provide meaningful feedback to users.

## Code examples

### Create a new task with error handling

```javascript
// JavaScript example: Create a new task with error handling
async function createTask(taskData) {
  try {
    const response = await fetch('http://localhost:3000/tasks', {
      method: 'POST',
      headers: {
        'Authorization': 'Bearer your-token-here',
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(taskData)
    });
    
    if (!response.ok) {
      const errorData = await response.json();
      
      // Handle specific error cases
      if (errorData.code === 'INVALID_FIELD' || errorData.code === 'MISSING_REQUIRED_FIELD') {
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
      
      throw new Error(errorData.message || 'Failed to create task');
    }
    
    return await response.json();
  } catch (error) {
    console.error('Error creating task:', error);
    throw error;
  }
}

// Helper function to format date in ISO 8601 format
function formatDate(date) {
  return date.toISOString();
}

// Usage example
try {
  // Create a due date 2 days from now
  const dueDate = new Date();
  dueDate.setDate(dueDate.getDate() + 2);
  
  const newTask = await createTask({
    userId: 1,
    taskTitle: 'Complete project proposal',
    taskDescription: 'Finish the proposal for the new client project',
    dueDate: formatDate(dueDate),
    warningOffset: 120
  });
  
  console.log('Task created:', newTask);
} catch (error) {
  if (error.fieldErrors) {
    // Handle field-specific errors
    Object.entries(error.fieldErrors).forEach(([field, reason]) => {
      console.error(`Error in ${field}: ${reason}`);
      // Update UI to show error for this field
    });
  } else {
    // Handle general error
    console.error('Failed to create task:', error.message);
  }
}
```

```python
# Python example: Create a new task with error handling
from datetime import datetime, timedelta
import requests

def create_task(token, task_data):
    try:
        url = "http://localhost:3000/tasks"
        headers = {
            "Authorization": f"Bearer {token}",
            "Content-Type": "application/json"
        }
        
        response = requests.post(url, headers=headers, json=task_data)
        response.raise_for_status()  # Raise exception for 4XX/5XX status codes
        
        return response.json()
    except requests.exceptions.HTTPError as e:
        # Handle API errors
        try:
            error_data = e.response.json()
            
            # Handle field-specific errors
            if error_data.get("code") in ["INVALID_FIELD", "MISSING_REQUIRED_FIELD"]:
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
            print(f"Error creating task: {str(e)}")
            return None
    except Exception as e:
        print(f"Error creating task: {str(e)}")
        return None

# Helper function to format date in ISO 8601 format
def format_date(date):
    return date.isoformat()

# Usage example
# Create a due date 2 days from now
due_date = datetime.now() + timedelta(days=2)

new_task = create_task("your-token-here", {
    "userId": 1,
    "taskTitle": "Complete project proposal",
    "taskDescription": "Finish the proposal for the new client project",
    "dueDate": format_date(due_date),
    "warningOffset": 120
})

if new_task:
    print(f"Task created: {new_task}")
else:
    print("Failed to create task")
```

## Related resources

- [Task resource](../resources/task-resource.md)
- [Task status lifecycle](../core-concepts/task-status-lifecycle.md)

## See also

- [Get all tasks](get-all-tasks.md)
- [Get task by ID](get-task-by-id.md)
- [Update a task](update-task.md)
- [Delete a task](delete-task.md)--- FILE: api-reference/get-all-tasks.md ---
---
title: "Get all tasks"
description: "API endpoint to retrieve a list of all tasks with pagination, sorting, and filtering options."
tags: ["tasks", "endpoint", "GET"]
categories: ["api-reference"]
importance: 7
api_endpoints: ["/tasks"]
related_pages: ["task-resource", "pagination", "sorting", "task-status-lifecycle"]
parent: "API Reference" 
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 20, 2025"
nav_order: "7"
layout: "default"
version: "v1.0.0"
lastUpdated: "May 20, 2025"
---

# Get all tasks

Retrieves a list of all tasks in the system. This endpoint supports pagination, sorting, and filtering options to help manage large result sets.

## Endpoint

```
GET /tasks
```

## Path parameters

None.

## Query parameters

| Parameter | Type | Description | Required | Default | Constraints |
|-----------|------|-------------|----------|---------|------------|
| `_page` | integer | Page number (zero-indexed) | No | 0 | Minimum: 0 |
| `_perPage` | integer | Number of items per page | No | 20 | Minimum: 1, Maximum: 100 |
| `_sort` | string | Field to sort by | No | None | Valid fields: `taskId`, `userId`, `taskTitle`, `taskStatus`, `dueDate`, `warningOffset` |
| `taskStatus` | string | Filter tasks by status | No | None | Must be one of the predefined status values |

### Sorting

To sort results in ascending order, specify the field name:
```
GET /tasks?_sort=dueDate
```

To sort results in descending order, prefix the field name with a hyphen:
```
GET /tasks?_sort=-dueDate
```

### Filtering by status

To filter tasks by their status:
```
GET /tasks?taskStatus=IN_PROGRESS
```

Valid status values:
- `NOT_STARTED`
- `IN_PROGRESS`
- `BLOCKED`
- `DEFERRED`
- `COMPLETED`
- `CANCELLED`

## Request example

```bash
# cURL example
curl -X GET "http://localhost:3000/tasks?_page=0&_perPage=10&_sort=-dueDate&taskStatus=IN_PROGRESS" \
  -H "Authorization: Bearer your-token-here"
```

```python
# Python example
import requests

url = "http://localhost:3000/tasks"
headers = {
    "Authorization": "Bearer your-token-here"
}
params = {
    "_page": 0,
    "_perPage": 10,
    "_sort": "-dueDate",
    "taskStatus": "IN_PROGRESS"
}

response = requests.get(url, headers=headers, params=params)
print(response.json())
```

```javascript
// JavaScript example
fetch('http://localhost:3000/tasks?_page=0&_perPage=10&_sort=-dueDate&taskStatus=IN_PROGRESS', {
  headers: {
    'Authorization': 'Bearer your-token-here'
  }
})
.then(response => response.json())
.then(data => console.log(data));
```

## Response

### Success response (200 OK)

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
    },
    {
      "taskId": 2,
      "userId": 1,
      "taskTitle": "Schedule team meeting",
      "taskDescription": "Set up weekly sync-up with the development team",
      "taskStatus": "IN_PROGRESS",
      "dueDate": "2025-06-10T10:00:00-05:00",
      "warningOffset": 60
    }
    // Additional tasks...
  ]
}
```

### Error responses

| Status code | Description | Error code |
|-------------|-------------|------------|
| 400 Bad Request | Invalid query parameters | `INVALID_FIELD` |
| 401 Unauthorized | Missing or invalid authentication | `UNAUTHORIZED` |
| 403 Forbidden | Insufficient permissions | `FORBIDDEN` |
| 429 Too Many Requests | Rate limit exceeded | `RATE_LIMIT_EXCEEDED` |
| 500 Server Error | Unexpected server error | `SERVER_ERROR` |

See [Error responses](error-responses.md) for details on error response format.

## Authentication

This endpoint requires authentication using a bearer token:

```
Authorization: Bearer your-token-here
```

## Important considerations

- The response does not include information about the total number of tasks or pages. Your application should check if the number of returned tasks is less than `_perPage` to determine if you've reached the last page.
- Sorting is case-sensitive. For example, when sorting by `taskTitle`, titles starting with uppercase letters will appear before those starting with lowercase letters.
- When retrieving large sets of tasks, use pagination to improve performance and reduce response payload size.
- The `taskStatus` filter is a strict equality filter. It will only return tasks that exactly match the specified status.

## Best practices

- Use reasonable page sizes (10-50 tasks per page) to balance between number of requests and payload size.
- Implement caching for paginated responses to reduce server load and improve application performance.
- Use the sorting feature to create useful views, such as sorting by due date to show most urgent tasks first.
- Use status filtering to create focused views for different workflow stages.
- Combine sorting and filtering to create highly customized views, such as "Most urgent IN_PROGRESS tasks."

## Code examples

### Fetch all tasks with pagination and filtering

```javascript
// JavaScript example: Fetch all tasks with pagination and filtering
async function getAllTasks(taskStatus) {
  const pageSize = 20;
  let currentPage = 0;
  let allTasks = [];
  let hasMoreTasks = true;
  
  // Build query parameters
  const queryParams = new URLSearchParams({
    _perPage: pageSize
  });
  
  // Add taskStatus filter if provided
  if (taskStatus) {
    queryParams.append('taskStatus', taskStatus);
  }
  
  while (hasMoreTasks) {
    try {
      // Update page for each request
      queryParams.set('_page', currentPage);
      
      const response = await fetch(`http://localhost:3000/tasks?${queryParams.toString()}`, {
        headers: {
          'Authorization': 'Bearer your-token-here'
        }
      });
      
      if (!response.ok) {
        throw new Error(`API error: ${response.status}`);
      }
      
      const data = await response.json();
      const tasks = data.tasks;
      
      if (tasks.length === 0) {
        hasMoreTasks = false;
      } else {
        allTasks = allTasks.concat(tasks);
        currentPage++;
        
        // Check if we received fewer tasks than requested (last page)
        if (tasks.length < pageSize) {
          hasMoreTasks = false;
        }
      }
    } catch (error) {
      console.error('Error fetching tasks:', error);
      hasMoreTasks = false;
    }
  }
  
  return allTasks;
}

// Usage example: Get all in-progress tasks
getAllTasks('IN_PROGRESS')
  .then(tasks => {
    console.log(`Found ${tasks.length} in-progress tasks`);
    console.log(tasks);
  })
  .catch(error => {
    console.error('Failed to retrieve tasks:', error);
  });
```

```python
# Python example: Fetch all tasks with pagination and filtering
def get_all_tasks(token, task_status=None):
    page_size = 20
    current_page = 0
    all_tasks = []
    has_more_tasks = True
    
    # Build query parameters
    params = {
        "_perPage": page_size
    }
    
    # Add taskStatus filter if provided
    if task_status:
        params["taskStatus"] = task_status
    
    while has_more_tasks:
        try:
            # Update page for each request
            params["_page"] = current_page
            
            url = "http://localhost:3000/tasks"
            headers = {"Authorization": f"Bearer {token}"}
            
            response = requests.get(url, headers=headers, params=params)
            response.raise_for_status()
            
            data = response.json()
            tasks = data.get("tasks", [])
            
            if not tasks:
                has_more_tasks = False
            else:
                all_tasks.extend(tasks)
                current_page += 1
                
                # Check if we received fewer tasks than requested (last page)
                if len(tasks) < page_size:
                    has_more_tasks = False
                    
        except Exception as e:
            print(f"Error fetching tasks: {e}")
            has_more_tasks = False
    
    return all_tasks

# Usage example: Get all completed tasks
completed_tasks = get_all_tasks("your-token-here", "COMPLETED")
print(f"Found {len(completed_tasks)} completed tasks")
print(completed_tasks)
```

## Related resources

- [Task resource](../resources/task-resource.md)
- [Pagination](../core-concepts/pagination.md)
- [Sorting](../core-concepts/sorting.md)
- [Task status lifecycle](../core-concepts/task-status-lifecycle.md)

## See also

- [Create a task](create-task.md)
- [Get task by ID](get-task-by-id.md)
- [Update a task](update-task.md)
- [Delete a task](delete-task.md)--- FILE: api-reference/delete-user.md ---
---
title: "Delete a user"
description: "API endpoint to remove a user from the system."
tags: ["users", "endpoint", "DELETE"]
categories: ["api-reference"]
importance: 7
api_endpoints: ["/users/{userId}"]
related_pages: ["user-resource"]
parent: "API Reference" 
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 20, 2025"
nav_order: "6"
layout: "default"
version: "v1.0.0"
lastUpdated: "May 20, 2025"
---

# Delete a user

Removes a user from the system. This operation is irreversible.

## Endpoint

```
DELETE /users/{userId}
```

## Path parameters

| Parameter | Type | Description | Required |
|-----------|------|-------------|----------|
| `userId` | integer | The unique identifier of the user to delete | Yes |

## Request example

```bash
# cURL example
curl -X DELETE http://localhost:3000/users/1 \
  -H "Authorization: Bearer your-token-here"
```

```python
# Python example
import requests

url = "http://localhost:3000/users/1"
headers = {
    "Authorization": "Bearer your-token-here"
}

response = requests.delete(url, headers=headers)
print(response.status_code)
```

```javascript
// JavaScript example
fetch('http://localhost:3000/users/1', {
  method: 'DELETE',
  headers: {
    'Authorization': 'Bearer your-token-here'
  }
})
.then(response => {
  if (response.ok) {
    console.log('User deleted successfully');
  } else {
    throw new Error('Failed to delete user');
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
| 400 Bad Request | Invalid user ID format | `INVALID_FIELD` |
| 401 Unauthorized | Missing or invalid authentication | `UNAUTHORIZED` |
| 403 Forbidden | Insufficient permissions | `FORBIDDEN` |
| 404 Not Found | User not found | `RESOURCE_NOT_FOUND` |
| 429 Too Many Requests | Rate limit exceeded | `RATE_LIMIT_EXCEEDED` |
| 500 Server Error | Unexpected server error | `SERVER_ERROR` |

See [Error responses](error-responses.md) for details on error response format.

## Authentication

This endpoint requires authentication using a bearer token:

```
Authorization: Bearer your-token-here
```

## Important considerations

- This operation is irreversible. Once a user is deleted, it cannot be recovered.
- When a user is deleted, all tasks associated with that user are also deleted (cascade delete).
- The `userId` must be a valid integer that corresponds to an existing user. If the specified user does not exist, the API will return a 404 Not Found response.
- The API will not return a response body on success, only an HTTP 204 status code.

## Best practices

- Implement a confirmation step in your application before sending the delete request to prevent accidental deletions.
- Consider implementing a soft delete mechanism in your application if you need the ability to recover deleted users.
- Update your application's state after a successful deletion to reflect the change.
- Handle the 404 Not Found response gracefully if the user has already been deleted.

## Code examples

### Delete a user with error handling

```javascript
// JavaScript example: Delete a user with error handling
async function deleteUser(userId) {
  try {
    const response = await fetch(`http://localhost:3000/users/${userId}`, {
      method: 'DELETE',
      headers: {
        'Authorization': 'Bearer your-token-here'
      }
    });
    
    if (!response.ok) {
      const errorData = await response.json();
      
      if (response.status === 404) {
        throw new Error(`User with ID ${userId} not found`);
      }
      
      throw new Error(errorData.message || `Failed to delete user with ID ${userId}`);
    }
    
    return true; // Successful deletion
  } catch (error) {
    console.error(`Error deleting user with ID ${userId}:`, error);
    throw error;
  }
}

// Usage example
try {
  const success = await deleteUser(1);
  if (success) {
    console.log('User deleted successfully');
    // Update application state to reflect deletion
  }
} catch (error) {
  console.error('Failed to delete user:', error.message);
}
```

```python
# Python example: Delete a user with error handling
def delete_user(token, user_id):
    try:
        url = f"http://localhost:3000/users/{user_id}"
        headers = {
            "Authorization": f"Bearer {token}"
        }
        
        response = requests.delete(url, headers=headers)
        
        if response.status_code == 204:
            return True  # Successful deletion
        
        if response.status_code == 404:
            print(f"User with ID {user_id} not found")
            return False
            
        # Handle other error responses
        try:
            error_data = response.json()
            print(f"API error: {error_data.get('message', f'Status code: {response.status_code}')}")
        except ValueError:
            # Could not parse error response as JSON
            print(f"Error deleting user. Status code: {response.status_code}")
        
        return False
    except Exception as e:
        print(f"Error deleting user: {str(e)}")
        return False

# Usage example
success = delete_user("your-token-here", 1)

if success:
    print("User deleted successfully")
    # Update application state to reflect deletion
else:
    print("Failed to delete user")
```

## Related resources

- [User resource](../resources/user-resource.md)

## See also

- [Get all users](get-all-users.md)
- [Create a user](create-user.md)
- [Get user by ID](get-user-by-id.md)
- [Update a user](update-user.md)--- FILE: api-reference/update-user.md ---
---
title: "Update a user"
description: "API endpoint to update an existing user's information."
tags: ["users", "endpoint", "PATCH"]
categories: ["api-reference"]
importance: 7
api_endpoints: ["/users/{userId}"]
related_pages: ["user-resource"]
parent: "API Reference" 
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 20, 2025"
nav_order: "5"
layout: "default"
version: "v1.0.0"
lastUpdated: "May 20, 2025"
---

# Update a user

Updates one or more properties of an existing user. The API supports partial updates, so you only need to include the fields you want to change.

## Endpoint

```
PATCH /users/{userId}
```

## Path parameters

| Parameter | Type | Description | Required |
|-----------|------|-------------|----------|
| `userId` | integer | The unique identifier of the user to update | Yes |

## Request body

| Property | Type | Description | Required | Constraints |
|----------|------|-------------|----------|------------|
| `firstName` | string | User's first name | No | 1-100 characters |
| `lastName` | string | User's last name | No | 1-100 characters |
| `contactEmail` | string | User's email address | No | Valid email format, 3-255 characters |

You must include at least one property in the request body.

Example request body:

```json
{
  "contactEmail": "new.email@example.com"
}
```

## Request example

```bash
# cURL example
curl -X PATCH http://localhost:3000/users/1 \
  -H "Authorization: Bearer your-token-here" \
  -H "Content-Type: application/json" \
  -d '{
    "contactEmail": "new.email@example.com"
  }'
```

```python
# Python example
import requests

url = "http://localhost:3000/users/1"
headers = {
    "Authorization": "Bearer your-token-here",
    "Content-Type": "application/json"
}
data = {
    "contactEmail": "new.email@example.com"
}

response = requests.patch(url, headers=headers, json=data)
print(response.json())
```

```javascript
// JavaScript example
fetch('http://localhost:3000/users/1', {
  method: 'PATCH',
  headers: {
    'Authorization': 'Bearer your-token-here',
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({
    contactEmail: 'new.email@example.com'
  })
})
.then(response => response.json())
.then(data => console.log(data));
```

## Response

### Success response (200 OK)

```json
{
  "userId": 1,
  "firstName": "John",
  "lastName": "Doe",
  "contactEmail": "new.email@example.com"
}
```

### Error responses

| Status code | Description | Error code |
|-------------|-------------|------------|
| 400 Bad Request | Invalid request body or user ID | `INVALID_FIELD` |
| 401 Unauthorized | Missing or invalid authentication | `UNAUTHORIZED` |
| 403 Forbidden | Insufficient permissions | `FORBIDDEN` |
| 404 Not Found | User not found | `RESOURCE_NOT_FOUND` |
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
- The `userId` must be a valid integer that corresponds to an existing user. If the specified user does not exist, the API will return a 404 Not Found response.
- The `contactEmail` must be unique across all users in the system. If you attempt to update a user with an email that already exists for another user, the API will return a 400 Bad Request response.
- String fields have minimum and maximum length constraints. If a field value is too short or too long, the API will return a 400 Bad Request response with an `INVALID_FIELD` error code.
- The `contactEmail` field must contain a valid email address. If the email format is invalid, the API will return a 400 Bad Request response with an `INVALID_FIELD` error code.
- The response includes the complete user object with all properties, including those that weren't updated.

## Best practices

- Only include the fields you want to update in the request body to minimize payload size.
- Validate user input on the client side before sending the request to reduce unnecessary API calls.
- Handle unique email constraints by checking if the email already exists before updating a user.
- Use proper error handling to provide meaningful feedback to users when their input is invalid.
- Consider implementing optimistic updates in your UI to improve perceived performance.

## Code examples

### Update a user with error handling

```javascript
// JavaScript example: Update a user with error handling
async function updateUser(userId, userData) {
  try {
    const response = await fetch(`http://localhost:3000/users/${userId}`, {
      method: 'PATCH',
      headers: {
        'Authorization': 'Bearer your-token-here',
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(userData)
    });
    
    if (!response.ok) {
      const errorData = await response.json();
      
      // Handle specific error cases
      if (errorData.code === 'RESOURCE_NOT_FOUND') {
        throw new Error(`User with ID ${userId} not found`);
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
      
      throw new Error(errorData.message || `Failed to update user with ID ${userId}`);
    }
    
    return await response.json();
  } catch (error) {
    console.error(`Error updating user with ID ${userId}:`, error);
    throw error;
  }
}

// Usage example
try {
  const updatedUser = await updateUser(1, {
    contactEmail: 'new.email@example.com'
  });
  console.log('User updated:', updatedUser);
} catch (error) {
  if (error.fieldErrors) {
    // Handle field-specific errors
    Object.entries(error.fieldErrors).forEach(([field, reason]) => {
      console.error(`Error in ${field}: ${reason}`);
      // Update UI to show error for this field
    });
  } else {
    // Handle general error
    console.error('Failed to update user:', error.message);
  }
}
```

```python
# Python example: Update a user with error handling
def update_user(token, user_id, user_data):
    try:
        url = f"http://localhost:3000/users/{user_id}"
        headers = {
            "Authorization": f"Bearer {token}",
            "Content-Type": "application/json"
        }
        
        response = requests.patch(url, headers=headers, json=user_data)
        
        if response.status_code == 404:
            print(f"User with ID {user_id} not found")
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
            print(f"Error updating user: {str(e)}")
            return None
    except Exception as e:
        print(f"Error updating user: {str(e)}")
        return None

# Usage example
updated_user = update_user("your-token-here", 1, {
    "contactEmail": "new.email@example.com"
})

if updated_user:
    print(f"User updated: {updated_user}")
else:
    print("Failed to update user")
```

## Related resources

- [User resource](../resources/user-resource.md)

## See also

- [Get all users](get-all-users.md)
- [Create a user](create-user.md)
- [Get user by ID](get-user-by-id.md)
- [Delete a user](delete-user.md)--- FILE: api-reference/get-user-by-id.md ---
---
title: "Get user by ID"
description: "API endpoint to retrieve a specific user by their unique identifier."
tags: ["users", "endpoint", "GET"]
categories: ["api-reference"]
importance: 7
api_endpoints: ["/users/{userId}"]
related_pages: ["user-resource"]
parent: "API Reference" 
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 20, 2025"
nav_order: "4"
layout: "default"
version: "v1.0.0"
lastUpdated: "May 20, 2025"
---

# Get user by ID

Retrieves a specific user by their unique identifier.

## Endpoint

```
GET /users/{userId}
```

## Path parameters

| Parameter | Type | Description | Required |
|-----------|------|-------------|----------|
| `userId` | integer | The unique identifier of the user to retrieve | Yes |

## Request example

```bash
# cURL example
curl -X GET http://localhost:3000/users/1 \
  -H "Authorization: Bearer your-token-here"
```

```python
# Python example
import requests

url = "http://localhost:3000/users/1"
headers = {
    "Authorization": "Bearer your-token-here"
}

response = requests.get(url, headers=headers)
print(response.json())
```

```javascript
// JavaScript example
fetch('http://localhost:3000/users/1', {
  headers: {
    'Authorization': 'Bearer your-token-here'
  }
})
.then(response => response.json())
.then(data => console.log(data));
```

## Response

### Success response (200 OK)

```json
{
  "userId": 1,
  "firstName": "John",
  "lastName": "Doe",
  "contactEmail": "john.doe@example.com"
}
```

### Error responses

| Status code | Description | Error code |
|-------------|-------------|------------|
| 400 Bad Request | Invalid user ID format | `INVALID_FIELD` |
| 401 Unauthorized | Missing or invalid authentication | `UNAUTHORIZED` |
| 403 Forbidden | Insufficient permissions | `FORBIDDEN` |
| 404 Not Found | User not found | `RESOURCE_NOT_FOUND` |
| 429 Too Many Requests | Rate limit exceeded | `RATE_LIMIT_EXCEEDED` |
| 500 Server Error | Unexpected server error | `SERVER_ERROR` |

See [Error responses](error-responses.md) for details on error response format.

## Authentication

This endpoint requires authentication using a bearer token:

```
Authorization: Bearer your-token-here
```

## Important considerations

- The `userId` must be a valid integer that corresponds to an existing user.
- If the specified user does not exist, the API will return a 404 Not Found response.
- This endpoint returns a single user object, not an array.

## Best practices

- Cache user details when appropriate to reduce API calls.
- Implement proper error handling to deal with cases where the user does not exist.
- Use this endpoint when you need detailed information about a specific user rather than filtering the GET /users endpoint.

## Code examples

### Retrieve a user by ID with error handling

```javascript
// JavaScript example: Retrieve a user by ID with error handling
async function getUserById(userId) {
  try {
    const response = await fetch(`http://localhost:3000/users/${userId}`, {
      headers: {
        'Authorization': 'Bearer your-token-here'
      }
    });
    
    if (!response.ok) {
      const errorData = await response.json();
      
      if (response.status === 404) {
        throw new Error(`User with ID ${userId} not found`);
      }
      
      throw new Error(errorData.message || `Failed to retrieve user with ID ${userId}`);
    }
    
    return await response.json();
  } catch (error) {
    console.error(`Error retrieving user with ID ${userId}:`, error);
    throw error;
  }
}

// Usage example
try {
  const user = await getUserById(1);
  console.log('User details:', user);
} catch (error) {
  console.error('Failed to retrieve user:', error.message);
}
```

```python
# Python example: Retrieve a user by ID with error handling
def get_user_by_id(token, user_id):
    try:
        url = f"http://localhost:3000/users/{user_id}"
        headers = {
            "Authorization": f"Bearer {token}"
        }
        
        response = requests.get(url, headers=headers)
        
        if response.status_code == 404:
            print(f"User with ID {user_id} not found")
            return None
            
        response.raise_for_status()  # Raise exception for other 4XX/5XX status codes
        
        return response.json()
    except requests.exceptions.HTTPError as e:
        # Handle API errors
        try:
            error_data = e.response.json()
            print(f"API error: {error_data.get('message', str(e))}")
        except ValueError:
            # Could not parse error response as JSON
            print(f"Error retrieving user: {str(e)}")
        return None
    except Exception as e:
        print(f"Error retrieving user: {str(e)}")
        return None

# Usage example
user = get_user_by_id("your-token-here", 1)

if user:
    print(f"User details: {user}")
else:
    print("Failed to retrieve user")
```

## Related resources

- [User resource](../resources/user-resource.md)

## See also

- [Get all users](get-all-users.md)
- [Create a user](create-user.md)
- [Update a user](update-user.md)
- [Delete a user](delete-user.md)--- FILE: index.md ---
---
title: "Task Management API Documentation"
description: "Comprehensive guide to the Task Management API, including usage, endpoints, and best practices."
tags: ["API", "documentation", "task management"]
categories: ["overview"]
importance: 10
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 20, 2025"
nav_exclude: true
layout: "default"
version: "v1.0.0"
lastUpdated: "May 20, 2025"
---

# Task Management API Documentation

Welcome to the Task Management API documentation. This API provides a comprehensive solution for managing to-do tasks and users in your applications.

## What is the Task Management API?

The Task Management API is a RESTful service that enables you to create, read, update, and delete tasks and users. It's designed to help you build task management features into your applications with minimal effort.

## Key features

- **User management**: Create and manage user accounts
- **Task management**: Create and manage to-do tasks with due dates and reminders
- **Task statuses**: Track task progress with predefined status values
- **Pagination**: Navigate through large collections of resources
- **Sorting**: Order resources based on specific fields
- **Filtering**: Filter tasks by status

## Getting started

If you're new to the Task Management API, we recommend starting with the following resources:

- [Getting started guide](getting-started.md): Learn how to set up and make your first API request
- [Core concepts](core-concepts.md): Understand the fundamental concepts of the API
- [API reference](api-reference.md): Explore the complete API reference documentation

## Resource overview

The API provides access to two main resources:

- **Users**: Represent individuals who can create and manage tasks
- **Tasks**: Represent to-do items with titles, descriptions, due dates, and statuses

## Authentication

All API requests require authentication using bearer tokens. Learn more in the [authentication guide](getting-started/authentication.md).

## Support

If you need help using the API, check out the [support resources](support.md) or visit the [FAQ](support/faq.md).

--- FILE: getting-started.md ---
---
title: "Getting Started with the Task Management API"
description: "Introduction to getting started with the Task Management API, including setup, authentication, and basic concepts."
tags: ["introduction", "overview", "getting-started"]
categories: ["getting-started"]
importance: 10
has_toc: false
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 20, 2025"
nav_order: "2"
layout: "default"
version: "v1.0.0"
lastUpdated: "May 20, 2025"
---

# Getting Started with the Task Management API

This guide will help you start using the Task Management API to create and manage tasks in your applications.

## Overview

The Task Management API is a RESTful service that allows you to:

- Create and manage user accounts
- Create and track to-do tasks
- Update task statuses as they progress
- Set due dates and reminders for tasks

## Base URL

All API endpoints are relative to the base URL:

```

```python
# Python example: Create a new user with error handling
def create_user(token, user_data):
    try:
        url = "http://localhost:3000/users"
        headers = {
            "Authorization": f"Bearer {token}",
            "Content-Type": "application/json"
        }
        
        response = requests.post(url, headers=headers, json=user_data)
        response.raise_for_status()  # Raise exception for 4XX/5XX status codes
        
        return response.json()
    except requests.exceptions.HTTPError as e:
        # Handle API errors
        try:
            error_data = e.response.json()
            
            # Handle field-specific errors
            if error_data.get("code") in ["INVALID_FIELD", "MISSING_REQUIRED_FIELD"]:
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
            print(f"Error creating user: {str(e)}")
            return None
    except Exception as e:
        print(f"Error creating user: {str(e)}")
        return None

# Usage example
new_user = create_user("your-token-here", {
    "firstName": "John",
    "lastName": "Doe",
    "contactEmail": "john.doe@example.com"
})

if new_user:
    print(f"User created: {new_user}")
```

## Related resources

- [User resource](../resources/user-resource.md)

## See also

- [Get all users](get-all-users.md)
- [Get user by ID](get-user-by-id.md)
- [Update a user](update-user.md)
- [Delete a user](delete-user.md)
http://localhost:3000
```

This is intended for development and testing. For production use, your API provider will supply the appropriate base URL.

## Authentication

All API requests require authentication using bearer tokens. See the [authentication guide](getting-started/authentication.md) for detailed instructions.

## Making your first request

Follow these steps to make your first API request:

1. Authenticate and obtain a bearer token
2. Create a user
3. Create a task for that user
4. Retrieve the task details

Let's walk through each step.

### Step 1: Authenticate

Include your bearer token in the Authorization header of each request:

```
Authorization: Bearer your-token-here
```

### Step 2: Create a user

Send a POST request to the `/users` endpoint with the required user information:

```javascript
// JavaScript example: Create a new user with error handling
async function createUser(userData) {
  try {
    const response = await fetch('http://localhost:3000/users', {
      method: 'POST',
      headers: {
        'Authorization': 'Bearer your-token-here',
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(userData)
    });
    
    if (!response.ok) {
      const errorData = await response.json();
      
      // Handle specific error cases
      if (errorData.code === 'INVALID_FIELD' || errorData.code === 'MISSING_REQUIRED_FIELD') {
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
      
      throw new Error(errorData.message || 'Failed to create user');
    }
    
    return await response.json();
  } catch (error) {
    console.error('Error creating user:', error);
    throw error;
  }
}

// Usage example
try {
  const newUser = await createUser({
    firstName: 'John',
    lastName: 'Doe',
    contactEmail: 'john.doe@example.com'
  });
  console.log('User created:', newUser);
} catch (error) {
  if (error.fieldErrors) {
    // Handle field-specific errors
    Object.entries(error.fieldErrors).forEach(([field, reason]) => {
      console.error(`Error in ${field}: ${reason}`);
      // Update UI to show error for this field
    });
  } else {
    // Handle general error
    console.error('Failed to create user:', error.message);
  }
} example
fetch('http://localhost:3000/users', {
  method: 'POST',
  headers: {
    'Authorization': 'Bearer your-token-here',
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({
    firstName: 'John',
    lastName: 'Doe',
    contactEmail: 'john.doe@example.com'
  })
})
.then(response => response.json())
.then(data => console.log(data));
```

### Step 3: Create a task

Use the user ID from the previous response to create a task:

```javascript
// JavaScript example
fetch('http://localhost:3000/tasks', {
  method: 'POST',
  headers: {
    'Authorization': 'Bearer your-token-here',
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({
    userId: 1, // Use the actual userId from the previous response
    taskTitle: 'Complete API integration',
    taskDescription: 'Integrate the Task Management API into our application',
    dueDate: '2025-06-01T12:00:00-05:00',
    warningOffset: 60 // 60 minutes before due date
  })
})
.then(response => response.json())
.then(data => console.log(data));
```

### Step 4: Retrieve the task

Use the task ID from the previous response to retrieve the task details:

```javascript
// JavaScript example
fetch('http://localhost:3000/tasks/1', { // Use the actual taskId
  headers: {
    'Authorization': 'Bearer your-token-here'
  }
})
.then(response => response.json())
.then(data => console.log(data));
```

## Next steps

Now that you've made your first API requests, explore these resources to learn more:

- [User resource](resources/user-resource.md): Learn about user properties and operations
- [Task resource](resources/task-resource.md): Learn about task properties and operations
- [Core concepts](core-concepts.md): Understand pagination, sorting, and other key concepts
- [API reference](api-reference.md): Explore the complete API reference documentation

--- FILE: getting-started/introduction.md ---
---
title: "Introduction to the Task Management API"
description: "Overview of the Task Management API capabilities, features, and use cases."
tags: ["introduction", "overview"]
categories: ["getting-started"]
importance: 10
parent: "Getting Started"
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 20, 2025"
nav_order: "1"
layout: "default"
version: "v1.0.0"
lastUpdated: "May 20, 2025"
---

# Introduction to the Task Management API

The Task Management API provides a comprehensive set of endpoints for creating and managing to-do tasks and users. This API enables developers to build task management features into their applications with minimal effort.

## Capabilities

The Task Management API offers the following capabilities:

- **User management**: Create, retrieve, update, and delete user accounts
- **Task management**: Create, retrieve, update, and delete to-do tasks
- **Task lifecycle**: Track task progress through various statuses
- **Reminders**: Set warning offsets to trigger reminders before due dates
- **Pagination**: Navigate through large collections of resources
- **Sorting**: Order resources based on specific fields
- **Filtering**: Filter tasks by status

## Key features

### User management

The API provides endpoints for managing user accounts, including:

- Creating new users with first name, last name, and contact email
- Retrieving user information by ID
- Updating user information
- Deleting user accounts

### Task management

The API provides endpoints for managing tasks, including:

- Creating new tasks with titles, descriptions, due dates, and warning offsets
- Retrieving task information by ID
- Updating task information, including status changes
- Deleting tasks

### Task lifecycle

Tasks can have one of the following statuses:

- NOT_STARTED: The task has not been started yet
- IN_PROGRESS: The task is currently being worked on
- BLOCKED: The task cannot proceed due to an external factor
- DEFERRED: The task has been postponed to a later time
- COMPLETED: The task has been finished
- CANCELLED: The task has been cancelled and will not be completed

### Reminders

The API supports setting a warning offset (in minutes) before a task's due date. This can be used to implement reminder functionality in your application.

## Use cases

The Task Management API can be used for a variety of applications, including:

- Personal to-do list applications
- Team task management systems
- Project management tools
- Calendar and scheduling applications
- Reminder and notification systems

## API structure

The API is organized around two primary resources:

- **Users**: Individuals who can create and manage tasks
- **Tasks**: To-do items with titles, descriptions, due dates, and statuses

Each resource supports standard CRUD operations (Create, Read, Update, Delete) via RESTful endpoints.

## Next steps

- [Quick start guide](quickstart.md): Get up and running in minutes
- [Authentication](authentication.md): Learn how to authenticate your API requests
- [Core concepts](../core-concepts.md): Understand the fundamental concepts of the API

--- FILE: getting-started/quickstart.md ---
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

--- FILE: getting-started/authentication.md ---
---
title: "Authentication"
description: "Learn how to authenticate your requests to the Task Management API using bearer tokens."
tags: ["authentication", "security", "bearer token"]
categories: ["getting-started"]
importance: 8
parent: "Getting Started"
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 20, 2025"
nav_order: "3"
layout: "default"
version: "v1.0.0"
lastUpdated: "May 20, 2025"
---

# Authentication

The Task Management API uses bearer token authentication to secure all endpoints. This guide explains how to authenticate your requests.

## Bearer token authentication

Bearer token authentication is a simple HTTP authentication scheme that uses security tokens called "bearer tokens." The bearer token is a cryptic string, usually generated by the server in response to a login request. The client must send this token in the Authorization header when making requests to protected resources.

## Authentication header

For all API requests, include the bearer token in the Authorization header:

```
Authorization: Bearer your-token-here
```

Replace `your-token-here` with your actual bearer token.

## Example request with authentication

Here's an example of making an authenticated request to get all users:

```bash
# cURL example
curl -X GET http://localhost:3000/users \
  -H "Authorization: Bearer your-token-here"
```

```python
# Python example
import requests

url = "http://localhost:3000/users"
headers = {
    "Authorization": "Bearer your-token-here"
}

response = requests.get(url, headers=headers)
print(response.json())
```

```javascript
// JavaScript example
fetch('http://localhost:3000/users', {
  headers: {
    'Authorization': 'Bearer your-token-here'
  }
})
.then(response => response.json())
.then(data => console.log(data));
```

## Authentication errors

If you don't include a valid token, the API will respond with one of these errors:

### Missing authentication

If you don't include an Authorization header, you'll receive a `401 Unauthorized` response:

```json
{
  "code": "UNAUTHORIZED",
  "message": "Authentication is required to access this resource",
  "requestId": "req-f8d31a62-e789-4856-9452-5efa50223c7a"
}
```

### Invalid token

If you include an invalid or expired token, you'll receive a `401 Unauthorized` response:

```json
{
  "code": "UNAUTHORIZED",
  "message": "Authentication is required to access this resource",
  "requestId": "req-f8d31a62-e789-4856-9452-5efa50223c7a"
}
```

### Insufficient permissions

If your token is valid but doesn't have permission to access a specific resource, you'll receive a `403 Forbidden` response:

```json
{
  "code": "FORBIDDEN",
  "message": "You do not have permission to access this resource",
  "requestId": "req-f8d31a62-e789-4856-9452-5efa50223c7a"
}
```

## Best practices

1. Store tokens securely and never expose them in client-side code or URLs
2. Implement token refresh mechanisms for long-lived applications
3. Always use HTTPS to prevent token interception
4. Revoke tokens when they're no longer needed

## Next steps

- Learn about [rate limiting](rate-limiting.md)
- Explore the [API reference](../api-reference.md)
- Check out the [user resource](../resources/user-resource.md) endpoints

--- FILE: core-concepts.md ---
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

--- FILE: core-concepts/data-model.md ---
---
title: "Data model"
description: "Overview of the core resources in the Task Management API and their relationships."
tags: ["data model", "resources", "schema"]
categories: ["core-concepts"]
importance: 9
parent: "Core Concepts"
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 20, 2025"
nav_order: "1"
layout: "default"
version: "v1.0.0"
lastUpdated: "May 20, 2025"
---

# Data model

The Task Management API is built around two main resources: Users and Tasks. This page provides an overview of these resources and their relationships.

## Resource relationships

The relationship between Users and Tasks is a one-to-many relationship:

- A User can have multiple Tasks
- Each Task belongs to exactly one User

This relationship is enforced by the `userId` field on the Task resource, which references the User who owns the task.

## User resource

The User resource represents an individual who can create and manage tasks in the system.

### Properties

| Property | Type | Description | Required | Constraints |
|----------|------|-------------|----------|------------|
| userId | integer | Unique identifier for the user | Yes (generated) | Generated by the API |
| firstName | string | User's first name | Yes | 1-100 characters |
| lastName | string | User's last name | Yes | 1-100 characters |
| contactEmail | string | User's email address | Yes | Valid email format, 3-255 characters |

For more details, see the [User resource](../resources/user-resource.md) documentation.

## Task resource

The Task resource represents a to-do item that belongs to a user.

### Properties

| Property | Type | Description | Required | Constraints |
|----------|------|-------------|----------|------------|
| taskId | integer | Unique identifier for the task | Yes (generated) | Generated by the API |
| userId | integer | ID of the user who owns the task | Yes | Must reference a valid user |
| taskTitle | string | Short description of the task | Yes | 1-80 characters |
| taskDescription | string | Detailed description of the task | No | 1-255 characters |
| taskStatus | string | Current status of the task | Yes (default: NOT_STARTED) | Must be one of the predefined status values |
| dueDate | string (date-time) | When the task is due | Yes | ISO 8601 format |
| warningOffset | integer | Minutes before due date to send reminder | Yes | 0-64000 |

For more details, see the [Task resource](../resources/task-resource.md) documentation.

## Task status values

The `taskStatus` field can have one of the following values:

- NOT_STARTED: The task has not been started yet
- IN_PROGRESS: The task is currently being worked on
- BLOCKED: The task cannot proceed due to an external factor
- DEFERRED: The task has been postponed to a later time
- COMPLETED: The task has been finished
- CANCELLED: The task has been cancelled and will not be completed

For more details on task status transitions, see the [Task status lifecycle](task-status-lifecycle.md) documentation.

## Error resource

The API also defines an Error resource format for error responses.

### Properties

| Property | Type | Description | Required |
|----------|------|-------------|----------|
| code | string | Error code identifying the type of error | Yes |
| message | string | Human-readable error message | Yes |
| details | array | Additional error details when available | No |
| requestId | string | Request identifier for troubleshooting | No |

For more details on error handling, see the [Error handling](error-handling.md) documentation.

## Data model diagram

```
+------------------+       +------------------+
|      User        |       |      Task        |
+------------------+       +------------------+
| userId           |<------| userId           |
| firstName        |       | taskId           |
| lastName         |       | taskTitle        |
| contactEmail     |       | taskDescription  |
+------------------+       | taskStatus       |
                           | dueDate          |
                           | warningOffset    |
                           +------------------+
```

## Next steps

- Learn about [pagination](pagination.md) for retrieving collections of resources
- Explore the [User resource](../resources/user-resource.md) in more detail
- Explore the [Task resource](../resources/task-resource.md) in more detail
- Understand the [Task status lifecycle](task-status-lifecycle.md)

--- FILE: core-concepts/pagination.md ---
---
title: "Pagination"
description: "How to navigate through large collections of resources using pagination parameters."
tags: ["pagination", "collection"]
categories: ["core-concepts"]
importance: 7
parent: "Core Concepts"
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 20, 2025"
nav_order: "2"
layout: "default"
version: "v1.0.0"
lastUpdated: "May 20, 2025"
---

# Pagination

When retrieving collections of resources like users or tasks, the API implements pagination to manage large result sets. This page explains how to use pagination in the Task Management API.

## Pagination parameters

The API supports the following pagination parameters:

| Parameter | Description | Default | Constraints |
|-----------|-------------|---------|------------|
| `_page` | Page number (zero-indexed) | 0 | Minimum: 0 |
| `_perPage` | Number of items per page | 20 | Minimum: 1, Maximum: 100 |

## Request example

Here's an example of requesting the second page of users with 10 users per page:

```bash
# cURL example
curl -X GET "http://localhost:3000/users?_page=1&_perPage=10" \
  -H "Authorization: Bearer your-token-here"
```

```python
# Python example
import requests

url = "http://localhost:3000/users"
headers = {
    "Authorization": "Bearer your-token-here"
}
params = {
    "_page": 1,
    "_perPage": 10
}

response = requests.get(url, headers=headers, params=params)
print(response.json())
```

```javascript
// JavaScript example
fetch('http://localhost:3000/users?_page=1&_perPage=10', {
  headers: {
    'Authorization': 'Bearer your-token-here'
  }
})
.then(response => response.json())
.then(data => console.log(data));
```

## Response format

The response will contain the requested page of resources:

```json
{
  "users": [
    {
      "userId": 11,
      "firstName": "Jane",
      "lastName": "Doe",
      "contactEmail": "jane.doe@example.com"
    },
    // ... more users up to the specified _perPage value
  ]
}
```

## Pagination strategy

To navigate through all pages of a resource:

1. Start with `_page=0` and your desired `_perPage` value
2. Process the items in the response
3. Increment `_page` by 1 and make another request
4. Repeat until you receive an empty array or fewer items than `_perPage`

## Combining with sorting

Pagination can be combined with sorting to create more complex queries:

```
GET /users?_page=1&_perPage=10&_sort=lastName
```

This retrieves the second page of users, with 10 users per page, sorted by last name in ascending order.

See the [sorting documentation](sorting.md) for more details on sorting options.

## Best practices

1. Use a reasonable `_perPage` value (10-50) to balance between request overhead and payload size
2. Remember that page numbers are zero-indexed (`_page=0` is the first page)
3. Handle empty results gracefully in your application
4. Consider implementing caching for paginated responses

## Endpoints supporting pagination

The following endpoints support pagination:

- `GET /users`: Retrieve all users
- `GET /tasks`: Retrieve all tasks

## Next steps

- Learn about [sorting](sorting.md) to order your paginated results
- Explore the [API reference](../api-reference.md) for detailed endpoint documentation

--- FILE: core-concepts/sorting.md ---
---
title: "Sorting"
description: "How to sort API results using sort parameters."
tags: ["sorting", "collection"]
categories: ["core-concepts"]
importance: 6
parent: "Core Concepts"
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 20, 2025"
nav_order: "3"
layout: "default"
version: "v1.0.0"
lastUpdated: "May 20, 2025"
---

# Sorting

The Task Management API supports sorting capabilities to help you organize and find specific resources. This page explains how to use sorting in the API.

## Sorting parameter

To sort API results, use the `_sort` query parameter:

| Parameter | Description | Example |
|-----------|-------------|---------|
| `_sort` | Field to sort by, prefixed with `-` for descending order | `_sort=lastName` or `_sort=-dueDate` |

## Sort direction

- **Ascending order**: Use the field name without a prefix (e.g., `_sort=firstName`)
- **Descending order**: Prefix the field name with a hyphen (e.g., `_sort=-dueDate`)

## Request examples

### Sort users by last name (ascending)

```bash
# cURL example
curl -X GET "http://localhost:3000/users?_sort=lastName" \
  -H "Authorization: Bearer your-token-here"
```

```python
# Python example
import requests

url = "http://localhost:3000/users"
headers = {
    "Authorization": "Bearer your-token-here"
}
params = {
    "_sort": "lastName"
}

response = requests.get(url, headers=headers, params=params)
print(response.json())
```

```javascript
// JavaScript example
fetch('http://localhost:3000/users?_sort=lastName', {
  headers: {
    'Authorization': 'Bearer your-token-here'
  }
})
.then(response => response.json())
.then(data => console.log(data));
```

### Sort tasks by due date (descending)

```bash
# cURL example
curl -X GET "http://localhost:3000/tasks?_sort=-dueDate" \
  -H "Authorization: Bearer your-token-here"
```

```python
# Python example
import requests

url = "http://localhost:3000/tasks"
headers = {
    "Authorization": "Bearer your-token-here"
}
params = {
    "_sort": "-dueDate"
}

response = requests.get(url, headers=headers, params=params)
print(response.json())
```

```javascript
// JavaScript example
fetch('http://localhost:3000/tasks?_sort=-dueDate', {
  headers: {
    'Authorization': 'Bearer your-token-here'
  }
})
.then(response => response.json())
.then(data => console.log(data));
```

## Sortable fields

### User resource

You can sort the User resource by these fields:
- `userId`
- `firstName`
- `lastName`
- `contactEmail`

### Task resource

You can sort the Task resource by these fields:
- `taskId`
- `userId`
- `taskTitle`
- `taskStatus`
- `dueDate`
- `warningOffset`

## Combining with pagination

Sorting can be combined with pagination to create more complex queries:

```
GET /tasks?_sort=-dueDate&_page=0&_perPage=10
```

This retrieves the first page of tasks, with 10 tasks per page, sorted by due date in descending order (newest first).

See the [pagination documentation](pagination.md) for more details on pagination options.

## Combining with filtering

Sorting can also be combined with filtering:

```
GET /tasks?taskStatus=IN_PROGRESS&_sort=dueDate
```

This retrieves all in-progress tasks, sorted by due date in ascending order (oldest first).

## Best practices

1. Use sorting to create more usable and predictable API responses
2. Combine sorting with pagination when displaying lists to users
3. Sort by date fields in descending order (`-dueDate`) to show newest items first
4. Sort by name fields in ascending order (`firstName`, `lastName`) for alphabetical listings

## Endpoints supporting sorting

The following endpoints support sorting:

- `GET /users`: Retrieve all users
- `GET /tasks`: Retrieve all tasks

## Next steps

- Learn about [pagination](pagination.md) to manage large result sets
- Explore the [API reference](../api-reference.md) for detailed endpoint documentation

--- FILE: core-concepts/error-handling.md ---
---
title: "Error handling"
description: "Common error patterns and best practices for handling errors in the Task Management API."
tags: ["errors", "troubleshooting"]
categories: ["core-concepts"]
importance: 8
parent: "Core Concepts"
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 20, 2025"
nav_order: "4"
layout: "default"
version: "v1.0.0"
lastUpdated: "May 20, 2025"
---

# Error handling

The Task Management API uses consistent error formats to help you understand and resolve issues. This page explains the API's error handling approach and provides guidance on best practices.

## Error response format

All API errors follow a consistent JSON format:

```json
{
  "code": "ERROR_CODE",
  "message": "Human-readable error message",
  "details": [
    {
      "field": "fieldName",
      "reason": "Specific reason for the error",
      "location": "body"
    }
  ],
  "requestId": "req-f8d31a62-e789-4856-9452-5efa50223c7a"
}
```

### Error properties

| Property | Description | Always included |
|----------|-------------|----------------|
| `code` | Error code that identifies the type of error | Yes |
| `message` | Human-readable error message | Yes |
| `details` | Array of objects with field-specific error information | No |
| `requestId` | Unique identifier for the request, useful for troubleshooting | No |

## HTTP status codes

The API uses standard HTTP status codes to indicate the success or failure of requests:

| Status code | Description |
|-------------|-------------|
| 200 OK | The request succeeded |
| 201 Created | The request succeeded and a new resource was created |
| 204 No Content | The request succeeded but there is no content to return |
| 400 Bad Request | The request contains invalid parameters or fields |
| 401 Unauthorized | Authentication is required or the provided credentials are invalid |
| 403 Forbidden | The authenticated user does not have permission to access the resource |
| 404 Not Found | The requested resource was not found |
| 429 Too Many Requests | The client has sent too many requests in a given amount of time |
| 500 Server Error | An unexpected server error occurred |

## Common error codes

| Error code | Description |
|------------|-------------|
| `INVALID_FIELD` | A field value is invalid |
| `MISSING_REQUIRED_FIELD` | A required field is missing |
| `RESOURCE_NOT_FOUND` | The requested resource could not be found |
| `UNAUTHORIZED` | Authentication is required |
| `FORBIDDEN` | Permission denied |
| `RATE_LIMIT_EXCEEDED` | Too many requests |
| `SERVER_ERROR` | An unexpected server error occurred |

## Error handling examples

### Invalid field value

```json
{
  "code": "INVALID_FIELD",
  "message": "The field `contactEmail` must be a valid email address",
  "details": [
    {
      "field": "contactEmail",
      "reason": "Invalid format",
      "location": "body"
    }
  ],
  "requestId": "req-f8d31a62-e789-4856-9452-5efa50223c7a"
}
```

### Missing required field

```json
{
  "code": "MISSING_REQUIRED_FIELD",
  "message": "The `lastName` field is required.",
  "details": [
    {
      "field": "lastName",
      "reason": "Is required",
      "location": "body"
    }
  ],
  "requestId": "req-f8d31a62-e789-4856-9452-5efa50223c7a"
}
```

### Resource not found

```json
{
  "code": "RESOURCE_NOT_FOUND",
  "message": "The requested resource could not be found",
  "requestId": "req-f8d31a62-e789-4856-9452-5efa50223c7a"
}
```

## Best practices for error handling

1. **Check HTTP status codes first**: The HTTP status code provides the first indication of what went wrong.

2. **Examine the error code**: The `code` field provides a specific error type that you can use to handle different errors in your application.

3. **Display error messages to users**: The `message` field contains a human-readable error message that you can display to your users.

4. **Check field-specific errors**: The `details` array provides field-level validation errors that you can use to highlight specific form fields.

5. **Log the request ID**: The `requestId` field is useful for troubleshooting and should be included in any error logs.

6. **Implement retry logic for 429 errors**: When you receive a 429 Too Many Requests response, use the Retry-After header to determine when to retry the request.

7. **Handle authentication errors gracefully**: Redirect users to a login page or prompt them to re-authenticate when you receive 401 Unauthorized errors.

## Client-side error handling example

```javascript
// JavaScript example
async function makeApiRequest(endpoint, options) {
  try {
    const response = await fetch(`http://localhost:3000${endpoint}`, {
      ...options,
      headers: {
        'Authorization': 'Bearer your-token-here',
        'Content-Type': 'application/json',
        ...options.headers
      }
    });
    
    // If the response is not OK, parse the error
    if (!response.ok) {
      const errorData = await response.json();
      
      // Handle specific error codes
      switch (errorData.code) {
        case 'UNAUTHORIZED':
          // Redirect to login page
          redirectToLogin();
          break;
        case 'RATE_LIMIT_EXCEEDED':
          // Implement retry with exponential backoff
          const retryAfter = response.headers.get('Retry-After') || 5;
          return await retryRequest(endpoint, options, retryAfter);
        case 'INVALID_FIELD':
        case 'MISSING_REQUIRED_FIELD':
          // Display field-specific errors
          displayFieldErrors(errorData.details);
          break;
        default:
          // Display generic error message
          displayErrorMessage(errorData.message);
      }
      
      // Log the error with request ID
      console.error(`API Error (${errorData.requestId}):`, errorData);
      
      throw errorData;
    }
    
    // If the response is OK but there's no content, return null
    if (response.status === 204) {
      return null;
    }
    
    // Otherwise, parse and return the JSON response
    return await response.json();
  } catch (error) {
    // Handle network errors or JSON parsing errors
    console.error('API Request Failed:', error);
    throw error;
  }
}
```

## For more information

- [API reference](../api-reference.md): Detailed endpoint documentation including possible error responses
- [Error responses reference](../api-reference/error-responses.md): Comprehensive list of all possible error responses

--- FILE: core-concepts/task-status-lifecycle.md ---
---
title: "Task status lifecycle"
description: "Understanding the various status values that tasks can have and their transitions."
tags: ["task status", "workflow"]
categories: ["core-concepts"]
importance: 7
parent: "Core Concepts"
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 20, 2025"
nav_order: "5"
layout: "default"
version: "v1.0.0"
lastUpdated: "May 20, 2025"
---

# Task status lifecycle

The Task Management API uses a set of predefined status values to track the progress of tasks throughout their lifecycle. This page explains these statuses and their typical transitions.

## Task status values

Each task in the system has a `taskStatus` field that can have one of the following values:

| Status | Description |
|--------|-------------|
| `NOT_STARTED` | The task has not been started yet. This is the default status for new tasks. |
| `IN_PROGRESS` | The task is currently being worked on. |
| `BLOCKED` | The task cannot proceed due to an external factor or dependency. |
| `DEFERRED` | The task has been postponed to a later time. |
| `COMPLETED` | The task has been finished successfully. |
| `CANCELLED` | The task has been cancelled and will not be completed. |

## Status transitions

While the API doesn't enforce a specific workflow, tasks typically follow these transitions:

```
                   ┌─────────────┐
                   │ NOT_STARTED │
                   └──────┬──────┘
                          │
                          ▼
┌─────────┐       ┌─────────────┐       ┌─────────┐
│ DEFERRED │◄────►│ IN_PROGRESS │◄────►│ BLOCKED │
└─────┬───┘       └──────┬──────┘       └────┬────┘
      │                  │                   │
      │                  ▼                   │
      │           ┌─────────────┐            │
      └──────────►│  COMPLETED  │◄───────────┘
                  └──────┬──────┘
                         │
                         ▼
                  ┌─────────────┐
                  │  CANCELLED  │
                  └─────────────┘
```

## Setting and updating task status

### When creating a task

When creating a new task, you can specify the initial status in the request. If not provided, it defaults to `NOT_STARTED`:

```json
{
  "userId": 1,
  "taskTitle": "Complete project proposal",
  "taskDescription": "Finish the proposal for the new client project",
  "taskStatus": "IN_PROGRESS", // Optional, defaults to NOT_STARTED
  "dueDate": "2025-06-15T17:00:00-05:00",
  "warningOffset": 120
}
```

### Updating task status

To update a task's status, use the PATCH method on the task endpoint:

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

## Filtering tasks by status

You can filter tasks by their status using the `taskStatus` query parameter:

```bash
# cURL example
curl -X GET "http://localhost:3000/tasks?taskStatus=IN_PROGRESS" \
  -H "Authorization: Bearer your-token-here"
```

```python
# Python example
import requests

url = "http://localhost:3000/tasks"
headers = {
    "Authorization": "Bearer your-token-here"
}
params = {
    "taskStatus": "IN_PROGRESS"
}

response = requests.get(url, headers=headers, params=params)
print(response.json())
```

```javascript
// JavaScript example
fetch('http://localhost:3000/tasks?taskStatus=IN_PROGRESS', {
  headers: {
    'Authorization': 'Bearer your-token-here'
  }
})
.then(response => response.json())
.then(data => console.log(data));
```

## Best practices

1. **Use appropriate statuses**: Choose the status that best reflects the current state of the task.
2. **Update status promptly**: Update the task status as soon as its state changes to keep the system current.
3. **Filter by status**: Use status filtering to create views of tasks that require attention.
4. **Track transitions**: Consider tracking status transitions in your application to create an audit trail.

## Common use cases

- **To-do list**: Filter for `NOT_STARTED` tasks to see what needs to be done.
- **In progress**: Filter for `IN_PROGRESS` tasks to see what's currently being worked on.
- **Blocked items**: Filter for `BLOCKED` tasks to identify bottlenecks.
- **Completed items**: Filter for `COMPLETED` tasks to review what's been accomplished.

## Next steps

- Learn about [filtering tasks](../api-reference/get-all-tasks.md#filtering) in the API reference
- Explore the [Task resource](../resources/task-resource.md) in more detail
- Check out the [update task endpoint](../api-reference/update-task.md) for updating task statuses

--- FILE: resources.md ---
---
title: "API Resources"
description: "Detailed information about the core resources available in the Task Management API."
tags: ["resources", "overview"]
categories: ["resources"]
importance: 9
has_toc: false
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 20, 2025"
nav_order: "4"
layout: "default"
version: "v1.0.0"
lastUpdated: "May 20, 2025"
---

# API Resources

The Task Management API is built around two primary resources: Users and Tasks. This page provides an overview of these resources and links to detailed documentation for each.

## User resource

The User resource represents an individual who can create and manage tasks in the system. Each user has a unique identifier, name information, and a contact email.

### Key properties

- `userId`: Unique identifier for the user
- `firstName`: User's first name
- `lastName`: User's last name
- `contactEmail`: User's email address

### Related operations

- `GET /users`: Retrieve all users
- `POST /users`: Create a new user
- `GET /users/{userId}`: Retrieve a specific user
- `PATCH /users/{userId}`: Update a user
- `DELETE /users/{userId}`: Delete a user

For detailed information, see the [User resource documentation](resources/user-resource.md).

## Task resource

The Task resource represents a to-do item that belongs to a user. Each task has a unique identifier, title, description, status, due date, and warning offset.

### Key properties

- `taskId`: Unique identifier for the task
- `userId`: ID of the user who owns the task
- `taskTitle`: Short description of the task
- `taskDescription`: Detailed description of the task
- `taskStatus`: Current status of the task (e.g., NOT_STARTED, IN_PROGRESS, COMPLETED)
- `dueDate`: When the task is due
- `warningOffset`: Minutes before due date to send reminder

### Related operations

- `GET /tasks`: Retrieve all tasks
- `POST /tasks`: Create a new task
- `GET /tasks/{taskId}`: Retrieve a specific task
- `PATCH /tasks/{taskId}`: Update a task
- `DELETE /tasks/{taskId}`: Delete a task

For detailed information, see the [Task resource documentation](resources/task-resource.md).

## Resource relationships

The relationship between Users and Tasks is a one-to-many relationship:

- A User can have multiple Tasks
- Each Task belongs to exactly one User

This relationship is enforced by the `userId` field on the Task resource, which references the User who owns the task.

## Resource representations

All resources in the API are represented using JSON format. Here are examples of the User and Task resources:

### User representation

```json
{
  "userId": 1,
  "firstName": "John",
  "lastName": "Doe",
  "contactEmail": "john.doe@example.com"
}
```

### Task representation

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

## Next steps

- Explore the [User resource documentation](resources/user-resource.md) in detail
- Explore the [Task resource documentation](resources/task-resource.md) in detail
- Learn about [core concepts](core-concepts.md) like pagination, sorting, and error handling
- Check out the [API reference](api-reference.md) for detailed endpoint documentation

--- FILE: resources/user-resource.md ---
---
title: "User resource"
description: "Detailed information about the User resource, its properties, and related endpoints."
tags: ["user", "resource"]
categories: ["resources"]
importance: 9
parent: "API Resources"
related_pages: ["get-all-users", "create-user", "get-user-by-id", "update-user", "delete-user"]
api_endpoints: ["/users", "/users/{userId}"]
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 20, 2025"
nav_order: "1"
layout: "default"
version: "v1.0.0"
lastUpdated: "May 20, 2025"
---

# User resource

The User resource represents an individual who can create and manage tasks in the Task Management API. Users must be created before tasks can be associated with them.

## Properties

| Property | Type | Description | Required | Constraints |
|----------|------|-------------|----------|------------|
| `userId` | integer | The unique identifier for the user | Yes (generated) | System-generated, read-only |
| `firstName` | string | The user's first name | Yes | 1-100 characters |
| `lastName` | string | The user's last name | Yes | 1-100 characters |
| `contactEmail` | string | The user's email address | Yes | Valid email format, 3-255 characters |

## User representation

A User resource is represented in JSON format:

```json
{
  "userId": 1,
  "firstName": "John",
  "lastName": "Doe",
  "contactEmail": "john.doe@example.com"
}
```

## Creating a user

To create a user, send a POST request to the `/users` endpoint with the required user information:

```json
{
  "firstName": "John",
  "lastName": "Doe",
  "contactEmail": "john.doe@example.com"
}
```

The API will generate a unique `userId` for the new user.

For detailed information, see the [Create a user](../api-reference/create-user.md) endpoint documentation.

## Retrieving users

### Get all users

To retrieve all users, send a GET request to the `/users` endpoint. The response will include an array of user objects:

```json
{
  "users": [
    {
      "userId": 1,
      "firstName": "John",
      "lastName": "Doe",
      "contactEmail": "john.doe@example.com"
    },
    {
      "userId": 2,
      "firstName": "Jane",
      "lastName": "Smith",
      "contactEmail": "jane.smith@example.com"
    }
  ]
}
```

This endpoint supports pagination and sorting. For detailed information, see the [Get all users](../api-reference/get-all-users.md) endpoint documentation.

### Get a specific user

To retrieve a specific user, send a GET request to the `/users/{userId}` endpoint, where `{userId}` is the unique identifier of the user:

```
GET /users/1
```

For detailed information, see the [Get user by ID](../api-reference/get-user-by-id.md) endpoint documentation.

## Updating a user

To update a user, send a PATCH request to the `/users/{userId}` endpoint with the fields you want to update:

```json
{
  "contactEmail": "new.email@example.com"
}
```

The API supports partial updates, so you only need to include the fields you want to change.

For detailed information, see the [Update a user](../api-reference/update-user.md) endpoint documentation.

## Deleting a user

To delete a user, send a DELETE request to the `/users/{userId}` endpoint:

```
DELETE /users/1
```

For detailed information, see the [Delete a user](../api-reference/delete-user.md) endpoint documentation.

## Related resources

The User resource is related to the Task resource. A user can have multiple tasks associated with them through the `userId` field on the Task resource.

To retrieve all tasks for a user, you can filter the tasks endpoint by the user ID:

```
GET /tasks?userId=1
```

## Important considerations

- The `contactEmail` must be unique across all users in the system.
- When a user is deleted, all associated tasks should be deleted as well (cascade delete).
- The `userId` is generated by the system and cannot be specified when creating a user.

## Best practices

1. **Validate email addresses**: Although the API validates email format, it's good practice to validate email addresses in your client application before sending requests.
2. **Handle unique email constraints**: Be prepared to handle errors if you try to create a user with an email that already exists.
3. **Implement proper authentication**: Ensure that users can only access and modify their own data by implementing proper authentication and authorization in your application.

## See also

- [Task resource](task-resource.md)
- [Get all users](../api-reference/get-all-users.md)
- [Create a user](../api-reference/create-user.md)
- [Get user by ID](../api-reference/get-user-by-id.md)
- [Update a user](../api-reference/update-user.md)
- [Delete a user](../api-reference/delete-user.md)

--- FILE: resources/task-resource.md ---
---
title: "Task resource"
description: "Detailed information about the Task resource, its properties, and related endpoints."
tags: ["task", "resource"]
categories: ["resources"]
importance: 9
parent: "API Resources"
related_pages: ["get-all-tasks", "create-task", "get-task-by-id", "update-task", "delete-task"]
api_endpoints: ["/tasks", "/tasks/{taskId}"]
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 20, 2025"
nav_order: "2"
layout: "default"
version: "v1.0.0"
lastUpdated: "May 20, 2025"
---

# Task resource

The Task resource represents a to-do item in the Task Management API. Each task belongs to a user and has properties that describe what needs to be done, when it's due, and its current status.

## Properties

| Property | Type | Description | Required | Constraints |
|----------|------|-------------|----------|------------|
| `taskId` | integer | The unique identifier for the task | Yes (generated) | System-generated, read-only |
| `userId` | integer | ID of the user who owns the task | Yes | Must reference a valid user |
| `taskTitle` | string | Short description of the task | Yes | 1-80 characters |
| `taskDescription` | string | Detailed description of the task | No | 1-255 characters |
| `taskStatus` | string | Current status of the task | Yes (default: NOT_STARTED) | Must be one of the predefined status values |
| `dueDate` | string (date-time) | When the task is due | Yes | ISO 8601 format |
| `warningOffset` | integer | Minutes before due date to send reminder | Yes | 0-64000 |

## Task status values

The `taskStatus` field can have one of the following values:

- `NOT_STARTED`: The task has not been started yet
- `IN_PROGRESS`: The task is currently being worked on
- `BLOCKED`: The task cannot proceed due to an external factor
- `DEFERRED`: The task has been postponed to a later time
- `COMPLETED`: The task has been finished
- `CANCELLED`: The task has been cancelled and will not be completed

For more details on task status transitions, see the [Task status lifecycle](../core-concepts/task-status-lifecycle.md) documentation.

## Task representation

A Task resource is represented in JSON format:

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

## Creating a task

To create a task, send a POST request to the `/tasks` endpoint with the required task information:

```json
{
  "userId": 1,
  "taskTitle": "Complete project proposal",
  "taskDescription": "Finish the proposal for the new client project",
  "dueDate": "2025-06-15T17:00:00-05:00",
  "warningOffset": 120
}
```

The API will generate a unique `taskId` for the new task and set the `taskStatus` to `NOT_STARTED` if not specified.

For detailed information, see the [Create a task](../api-reference/create-task.md) endpoint documentation.

## Retrieving tasks

### Get all tasks

To retrieve all tasks, send a GET request to the `/tasks` endpoint. The response will include an array of task objects:

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
    },
    {
      "taskId": 2,
      "userId": 2,
      "taskTitle": "Schedule team meeting",
      "taskDescription": "Coordinate with team for weekly sync-up",
      "taskStatus": "COMPLETED",
      "dueDate": "2025-05-10T10:00:00-05:00",
      "warningOffset": 60
    }
  ]
}
```

This endpoint supports pagination, sorting, and filtering by task status. For detailed information, see the [Get all tasks](../api-reference/get-all-tasks.md) endpoint documentation.

### Get a specific task

To retrieve a specific task, send a GET request to the `/tasks/{taskId}` endpoint, where `{taskId}` is the unique identifier of the task:

```
GET /tasks/1
```

For detailed information, see the [Get task by ID](../api-reference/get-task-by-id.md) endpoint documentation.

## Updating a task

To update a task, send a PATCH request to the `/tasks/{taskId}` endpoint with the fields you want to update:

```json
{
  "taskStatus": "COMPLETED"
}
```

The API supports partial updates, so you only need to include the fields you want to change.

For detailed information, see the [Update a task](../api-reference/update-task.md) endpoint documentation.

## Deleting a task

To delete a task, send a DELETE request to the `/tasks/{taskId}` endpoint:

```
DELETE /tasks/1
```

For detailed information, see the [Delete a task](../api-reference/delete-task.md) endpoint documentation.

## Related resources

The Task resource is related to the User resource. Each task must be associated with a user through the `userId` field.

To retrieve the user who owns a task, you can use the `GET /users/{userId}` endpoint with the `userId` from the task.

## Important considerations

- The `userId` must reference an existing user in the system.
- The `dueDate` should be in the future when creating a task.
- The `warningOffset` is used to calculate when reminders should be sent (e.g., 120 minutes before the due date).
- When updating a task's status, follow the typical status transitions described in the [Task status lifecycle](../core-concepts/task-status-lifecycle.md) documentation.

## Best practices

1. **Use meaningful task titles**: Task titles should be concise but descriptive enough to understand the task at a glance.
2. **Set appropriate warning offsets**: Consider the nature of the task when setting the warning offset. Critical tasks might need longer warning periods.
3. **Keep task statuses up to date**: Regularly update task statuses to reflect their current state.
4. **Use filtering for task lists**: When retrieving tasks, use status filtering to create focused views (e.g., only IN_PROGRESS tasks).

## See also

- [User resource](user-resource.md)
- [Task status lifecycle](../core-concepts/task-status-lifecycle.md)
- [Get all tasks](../api-reference/get-all-tasks.md)
- [Create a task](../api-reference/create-task.md)
- [Get task by ID](../api-reference/get-task-by-id.md)
- [Update a task](../api-reference/update-task.md)
- [Delete a task](../api-reference/delete-task.md)

--- FILE: api-reference.md ---
---
title: "API Reference"
description: "Comprehensive reference documentation for all endpoints in the Task Management API."
tags: ["reference", "endpoints", "api"]
categories: ["api-reference"]
importance: 8
has_toc: false
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 20, 2025"
nav_order: "5"
layout: "default"
version: "v1.0.0"
lastUpdated: "May 20, 2025"
---

# API Reference

This page provides a comprehensive reference for all endpoints in the Task Management API. Each endpoint is documented with its HTTP method, path, parameters, request format, response format, and example code.

## Authentication

All API endpoints require authentication using bearer tokens. Include your token in the Authorization header of each request:

```
Authorization: Bearer your-token-here
```

For more details, see the [Authentication guide](getting-started/authentication.md).

## Base URL

All API endpoints are relative to the base URL:

```
http://localhost:3000
```

## User endpoints

The following endpoints are available for managing users:

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | [/users](api-reference/get-all-users.md) | Get all users |
| POST | [/users](api-reference/create-user.md) | Create a new user |
| GET | [/users/{userId}](api-reference/get-user-by-id.md) | Get a user by ID |
| PATCH | [/users/{userId}](api-reference/update-user.md) | Update a user |
| DELETE | [/users/{userId}](api-reference/delete-user.md) | Delete a user |

## Task endpoints

The following endpoints are available for managing tasks:

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | [/tasks](api-reference/get-all-tasks.md) | Get all tasks |
| POST | [/tasks](api-reference/create-task.md) | Create a new task |
| GET | [/tasks/{taskId}](api-reference/get-task-by-id.md) | Get a task by ID |
| PATCH | [/tasks/{taskId}](api-reference/update-task.md) | Update a task |
| DELETE | [/tasks/{taskId}](api-reference/delete-task.md) | Delete a task |

## Error responses

All endpoints may return error responses in a consistent format. For details on error codes, messages, and handling, see the [Error responses](api-reference/error-responses.md) documentation.

## Common parameters

### Pagination parameters

The following parameters are supported by list endpoints (`GET /users` and `GET /tasks`):

| Parameter | Description | Default | Constraints |
|-----------|-------------|---------|------------|
| `_page` | Page number (zero-indexed) | 0 | Minimum: 0 |
| `_perPage` | Number of items per page | 20 | Minimum: 1, Maximum: 100 |

For more details, see the [Pagination documentation](core-concepts/pagination.md).

### Sorting parameter

The following parameter is supported by list endpoints (`GET /users` and `GET /tasks`):

| Parameter | Description | Example |
|-----------|-------------|---------|
| `_sort` | Field to sort by, prefixed with `-` for descending order | `_sort=lastName` or `_sort=-dueDate` |

For more details, see the [Sorting documentation](core-concepts/sorting.md).

### Filtering parameters

The following parameter is supported by the `GET /tasks` endpoint:

| Parameter | Description | Example |
|-----------|-------------|---------|
| `taskStatus` | Filter tasks by status | `taskStatus=IN_PROGRESS` |

## Resources

For detailed information about the resources used in the API, see:

- [User resource](resources/user-resource.md)
- [Task resource](resources/task-resource.md)

## Need more help?

If you need additional assistance, check out:

- [Getting started guide](getting-started.md)
- [Core concepts](core-concepts.md)
- [Tutorials & guides](tutorials.md)
- [Support & FAQ](support.md)

--- FILE: api-reference/error-responses.md ---
---
title: "Error responses"
description: "Reference documentation for all error responses returned by the API."
tags: ["errors", "reference"]
categories: ["api-reference"]
importance: 8
parent: "API Reference" 
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 20, 2025"
nav_order: "1"
layout: "default"
version: "v1.0.0"
lastUpdated: "May 20, 2025"
---

# Error responses

The Task Management API returns standardized error responses for all endpoints. This page documents the standard error format and common error codes you might encounter.

## Error response format

All error responses follow a consistent JSON format:

```json
{
  "code": "ERROR_CODE",
  "message": "Human-readable error message",
  "details": [
    {
      "field": "fieldName",
      "reason": "Specific reason for the error",
      "location": "body"
    }
  ],
  "requestId": "req-f8d31a62-e789-4856-9452-5efa50223c7a"
}
```

## Error response properties

| Property | Description | Always included |
|----------|-------------|----------------|
| `code` | Error code identifying the type of error | Yes |
| `message` | Human-readable error message | Yes |
| `details` | Array of objects with field-specific error information | No |
| `requestId` | Unique identifier for the request, useful for troubleshooting | No |

## HTTP status codes

The API uses standard HTTP status codes to indicate the success or failure of requests:

| Status code | Description | Example error codes |
|-------------|-------------|---------------------|
| 400 Bad Request | The request contains invalid parameters or fields | `INVALID_FIELD`, `MISSING_REQUIRED_FIELD` |
| 401 Unauthorized | Authentication is required or the provided credentials are invalid | `UNAUTHORIZED` |
| 403 Forbidden | The authenticated user does not have permission to access the resource | `FORBIDDEN` |
| 404 Not Found | The requested resource was not found | `RESOURCE_NOT_FOUND` |
| 429 Too Many Requests | The client has sent too many requests in a given amount of time | `RATE_LIMIT_EXCEEDED` |
| 500 Server Error | An unexpected server error occurred | `SERVER_ERROR` |

## Common error codes

### INVALID_FIELD

Returned when a field value is invalid. The `details` array will contain information about which field failed validation and why.

```json
{
  "code": "INVALID_FIELD",
  "message": "The field `contactEmail` must be a valid email address",
  "details": [
    {
      "field": "contactEmail",
      "reason": "Invalid format",
      "location": "body"
    }
  ],
  "requestId": "req-f8d31a62-e789-4856-9452-5efa50223c7a"
}
```

### MISSING_REQUIRED_FIELD

Returned when a required field is missing from the request. The `details` array will contain information about which required field is missing.

```json
{
  "code": "MISSING_REQUIRED_FIELD",
  "message": "The `lastName` field is required.",
  "details": [
    {
      "field": "lastName",
      "reason": "Is required",
      "location": "body"
    }
  ],
  "requestId": "req-f8d31a62-e789-4856-9452-5efa50223c7a"
}
```

### RESOURCE_NOT_FOUND

Returned when the requested resource could not be found.

```json
{
  "code": "RESOURCE_NOT_FOUND",
  "message": "The requested resource could not be found",
  "requestId": "req-f8d31a62-e789-4856-9452-5efa50223c7a"
}
```

### UNAUTHORIZED

Returned when authentication is required or the provided credentials are invalid.

```json
{
  "code": "UNAUTHORIZED",
  "message": "Authentication is required to access this resource",
  "requestId": "req-f8d31a62-e789-4856-9452-5efa50223c7a"
}
```

### FORBIDDEN

Returned when the authenticated user does not have permission to access the requested resource.

```json
{
  "code": "FORBIDDEN",
  "message": "You do not have permission to access this resource",
  "requestId": "req-f8d31a62-e789-4856-9452-5efa50223c7a"
}
```

### RATE_LIMIT_EXCEEDED

Returned when the client has sent too many requests in a given amount of time. The response will include a `Retry-After` header indicating how long to wait before making a new request.

```json
{
  "code": "RATE_LIMIT_EXCEEDED",
  "message": "Rate limit exceeded. Try again in 30 seconds",
  "requestId": "req-f8d31a62-e789-4856-9452-5efa50223c7a"
}
```

### SERVER_ERROR

Returned when an unexpected server error occurs.

```json
{
  "code": "SERVER_ERROR",
  "message": "An unexpected error occurred. Please try again later",
  "requestId": "req-f8d31a62-e789-4856-9452-5efa50223c7a"
}
```

## Field-specific error patterns

### Invalid email format

```json
{
  "code": "INVALID_FIELD",
  "message": "The field `contactEmail` must be a valid email address",
  "details": [
    {
      "field": "contactEmail",
      "reason": "Invalid format",
      "location": "body"
    }
  ],
  "requestId": "req-f8d31a62-e789-4856-9452-5efa50223c7a"
}
```

### Invalid task status

```json
{
  "code": "INVALID_FIELD",
  "message": "The `taskStatus` value 'DONE' is not valid.",
  "details": [
    {
      "field": "taskStatus",
      "reason": "Invalid value",
      "location": "body"
    }
  ],
  "requestId": "req-f8d31a62-e789-4856-9452-5efa50223c7a"
}
```

### String length constraints

```json
{
  "code": "INVALID_FIELD",
  "message": "The field `taskTitle` must be between 1 and 80 characters",
  "details": [
    {
      "field": "taskTitle",
      "reason": "String too long",
      "location": "body"
    }
  ],
  "requestId": "req-f8d31a62-e789-4856-9452-5efa50223c7a"
}
```

### Numeric constraints

```json
{
  "code": "INVALID_FIELD",
  "message": "The field `warningOffset` must be between 0 and 64000",
  "details": [
    {
      "field": "warningOffset",
      "reason": "Value too large",
      "location": "body"
    }
  ],
  "requestId": "req-f8d31a62-e789-4856-9452-5efa50223c7a"
}
```

## Handling errors in your application

Here's an example of how to handle errors in a JavaScript application:

```javascript
async function makeApiRequest(endpoint, options) {
  try {
    const response = await fetch(`http://localhost:3000${endpoint}`, {
      ...options,
      headers: {
        'Authorization': 'Bearer your-token-here',
        'Content-Type': 'application/json',
        ...options.headers
      }
    });
    
    if (!response.ok) {
      const errorData = await response.json();
      
      // Handle specific error codes
      switch (errorData.code) {
        case 'UNAUTHORIZED':
          // Redirect to login page
          window.location.href = '/login';
          break;
        case 'RATE_LIMIT_EXCEEDED':
          // Wait and retry
          const retryAfter = response.headers.get('Retry-After') || 5;
          console.log(`Rate limited. Retrying in ${retryAfter} seconds.`);
          setTimeout(() => makeApiRequest(endpoint, options), retryAfter * 1000);
          return;
        case 'INVALID_FIELD':
        case 'MISSING_REQUIRED_FIELD':
          // Display field-specific errors
          if (errorData.details) {
            errorData.details.forEach(detail => {
              console.error(`Field error: ${detail.field} - ${detail.reason}`);
              // Update UI to show error next to field
            });
          }
          break;
        default:
          // Display generic error message
          console.error(`API Error: ${errorData.message}`);
      }
      
      // Log the error with request ID
      console.error(`Request ID: ${errorData.requestId}`);
      
      throw errorData;
    }
    
    return await response.json();
  } catch (error) {
    console.error('API Request Failed:', error);
    throw error;
  }
}
```

## Best practices

1. **Always check HTTP status codes**: The HTTP status code provides the first indication of what went wrong.
2. **Parse error responses**: Extract the error code, message, and details to provide useful feedback to users.
3. **Log request IDs**: The `requestId` field is valuable for troubleshooting and should be included in error logs.
4. **Handle field-specific errors**: Use the `details` array to highlight specific form fields that need correction.
5. **Implement retry logic for rate limiting**: When you receive a 429 status code, use the Retry-After header to determine when to retry.

## See also

- [Core concepts: Error handling](../core-concepts/error-handling.md)
- [Getting started: Authentication](../getting-started/authentication.md)

--- FILE: api-reference/get-all-users.md ---
---
title: "Get all users"
description: "API endpoint to retrieve a list of all users with pagination and sorting support."
tags: ["users", "endpoint", "GET"]
categories: ["api-reference"]
importance: 7
api_endpoints: ["/users"]
related_pages: ["user-resource", "pagination", "sorting"]
parent: "API Reference" 
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 20, 2025"
nav_order: "2"
layout: "default"
version: "v1.0.0"
lastUpdated: "May 20, 2025"
---

# Get all users

Retrieves a list of all users in the system. This endpoint supports pagination and sorting options to help manage large result sets.

## Endpoint

```
GET /users
```

## Path parameters

None.

## Query parameters

| Parameter | Type | Description | Required | Default | Constraints |
|-----------|------|-------------|----------|---------|------------|
| `_page` | integer | Page number (zero-indexed) | No | 0 | Minimum: 0 |
| `_perPage` | integer | Number of items per page | No | 20 | Minimum: 1, Maximum: 100 |
| `_sort` | string | Field to sort by | No | None | Valid fields: `userId`, `firstName`, `lastName`, `contactEmail` |

### Sorting

To sort results in ascending order, specify the field name:
```
GET /users?_sort=lastName
```

To sort results in descending order, prefix the field name with a hyphen:
```
GET /users?_sort=-lastName
```

## Request example

```bash
# cURL example
curl -X GET "http://localhost:3000/users?_page=0&_perPage=10&_sort=lastName" \
  -H "Authorization: Bearer your-token-here"
```

```python
# Python example
import requests

url = "http://localhost:3000/users"
headers = {
    "Authorization": "Bearer your-token-here"
}
params = {
    "_page": 0,
    "_perPage": 10,
    "_sort": "lastName"
}

response = requests.get(url, headers=headers, params=params)
print(response.json())
```

```javascript
// JavaScript example
fetch('http://localhost:3000/users?_page=0&_perPage=10&_sort=lastName', {
  headers: {
    'Authorization': 'Bearer your-token-here'
  }
})
.then(response => response.json())
.then(data => console.log(data));
```

## Response

### Success response (200 OK)

```json
{
  "users": [
    {
      "userId": 1,
      "firstName": "John",
      "lastName": "Doe",
      "contactEmail": "john.doe@example.com"
    },
    {
      "userId": 2,
      "firstName": "Jane",
      "lastName": "Smith",
      "contactEmail": "jane.smith@example.com"
    }
    // Additional users...
  ]
}
```

### Error responses

| Status code | Description | Error code |
|-------------|-------------|------------|
| 400 Bad Request | Invalid query parameters | `INVALID_FIELD` |
| 401 Unauthorized | Missing or invalid authentication | `UNAUTHORIZED` |
| 403 Forbidden | Insufficient permissions | `FORBIDDEN` |
| 429 Too Many Requests | Rate limit exceeded | `RATE_LIMIT_EXCEEDED` |
| 500 Server Error | Unexpected server error | `SERVER_ERROR` |

See [Error responses](error-responses.md) for details on error response format.

## Authentication

This endpoint requires authentication using a bearer token:

```
Authorization: Bearer your-token-here
```

## Important considerations

- The response does not include information about the total number of users or pages. Your application should check if the number of returned users is less than `_perPage` to determine if you've reached the last page.
- Sorting is case-sensitive. For example, when sorting by `lastName`, names starting with uppercase letters will appear before those starting with lowercase letters.
- When retrieving large sets of users, use pagination to improve performance and reduce response payload size.

## Best practices

- Use reasonable page sizes (10-50 users per page) to balance between number of requests and payload size.
- Implement caching for paginated responses to reduce server load and improve application performance.
- When displaying a list of users, include controls to change the sort field and direction.
- Handle empty result sets gracefully in your UI.

## Code examples

### Fetch all users with pagination

```javascript
// JavaScript example: Fetch all users with pagination
async function getAllUsers() {
  const pageSize = 20;
  let currentPage = 0;
  let allUsers = [];
  let hasMoreUsers = true;
  
  while (hasMoreUsers) {
    try {
      const response = await fetch(`http://localhost:3000/users?_page=${currentPage}&_perPage=${pageSize}`, {
        headers: {
          'Authorization': 'Bearer your-token-here'
        }
      });
      
      if (!response.ok) {
        throw new Error(`API error: ${response.status}`);
      }
      
      const data = await response.json();
      const users = data.users;
      
      if (users.length === 0) {
        hasMoreUsers = false;
      } else {
        allUsers = allUsers.concat(users);
        currentPage++;
        
        // Check if we received fewer users than requested (last page)
        if (users.length < pageSize) {
          hasMoreUsers = false;
        }
      }
    } catch (error) {
      console.error('Error fetching users:', error);
      hasMoreUsers = false;
    }
  }
  
  return allUsers;
}
```

```python
# Python example: Fetch all users with pagination
import requests

def get_all_users(token):
    page_size = 20
    current_page = 0
    all_users = []
    has_more_users = True
    
    while has_more_users:
        try:
            url = f"http://localhost:3000/users?_page={current_page}&_perPage={page_size}"
            headers = {"Authorization": f"Bearer {token}"}
            
            response = requests.get(url, headers=headers)
            response.raise_for_status()
            
            data = response.json()
            users = data.get("users", [])
            
            if not users:
                has_more_users = False
            else:
                all_users.extend(users)
                current_page += 1
                
                # Check if we received fewer users than requested (last page)
                if len(users) < page_size:
                    has_more_users = False
                    
        except Exception as e:
            print(f"Error fetching users: {e}")
            has_more_users = False
    
    return all_users
```

```bash
# cURL example: Fetch all users with pagination (bash script)
#!/bin/bash

TOKEN="your-token-here"
PAGE_SIZE=20
CURRENT_PAGE=0
ALL_USERS=""

while true; do
  RESPONSE=$(curl -s -X GET "http://localhost:3000/users?_page=$CURRENT_PAGE&_perPage=$PAGE_SIZE" \
    -H "Authorization: Bearer $TOKEN")
  
  # Extract users array
  USERS=$(echo $RESPONSE | jq -r '.users')
  
  # Check if users array is empty or has fewer items than page size
  USER_COUNT=$(echo $USERS | jq -r 'length')
  
  if [ "$USER_COUNT" -eq 0 ]; then
    break
  fi
  
  # Append to all users
  if [ -z "$ALL_USERS" ]; then
    ALL_USERS=$USERS
  else
    ALL_USERS=$(echo $ALL_USERS $USERS | jq -s 'add')
  fi
  
  CURRENT_PAGE=$((CURRENT_PAGE + 1))
  
  if [ "$USER_COUNT" -lt "$PAGE_SIZE" ]; then
    break
  fi
done

echo $ALL_USERS | jq
```

## Related resources

- [User resource](../resources/user-resource.md)
- [Pagination](../core-concepts/pagination.md)
- [Sorting](../core-concepts/sorting.md)

## See also

- [Create a user](create-user.md)
- [Get user by ID](get-user-by-id.md)
- [Update a user](update-user.md)
- [Delete a user](delete-user.md)

--- FILE: api-reference/create-user.md ---
---
title: "Create a user"
description: "API endpoint to create a new user in the system."
tags: ["users", "endpoint", "POST"]
categories: ["api-reference"]
importance: 7
api_endpoints: ["/users"]
related_pages: ["user-resource"]
parent: "API Reference" 
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 20, 2025"
nav_order: "3"
layout: "default"
version: "v1.0.0"
lastUpdated: "May 20, 2025"
---

# Create a user

Creates a new user in the system. The API generates a unique identifier for the new user.

## Endpoint

```
POST /users
```

## Path parameters

None.

## Request body

| Property | Type | Description | Required | Constraints |
|----------|------|-------------|----------|------------|
| `firstName` | string | User's first name | Yes | 1-100 characters |
| `lastName` | string | User's last name | Yes | 1-100 characters |
| `contactEmail` | string | User's email address | Yes | Valid email format, 3-255 characters |

Example request body:

```json
{
  "firstName": "John",
  "lastName": "Doe",
  "contactEmail": "john.doe@example.com"
}
```

## Request example

```bash
# cURL example
curl -X POST http://localhost:3000/users \
  -H "Authorization: Bearer your-token-here" \
  -H "Content-Type: application/json" \
  -d '{
    "firstName": "John",
    "lastName": "Doe",
    "contactEmail": "john.doe@example.com"
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
    "firstName": "John",
    "lastName": "Doe",
    "contactEmail": "john.doe@example.com"
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
    firstName: 'John',
    lastName: 'Doe',
    contactEmail: 'john.doe@example.com'
  })
})
.then(response => response.json())
.then(data => console.log(data));
```

## Response

### Success response (201 Created)

```json
{
  "userId": 1,
  "firstName": "John",
  "lastName": "Doe",
  "contactEmail": "john.doe@example.com"
}
```

### Error responses

| Status code | Description | Error code |
|-------------|-------------|------------|
| 400 Bad Request | Invalid request body | `INVALID_FIELD`, `MISSING_REQUIRED_FIELD` |
| 401 Unauthorized | Missing or invalid authentication | `UNAUTHORIZED` |
| 403 Forbidden | Insufficient permissions | `FORBIDDEN` |
| 429 Too Many Requests | Rate limit exceeded | `RATE_LIMIT_EXCEEDED` |
| 500 Server Error | Unexpected server error | `SERVER_ERROR` |

See [Error responses](error-responses.md) for details on error response format.

## Authentication

This endpoint requires authentication using a bearer token:

```
Authorization: Bearer your-token-here
```

## Important considerations

- The `contactEmail` must be unique across all users in the system. If you attempt to create a user with an email that already exists, the API will return a 400 Bad Request response.
- The `userId` is generated by the system and cannot be specified in the request.
- All fields are required. If any field is missing, the API will return a 400 Bad Request response with a `MISSING_REQUIRED_FIELD` error code.
- String fields have minimum and maximum length constraints. If a field value is too short or too long, the API will return a 400 Bad Request response with an `INVALID_FIELD` error code.
- The `contactEmail` field must contain a valid email address. If the email format is invalid, the API will return a 400 Bad Request response with an `INVALID_FIELD` error code.

## Best practices

- Validate user input on the client side before sending the request to reduce unnecessary API calls.
- Handle unique email constraints by checking if the email already exists before creating a new user.
- Use proper error handling to provide meaningful feedback to users when their input is invalid.
- Consider implementing a confirmation step for email addresses to ensure they are correct.

## Code examples

### Create a new user with error handling

```javascript
// JavaScript

--- FILE: advanced/security-best-practices.md ---
---
title: "Security best practices"
description: "Advanced security considerations when working with the Task Management API."
tags: ["security", "best practices"]
categories: ["advanced"]
importance: 6
parent: "Advanced Topics" 
ai-generated: false
nav_order: "2"
layout: "default"
version: "v1.0.0"
lastUpdated: "May 20, 2025"
---

# Security best practices

This guide provides recommendations for implementing security best practices when working with the Task Management API.

## Secure authentication handling

### Token security

Bearer tokens are used to authenticate with the API. To keep these tokens secure:

1. **Never expose tokens in client-side code**: Store tokens securely on the server side whenever possible.
2. **Implement token rotation**: Regularly rotate tokens to limit the impact of potential breaches.
3. **Use secure storage**: Store tokens in secure environments, not in plain text or version control.
4. **Set appropriate token expiry**: Use short-lived tokens when possible to reduce the risk of token theft.

### Secure storage in different environments

**Browser environments:**
```javascript
// Use secure storage options like HttpOnly cookies instead of localStorage
// Bad - Don't do this
localStorage.setItem('apiToken', 'your-token-here');

// Better - Use HttpOnly cookies set by your server
// The token isn't accessible via JavaScript
```

**Mobile environments:**
```javascript
// Use secure storage options provided by the platform
// iOS - Keychain
// Android - EncryptedSharedPreferences
// React Native example using secure-storage library
import SecureStorage from 'react-native-secure-storage';

async function storeToken(token) {
  try {
    await SecureStorage.setItem('apiToken', token);
  } catch (error) {
    console.error('Error storing token securely:', error);
  }
}
```

**Server environments:**
```javascript
// Use environment variables or secure key management systems
// Node.js example
const apiToken = process.env.API_TOKEN;

// Use a service like AWS Secrets Manager, HashiCorp Vault, etc.
```

## Request and response security

### HTTPS usage

Always use HTTPS for all API communications, even in development environments. This prevents man-in-the-middle attacks and eavesdropping.

### Input validation

Validate all input before sending it to the API:

```javascript
// JavaScript example of input validation
function validateTaskInput(taskData) {
  const errors = {};
  
  // Validate required fields
  if (!taskData.taskTitle || taskData.taskTitle.trim() === '') {
    errors.taskTitle = 'Task title is required';
  } else if (taskData.taskTitle.length > 80) {
    errors.taskTitle = 'Task title must be 80 characters or less';
  }
  
  if (!taskData.userId || typeof taskData.userId !== 'number') {
    errors.userId = 'Valid user ID is required';
  }
  
  if (!taskData.dueDate) {
    errors.dueDate = 'Due date is required';
  } else {
    // Validate date format
    const dateRegex = /^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}(?:Z|[+-]\d{2}:\d{2})$/;
    if (!dateRegex.test(taskData.dueDate)) {
      errors.dueDate = 'Due date must be in ISO 8601 format (YYYY-MM-DDTHH:MM:SSZ)';
    }
  }
  
  if (taskData.warningOffset === undefined) {
    errors.warningOffset = 'Warning offset is required';
  } else if (typeof taskData.warningOffset !== 'number' || 
             taskData.warningOffset < 0 || 
             taskData.warningOffset > 64000) {
    errors.warningOffset = 'Warning offset must be a number between 0 and 64000';
  }
  
  if (taskData.taskStatus && 
      !['NOT_STARTED', 'IN_PROGRESS', 'BLOCKED', 'DEFERRED', 'COMPLETED', 'CANCELLED']
        .includes(taskData.taskStatus)) {
    errors.taskStatus = 'Invalid task status';
  }
  
  return {
    isValid: Object.keys(errors).length === 0,
    errors
  };
}

// Usage example
const taskData = {
  userId: 1,
  taskTitle: 'Complete security review',
  taskDescription: 'Review security practices for the API integration',
  dueDate: '2025-06-15T17:00:00-05:00',
  warningOffset: 120
};

const validation = validateTaskInput(taskData);
if (!validation.isValid) {
  console.error('Invalid task data:', validation.errors);
  // Don't proceed with the API call
} else {
  // Safe to send to API
  createTask(taskData);
}
```

### Output sanitization

Always sanitize data received from the API before displaying it to users or using it in your application:

```javascript
// JavaScript example of basic output sanitization
function sanitizeHtml(text) {
  if (!text) return '';
  
  return text
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&#39;');
}

// Usage example
function displayTaskDescription(task) {
  const safeDescription = sanitizeHtml(task.taskDescription);
  document.getElementById('task-description').innerHTML = safeDescription;
}
```

## Authorization and access control

### Principle of least privilege

Apply the principle of least privilege to your API usage:

1. Only request access to resources your application needs
2. Only perform operations that are necessary
3. Implement additional authorization checks in your application

### User-based access control

Implement user-based access control in your application:

```javascript
// JavaScript example of user-based access control
function canUserManageTask(userId, taskUserId) {
  // Check if the current user is the owner of the task
  if (userId === taskUserId) {
    return true;
  }
  
  // Check if the user has admin privileges
  if (userHasAdminRole(userId)) {
    return true;
  }
  
  return false;
}

// Usage example
async function updateTaskStatus(taskId, newStatus) {
  const currentUserId = getCurrentUserId(); // Get from your auth system
  
  // Fetch the task to check ownership
  try {
    const task = await api.getTask(taskId);
    
    if (!canUserManageTask(currentUserId, task.userId)) {
      throw new Error('You do not have permission to update this task');
    }
    
    // Proceed with the update
    return await api.updateTaskStatus(taskId, newStatus);
  } catch (error) {
    console.error('Error updating task status:', error);
    throw error;
  }
}
```

## Securing sensitive data

### Handling personal information

When working with personal information in the User resource:

1. Only collect and store the minimum necessary information
2. Implement appropriate data access controls
3. Consider data masking for sensitive fields
4. Follow applicable data protection regulations (GDPR, CCPA, etc.)

### Data minimization

Only request and store the data you need for your application:

```javascript
// JavaScript example of data minimization
// Instead of storing the entire user object
const fullUser = {
  userId: 1,
  firstName: 'John',
  lastName: 'Doe',
  contactEmail: 'john.doe@example.com',
  // Other potentially sensitive fields
};

// Store only what you need
const minimizedUser = {
  userId: fullUser.userId,
  displayName: `${fullUser.firstName} ${fullUser.lastName.charAt(0)}.` // "John D."
};

// Use the minimized data in your application
displayTaskAssignee(minimizedUser.displayName);
```

## Secure deployment practices

### Environment configuration

Use different environment configurations for development, testing, and production:

```javascript
// JavaScript example of environment configuration
const config = {
  development: {
    apiUrl: 'http://localhost:3000',
    logLevel: 'debug'
  },
  test: {
    apiUrl: 'https://test-api.example.com',
    logLevel: 'info'
  },
  production: {
    apiUrl: 'https://api.example.com',
    logLevel: 'error'
  }
};

// Select configuration based on environment
const env = process.env.NODE_ENV || 'development';
const apiConfig = config[env];

console.log(`Using API URL: ${apiConfig.apiUrl} with log level: ${apiConfig.logLevel}`);
```

### Dependency security

Regularly audit and update your dependencies:

1. Use tools like npm audit, OWASP Dependency Check, or Snyk
2. Keep dependencies updated to the latest secure versions
3. Lock dependency versions to prevent unexpected changes
4. Implement a vulnerable dependency monitoring system

## Monitoring and incident response

### Security logging

Implement security-focused logging:

```javascript
// JavaScript example of security logging
function securityLog(event, details) {
  const logEntry = {
    timestamp: new Date().toISOString(),
    event,
    details,
    userId: getCurrentUserId(),
    sessionId: getSessionId(),
    ip: getClientIp()
  };
  
  // Log to your secure logging system
  console.log('SECURITY EVENT:', JSON.stringify(logEntry));
  
  // For production, send to a secure logging service
  // secureLoggingService.log(logEntry);
}

// Usage examples
function trackSensitiveActions() {
  // Track authentication events
  securityLog('LOGIN_SUCCESS', { method: 'bearer_token' });
  
  // Track access to sensitive data
  securityLog('USER_DATA_ACCESS', { userId: 123, fields: ['contactEmail'] });
  
  // Track changes to important resources
  securityLog('TASK_STATUS_CHANGE', { taskId: 456, oldStatus: 'IN_PROGRESS', newStatus: 'COMPLETED' });
  
  // Track potential security issues
  securityLog('REPEATED_AUTH_FAILURE', { attempts: 5, timeWindow: '10m' });
}
```

### Incident response plan

Develop an incident response plan for API security incidents:

1. Define what constitutes a security incident
2. Establish roles and responsibilities
3. Create communication protocols
4. Document response procedures
5. Implement recovery plans
6. Test and update the plan regularly

## Summary

Following these security best practices will help protect your application and user data when integrating with the Task Management API. Remember that security is an ongoing process, not a one-time implementation.

Key takeaways:
- Securely handle authentication tokens
- Validate all input and sanitize all output
- Implement proper authorization and access control
- Minimize and protect sensitive data
- Use secure deployment practices
- Monitor for security events and have an incident response plan

For more information on API security best practices, consult resources like the OWASP API Security Project.

--- FILE: advanced/handling-data-consistency.md ---
---
title: "Handling data consistency"
description: "Strategies for maintaining data consistency when working with the API, including handling race conditions and concurrency."
tags: ["data consistency", "concurrency"]
categories: ["advanced"]
importance: 4
parent: "Advanced Topics" 
ai-generated: false
nav_order: "3"
layout: "default"
version: "v1.0.0"
lastUpdated: "May 20, 2025"
---

# Handling data consistency

When working with the Task Management API, maintaining data consistency is important, especially in applications with multiple users or concurrent operations. This guide explores strategies for handling data consistency issues.

## Understanding concurrency challenges

### Common concurrency issues

When multiple clients interact with the same resources, several issues can arise:

1. **Race conditions**: When two operations occur almost simultaneously, leading to unexpected results
2. **Lost updates**: When one user's changes overwrite another user's changes
3. **Inconsistent reads**: When reading data that's in the middle of being modified
4. **Deadlocks**: When operations are waiting for each other to complete

### Example scenario: Task status updates

Consider a scenario where two users try to update the same task simultaneously:

1. User A reads task status: "IN_PROGRESS"
2. User B reads task status: "IN_PROGRESS"
3. User A updates status to "BLOCKED"
4. User B updates status to "COMPLETED"
5. Result: User B's update overwrites User A's update, and the "BLOCKED" status is lost

## Optimistic concurrency control

Optimistic concurrency control assumes conflicts are rare and handles them when they occur.

### Implementation strategy

1. Read the current state of the resource
2. Make local modifications
3. Check if the resource has been modified before updating
4. If no conflict, proceed with the update
5. If conflict, handle it according to business rules

### Client-side implementation

```javascript
// JavaScript example of optimistic concurrency control
async function updateTaskWithOptimisticLock(taskId, updates) {
  try {
    // 1. Get the current state of the task
    const originalTask = await api.getTask(taskId);
    const originalVersion = originalTask.version; // Assume a version field
    
    // 2. Prepare the updates with version check
    const updateData = {
      ...updates,
      expectedVersion: originalVersion
    };
    
    // 3. Attempt to update the resource
    const updatedTask = await api.updateTask(taskId, updateData);
    console.log('Task updated successfully:', updatedTask);
    return updatedTask;
  } catch (error) {
    // 4. Handle concurrency conflict
    if (error.code === 'VERSION_CONFLICT') {
      console.log('Task was modified by another user. Resolving conflict...');
      
      // Fetch the latest version
      const currentTask = await api.getTask(taskId);
      
      // Implement conflict resolution strategy (e.g., retry, merge, or notify user)
      return handleConflict(originalTask, currentTask, updates);
    }
    
    // Handle other errors
    throw error;
  }
}

// Conflict resolution function
function handleConflict(originalTask, currentTask, userUpdates) {
  // Option 1: Automatically merge non-conflicting changes
  const mergedUpdates = { ...userUpdates };
  
  // Don't overwrite fields that changed unless they match our original values
  Object.keys(userUpdates).forEach(key => {
    if (originalTask[key] !== currentTask[key]) {
      console.log(`Field "${key}" was changed by another user. Keeping their change.`);
      delete mergedUpdates[key];
    }
  });
  
  // Option 2: Present both versions to the user and let them decide
  showConflictResolutionUI(originalTask, currentTask, userUpdates);
  
  // Option 3: Apply a business-specific resolution strategy
  // For example, for task status, maybe "BLOCKED" takes precedence
  if (userUpdates.taskStatus === 'BLOCKED' && currentTask.taskStatus !== 'BLOCKED') {
    console.log('Keeping BLOCKED status as it takes precedence.');
    mergedUpdates.taskStatus = 'BLOCKED';
  }
  
  // If there are still changes to apply, retry the update
  if (Object.keys(mergedUpdates).length > 0) {
    return updateTaskWithOptimisticLock(currentTask.taskId, mergedUpdates);
  }
  
  // Otherwise return the current version
  return currentTask;
}
```

### Using HTTP conditional requests

If the API supports ETag headers or similar mechanisms:

```javascript
async function updateTaskWithEtag(taskId, updates) {
  try {
    // 1. Get the current state with ETag
    const response = await fetch(`http://localhost:3000/tasks/${taskId}`, {
      headers: {
        'Authorization': 'Bearer your-token-here'
      }
    });
    
    const originalTask = await response.json();
    const etag = response.headers.get('ETag');
    
    // 2. Attempt to update with If-Match header
    const updateResponse = await fetch(`http://localhost:3000/tasks/${taskId}`, {
      method: 'PATCH',
      headers: {
        'Authorization': 'Bearer your-token-here',
        'Content-Type': 'application/json',
        'If-Match': etag
      },
      body: JSON.stringify(updates)
    });
    
    // 3. Handle response
    if (updateResponse.status === 412) { // Precondition Failed
      // Resource was modified, handle conflict
      console.log('Task was modified by another user. Resolving conflict...');
      return handleEtagConflict(taskId, updates);
    }
    
    return await updateResponse.json();
  } catch (error) {
    console.error('Error updating task:', error);
    throw error;
  }
}
```

## Pessimistic concurrency control

Pessimistic concurrency control assumes conflicts are likely and prevents them by locking resources.

### Implementation approach

While the Task Management API doesn't directly support locks, you can implement a pessimistic approach using application-level locking:

```javascript
// JavaScript example of application-level locking
class TaskLockManager {
  constructor() {
    this.locks = new Map();
    this.lockTimeout = 60000; // 1 minute default
  }
  
  async acquireLock(taskId, userId) {
    const now = Date.now();
    const lockKey = `task-${taskId}`;
    
    // Check if there's an existing lock
    if (this.locks.has(lockKey)) {
      const lock = this.locks.get(lockKey);
      
      // If lock hasn't expired and belongs to someone else
      if (now - lock.timestamp < this.lockTimeout && lock.userId !== userId) {
        throw new Error(`Task is locked by another user until ${new Date(lock.timestamp + this.lockTimeout)}`);
      }
    }
    
    // Acquire or renew lock
    this.locks.set(lockKey, {
      userId,
      timestamp: now
    });
    
    console.log(`Lock acquired on task ${taskId} by user ${userId}`);
    return true;
  }
  
  releaseLock(taskId, userId) {
    const lockKey = `task-${taskId}`;
    
    // Only release if it's our lock
    if (this.locks.has(lockKey)) {
      const lock = this.locks.get(lockKey);
      
      if (lock.userId === userId) {
        this.locks.delete(lockKey);
        console.log(`Lock released on task ${taskId} by user ${userId}`);
        return true;
      }
    }
    
    return false;
  }
  
  // Clean up expired locks periodically
  startCleanupInterval() {
    setInterval(() => {
      const now = Date.now();
      
      for (const [lockKey, lock] of this.locks.entries()) {
        if (now - lock.timestamp >= this.lockTimeout) {
          console.log(`Lock on ${lockKey} expired and released`);
          this.locks.delete(lockKey);
        }
      }
    }, 30000); // Run every 30 seconds
  }
}

// Usage example
const lockManager = new TaskLockManager();
lockManager.startCleanupInterval();

async function updateTaskWithLock(taskId, userId, updates) {
  try {
    // Acquire lock before making changes
    await lockManager.acquireLock(taskId, userId);
    
    // Proceed with the update
    const updatedTask = await api.updateTask(taskId, updates);
    
    // Release the lock after the operation
    lockManager.releaseLock(taskId, userId);
    
    return updatedTask;
  } catch (error) {
    console.error('Error updating task:', error);
    
    // Ensure lock is released even on error
    lockManager.releaseLock(taskId, userId);
    
    throw error;
  }
}
```

### Distributed locking considerations

For applications running on multiple servers, consider using a distributed locking mechanism:

1. Use a database that supports locking
2. Implement locking through Redis or similar services
3. Use specialized distributed lock services

## Batch operations and transactions

When making multiple related changes, use batch operations to reduce the chance of inconsistency.

### Batching related operations

```javascript
// JavaScript example of batching operations
async function assignMultipleTasksToUser(taskIds, userId) {
  const successfulUpdates = [];
  const failedUpdates = [];
  
  // Process all tasks in parallel
  const updatePromises = taskIds.map(async taskId => {
    try {
      const result = await api.updateTask(taskId, { userId });
      successfulUpdates.push({ taskId, result });
      return { success: true, taskId };
    } catch (error) {
      failedUpdates.push({ taskId, error });
      return { success: false, taskId, error };
    }
  });
  
  // Wait for all operations to complete
  const results = await Promise.all(updatePromises);
  
  return {
    successful: successfulUpdates,
    failed: failedUpdates,
    allSucceeded: failedUpdates.length === 0
  };
}

// Usage example
async function reassignUserTasks(oldUserId, newUserId) {
  try {
    // 1. Get all tasks for the old user
    const response = await api.getTasks({ userId: oldUserId });
    const tasks = response.tasks;
    
    if (tasks.length === 0) {
      console.log(`No tasks found for user ${oldUserId}`);
      return { successful: [], failed: [], allSucceeded: true };
    }
    
    // 2. Extract task IDs
    const taskIds = tasks.map(task => task.taskId);
    
    // 3. Reassign all tasks to the new user
    console.log(`Reassigning ${taskIds.length} tasks from user ${oldUserId} to user ${newUserId}`);
    return await assignMultipleTasksToUser(taskIds, newUserId);
  } catch (error) {
    console.error('Error reassigning tasks:', error);
    throw error;
  }
}
```

## Retry strategies

Implement retry strategies for operations that might fail due to temporary conditions.

### Exponential backoff

```javascript
// JavaScript example of retry with exponential backoff
async function retryOperation(operation, maxRetries = 3, initialDelay = 1000) {
  let retries = 0;
  
  while (true) {
    try {
      return await operation();
    } catch (error) {
      retries++;
      
      // If we've hit the retry limit, or it's not a retryable error, rethrow
      if (retries > maxRetries || !isRetryableError(error)) {
        throw error;
      }
      
      // Calculate backoff delay (1s, 2s, 4s, etc.)
      const delay = initialDelay * Math.pow(2, retries - 1);
      console.log(`Operation failed. Retrying in ${delay}ms... (Attempt ${retries}/${maxRetries})`);
      
      // Wait before retrying
      await new Promise(resolve => setTimeout(resolve, delay));
    }
  }
}

// Helper to determine if an error is retryable
function isRetryableError(error) {
  // Customize based on API error responses
  return error.status === 429 || // Rate limiting
         error.status >= 500 ||  // Server errors
         error.code === 'NETWORK_ERROR'; // Network issues
}

// Usage example
async function updateTaskWithRetry(taskId, updates) {
  return retryOperation(
    () => api.updateTask(taskId, updates),
    3, // max retries
    1000 // initial delay
  );
}
```

## Eventual consistency considerations

The Task Management API might use eventual consistency for some operations, where changes take time to propagate.

### Handling eventual consistency

1. **Use appropriate polling strategies**: When changes aren't immediately visible, implement appropriate polling
2. **Implement optimistic UI updates**: Update the UI immediately but confirm changes with the server
3. **Provide user feedback**: Inform users when changes are pending or being processed

```javascript
// JavaScript example of handling eventual consistency
async function updateTaskWithConsistencyCheck(taskId, updates) {
  // Make the update
  await api.updateTask(taskId, updates);
  
  // Implement a polling strategy to verify the update
  const maxAttempts = 5;
  const pollInterval = 500; // 500ms
  
  for (let attempt = 0; attempt < maxAttempts; attempt++) {
    // Wait before checking
    await new Promise(resolve => setTimeout(resolve, pollInterval));
    
    // Get the latest task state
    const task = await api.getTask(taskId);
    
    // Check if our updates are reflected
    const isConsistent = Object.keys(updates).every(key => 
      task[key] === updates[key]
    );
    
    if (isConsistent) {
      console.log(`Update to task ${taskId} confirmed after ${attempt + 1} attempt(s)`);
      return task;
    }
    
    console.log(`Update not yet consistent on attempt ${attempt + 1}. Retrying...`);
  }
  
  console.warn(`Update to task ${taskId} may not be fully propagated after ${maxAttempts} checks`);
  // Get the latest state anyway
  return await api.getTask(taskId);
}
```

## Data validation and integrity

Implement client-side validation to ensure data integrity before sending requests.

### Comprehensive validation

```javascript
// JavaScript example of comprehensive validation
function validateTaskData(taskData, isUpdate = false) {
  const errors = {};
  
  // In update mode, we don't require all fields
  if (!isUpdate) {
    // Required fields
    if (!taskData.userId) errors.userId = 'User ID is required';
    if (!taskData.taskTitle) errors.taskTitle = 'Task title is required';
    if (!taskData.dueDate) errors.dueDate = 'Due date is required';
    if (taskData.warningOffset === undefined) errors.warningOffset = 'Warning offset is required';
  }
  
  // Field validation if present
  if (taskData.taskTitle && (taskData.taskTitle.length < 1 || taskData.taskTitle.length > 80)) {
    errors.taskTitle = 'Task title must be between 1 and 80 characters';
  }
  
  if (taskData.taskDescription && taskData.taskDescription.length > 255) {
    errors.taskDescription = 'Task description must be 255 characters or less';
  }
  
  if (taskData.dueDate) {
    const dueDate = new Date(taskData.dueDate);
    const now = new Date();
    
    if (isNaN(dueDate.getTime())) {
      errors.dueDate = 'Invalid date format';
    } else if (dueDate < now && !isUpdate) {
      errors.dueDate = 'Due date must be in the future';
    }
  }
  
  if (taskData.warningOffset !== undefined) {
    if (typeof taskData.warningOffset !== 'number' || 
        taskData.warningOffset < 0 || 
        taskData.warningOffset > 64000) {
      errors.warningOffset = 'Warning offset must be between 0 and 64000';
    }
  }
  
  if (taskData.taskStatus && 
      !['NOT_STARTED', 'IN_PROGRESS', 'BLOCKED', 'DEFERRED', 'COMPLETED', 'CANCELLED']
        .includes(taskData.taskStatus)) {
    errors.taskStatus = 'Invalid task status';
  }
  
  return {
    isValid: Object.keys(errors).length === 0,
    errors
  };
}
```

## Summary

By implementing these strategies for handling data consistency, you can create robust applications that maintain data integrity even in complex scenarios with concurrent operations.

Key takeaways:
- Choose the right concurrency control strategy based on your needs
- Implement proper validation to ensure data integrity
- Use batching for related operations
- Develop retry strategies for transient failures
- Account for eventual consistency in your application design

These approaches help you build reliable applications that provide a consistent user experience while working with the Task Management API.

--- FILE: api-reference/update-task.md ---
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

--- FILE: api-reference/update-user.md ---
---
title: "Update a user"
description: "API endpoint to update an existing user's information."
tags: ["users", "endpoint", "PATCH"]
categories: ["api-reference"]
importance: 7
api_endpoints: ["/users/{userId}"]
related_pages: ["user-resource"]
parent: "API Reference" 
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 20, 2025"
nav_order: "5"
layout: "default"
version: "v1.0.0"
lastUpdated: "May 20, 2025"
---

# Update a user

Updates one or more properties of an existing user. The API supports partial updates, so you only need to include the fields you want to change.

## Endpoint

```
PATCH /users/{userId}
```

## Path parameters

| Parameter | Type | Description | Required |
|-----------|------|-------------|----------|
| `userId` | integer | The unique identifier of the user to update | Yes |

## Request body

| Property | Type | Description | Required | Constraints |
|----------|------|-------------|----------|------------|
| `firstName` | string | User's first name | No | 1-100 characters |
| `lastName` | string | User's last name | No | 1-100 characters |
| `contactEmail` | string | User's email address | No | Valid email format, 3-255 characters |

You must include at least one property in the request body.

Example request body:

```json
{
  "contactEmail": "new.email@example.com"
}
```

## Request example

```bash
# cURL example
curl -X PATCH http://localhost:3000/users/1 \
  -H "Authorization: Bearer your-token-here" \
  -H "Content-Type: application/json" \
  -d '{
    "contactEmail": "new.email@example.com"
  }'
```

```python
# Python example
import requests

url = "http://localhost:3000/users/1"
headers = {
    "Authorization": "Bearer your-token-here",
    "Content-Type": "application/json"
}
data = {
    "contactEmail": "new.email@example.com"
}

response = requests.patch(url, headers=headers, json=data)
print(response.json())
```

```javascript
// JavaScript example
fetch('http://localhost:3000/users/1', {
  method: 'PATCH',
  headers: {
    'Authorization': 'Bearer your-token-here',
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({
    contactEmail: 'new.email@example.com'
  })
})
.then(response => response.json())
.then(data => console.log(data));
```

## Response

### Success response (200 OK)

```json
{
  "userId": 1,
  "firstName": "John",
  "lastName": "Doe",
  "contactEmail": "new.email@example.com"
}
```

### Error responses

| Status code | Description | Error code |
|-------------|-------------|------------|
| 400 Bad Request | Invalid request body or user ID | `INVALID_FIELD` |
| 401 Unauthorized | Missing or invalid authentication | `UNAUTHORIZED` |
| 403 Forbidden | Insufficient permissions | `FORBIDDEN` |
| 404 Not Found | User not found | `RESOURCE_NOT_FOUND` |
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
- The `userId` must be a valid integer that corresponds to an existing user. If the specified user does not exist, the API will return a 404 Not Found response.
- The `contactEmail` must be unique across all users in the system. If you attempt to update a user with an email that already exists for another user, the API will return a 400 Bad Request response.
- String fields have minimum and maximum length constraints. If a field value is too short or too long, the API will return a 400 Bad Request response with an `INVALID_FIELD` error code.
- The `contactEmail` field must contain a valid email address. If the email format is invalid, the API will return a 400 Bad Request response with an `INVALID_FIELD` error code.
- The response includes the complete user object with all properties, including those that weren't updated.

## Best practices

- Only include the fields you want to update in the request body to minimize payload size.
- Validate user input on the client side before sending the request to reduce unnecessary API calls.
- Handle unique email constraints by checking if the email already exists before updating a user.
- Use proper error handling to provide meaningful feedback to users when their input is invalid.
- Consider implementing optimistic updates in your UI to improve perceived performance.

## Code examples

### Update a user with error handling

```javascript
// JavaScript example: Update a user with error handling
async function updateUser(userId, userData) {
  try {
    const response = await fetch(`http://localhost:3000/users/${userId}`, {
      method: 'PATCH',
      headers: {
        'Authorization': 'Bearer your-token-here',
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(userData)
    });
    
    if (!response.ok) {
      const errorData = await response.json();
      
      // Handle specific error cases
      if (errorData.code === 'RESOURCE_NOT_FOUND') {
        throw new Error(`User with ID ${userId} not found`);
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
      
      throw new Error(errorData.message || `Failed to update user with ID ${userId}`);
    }
    
    return await response.json();
  } catch (error) {
    console.error(`Error updating user with ID ${userId}:`, error);
    throw error;
  }
}

// Usage example
try {
  const updatedUser = await updateUser(1, {
    contactEmail: 'new.email@example.com'
  });
  console.log('User updated:', updatedUser);
} catch (error) {
  if (error.fieldErrors) {
    // Handle field-specific errors
    Object.entries(error.fieldErrors).forEach(([field, reason]) => {
      console.error(`Error in ${field}: ${reason}`);
      // Update UI to show error for this field
    });
  } else {
    // Handle general error
    console.error('Failed to update user:', error.message);
  }
}
```

```python
# Python example: Update a user with error handling
def update_user(token, user_id, user_data):
    try:
        url = f"http://localhost:3000/users/{user_id}"
        headers = {
            "Authorization": f"Bearer {token}",
            "Content-Type": "application/json"
        }
        
        response = requests.patch(url, headers=headers, json=user_data)
        
        if response.status_code == 404:
            print(f"User with ID {user_id} not found")
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
            print(f"Error updating user: {str(e)}")
            return None
    except Exception as e:
        print(f"Error updating user: {str(e)}")
        return None

# Usage example
updated_user = update_user("your-token-here", 1, {
    "contactEmail": "new.email@example.com"
})

if updated_user:
    print(f"User updated: {updated_user}")
else:
    print("Failed to update user")
```

## Related resources

- [User resource](../resources/user-resource.md)

## See also

- [Get all users](get-all-users.md)
- [Create a user](create-user.md)
- [Get user by ID](get-user-by-id.md)
- [Delete a user](delete-user.md)

--- FILE: api-reference/get-all-tasks.md ---
---
title: "Get all tasks"
description: "API endpoint to retrieve a list of all tasks with pagination, sorting, and filtering options."
tags: ["tasks", "endpoint", "GET"]
categories: ["api-reference"]
importance: 7
api_endpoints: ["/tasks"]
related_pages: ["task-resource", "pagination", "sorting", "task-status-lifecycle"]
parent: "API Reference" 
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 20, 2025"
nav_order: "7"
layout: "default"
version: "v1.0.0"
lastUpdated: "May 20, 2025"
---

# Get all tasks

Retrieves a list of all tasks in the system. This endpoint supports pagination, sorting, and filtering options to help manage large result sets.

## Endpoint

```
GET /tasks
```

## Path parameters

None.

## Query parameters

| Parameter | Type | Description | Required | Default | Constraints |
|-----------|------|-------------|----------|---------|------------|
| `_page` | integer | Page number (zero-indexed) | No | 0 | Minimum: 0 |
| `_perPage` | integer | Number of items per page | No | 20 | Minimum: 1, Maximum: 100 |
| `_sort` | string | Field to sort by | No | None | Valid fields: `taskId`, `userId`, `taskTitle`, `taskStatus`, `dueDate`, `warningOffset` |
| `taskStatus` | string | Filter tasks by status | No | None | Must be one of the predefined status values |

### Sorting

To sort results in ascending order, specify the field name:
```
GET /tasks?_sort=dueDate
```

To sort results in descending order, prefix the field name with a hyphen:
```
GET /tasks?_sort=-dueDate
```

### Filtering by status

To filter tasks by their status:
```
GET /tasks?taskStatus=IN_PROGRESS
```

Valid status values:
- `NOT_STARTED`
- `IN_PROGRESS`
- `BLOCKED`
- `DEFERRED`
- `COMPLETED`
- `CANCELLED`

## Request example

```bash
# cURL example
curl -X GET "http://localhost:3000/tasks?_page=0&_perPage=10&_sort=-dueDate&taskStatus=IN_PROGRESS" \
  -H "Authorization: Bearer your-token-here"
```

```python
# Python example
import requests

url = "http://localhost:3000/tasks"
headers = {
    "Authorization": "Bearer your-token-here"
}
params = {
    "_page": 0,
    "_perPage": 10,
    "_sort": "-dueDate",
    "taskStatus": "IN_PROGRESS"
}

response = requests.get(url, headers=headers, params=params)
print(response.json())
```

```javascript
// JavaScript example
fetch('http://localhost:3000/tasks?_page=0&_perPage=10&_sort=-dueDate&taskStatus=IN_PROGRESS', {
  headers: {
    'Authorization': 'Bearer your-token-here'
  }
})
.then(response => response.json())
.then(data => console.log(data));
```

## Response

### Success response (200 OK)

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
    },
    {
      "taskId": 2,
      "userId": 1,
      "taskTitle": "Schedule team meeting",
      "taskDescription": "Set up weekly sync-up with the development team",
      "taskStatus": "IN_PROGRESS",
      "dueDate": "2025-06-10T10:00:00-05:00",
      "warningOffset": 60
    }
    // Additional tasks...
  ]
}
```

### Error responses

| Status code | Description | Error code |
|-------------|-------------|------------|
| 400 Bad Request | Invalid query parameters | `INVALID_FIELD` |
| 401 Unauthorized | Missing or invalid authentication | `UNAUTHORIZED` |
| 403 Forbidden | Insufficient permissions | `FORBIDDEN` |
| 429 Too Many Requests | Rate limit exceeded | `RATE_LIMIT_EXCEEDED` |
| 500 Server Error | Unexpected server error | `SERVER_ERROR` |

See [Error responses](error-responses.md) for details on error response format.

## Authentication

This endpoint requires authentication using a bearer token:

```
Authorization: Bearer your-token-here
```

## Important considerations

- The response does not include information about the total number of tasks or pages. Your application should check if the number of returned tasks is less than `_perPage` to determine if you've reached the last page.
- Sorting is case-sensitive. For example, when sorting by `taskTitle`, titles starting with uppercase letters will appear before those starting with lowercase letters.
- When retrieving large sets of tasks, use pagination to improve performance and reduce response payload size.
- The `taskStatus` filter is a strict equality filter. It will only return tasks that exactly match the specified status.

## Best practices

- Use reasonable page sizes (10-50 tasks per page) to balance between number of requests and payload size.
- Implement caching for paginated responses to reduce server load and improve application performance.
- Use the sorting feature to create useful views, such as sorting by due date to show most urgent tasks first.
- Use status filtering to create focused views for different workflow stages.
- Combine sorting and filtering to create highly customized views, such as "Most urgent IN_PROGRESS tasks."

## Code examples

### Fetch all tasks with pagination and filtering

```javascript
// JavaScript example: Fetch all tasks with pagination and filtering
async function getAllTasks(taskStatus) {
  const pageSize = 20;
  let currentPage = 0;
  let allTasks = [];
  let hasMoreTasks = true;
  
  // Build query parameters
  const queryParams = new URLSearchParams({
    _perPage: pageSize
  });
  
  // Add taskStatus filter if provided
  if (taskStatus) {
    queryParams.append('taskStatus', taskStatus);
  }
  
  while (hasMoreTasks) {
    try {
      // Update page for each request
      queryParams.set('_page', currentPage);
      
      const response = await fetch(`http://localhost:3000/tasks?${queryParams.toString()}`, {
        headers: {
          'Authorization': 'Bearer your-token-here'
        }
      });
      
      if (!response.ok) {
        throw new Error(`API error: ${response.status}`);
      }
      
      const data = await response.json();
      const tasks = data.tasks;
      
      if (tasks.length === 0) {
        hasMoreTasks = false;
      } else {
        allTasks = allTasks.concat(tasks);
        currentPage++;
        
        // Check if we received fewer tasks than requested (last page)
        if (tasks.length < pageSize) {
          hasMoreTasks = false;
        }
      }
    } catch (error) {
      console.error('Error fetching tasks:', error);
      hasMoreTasks = false;
    }
  }
  
  return allTasks;
}

// Usage example: Get all in-progress tasks
getAllTasks('IN_PROGRESS')
  .then(tasks => {
    console.log(`Found ${tasks.length} in-progress tasks`);
    console.log(tasks);
  })
  .catch(error => {
    console.error('Failed to retrieve tasks:', error);
  });
```

```python
# Python example: Fetch all tasks with pagination and filtering
def get_all_tasks(token, task_status=None):
    page_size = 20
    current_page = 0
    all_tasks = []
    has_more_tasks = True
    
    # Build query parameters
    params = {
        "_perPage": page_size
    }
    
    # Add taskStatus filter if provided
    if task_status:
        params["taskStatus"] = task_status
    
    while has_more_tasks:
        try:
            # Update page for each request
            params["_page"] = current_page
            
            url = "http://localhost:3000/tasks"
            headers = {"Authorization": f"Bearer {token}"}
            
            response = requests.get(url, headers=headers, params=params)
            response.raise_for_status()
            
            data = response.json()
            tasks = data.get("tasks", [])
            
            if not tasks:
                has_more_tasks = False
            else:
                all_tasks.extend(tasks)
                current_page += 1
                
                # Check if we received fewer tasks than requested (last page)
                if len(tasks) < page_size:
                    has_more_tasks = False
                    
        except Exception as e:
            print(f"Error fetching tasks: {e}")
            has_more_tasks = False
    
    return all_tasks

# Usage example: Get all completed tasks
completed_tasks = get_all_tasks("your-token-here", "COMPLETED")
print(f"Found {len(completed_tasks)} completed tasks")
print(completed_tasks)
```

## Related resources

- [Task resource](../resources/task-resource.md)
- [Pagination](../core-concepts/pagination.md)
- [Sorting](../core-concepts/sorting.md)
- [Task status lifecycle](../core-concepts/task-status-lifecycle.md)

## See also

- [Create a task](create-task.md)
- [Get task by ID](get-task-by-id.md)
- [Update a task](update-task.md)
- [Delete a task](delete-task.md)

--- FILE: api-reference/delete-user.md ---
---
title: "Delete a user"
description: "API endpoint to remove a user from the system."
tags: ["users", "endpoint", "DELETE"]
categories: ["api-reference"]
importance: 7
api_endpoints: ["/users/{userId}"]
related_pages: ["user-resource"]
parent: "API Reference" 
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 20, 2025"
nav_order: "6"
layout: "default"
version: "v1.0.0"
lastUpdated: "May 20, 2025"
---

# Delete a user

Removes a user from the system. This operation is irreversible.

## Endpoint

```
DELETE /users/{userId}
```

## Path parameters

| Parameter | Type | Description | Required |
|-----------|------|-------------|----------|
| `userId` | integer | The unique identifier of the user to delete | Yes |

## Request example

```bash
# cURL example
curl -X DELETE http://localhost:3000/users/1 \
  -H "Authorization: Bearer your-token-here"
```

```python
# Python example
import requests

url = "http://localhost:3000/users/1"
headers = {
    "Authorization": "Bearer your-token-here"
}

response = requests.delete(url, headers=headers)
print(response.status_code)
```

```javascript
// JavaScript example
fetch('http://localhost:3000/users/1', {
  method: 'DELETE',
  headers: {
    'Authorization': 'Bearer your-token-here'
  }
})
.then(response => {
  if (response.ok) {
    console.log('User deleted successfully');
  } else {
    throw new Error('Failed to delete user');
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
| 400 Bad Request | Invalid user ID format | `INVALID_FIELD` |
| 401 Unauthorized | Missing or invalid authentication | `UNAUTHORIZED` |
| 403 Forbidden | Insufficient permissions | `FORBIDDEN` |
| 404 Not Found | User not found | `RESOURCE_NOT_FOUND` |
| 429 Too Many Requests | Rate limit exceeded | `RATE_LIMIT_EXCEEDED` |
| 500 Server Error | Unexpected server error | `SERVER_ERROR` |

See [Error responses](error-responses.md) for details on error response format.

## Authentication

This endpoint requires authentication using a bearer token:

```
Authorization: Bearer your-token-here
```

## Important considerations

- This operation is irreversible. Once a user is deleted, it cannot be recovered.
- When a user is deleted, all tasks associated with that user are also deleted (cascade delete).
- The `userId` must be a valid integer that corresponds to an existing user. If the specified user does not exist, the API will return a 404 Not Found response.
- The API will not return a response body on success, only an HTTP 204 status code.

## Best practices

- Implement a confirmation step in your application before sending the delete request to prevent accidental deletions.
- Consider implementing a soft delete mechanism in your application if you need the ability to recover deleted users.
- Update your application's state after a successful deletion to reflect the change.
- Handle the 404 Not Found response gracefully if the user has already been deleted.

## Code examples

### Delete a user with error handling

```javascript
// JavaScript example: Delete a user with error handling
async function deleteUser(userId) {
  try {
    const response = await fetch(`http://localhost:3000/users/${userId}`, {
      method: 'DELETE',
      headers: {
        'Authorization': 'Bearer your-token-here'
      }
    });
    
    if (!response.ok) {
      const errorData = await response.json();
      
      if (response.status === 404) {
        throw new Error(`User with ID ${userId} not found`);
      }
      
      throw new Error(errorData.message || `Failed to delete user with ID ${userId}`);
    }
    
    return true; // Successful deletion
  } catch (error) {
    console.error(`Error deleting user with ID ${userId}:`, error);
    throw error;
  }
}

// Usage example
try {
  const success = await deleteUser(1);
  if (success) {
    console.log('User deleted successfully');
    // Update application state to reflect deletion
  }
} catch (error) {
  console.error('Failed to delete user:', error.message);
}
```

```python
# Python example: Delete a user with error handling
def delete_user(token, user_id):
    try:
        url = f"http://localhost:3000/users/{user_id}"
        headers = {
            "Authorization": f"Bearer {token}"
        }
        
        response = requests.delete(url, headers=headers)
        
        if response.status_code == 204:
            return True  # Successful deletion
        
        if response.status_code == 404:
            print(f"User with ID {user_id} not found")
            return False
            
        # Handle other error responses
        try:
            error_data = response.json()
            print(f"API error: {error_data.get('message', f'Status code: {response.status_code}')}")
        except ValueError:
            # Could not parse error response as JSON
            print(f"Error deleting user. Status code: {response.status_code}")
        
        return False
    except Exception as e:
        print(f"Error deleting user: {str(e)}")
        return False

# Usage example
success = delete_user("your-token-here", 1)

if success:
    print("User deleted successfully")
    # Update application state to reflect deletion
else:
    print("Failed to delete user")
```

## Related resources

- [User resource](../resources/user-resource.md)

## See also

- [Get all users](get-all-users.md)
- [Create a user](create-user.md)
- [Get user by ID](get-user-by-id.md)
- [Update a user](update-user.md)

--- FILE: api-reference/delete-task.md ---
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
- [Update a task](update-task.md)

--- FILE: api-reference/get-user-by-id.md ---
---
title: "Get user by ID"
description: "API endpoint to retrieve a specific user by their unique identifier."
tags: ["users", "endpoint", "GET"]
categories: ["api-reference"]
importance: 7
api_endpoints: ["/users/{userId}"]
related_pages: ["user-resource"]
parent: "API Reference" 
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 20, 2025"
nav_order: "4"
layout: "default"
version: "v1.0.0"
lastUpdated: "May 20, 2025"
---

# Get user by ID

Retrieves a specific user by their unique identifier.

## Endpoint

```
GET /users/{userId}
```

## Path parameters

| Parameter | Type | Description | Required |
|-----------|------|-------------|----------|
| `userId` | integer | The unique identifier of the user to retrieve | Yes |

## Request example

```bash
# cURL example
curl -X GET http://localhost:3000/users/1 \
  -H "Authorization: Bearer your-token-here"
```

```python
# Python example
import requests

url = "http://localhost:3000/users/1"
headers = {
    "Authorization": "Bearer your-token-here"
}

response = requests.get(url, headers=headers)
print(response.json())
```

```javascript
// JavaScript example
fetch('http://localhost:3000/users/1', {
  headers: {
    'Authorization': 'Bearer your-token-here'
  }
})
.then(response => response.json())
.then(data => console.log(data));
```

## Response

### Success response (200 OK)

```json
{
  "userId": 1,
  "firstName": "John",
  "lastName": "Doe",
  "contactEmail": "john.doe@example.com"
}
```

### Error responses

| Status code | Description | Error code |
|-------------|-------------|------------|
| 400 Bad Request | Invalid user ID format | `INVALID_FIELD` |
| 401 Unauthorized | Missing or invalid authentication | `UNAUTHORIZED` |
| 403 Forbidden | Insufficient permissions | `FORBIDDEN` |
| 404 Not Found | User not found | `RESOURCE_NOT_FOUND` |
| 429 Too Many Requests | Rate limit exceeded | `RATE_LIMIT_EXCEEDED` |
| 500 Server Error | Unexpected server error | `SERVER_ERROR` |

See [Error responses](error-responses.md) for details on error response format.

## Authentication

This endpoint requires authentication using a bearer token:

```
Authorization: Bearer your-token-here
```

## Important considerations

- The `userId` must be a valid integer that corresponds to an existing user.
- If the specified user does not exist, the API will return a 404 Not Found response.
- This endpoint returns a single user object, not an array.

## Best practices

- Cache user details when appropriate to reduce API calls.
- Implement proper error handling to deal with cases where the user does not exist.
- Use this endpoint when you need detailed information about a specific user rather than filtering the GET /users endpoint.

## Code examples

### Retrieve a user by ID with error handling

```javascript
// JavaScript example: Retrieve a user by ID with error handling
async function getUserById(userId) {
  try {
    const response = await fetch(`http://localhost:3000/users/${userId}`, {
      headers: {
        'Authorization': 'Bearer your-token-here'
      }
    });
    
    if (!response.ok) {
      const errorData = await response.json();
      
      if (response.status === 404) {
        throw new Error(`User with ID ${userId} not found`);
      }
      
      throw new Error(errorData.message || `Failed to retrieve user with ID ${userId}`);
    }
    
    return await response.json();
  } catch (error) {
    console.error(`Error retrieving user with ID ${userId}:`, error);
    throw error;
  }
}

// Usage example
try {
  const user = await getUserById(1);
  console.log('User details:', user);
} catch (error) {
  console.error('Failed to retrieve user:', error.message);
}
```

```python
# Python example: Retrieve a user by ID with error handling
def get_user_by_id(token, user_id):
    try:
        url = f"http://localhost:3000/users/{user_id}"
        headers = {
            "Authorization": f"Bearer {token}"
        }
        
        response = requests.get(url, headers=headers)
        
        if response.status_code == 404:
            print(f"User with ID {user_id} not found")
            return None
            
        response.raise_for_status()  # Raise exception for other 4XX/5XX status codes
        
        return response.json()
    except requests.exceptions.HTTPError as e:
        # Handle API errors
        try:
            error_data = e.response.json()
            print(f"API error: {error_data.get('message', str(e))}")
        except ValueError:
            # Could not parse error response as JSON
            print(f"Error retrieving user: {str(e)}")
        return None
    except Exception as e:
        print(f"Error retrieving user: {str(e)}")
        return None

# Usage example
user = get_user_by_id("your-token-here", 1)

if user:
    print(f"User details: {user}")
else:
    print("Failed to retrieve user")
```

## Related resources

- [User resource](../resources/user-resource.md)

## See also

- [Get all users](get-all-users.md)
- [Create a user](create-user.md)
- [Update a user](update-user.md)
- [Delete a user](delete-user.md)

--- FILE: api-reference/create-task.md ---
---
title: "Create a task"
description: "API endpoint to create a new task in the system."
tags: ["tasks", "endpoint", "POST"]
categories: ["api-reference"]
importance: 7
api_endpoints: ["/tasks"]
related_pages: ["task-resource", "task-status-lifecycle"]
parent: "API Reference" 
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 20, 2025"
nav_order: "8"
layout: "default"
version: "v1.0.0"
lastUpdated: "May 20, 2025"
---

# Create a task

Creates a new task in the system. The API generates a unique identifier for the new task.

## Endpoint

```
POST /tasks
```

## Path parameters

None.

## Request body

| Property | Type | Description | Required | Constraints |
|----------|------|-------------|----------|------------|
| `userId` | integer | ID of the user who owns the task | Yes | Must reference a valid user |
| `taskTitle` | string | Short description of the task | Yes | 1-80 characters |
| `taskDescription` | string | Detailed description of the task | No | 1-255 characters |
| `taskStatus` | string | Current status of the task | No | Must be one of the predefined status values |
| `dueDate` | string (date-time) | When the task is due | Yes | ISO 8601 format |
| `warningOffset` | integer | Minutes before due date to send reminder | Yes | 0-64000 |

Example request body:

```json
{
  "userId": 1,
  "taskTitle": "Complete project proposal",
  "taskDescription": "Finish the proposal for the new client project",
  "dueDate": "2025-06-15T17:00:00-05:00",
  "warningOffset": 120
}
```

## Request example

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

## Response

### Success response (201 Created)

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

### Error responses

| Status code | Description | Error code |
|-------------|-------------|------------|
| 400 Bad Request | Invalid request body | `INVALID_FIELD`, `MISSING_REQUIRED_FIELD` |
| 401 Unauthorized | Missing or invalid authentication | `UNAUTHORIZED` |
| 403 Forbidden | Insufficient permissions | `FORBIDDEN` |
| 429 Too Many Requests | Rate limit exceeded | `RATE_LIMIT_EXCEEDED` |
| 500 Server Error | Unexpected server error | `SERVER_ERROR` |

See [Error responses](error-responses.md) for details on error response format.

## Authentication

This endpoint requires authentication using a bearer token:

```
Authorization: Bearer your-token-here
```

## Important considerations

- The `userId` must reference an existing user in the system. If the user doesn't exist, the API will return a 400 Bad Request response.
- The `taskId` is generated by the system and cannot be specified in the request.
- If `taskStatus` is not provided, it defaults to `NOT_STARTED`.
- The `dueDate` should be in the future when creating a task.
- The `dueDate` must be in ISO 8601 format (e.g., `2025-06-15T17:00:00-05:00`).
- The `warningOffset` is used to calculate when reminders should be sent (e.g., 120 minutes before the due date).
- All required fields must be included in the request. If any required field is missing, the API will return a 400 Bad Request response with a `MISSING_REQUIRED_FIELD` error code.
- String fields have minimum and maximum length constraints. If a field value is too short or too long, the API will return a 400 Bad Request response with an `INVALID_FIELD` error code.

## Best practices

- Validate user input on the client side before sending the request to reduce unnecessary API calls.
- Use appropriate task titles that clearly describe the task.
- Set realistic due dates to help users manage their time effectively.
- Choose appropriate warning offsets based on the nature and urgency of the task.
- Handle errors gracefully and provide meaningful feedback to users.

## Code examples

### Create a new task with error handling

```javascript
// JavaScript example: Create a new task with error handling
async function createTask(taskData) {
  try {
    const response = await fetch('http://localhost:3000/tasks', {
      method: 'POST',
      headers: {
        'Authorization': 'Bearer your-token-here',
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(taskData)
    });
    
    if (!response.ok) {
      const errorData = await response.json();
      
      // Handle specific error cases
      if (errorData.code === 'INVALID_FIELD' || errorData.code === 'MISSING_REQUIRED_FIELD') {
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
      
      throw new Error(errorData.message || 'Failed to create task');
    }
    
    return await response.json();
  } catch (error) {
    console.error('Error creating task:', error);
    throw error;
  }
}

// Helper function to format date in ISO 8601 format
function formatDate(date) {
  return date.toISOString();
}

// Usage example
try {
  // Create a due date 2 days from now
  const dueDate = new Date();
  dueDate.setDate(dueDate.getDate() + 2);
  
  const newTask = await createTask({
    userId: 1,
    taskTitle: 'Complete project proposal',
    taskDescription: 'Finish the proposal for the new client project',
    dueDate: formatDate(dueDate),
    warningOffset: 120
  });
  
  console.log('Task created:', newTask);
} catch (error) {
  if (error.fieldErrors) {
    // Handle field-specific errors
    Object.entries(error.fieldErrors).forEach(([field, reason]) => {
      console.error(`Error in ${field}: ${reason}`);
      // Update UI to show error for this field
    });
  } else {
    // Handle general error
    console.error('Failed to create task:', error.message);
  }
}
```

```python
# Python example: Create a new task with error handling
from datetime import datetime, timedelta
import requests

def create_task(token, task_data):
    try:
        url = "http://localhost:3000/tasks"
        headers = {
            "Authorization": f"Bearer {token}",
            "Content-Type": "application/json"
        }
        
        response = requests.post(url, headers=headers, json=task_data)
        response.raise_for_status()  # Raise exception for 4XX/5XX status codes
        
        return response.json()
    except requests.exceptions.HTTPError as e:
        # Handle API errors
        try:
            error_data = e.response.json()
            
            # Handle field-specific errors
            if error_data.get("code") in ["INVALID_FIELD", "MISSING_REQUIRED_FIELD"]:
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
            print(f"Error creating task: {str(e)}")
            return None
    except Exception as e:
        print(f"Error creating task: {str(e)}")
        return None

# Helper function to format date in ISO 8601 format
def format_date(date):
    return date.isoformat()

# Usage example
# Create a due date 2 days from now
due_date = datetime.now() + timedelta(days=2)

new_task = create_task("your-token-here", {
    "userId": 1,
    "taskTitle": "Complete project proposal",
    "taskDescription": "Finish the proposal for the new client project",
    "dueDate": format_date(due_date),
    "warningOffset": 120
})

if new_task:
    print(f"Task created: {new_task}")
else:
    print("Failed to create task")
```

## Related resources

- [Task resource](../resources/task-resource.md)
- [Task status lifecycle](../core-concepts/task-status-lifecycle.md)

## See also

- [Get all tasks](get-all-tasks.md)
- [Get task by ID](get-task-by-id.md)
- [Update a task](update-task.md)
- [Delete a task](delete-task.md)

--- FILE: api-reference/get-task-by-id.md ---
---
title: "Get task by ID"
description: "API endpoint to retrieve a specific task by its unique identifier."
tags: ["tasks", "endpoint", "GET"]
categories: ["api-reference"]
importance: 7
api_endpoints: ["/tasks/{taskId}"]
related_pages: ["task-resource"]
parent: "API Reference" 
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 20, 2025"
nav_order: "9"
layout: "default"
version: "v1.0.0"
lastUpdated: "May 20, 2025"
---

# Get task by ID

Retrieves a specific task by its unique identifier.

## Endpoint

```
GET /tasks/{taskId}
```

## Path parameters

| Parameter | Type | Description | Required |
|-----------|------|-------------|----------|
| `taskId` | integer | The unique identifier of the task to retrieve | Yes |

## Request example

```bash
# cURL example
curl -X GET http://localhost:3000/tasks/1 \
  -H "Authorization: Bearer your-token-here"
```

```python
# Python example
import requests

url = "http://localhost:3000/tasks/1"
headers = {
    "Authorization": "Bearer your-token-here"
}

response = requests.get(url, headers=headers)
print(response.json())
```

```javascript
// JavaScript example
fetch('http://localhost:3000/tasks/1', {
  headers: {
    'Authorization': 'Bearer your-token-here'
  }
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
  "taskStatus": "IN_PROGRESS",
  "dueDate": "2025-06-15T17:00:00-05:00",
  "warningOffset": 120
}
```

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

- The `taskId` must be a valid integer that corresponds to an existing task.
- If the specified task does not exist, the API will return a 404 Not Found response.
- This endpoint returns a single task object, not an array.

## Best practices

- Cache task details when appropriate to reduce API calls.
- Implement proper error handling to deal with cases where the task does not exist.
- Use this endpoint when you need detailed information about a specific task rather than filtering the GET /tasks endpoint.

## Code examples

### Retrieve a task by ID with error handling

```javascript
// JavaScript example: Retrieve a task by ID with error handling
async function getTaskById(taskId) {
  try {
    const response = await fetch(`http://localhost:3000/tasks/${taskId}`, {
      headers: {
        'Authorization': 'Bearer your-token-here'
      }
    });
    
    if (!response.ok) {
      const errorData = await response.json();
      
      if (response.status === 404) {
        throw new Error(`Task with ID ${taskId} not found`);
      }
      
      throw new Error(errorData.message || `Failed to retrieve task with ID ${taskId}`);
    }
    
    return await response.json();
  } catch (error) {
    console.error(`Error retrieving task with ID ${taskId}:`, error);
    throw error;
  }
}

// Usage example
try {
  const task = await getTaskById(1);
  console.log('Task details:', task);
  
  // Check if task is due soon
  const dueDate = new Date(task.dueDate);
  const now = new Date();
  const timeUntilDue = dueDate - now;
  const hoursUntilDue = timeUntilDue / (1000 * 60 * 60);
  
  if (hoursUntilDue < 24) {
    console.log(`Task "${task.taskTitle}" is due in less than 24 hours!`);
  }
} catch (error) {
  console.error('Failed to retrieve task:', error.message);
}
```

```python
# Python example: Retrieve a task by ID with error handling
from datetime import datetime
import requests

def get_task_by_id(token, task_id):
    try:
        url = f"http://localhost:3000/tasks/{task_id}"
        headers = {
            "Authorization": f"Bearer {token}"
        }
        
        response = requests.get(url, headers=headers)
        
        if response.status_code == 404:
            print(f"Task with ID {task_id} not found")
            return None
            
        response.raise_for_status()  # Raise exception for other 4XX/5XX status codes
        
        return response.json()
    except requests.exceptions.HTTPError as e:
        # Handle API errors
        try:
            error_data = e.response.json()
            print(f"API error: {error_data.get('message', str(e))}")
        except ValueError:
            # Could not parse error response as JSON
            print(f"Error retrieving task: {str(e)}")
        return None
    except Exception as e:
        print(f"Error retrieving task: {str(e)}")
        return None

# Usage example
task = get_task_by_id("your-token-here", 1)

if task:
    print(f"Task details: {task}")
    
    # Check if task is due soon
    due_date = datetime.fromisoformat(task["dueDate"].replace("Z", "+00:00"))
    now = datetime.now()
    time_until_due = due_date - now
    hours_until_due = time_until_due.total_seconds() / 3600
    
    if hours_until_due < 24:
        print(f"Task \"{task['taskTitle']}\" is due in less than 24 hours!")
else:
    print("Failed to retrieve task")
```

## Related resources

- [Task resource](../resources/task-resource.md)

## See also

- [Get all tasks](get-all-tasks.md)
- [Create a task](create-task.md)
- [Update a task](update-task.md)
- [Delete a task](delete-task.md)

--- FILE: tutorials.md ---
---
title: "Tutorials & Guides"
description: "Step-by-step tutorials and practical guides for working with the Task Management API."
tags: ["tutorials", "guides", "how-to"]
categories: ["tutorials"]
importance: 7
has_toc: false
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 20, 2025"
nav_order: "6"
layout: "default"
version: "v1.0.0"
lastUpdated: "May 20, 2025"
---

# Tutorials & Guides

This section provides step-by-step tutorials and practical guides to help you quickly start using the Task Management API in common scenarios.

## Getting started tutorials

These tutorials guide you through basic operations with the API:

- [Getting started with users](tutorials/getting-started-with-users.md): Learn how to create, list, update, and delete users
- [Task management workflow](tutorials/task-management-workflow.md): Implement a complete task management workflow from creation to completion

## Implementation guides

These guides help you implement specific features using the API:

- [Implementing reminders](tutorials/implementing-reminders.md): Use the `warningOffset` property to implement a reminder system
- [Integration patterns](tutorials/integration-patterns.md): Common patterns for integrating the API with other systems

## Available tutorials

| Tutorial | Description | Level |
|----------|-------------|-------|
| [Getting started with users](tutorials/getting-started-with-users.md) | Create, list, update, and delete users | Beginner |
| [Task management workflow](tutorials/task-management-workflow.md) | Implement a complete task management workflow | Beginner |
| [Implementing reminders](tutorials/implementing-reminders.md) | Create a reminder system using warningOffset | Intermediate |
| [Integration patterns](tutorials/integration-patterns.md) | Integrate the API with other systems | Advanced |

## Tips for success

- Start with the [Getting started guide](getting-started.md) before diving into specific tutorials
- Understand the [core concepts](core-concepts.md) to make the most of the API
- Reference the [API documentation](api-reference.md) for detailed endpoint information
- Check the [Support & FAQ](support.md) section if you encounter any issues

## Next steps

After working through these tutorials, you might want to explore:

- [Advanced topics](advanced.md): Learn about optimization, security, and data consistency
- [Developer resources](developer-resources.md): Find additional resources like changelogs and tools

--- FILE: getting-started/rate-limiting.md ---
---
title: "Rate limiting"
description: "Understand the API's rate limits and how to handle rate limiting responses."
tags: ["rate limiting", "throttling"]
categories: ["getting-started"]
importance: 7
parent: "Getting Started"
ai-generated: false
nav_order: "4"
layout: "default"
version: "v1.0.0"
lastUpdated: "May 20, 2025"
---

# Rate limiting

The Task Management API implements rate limiting to ensure fair usage and protect the service from excessive traffic. This page explains the rate limits and how to handle rate limiting responses in your application.

## How rate limiting works

The API enforces limits on the number of requests you can make within a given time period. When you exceed these limits, the API will temporarily block your requests until the rate limit period resets.

## Rate limit headers

The API includes the following headers in each response to help you track your rate limit status:

| Header | Description |
|--------|-------------|
| `X-RateLimit-Limit` | The maximum number of requests allowed in the current time window |
| `X-RateLimit-Remaining` | The number of requests remaining in the current time window |
| `X-RateLimit-Reset` | The time (in Unix epoch seconds) when the current rate limit window resets |

Example headers:
```
X-RateLimit-Limit: 100
X-RateLimit-Remaining: 95
X-RateLimit-Reset: 1716442800
```

## Rate limit exceeded response

When you exceed the rate limit, the API will respond with:

- HTTP status code: `429 Too Many Requests`
- `Retry-After` header: indicates how many seconds to wait before retrying
- Error response body:

```json
{
  "code": "RATE_LIMIT_EXCEEDED",
  "message": "Rate limit exceeded. Try again in 30 seconds",
  "requestId": "req-f8d31a62-e789-4856-9452-5efa50223c7a"
}
```

## Best practices for handling rate limits

### 1. Monitor rate limit headers

Track the rate limit headers in your responses to avoid hitting the limits:

```javascript
// JavaScript example: Tracking rate limits
function checkRateLimits(response) {
  const limit = response.headers.get('X-RateLimit-Limit');
  const remaining = response.headers.get('X-RateLimit-Remaining');
  const reset = response.headers.get('X-RateLimit-Reset');
  
  console.log(`Rate limits: ${remaining}/${limit} requests remaining, resets at ${new Date(reset * 1000).toLocaleTimeString()}`);
  
  // Consider implementing throttling if getting close to the limit
  if (remaining && parseInt(remaining) < 10) {
    console.warn('Approaching rate limit, consider slowing down requests');
  }
}

// Usage
fetch('http://localhost:3000/users', {
  headers: {
    'Authorization': 'Bearer your-token-here'
  }
})
.then(response => {
  checkRateLimits(response);
  return response.json();
})
.then(data => console.log(data));
```

### 2. Implement exponential backoff

When rate limited, implement exponential backoff to retry requests:

```javascript
// JavaScript example: Exponential backoff retry
async function fetchWithRetry(url, options = {}, maxRetries = 5) {
  let retries = 0;
  
  while (retries <= maxRetries) {
    try {
      const response = await fetch(url, options);
      
      if (response.status === 429) {
        retries++;
        
        // Get retry-after value, or default to exponential backoff
        const retryAfter = response.headers.get('Retry-After');
        const delay = retryAfter ? parseInt(retryAfter, 10) * 1000 : Math.pow(2, retries) * 1000;
        
        console.log(`Rate limited. Retrying in ${delay/1000} seconds... (Attempt ${retries}/${maxRetries})`);
        
        // Wait before retrying
        await new Promise(resolve => setTimeout(resolve, delay));
        continue;
      }
      
      return response;
    } catch (error) {
      retries++;
      
      if (retries > maxRetries) {
        throw new Error(`Max retries exceeded: ${error.message}`);
      }
      
      const delay = Math.pow(2, retries) * 1000;
      console.log(`Network error. Retrying in ${delay/1000} seconds... (Attempt ${retries}/${maxRetries})`);
      
      await new Promise(resolve => setTimeout(resolve, delay));
    }
  }
}

// Usage
async function getTasks() {
  try {
    const response = await fetchWithRetry('http://localhost:3000/tasks', {
      headers: {
        'Authorization': 'Bearer your-token-here'
      }
    });
    
    const data = await response.json();
    console.log('Tasks:', data);
    return data;
  } catch (error) {
    console.error('Failed to fetch tasks:', error);
  }
}
```

```python
# Python example: Exponential backoff retry
import requests
import time
import random

def fetch_with_retry(url, headers=None, max_retries=5):
    headers = headers or {}
    retries = 0
    
    while retries <= max_retries:
        try:
            response = requests.get(url, headers=headers)
            
            if response.status_code == 429:
                retries += 1
                
                # Get retry-after value, or default to exponential backoff
                retry_after = response.headers.get('Retry-After')
                delay = int(retry_after) if retry_after else 2 ** retries
                
                # Add small jitter to avoid thundering herd problem
                delay = delay + random.uniform(0, 1)
                
                print(f"Rate limited. Retrying in {delay:.1f} seconds... (Attempt {retries}/{max_retries})")
                
                # Wait before retrying
                time.sleep(delay)
                continue
            
            return response
        
        except requests.exceptions.RequestException as e:
            retries += 1
            
            if retries > max_retries:
                raise Exception(f"Max retries exceeded: {str(e)}")
            
            delay = 2 ** retries + random.uniform(0, 1)
            print(f"Network error. Retrying in {delay:.1f} seconds... (Attempt {retries}/{max_retries})")
            
            time.sleep(delay)
    
    return None

# Usage
def get_tasks():
    try:
        response = fetch_with_retry(
            'http://localhost:3000/tasks',
            headers={'Authorization': 'Bearer your-token-here'}
        )
        
        if response and response.status_code == 200:
            data = response.json()
            print('Tasks:', data)
            return data
        else:
            print(f"Failed with status code: {response.status_code if response else 'No response'}")
            return None
    
    except Exception as e:
        print(f"Failed to fetch tasks: {str(e)}")
        return None
```

### 3. Implement request throttling

Proactively throttle your requests to stay below rate limits:

```javascript
// JavaScript example: Request throttling
class ThrottledApiClient {
  constructor(baseUrl, token, maxRequestsPerSecond = 5) {
    this.baseUrl = baseUrl;
    this.token = token;
    this.queue = [];
    this.processing = false;
    this.maxRequestsPerSecond = maxRequestsPerSecond;
    this.minRequestInterval = 1000 / maxRequestsPerSecond;
    this.lastRequestTime = 0;
  }
  
  async request(endpoint, options = {}) {
    return new Promise((resolve, reject) => {
      // Add request to queue
      this.queue.push({
        endpoint,
        options,
        resolve,
        reject
      });
      
      // Process queue if not already processing
      if (!this.processing) {
        this.processQueue();
      }
    });
  }
  
  async processQueue() {
    if (this.queue.length === 0) {
      this.processing = false;
      return;
    }
    
    this.processing = true;
    const { endpoint, options, resolve, reject } = this.queue.shift();
    
    // Calculate delay to maintain rate limit
    const now = Date.now();
    const timeElapsed = now - this.lastRequestTime;
    const delayNeeded = Math.max(0, this.minRequestInterval - timeElapsed);
    
    try {
      if (delayNeeded > 0) {
        await new Promise(resolveDelay => setTimeout(resolveDelay, delayNeeded));
      }
      
      const url = `${this.baseUrl}${endpoint}`;
      const headers = {
        'Authorization': `Bearer ${this.token}`,
        ...options.headers
      };
      
      this.lastRequestTime = Date.now();
      const response = await fetch(url, { ...options, headers });
      
      resolve(response);
    } catch (error) {
      reject(error);
    }
    
    // Process next item in queue with a small delay
    setTimeout(() => this.processQueue(), 0);
  }
  
  // Convenience methods
  async get(endpoint) {
    return this.request(endpoint);
  }
  
  async post(endpoint, data) {
    return this.request(endpoint, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(data)
    });
  }
  
  async patch(endpoint, data) {
    return this.request(endpoint, {
      method: 'PATCH',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(data)
    });
  }
  
  async delete(endpoint) {
    return this.request(endpoint, {
      method: 'DELETE'
    });
  }
}

// Usage
const api = new ThrottledApiClient('http://localhost:3000', 'your-token-here', 5);

async function loadTasks() {
  try {
    const response = await api.get('/tasks');
    const data = await response.json();
    console.log('Tasks:', data);
  } catch (error) {
    console.error('Failed to load tasks:', error);
  }
}
```

### A. Batch operations

Where possible, batch related operations to reduce the number of API calls:

```javascript
// JavaScript example: Batch task creation instead of multiple single calls
async function createMultipleTasks(tasks) {
  // Process tasks in batches to reduce API calls
  const batchSize = 5;
  const results = [];
  
  for (let i = 0; i < tasks.length; i += batchSize) {
    const batch = tasks.slice(i, i + batchSize);
    const promises = batch.map(task => 
      fetch('http://localhost:3000/tasks', {
        method: 'POST',
        headers: {
          'Authorization': 'Bearer your-token-here',
          'Content-Type': 'application/json'
        },
        body: JSON.stringify(task)
      })
      .then(response => response.json())
    );
    
    // Process each batch sequentially to avoid rate limits
    const batchResults = await Promise.all(promises);
    results.push(...batchResults);
    
    // Add delay between batches if needed
    if (i + batchSize < tasks.length) {
      await new Promise(resolve => setTimeout(resolve, 1000));
    }
  }
  
  return results;
}
```

## Rate limit tiers

The current rate limit tiers are as follows:

| Tier | Requests per minute | Daily limit |
|------|---------------------|------------|
| Basic | 60 | 10,000 |
| Professional | 300 | 50,000 |
| Enterprise | 1,000 | 250,000 |

Contact your API provider to determine which tier applies to your account.

## Related resources

- [Error handling](../core-concepts/error-handling.md)
- [Optimizing API usage](../advanced/optimizing-api-usage.md)
- [API reference](../api-reference.md)

If you experience unexpected rate limiting issues, please contact support with your request IDs for assistance.

--- FILE: advanced.md ---
---
title: "Advanced Topics"
description: "Advanced considerations for working with the Task Management API, including optimization, security, and data consistency."
tags: ["advanced", "optimization", "security"]
categories: ["advanced"]
importance: 6
has_toc: false
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 20, 2025"
nav_order: "7"
layout: "default"
version: "v1.0.0"
lastUpdated: "May 20, 2025"
---

# Advanced Topics

This section covers advanced considerations for working with the Task Management API. These topics are intended for developers who are already familiar with the API basics and want to optimize their implementation.

## Performance optimization

Performance optimization is critical for providing a responsive user experience. The [Optimizing API usage](advanced/optimizing-api-usage.md) guide covers techniques for reducing latency and minimizing server load:

- Implementing client-side caching
- Using pagination effectively
- Minimizing the number of API requests
- Batch operations best practices

## Security

Security is a crucial aspect of any API integration. The [Security best practices](advanced/security-best-practices.md) guide provides recommendations for keeping your implementation secure:

- Secure token handling
- Authorization best practices
- Input validation
- Handling sensitive data
- Preventing common vulnerabilities

## Data consistency

Maintaining data consistency is important for providing a reliable user experience. The [Handling data consistency](advanced/handling-data-consistency.md) guide covers strategies for dealing with concurrency issues:

- Optimistic vs. pessimistic concurrency control
- Handling race conditions
- Implementing retry logic
- Conflict resolution strategies

## Available advanced guides

| Guide | Description | Key topics |
|-------|-------------|-----------|
| [Optimizing API usage](advanced/optimizing-api-usage.md) | Best practices for efficient API usage | Caching, batching, performance |
| [Security best practices](advanced/security-best-practices.md) | Advanced security considerations | Authentication, authorization, input validation |
| [Handling data consistency](advanced/handling-data-consistency.md) | Strategies for maintaining data consistency | Concurrency, race conditions, conflict resolution |

## Further reading

After exploring these advanced topics, you might want to check out:

- [Developer resources](developer-resources.md) for additional tools and examples
- [API reference](api-reference.md) for detailed endpoint documentation
- [Support resources](support/support-resources.md) if you encounter advanced issues

--- FILE: developer-resources.md ---
---
title: "Developer Resources"
description: "Additional resources for developers working with the Task Management API, including changelogs, tooling, and code examples."
tags: ["resources", "developers", "tools"]
categories: ["developer-resources"]
importance: 5
has_toc: false
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 20, 2025"
nav_order: "8"
layout: "default"
version: "v1.0.0"
lastUpdated: "May 20, 2025"
---

# Developer Resources

This page provides additional resources to help you develop with the Task Management API more effectively.

## Code examples

The [Code examples](developer-resources/code-examples.md) page contains reusable code snippets and examples for common operations in multiple programming languages:

- JavaScript/Node.js
- Python
- cURL

These examples cover everything from authentication to advanced API usage patterns.

## API changelog

Stay updated on API changes by checking the [API changelog](developer-resources/api-changelog.md). This page documents:

- New features
- Bug fixes
- Breaking changes
- Deprecation notices

## Postman collection

For testing and exploring the API, use our [Postman collection](developer-resources/postman-collection.md). This resource provides:

- Ready-to-use API requests
- Environment variables for easy configuration
- Request examples with sample data
- Testing scripts

## Available resources

| Resource | Description | Format |
|----------|-------------|--------|
| [Code examples](developer-resources/code-examples.md) | Reusable code in multiple languages | Markdown, code snippets |
| [API changelog](developer-resources/api-changelog.md) | History of API changes | Markdown |
| [Postman collection](developer-resources/postman-collection.md) | Collection for API testing | Postman JSON |

## Community resources

While not officially supported, these community resources might be helpful:

- GitHub repositories with client libraries
- Blog posts about API integration
- Community forums

## Support resources

If you need additional help, check out the [Support & FAQ](support.md) section for:

- Frequently asked questions
- Troubleshooting guides
- Support contact information

--- FILE: index.md ---
---
title: "Task Management API Documentation"
description: "Comprehensive guide to the Task Management API, including usage, endpoints, and best practices."
tags: ["API", "documentation", "task management"]
categories: ["overview"]
importance: 10
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "May 20, 2025"
nav_exclude: true
layout: "default"
version: "v1.0.0"
lastUpdated: "May 20, 2025"
---

# Task Management API Documentation

Welcome to the Task Management API documentation. This API provides a comprehensive solution for managing to-do tasks and users in your applications.

## What is the Task Management API?

The Task Management API is a RESTful service that enables you to create, read, update, and delete tasks and users. It's designed to help you build task management features into your applications with minimal effort.

## Key features

- **User management**: Create and manage user accounts
- **Task management**: Create and manage to-do tasks with due dates and reminders
- **Task statuses**: Track task progress with predefined status values
- **Pagination**: Navigate through large collections of resources
- **Sorting**: Order resources based on specific fields
- **Filtering**: Filter tasks by status

## Getting started

If you're new to the Task Management API, we recommend starting with the following resources:

- [Getting started guide](getting-started.md): Learn how to set up and make your first API request
- [Core concepts](core-concepts.md): Understand the fundamental concepts of the API
- [API reference](api-reference.md): Explore the complete API reference documentation

## Resource overview

The API provides access to two main resources:

- **Users**: Represent individuals who can create and manage tasks
- **Tasks**: Represent to-do items with titles, descriptions, due dates, and statuses

## Authentication

All API requests require authentication using bearer tokens. Learn more in the [authentication guide](getting-started/authentication.md).

## Support

If you need help using the API, check out the [support resources](support.md) or visit the [FAQ](support/faq.md).

--- FILE: tutorials/integration-patterns.md ---
---
title: "Integration patterns"
description: "Common patterns for integrating the Task Management API with other systems and services."
tags: ["integration", "architecture"]
categories: ["tutorials"]
importance: 6
parent: "Tutorials & Guides" 
ai-generated: false
nav_order: "4"
layout: "default"
version: "v1.0.0"
lastUpdated: "May 20, 2025"
---

# Integration patterns

This guide explores common patterns for integrating the Task Management API with other systems and services. These patterns will help you create robust integrations that leverage the API's capabilities while working within its constraints.

## Backend integration patterns

### Synchronous request-response pattern

The most straightforward integration pattern is making direct, synchronous calls to the API from your backend service.

#### Implementation:

```javascript
// Node.js example: Direct API integration
const axios = require('axios');

class TaskApiClient {
  constructor(baseUrl, token) {
    this.baseUrl = baseUrl;
    this.token = token;
    this.client = axios.create({
      baseURL: baseUrl,
      headers: {
        'Authorization': `Bearer ${token}`,
        'Content-Type': 'application/json'
      }
    });
  }
  
  async getTasks() {
    try {
      const response = await this.client.get('/tasks');
      return response.data;
    } catch (error) {
      console.error('Error fetching tasks:', error.response?.data || error.message);
      throw error;
    }
  }
  
  async createTask(taskData) {
    try {
      const response = await this.client.post('/tasks', taskData);
      return response.data;
    } catch (error) {
      console.error('Error creating task:', error.response?.data || error.message);
      throw error;
    }
  }
}

// Usage in Express.js backend
const express = require('express');
const app = express();
app.use(express.json());

const taskApi = new TaskApiClient('http://localhost:3000', 'your-token-here');

// Endpoint that proxies to the Task Management API
app.get('/api/tasks', async (req, res) => {
  try {
    const tasks = await taskApi.getTasks();
    res.json(tasks);
  } catch (error) {
    res.status(error.response?.status || 500).json({
      error: 'Failed to fetch tasks',
      details: error.response?.data || error.message
    });
  }
});

app.listen(8000, () => {
  console.log('Server running on port 8000');
});
```

#### Advantages:

- Simple to implement
- Real-time response
- Clear error handling

#### Disadvantages:

- Potential for cascading failures if the API is down
- May encounter rate limiting with high-volume requests
- Blocking operation that can slow down response times

### Backend queue pattern

For operations that don't require immediate feedback, use a queue-based approach to decouple your service from the API.

#### Implementation:

```javascript
// Node.js example: Queue-based integration
const { Queue } = require('bullmq');
const axios = require('axios');

// Create a queue for task operations
const taskQueue = new Queue('task-operations', {
  connection: {
    host: 'localhost',
    port: 6379
  }
});

// Add task creation job to queue
async function queueTaskCreation(taskData) {
  await taskQueue.add('create-task', taskData);
  return { status: 'queued', message: 'Task creation has been queued' };
}

// Worker to process the queue
const { Worker } = require('bullmq');

const worker = new Worker('task-operations', async (job) => {
  const { name, data } = job;
  
  const apiClient = axios.create({
    baseURL: 'http://localhost:3000',
    headers: {
      'Authorization': 'Bearer your-token-here',
      'Content-Type': 'application/json'
    }
  });
  
  try {
    switch (name) {
      case 'create-task':
        const response = await apiClient.post('/tasks', data);
        return { success: true, taskId: response.data.taskId };
      
      case 'update-task':
        await apiClient.patch(`/tasks/${data.taskId}`, data.updates);
        return { success: true };
      
      case 'delete-task':
        await apiClient.delete(`/tasks/${data.taskId}`);
        return { success: true };
      
      default:
        throw new Error(`Unknown job type: ${name}`);
    }
  } catch (error) {
    // Log error details
    console.error(`Error processing job ${name}:`, error.response?.data || error.message);
    
    // For retryable errors, throw to trigger retry
    if (error.response?.status === 429 || error.response?.status >= 500) {
      throw error;
    }
    
    // For client errors, return failure but don't retry
    return { 
      success: false, 
      error: error.response?.data || error.message 
    };
  }
}, {
  connection: {
    host: 'localhost',
    port: 6379
  }
});

// Express.js API endpoint
app.post('/api/tasks', async (req, res) => {
  try {
    const result = await queueTaskCreation(req.body);
    res.status(202).json(result); // 202 Accepted
  } catch (error) {
    res.status(500).json({
      error: 'Failed to queue task creation',
      details: error.message
    });
  }
});
```

#### Advantages:

- Decoupled operations that don't block the main application
- Better resilience against API outages
- Built-in retry capabilities
- Control over concurrency and rate limits

#### Disadvantages:

- More complex architecture
- No immediate confirmation of successful operation
- Requires additional infrastructure (Redis, queue management)

### Webhook consumer pattern

For applications that need to react to task changes, implement a webhook endpoint that the task system can call.

#### Implementation:

```javascript
// Express.js webhook endpoint
app.post('/webhooks/tasks', express.json(), async (req, res) => {
  try {
    const { event, data } = req.body;
    
    // Verify webhook signature (implementation depends on your webhook provider)
    const isValid = verifyWebhookSignature(req);
    if (!isValid) {
      return res.status(401).json({ error: 'Invalid webhook signature' });
    }
    
    // Process different event types
    switch (event) {
      case 'task.created':
        await handleTaskCreated(data);
        break;
      
      case 'task.updated':
        await handleTaskUpdated(data);
        break;
      
      case 'task.completed':
        await handleTaskCompleted(data);
        break;
      
      case 'task.deleted':
        await handleTaskDeleted(data);
        break;
      
      default:
        console.warn(`Unhandled webhook event: ${event}`);
    }
    
    // Always respond with 200 to acknowledge receipt
    res.status(200).json({ received: true });
  } catch (error) {
    console.error('Error processing webhook:', error);
    
    // Still return 200 to avoid webhook retries
    // Log the error internally and handle through your monitoring system
    res.status(200).json({ received: true, processed: false });
  }
});

// Example handler function
async function handleTaskCompleted(taskData) {
  // Notify relevant users
  await sendNotification(taskData.userId, `Task "${taskData.taskTitle}" marked as completed`);
  
  // Update project status
  await updateProjectStatus(taskData.projectId);
  
  // Log the event
  await logTaskEvent(taskData.taskId, 'completed');
}

// Helper to verify webhook signatures
function verifyWebhookSignature(req) {
  // Implementation depends on your webhook provider
  const signature = req.headers['x-webhook-signature'];
  const payload = JSON.stringify(req.body);
  
  // Example verification using HMAC
  const crypto = require('crypto');
  const hmac = crypto.createHmac('sha256', 'your-webhook-secret');
  hmac.update(payload);
  const calculatedSignature = hmac.digest('hex');
  
  return crypto.timingSafeEqual(
    Buffer.from(signature),
    Buffer.from(calculatedSignature)
  );
}
```

#### Advantages:

- Real-time updates about task changes
- Efficient for event-driven architectures
- Reduces polling overhead

#### Disadvantages:

- Requires publicly accessible endpoints
- Needs careful security implementation
- Might require handling of missed webhooks

## Frontend integration patterns

### Single-page application pattern

For modern web applications, implement a client-side API integration.

#### Implementation:

```javascript
// React example with Axios
import React, { useState, useEffect } from 'react';
import axios from 'axios';

// API client setup
const apiClient = axios.create({
  baseURL: 'http://localhost:3000',
  headers: {
    'Content-Type': 'application/json'
  }
});

// Set auth token from user session
apiClient.interceptors.request.use(config => {
  const token = localStorage.getItem('authToken');
  if (token) {
    config.headers.Authorization = `Bearer ${token}`;
  }
  return config;
});

// Task list component
function TaskList() {
  const [tasks, setTasks] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  
  useEffect(() => {
    const fetchTasks = async () => {
      try {
        setLoading(true);
        const response = await apiClient.get('/tasks');
        setTasks(response.data.tasks);
        setError(null);
      } catch (err) {
        setError(err.response?.data || 'Failed to fetch tasks');
        console.error('Error fetching tasks:', err);
      } finally {
        setLoading(false);
      }
    };
    
    fetchTasks();
  }, []);
  
  const updateTaskStatus = async (taskId, newStatus) => {
    try {
      await apiClient.patch(`/tasks/${taskId}`, { taskStatus: newStatus });
      
      // Update local state optimistically
      setTasks(tasks.map(task => 
        task.taskId === taskId 
          ? { ...task, taskStatus: newStatus } 
          : task
      ));
    } catch (err) {
      setError(err.response?.data || 'Failed to update task');
      console.error('Error updating task:', err);
    }
  };
  
  if (loading) return <div>Loading tasks...</div>;
  if (error) return <div>Error: {error.message || error}</div>;
  
  return (
    <div className="task-list">
      <h2>Your Tasks</h2>
      {tasks.length === 0 ? (
        <p>No tasks found</p>
      ) : (
        <ul>
          {tasks.map(task => (
            <li key={task.taskId}>
              <h3>{task.taskTitle}</h3>
              <p>{task.taskDescription}</p>
              <div>
                Status: {task.taskStatus}
                <button 
                  onClick={() => updateTaskStatus(task.taskId, 'COMPLETED')}
                  disabled={task.taskStatus === 'COMPLETED'}
                >
                  Mark Complete
                </button>
              </div>
            </li>
          ))}
        </ul>
      )}
    </div>
  );
}

export default TaskList;
```

#### Advantages:

- Responsive user interface with immediate feedback
- Reduced server load
- Better user experience with optimistic updates

#### Disadvantages:

- Need to handle authentication token securely
- Exposes API endpoints to client-side code
- Requires careful error handling

### Backend-for-frontend pattern

For applications that need to aggregate data from multiple sources or add business logic, implement a backend-for-frontend (BFF) service.

#### Implementation:

```javascript
// Node.js Express BFF service
const express = require('express');
const axios = require('axios');
const app = express();
app.use(express.json());

// Task API client
const taskApi = axios.create({
  baseURL: 'http://localhost:3000',
  headers: {
    'Authorization': 'Bearer your-token-here',
    'Content-Type': 'application/json'
  }
});

// User API client (another service)
const userApi = axios.create({
  baseURL: 'http://localhost:4000',
  headers: {
    'Authorization': 'Bearer your-other-token-here',
    'Content-Type': 'application/json'
  }
});

// BFF endpoint that aggregates data from multiple sources
app.get('/api/user-dashboard/:userId', async (req, res) => {
  try {
    const userId = req.params.userId;
    
    // Make concurrent requests to different services
    const [userResponse, tasksResponse, projectsResponse] = await Promise.all([
      userApi.get(`/users/${userId}`),
      taskApi.get(`/tasks?userId=${userId}`),
      userApi.get(`/users/${userId}/projects`)
    ]);
    
    // Transform and combine the data
    const userData = userResponse.data;
    const tasks = tasksResponse.data.tasks;
    const projects = projectsResponse.data.projects;
    
    // Add business logic - calculate task metrics
    const taskMetrics = {
      total: tasks.length,
      completed: tasks.filter(t => t.taskStatus === 'COMPLETED').length,
      inProgress: tasks.filter(t => t.taskStatus === 'IN_PROGRESS').length,
      overdue: tasks.filter(t => {
        const dueDate = new Date(t.dueDate);
        return dueDate < new Date() && t.taskStatus !== 'COMPLETED';
      }).length
    };
    
    // Combine into a single response
    res.json({
      user: {
        id: userData.userId,
        name: `${userData.firstName} ${userData.lastName}`,
        email: userData.contactEmail
      },
      taskMetrics,
      recentTasks: tasks.slice(0, 5),
      projects
    });
  } catch (error) {
    console.error('Dashboard error:', error.response?.data || error.message);
    res.status(error.response?.status || 500).json({
      error: 'Failed to load dashboard data',
      details: error.response?.data || error.message
    });
  }
});

app.listen(5000, () => {
  console.log('BFF service running on port 5000');
});
```

#### Advantages:

- Hides complexity from the frontend
- Aggregates data from multiple sources
- Reduces number of requests from client
- Adds business logic without exposing it to the client
- Can handle authentication and authorization

#### Disadvantages:

- Introduces another service to maintain
- Can become a bottleneck if not properly designed
- May duplicate functionality

## Mobile integration patterns

### Offline-first pattern

For mobile applications that need to work with intermittent connectivity, implement an offline-first approach.

#### Implementation (React Native example):

```javascript
// React Native with offline support
import React, { useState, useEffect } from 'react';
import { View, Text, FlatList, Button } from 'react-native';
import AsyncStorage from '@react-native-async-storage/async-storage';
import NetInfo from '@react-native-community/netinfo';
import axios from 'axios';

const apiClient = axios.create({
  baseURL: 'http://localhost:3000',
  headers: { 'Content-Type': 'application/json' }
});

// Set auth token
apiClient.interceptors.request.use(async (config) => {
  const token = await AsyncStorage.getItem('authToken');
  if (token) {
    config.headers.Authorization = `Bearer ${token}`;
  }
  return config;
});

// Queue for pending operations
class OperationQueue {
  constructor() {
    this.queue = [];
    this.isProcessing = false;
  }
  
  async add(operation) {
    // Add to queue
    this.queue.push(operation);
    
    // Save queue to persistent storage
    await AsyncStorage.setItem('operationQueue', JSON.stringify(this.queue));
    
    // Try to process queue if online
    const netState = await NetInfo.fetch();
    if (netState.isConnected && !this.isProcessing) {
      this.processQueue();
    }
  }
  
  async loadQueue() {
    try {
      const savedQueue = await AsyncStorage.getItem('operationQueue');
      if (savedQueue) {
        this.queue = JSON.parse(savedQueue);
      }
    } catch (error) {
      console.error('Error loading operation queue:', error);
    }
  }
  
  async processQueue() {
    if (this.isProcessing || this.queue.length === 0) return;
    
    this.isProcessing = true;
    
    try {
      while (this.queue.length > 0) {
        const netState = await NetInfo.fetch();
        if (!netState.isConnected) break;
        
        const operation = this.queue[0];
        
        try {
          switch (operation.type) {
            case 'CREATE_TASK':
              await apiClient.post('/tasks', operation.data);
              break;
            case 'UPDATE_TASK':
              await apiClient.patch(`/tasks/${operation.data.taskId}`, operation.data.updates);
              break;
            case 'DELETE_TASK':
              await apiClient.delete(`/tasks/${operation.data.taskId}`);
              break;
          }
          
          // Operation succeeded, remove from queue
          this.queue.shift();
          await AsyncStorage.setItem('operationQueue', JSON.stringify(this.queue));
        } catch (error) {
          // If server error or network error, break and try later
          if (!error.response || error.response.status >= 500) {
            break;
          }
          
          // If client error (4xx), remove from queue as it won't succeed on retry
          if (error.response && error.response.status >= 400 && error.response.status < 500) {
            console.error('Operation failed and will not be retried:', operation, error.response.data);
            this.queue.shift();
            await AsyncStorage.setItem('operationQueue', JSON.stringify(this.queue));
          }
        }
      }
    } finally {
      this.isProcessing = false;
    }
  }
}

// Singleton instance
const operationQueue = new OperationQueue();

// Component using offline-first approach
function OfflineTaskList() {
  const [tasks, setTasks] = useState([]);
  const [loading, setLoading] = useState(true);
  const [isOnline, setIsOnline] = useState(true);
  
  // Load data on component mount
  useEffect(() => {
    // Subscribe to network info changes
    const unsubscribe = NetInfo.addEventListener(state => {
      setIsOnline(state.isConnected);
      
      // When coming back online, sync with server
      if (state.isConnected) {
        syncWithServer();
        operationQueue.processQueue();
      }
    });
    
    // Load stored tasks and operation queue
    const loadData = async () => {
      try {
        setLoading(true);
        
        // Load cached tasks
        const cachedTasks = await AsyncStorage.getItem('cachedTasks');
        if (cachedTasks) {
          setTasks(JSON.parse(cachedTasks));
        }
        
        // Load pending operations
        await operationQueue.loadQueue();
        
        // Try to fetch fresh data if online
        await syncWithServer();
      } catch (error) {
        console.error('Error loading data:', error);
      } finally {
        setLoading(false);
      }
    };
    
    loadData();
    
    return () => {
      unsubscribe();
    };
  }, []);
  
  // Sync with server
  const syncWithServer = async () => {
    const netState = await NetInfo.fetch();
    if (!netState.isConnected) return;
    
    try {
      const response = await apiClient.get('/tasks');
      const serverTasks = response.data.tasks;
      
      // Update local state
      setTasks(serverTasks);
      
      // Update cache
      await AsyncStorage.setItem('cachedTasks', JSON.stringify(serverTasks));
      await AsyncStorage.setItem('lastSync', new Date().toISOString());
    } catch (error) {
      console.error('Error syncing with server:', error);
    }
  };
  
  // Create task (works offline)
  const createTask = async (taskData) => {
    // Generate temporary local ID
    const tempId = `temp-${Date.now()}`;
    
    // Create optimistic local task
    const newTask = {
      taskId: tempId,
      ...taskData,
      taskStatus: taskData.taskStatus || 'NOT_STARTED',
      _isLocal: true
    };
    
    // Update local state optimistically
    const updatedTasks = [...tasks, newTask];
    setTasks(updatedTasks);
    
    // Save to local storage
    await AsyncStorage.setItem('cachedTasks', JSON.stringify(updatedTasks));
    
    // Add to operation queue
    await operationQueue.add({
      type: 'CREATE_TASK',
      data: taskData,
      tempId
    });
  };
  
  // Update task (works offline)
  const updateTaskStatus = async (taskId, newStatus) => {
    // Update local state optimistically
    const updatedTasks = tasks.map(task => 
      task.taskId === taskId 
        ? { ...task, taskStatus: newStatus, _isLocal: true } 
        : task
    );
    
    setTasks(updatedTasks);
    
    // Save to local storage
    await AsyncStorage.setItem('cachedTasks', JSON.stringify(updatedTasks));
    
    // Add to operation queue
    await operationQueue.add({
      type: 'UPDATE_TASK',
      data: {
        taskId,
        updates: { taskStatus: newStatus }
      }
    });
  };
  
  if (loading) return <Text>Loading tasks...</Text>;
  
  return (
    <View>
      <Text style={{ fontWeight: 'bold', fontSize: 18 }}>Your Tasks</Text>
      {!isOnline && <Text style={{ color: 'orange' }}>You're offline. Changes will sync when you reconnect.</Text>}
      
      <FlatList
        data={tasks}
        keyExtractor={(item) => item.taskId.toString()}
        renderItem={({ item }) => (
          <View style={{ padding: 10, borderBottomWidth: 1, borderColor: '#eee' }}>
            <Text style={{ fontWeight: 'bold' }}>{item.taskTitle}</Text>
            <Text>{item.taskDescription}</Text>
            <Text>Status: {item.taskStatus}</Text>
            {item._isLocal && <Text style={{ color: 'orange' }}>Not synced</Text>}
            
            <Button
              title="Mark Complete"
              disabled={item.taskStatus === 'COMPLETED'}
              onPress={() => updateTaskStatus(item.taskId, 'COMPLETED')}
            />
          </View>
        )}
      />
      
      <Button
        title="Create New Task"
        onPress={() => createTask({
          userId: 1, // This would come from user context
          taskTitle: 'New offline task',
          taskDescription: 'Created while offline',
          dueDate: new Date(Date.now() + 86400000).toISOString(), // Tomorrow
          warningOffset: 60
        })}
      />
      
      {isOnline && (
        <Button
          title="Sync Now"
          onPress={syncWithServer}
        />
      )}
    </View>
  );
}

export default OfflineTaskList;
```

#### Advantages:

- Works without internet connection
- Better user experience in poor connectivity
- Optimistic updates
- Automatically syncs when online

#### Disadvantages:

- More complex implementation
- Need to handle conflict resolution
- Local storage limitations
- Temporary IDs need careful management

## Third-party system integration patterns

### Scheduled synchronization pattern

For integrating with external systems that don't need real-time updates, use scheduled synchronization.

#### Implementation:

```javascript
// Node.js scheduled sync with external CRM
const cron = require('node-cron');
const axios = require('axios');
const { Pool } = require('pg');

// Database connection
const pool = new Pool({
  connectionString: process.env.DATABASE_URL
});

// API clients
const taskApi = axios.create({
  baseURL: 'http://localhost:3000',
  headers: {
    'Authorization': 'Bearer your-token-here',
    'Content-Type': 'application/json'
  }
});

const crmApi = axios.create({
  baseURL: 'https://crm.example.com/api',
  headers: {
    'Authorization': 'Bearer your-crm-token',
    'Content-Type': 'application/json'
  }
});

// Track sync state
async function getLastSyncTime() {
  const result = await pool.query('SELECT last_sync FROM sync_state WHERE system = $1', ['crm']);
  if (result.rows.length > 0) {
    return result.rows[0].last_sync;
  }
  return null;
}

async function updateLastSyncTime() {
  const now = new Date();
  await pool.query(
    'INSERT INTO sync_state (system, last_sync) VALUES ($1, $2) ON CONFLICT (system) DO UPDATE SET last_sync = $2',
    ['crm', now]
  );
  return now;
}

// Sync tasks to CRM
async function syncTasksToCrm() {
  try {
    console.log('Starting CRM sync...');
    
    // Get last sync time
    const lastSync = await getLastSyncTime();
    console.log(`Last sync: ${lastSync}`);
    
    // Get tasks updated since last sync
    let url = '/tasks';
    if (lastSync) {
      // Note: This assumes the API supports filtering by update time
      // You might need to fetch all tasks and filter in memory otherwise
      url += `?updatedSince=${lastSync.toISOString()}`;
    }
    
    const response = await taskApi.get(url);
    const tasks = response.data.tasks;
    
    console.log(`Found ${tasks.length} tasks to sync`);
    
    // Process each task
    for (const task of tasks) {
      // Map task to CRM format
      const crmTask = {
        external_id: `task-${task.taskId}`,
        title: task.taskTitle,
        description: task.taskDescription,
        status: mapStatusToCrm(task.taskStatus),
        due_date: task.dueDate,
        assigned_to: await lookupCrmUser(task.userId),
        last_updated: new Date().toISOString()
      };
      
      try {
        // Check if task already exists in CRM
        const checkResponse = await crmApi.get(`/tasks?external_id=task-${task.taskId}`);
        
        if (checkResponse.data.tasks.length > 0) {
          // Update existing task
          const crmTaskId = checkResponse.data.tasks[0].id;
          await crmApi.put(`/tasks/${crmTaskId}`, crmTask);
          console.log(`Updated CRM task ${crmTaskId} from task ${task.taskId}`);
        } else {
          // Create new task in CRM
          await crmApi.post('/tasks', crmTask);
          console.log(`Created CRM task from task ${task.taskId}`);
        }
      } catch (taskError) {
        console.error(`Error syncing task ${task.taskId} to CRM:`, taskError.response?.data || taskError.message);
        // Continue with next task
      }
    }
    
    // Update last sync time
    await updateLastSyncTime();
    console.log('CRM sync completed successfully');
  } catch (error) {
    console.error('Error during CRM sync:', error.response?.data || error.message);
    throw error;
  }
}

// Map task status to CRM status
function mapStatusToCrm(taskStatus) {
  const statusMap = {
    'NOT_STARTED': 'open',
    'IN_PROGRESS': 'in_progress',
    'BLOCKED': 'blocked',
    'DEFERRED': 'deferred',
    'COMPLETED': 'completed',
    'CANCELLED': 'cancelled'
  };
  
  return statusMap[taskStatus] || 'open';
}

// Look up CRM user ID based on task management user ID
async function lookupCrmUser(userId) {
  try {
    // This would typically involve a database lookup in a mapping table
    const result = await pool.query('SELECT crm_user_id FROM user_mapping WHERE task_user_id = $1', [userId]);
    
    if (result.rows.length > 0) {
      return result.rows[0].crm_user_id;
    }
    
    // Default to a general user if no mapping found
    return 'default-crm-user-id';
  } catch (error) {
    console.error(`Error looking up CRM user for user ${userId}:`, error);
    return 'default-crm-user-id';
  }
}

// Schedule sync every hour
cron.schedule('0 * * * *', async () => {
  try {
    await syncTasksToCrm();
  } catch (error) {
    console.error('Scheduled sync failed:', error);
    // Implement notification or alerting here
  }
});

// Manual sync endpoint
app.post('/api/sync/crm', async (req, res) => {
  try {
    await syncTasksToCrm();
    res.json({ success: true, message: 'CRM sync completed successfully' });
  } catch (error) {
    res.status(500).json({
      success: false,
      error: 'Sync failed',
      details: error.message
    });
  }
});
```

#### Advantages:

- Reduced API load with batched updates
- Simpler error handling and retries
- Less coupling between systems
- Can transform data between systems

#### Disadvantages:

- Not real-time
- Potential for data conflicts
- Need to track sync state
- More complex to debug

### Event-driven integration pattern

For real-time integration with external systems, use an event-driven approach with a message broker.

#### Implementation:

```javascript
// Node.js with RabbitMQ integration
const amqp = require('amqplib');
const axios = require('axios');

// API client
const taskApi = axios.create({
  baseURL: 'http://localhost:3000',
  headers: {
    'Authorization': 'Bearer your-token-here',
    'Content-Type': 'application/json'
  }
});

// Connect to RabbitMQ
async function connectToMessageBroker() {
  try {
    const connection = await amqp.connect('amqp://localhost');
    const channel = await connection.createChannel();
    
    // Define exchanges and queues
    await channel.assertExchange('task-events', 'topic', { durable: true });
    
    // Queue for handling task completed events
    await channel.assertQueue('email-notifications', { durable: true });
    await channel.bindQueue('email-notifications', 'task-events', 'task.completed');
    
    // Queue for handling task updates for analytics
    await channel.assertQueue('analytics-updates', { durable: true });
    await channel.bindQueue('analytics-updates', 'task-events', 'task.#'); // All task events
    
    // Queue for syncing with external systems
    await channel.assertQueue('external-sync', { durable: true });
    await channel.bindQueue('external-sync', 'task-events', 'task.created');
    await channel.bindQueue('external-sync', 'task-events', 'task.completed');
    
    console.log('Connected to message broker');
    return { connection, channel };
  } catch (error) {
    console.error('Failed to connect to message broker:', error);
    throw error;
  }
}

// Webhook handler that publishes events
async function handleTaskWebhook(req, res) {
  try {
    const { event, data } = req.body;
    
    // Verify webhook
    // ... (verification code omitted)
    
    // Acknowledge webhook receipt immediately
    res.status(200).json({ received: true });
    
    // Connect to message broker
    const { channel } = await connectToMessageBroker();
    
    // Map webhook event to message broker topic
    let routingKey;
    switch (event) {
      case 'task.created':
        routingKey = 'task.created';
        break;
      case 'task.updated':
        routingKey = 'task.updated';
        break;
      case 'task.completed':
        routingKey = 'task.completed';
        break;
      case 'task.deleted':
        routingKey = 'task.deleted';
        break;
      default:
        routingKey = 'task.unknown';
    }
    
    // Publish event to message broker
    channel.publish(
      'task-events', 
      routingKey, 
      Buffer.from(JSON.stringify(data)),
      { persistent: true }
    );
    
    console.log(`Published ${routingKey} event to message broker`);
  } catch (error) {
    console.error('Error handling webhook:', error);
    // Don't return error to webhook caller to prevent retries
    // Log and alert internally instead
  }
}

// Consumer for email notifications
async function startEmailNotificationConsumer() {
  try {
    const { channel } = await connectToMessageBroker();
    
    channel.consume('email-notifications', async (msg) => {
      try {
        const taskData = JSON.parse(msg.content.toString());
        
        // Get user details
        const userResponse = await axios.get(`http://localhost:4000/users/${taskData.userId}`);
        const user = userResponse.data;
        
        // Send email notification
        await sendTaskCompletedEmail(user.contactEmail, taskData);
        
        // Acknowledge message processing
        channel.ack(msg);
        console.log(`Sent completion email for task ${taskData.taskId}`);
      } catch (error) {
        console.error('Error processing email notification:', error);
        
        // Negative acknowledgment with requeue for retriable errors
        if (error.response?.status >= 500 || !error.response) {
          channel.nack(msg, false, true);
        } else {
          // For client errors, don't requeue
          channel.nack(msg, false, false);
        }
      }
    });
    
    console.log('Email notification consumer started');
  } catch (error) {
    console.error('Failed to start email notification consumer:', error);
    throw error;
  }
}

// Consumer for external system sync
async function startExternalSyncConsumer() {
  try {
    const { channel } = await connectToMessageBroker();
    
    channel.consume('external-sync', async (msg) => {
      try {
        const taskData = JSON.parse(msg.content.toString());
        const routingKey = msg.fields.routingKey;
        
        // Sync task to external system
        if (routingKey === 'task.created') {
          await createTaskInExternalSystem(taskData);
        } else if (routingKey === 'task.completed') {
          await completeTaskInExternalSystem(taskData);
        }
        
        // Acknowledge message processing
        channel.ack(msg);
        console.log(`Synced task ${taskData.taskId} to external system (${routingKey})`);
      } catch (error) {
        console.error('Error syncing to external system:', error);
        
        // Implement exponential backoff retry using message properties
        const headers = msg.properties.headers || {};
        const retryCount = (headers.retryCount || 0) + 1;
        
        if (retryCount <= 5) {
          // Publish for retry with delay
          const delayMs = Math.pow(2, retryCount) * 1000; // Exponential backoff
          setTimeout(() => {
            channel.publish(
              'task-events',
              msg.fields.routingKey,
              msg.content,
              {
                persistent: true,
                headers: { ...headers, retryCount }
              }
            );
            channel.ack(msg);
          }, delayMs);
          
          console.log(`Scheduled retry ${retryCount} for task ${JSON.parse(msg.content).taskId} in ${delayMs}ms`);
        } else {
          // Max retries exceeded, move to dead letter queue
          channel.publish('dead-letter', msg.fields.routingKey, msg.content, {
            persistent: true,
            headers: { ...headers, error: error.message }
          });
          channel.ack(msg);
          console.log(`Moved task ${JSON.parse(msg.content).taskId} to dead letter queue after ${retryCount} retries`);
        }
      }
    });
    
    console.log('External sync consumer started');
  } catch (error) {
    console.error('Failed to start external sync consumer:', error);
    throw error;
  }
}

// External system integration
async function createTaskInExternalSystem(taskData) {
  // Implementation depends on external system
  console.log(`Creating task ${taskData.taskId} in external system`);
  // ...
}

async function completeTaskInExternalSystem(taskData) {
  // Implementation depends on external system
  console.log(`Marking task ${taskData.taskId} as completed in external system`);
  // ...
}

// Email notification
async function sendTaskCompletedEmail(email, taskData) {
  // Implementation depends on email service
  console.log(`Sending completion email for task ${taskData.taskId} to ${email}`);
  // ...
}

// Start consumers
startEmailNotificationConsumer().catch(console.error);
startExternalSyncConsumer().catch(console.error);

// Express webhook endpoint
app.post('/webhooks/tasks', express.json(), handleTaskWebhook);
```

#### Advantages:

- Real-time updates
- Loose coupling between systems
- Scalable to multiple consumers
- Built-in retry mechanisms
- Reliable message delivery

#### Disadvantages:

- Requires message broker infrastructure
- More complex setup
- Need to handle duplicate events
- Webhook needs to be reliable

## Summary

These integration patterns can be mixed and matched depending on your specific requirements. For example, you might use:

- Backend queue pattern for write operations
- Scheduled synchronization for batch reporting
- Event-driven integration for real-time notifications
- Offline-first pattern for mobile applications

When choosing an integration pattern, consider:

1. **Real-time requirements**: Does the integration need to be immediate or can it be delayed?
2. **Reliability needs**: How critical is it that every operation succeeds?
3. **Network constraints**: Will the application work in low-connectivity environments?
4. **Scaling considerations**: How many users or operations will the system handle?
5. **Complexity tradeoffs**: What level of implementation complexity is acceptable?

By selecting the right integration patterns for your needs, you can build robust, scalable applications that leverage the Task Management API effectively.

--- FILE: tutorials/implementing-reminders.md ---
---
title: "Implementing reminders"
description: "How to use the warningOffset property to implement a reminder system for tasks approaching their due date."
tags: ["tutorial", "reminders"]
categories: ["tutorials"]
importance: 5
parent: "Tutorials & Guides" 
ai-generated: false
nav_order: "3"
layout: "default"
version: "v1.0.0"
lastUpdated: "May 20, 2025"
---

# Implementing reminders

The Task Management API includes a `warningOffset` property on task resources, which specifies the number of minutes before a task's due date that a reminder should be triggered. This guide will show you how to implement a reminder system using this property.

## Understanding warningOffset

Each task has the following time-related properties:

- `dueDate`: When the task is due (ISO 8601 datetime format)
- `warningOffset`: Minutes before the due date to send a reminder (integer)

For example, if a task has:
- `dueDate`: "2025-06-15T17:00:00-05:00" (5:00 PM on June 15, 2025)
- `warningOffset`: 120 (2 hours)

Then the reminder should be triggered at 3:00 PM on June 15, 2025 (2 hours before the due date).

## Reminder implementation options

There are several approaches to implementing reminders, depending on your application architecture:

### 1. Polling-based approach

This approach periodically checks for tasks that need reminders.

#### Server-side implementation:

```javascript
// Node.js with Express and node-cron
const express = require('express');
const cron = require('node-cron');
const axios = require('axios');
const app = express();

// API client setup
const apiClient = axios.create({
  baseURL: 'http://localhost:3000',
  headers: {
    'Authorization': 'Bearer your-token-here',
    'Content-Type': 'application/json'
  }
});

// Run the reminder check every minute
cron.schedule('* * * * *', async () => {
  try {
    await checkForDueTaskReminders();
  } catch (error) {
    console.error('Error checking for reminders:', error);
  }
});

async function checkForDueTaskReminders() {
  console.log('Checking for task reminders...');
  
  // Get all active tasks
  const response = await apiClient.get('/tasks');
  const tasks = response.data.tasks.filter(task => 
    ['NOT_STARTED', 'IN_PROGRESS', 'BLOCKED', 'DEFERRED'].includes(task.taskStatus)
  );
  
  // Current time
  const now = new Date();
  
  // Check each task for reminder time
  for (const task of tasks) {
    const dueDate = new Date(task.dueDate);
    const warningOffset = task.warningOffset || 0;
    
    // Calculate reminder time
    const reminderTime = new Date(dueDate);
    reminderTime.setMinutes(reminderTime.getMinutes() - warningOffset);
    
    // Calculate time window to avoid missing reminders between checks
    // (consider tasks due in the next 2 minutes as well)
    const reminderWindowStart = new Date(now);
    const reminderWindowEnd = new Date(now);
    reminderWindowEnd.setMinutes(now.getMinutes() + 2);
    
    // Check if reminder time is within the current window
    if (reminderTime >= reminderWindowStart && reminderTime <= reminderWindowEnd) {
      // Time to send a reminder!
      await sendTaskReminder(task);
      
      // Optionally mark the task as reminded in a database
      await markTaskReminded(task.taskId);
    }
  }
}

async function sendTaskReminder(task) {
  try {
    // Get user details
    const userResponse = await apiClient.get(`/users/${task.userId}`);
    const user = userResponse.data;
    
    console.log(`Sending reminder for task "${task.taskTitle}" to ${user.contactEmail}`);
    
    // In a real implementation, you would send an email or push notification
    // Example: Send email notification
    await sendEmail({
      to: user.contactEmail,
      subject: `Reminder: Task "${task.taskTitle}" is due soon`,
      body: `Your task "${task.taskTitle}" is due at ${new Date(task.dueDate).toLocaleString()}.`
    });
    
    // Example: Log reminder for audit purposes
    console.log(`Reminder sent for task ${task.taskId} to user ${task.userId} at ${new Date().toISOString()}`);
  } catch (error) {
    console.error(`Error sending reminder for task ${task.taskId}:`, error);
    throw error;
  }
}

// Mock implementation of email sending
async function sendEmail(options) {
  // In a real implementation, you would use a service like SendGrid, Mailgun, etc.
  console.log(`EMAIL: To: ${options.to}, Subject: ${options.subject}, Body: ${options.body}`);
  return true;
}

// Mock implementation of reminder tracking
async function markTaskReminded(taskId) {
  // In a real implementation, you would update a database record
  console.log(`Marked task ${taskId} as reminded`);
  return true;
}

app.listen(8000, () => {
  console.log('Reminder service running on port 8000');
});
```

#### Advantages:

- Simple to implement
- Works with any notification system
- Can run as a separate service

#### Disadvantages:

- Potential for missed reminders if the service is down
- Less efficient with large numbers of tasks
- May send duplicate reminders if not tracking sent reminders

### 2. Calendar-based approach

This approach creates calendar events with alarms for reminders.

#### Implementation:

```javascript
// Node.js with ical-generator
const express = require('express');
const axios = require('axios');
const ical = require('ical-generator');
const app = express();

// API client setup
const apiClient = axios.create({
  baseURL: 'http://localhost:3000',
  headers: {
    'Authorization': 'Bearer your-token-here',
    'Content-Type': 'application/json'
  }
});

// Generate iCalendar for a user's tasks
app.get('/users/:userId/calendar', async (req, res) => {
  try {
    const userId = req.params.userId;
    
    // Get user details
    const userResponse = await apiClient.get(`/users/${userId}`);
    const user = userResponse.data;
    
    // Get all tasks for the user
    const tasksResponse = await apiClient.get(`/tasks?userId=${userId}`);
    const tasks = tasksResponse.data.tasks;
    
    // Create a new calendar
    const calendar = ical({
      domain: 'example.com',
      name: `${user.firstName} ${user.lastName}'s Tasks`,
      timezone: 'America/New_York'
    });
    
    // Add each task as an event
    tasks.forEach(task => {
      // Only add incomplete tasks
      if (['NOT_STARTED', 'IN_PROGRESS', 'BLOCKED', 'DEFERRED'].includes(task.taskStatus)) {
        const event = calendar.createEvent({
          start: new Date(task.dueDate),
          end: new Date(new Date(task.dueDate).getTime() + 30 * 60000), // 30-minute duration
          summary: task.taskTitle,
          description: task.taskDescription || '',
          url: `https://yourtaskapp.com/tasks/${task.taskId}`,
          timezone: 'America/New_York'
        });
        
        // Add alarm based on warningOffset
        event.createAlarm({
          type: 'display',
          trigger: -(task.warningOffset || 0) * 60, // Convert minutes to seconds
          description: `Reminder: ${task.taskTitle}`
        });
      }
    });
    
    // Set content type and send the calendar
    res.set('Content-Type', 'text/calendar; charset=utf-8');
    res.set('Content-Disposition', `attachment; filename="${user.firstName}Tasks.ics"`);
    res.send(calendar.toString());
  } catch (error) {
    console.error('Error generating calendar:', error);
    res.status(500).json({
      error: 'Failed to generate calendar',
      details: error.message
    });
  }
});

// HTML page with subscription instructions
app.get('/users/:userId/calendar-setup', (req, res) => {
  const userId = req.params.userId;
  const calendarUrl = `${req.protocol}://${req.get('host')}/users/${userId}/calendar`;
  
  res.send(`
    <html>
      <head>
        <title>Task Calendar Setup</title>
        <style>
          body { font-family: Arial, sans-serif; line-height: 1.6; max-width: 800px; margin: 0 auto; padding: 20px; }
          .steps { background: #f5f5f5; padding: 20px; border-radius: 5px; }
          .calendar-url { background: #eee; padding: 10px; border-radius: 3px; word-break: break-all; }
        </style>
      </head>
      <body>
        <h1>Task Calendar Setup</h1>
        <p>Follow these steps to add your task calendar to your preferred calendar application:</p>
        
        <div class="steps">
          <h2>Your Calendar URL</h2>
          <div class="calendar-url">${calendarUrl}</div>
          
          <h2>Google Calendar</h2>
          <ol>
            <li>Open <a href="https://calendar.google.com" target="_blank">Google Calendar</a></li>
            <li>Click the "+" next to "Other calendars"</li>
            <li>Select "From URL"</li>
            <li>Paste the calendar URL above</li>
            <li>Click "Add Calendar"</li>
          </ol>
          
          <h2>Apple Calendar</h2>
          <ol>
            <li>Open Calendar app</li>
            <li>Select File > New Calendar Subscription</li>
            <li>Paste the calendar URL above</li>
            <li>Click Subscribe</li>
            <li>Adjust settings and click OK</li>
          </ol>
          
          <h2>Outlook</h2>
          <ol>
            <li>Open Outlook</li>
            <li>Go to Calendar view</li>
            <li>Click "Add Calendar" > "From Internet"</li>
            <li>Paste the calendar URL above</li>
            <li>Click "OK"</li>
          </ol>
          
          <h2>Direct Download</h2>
          <p>You can also <a href="${calendarUrl}">download the calendar file</a> and import it manually.</p>
        </div>
        
        <p><strong>Note:</strong> Your calendar will update automatically when you refresh/sync your calendar application.</p>
      </body>
    </html>
  `);
});

app.listen(8000, () => {
  console.log('Calendar service running on port 8000');
});
```

#### Advantages:

- Integrates with existing calendar applications
- Users get reminders even if your application is offline
- Can include additional task details in the calendar entry

#### Disadvantages:

- Calendar needs to be synced regularly for updates
- Less control over the exact reminder timing and format
- Requires users to set up calendar integration

### 3. Client-side implementation

This approach handles reminders directly in the client application.

#### Implementation (React example):

```jsx
// React component with reminder handling
import React, { useState, useEffect } from 'react';
import axios from 'axios';

// API client setup
const apiClient = axios.create({
  baseURL: 'http://localhost:3000',
  headers: {
    'Authorization': 'Bearer your-token-here',
    'Content-Type': 'application/json'
  }
});

function TaskReminders() {
  const [tasks, setTasks] = useState([]);
  const [upcomingReminders, setUpcomingReminders] = useState([]);
  const [nextReminderCheck, setNextReminderCheck] = useState(null);
  
  // Load tasks when component mounts
  useEffect(() => {
    const loadTasks = async () => {
      try {
        const response = await apiClient.get('/tasks');
        const activeTasks = response.data.tasks.filter(task => 
          ['NOT_STARTED', 'IN_PROGRESS', 'BLOCKED', 'DEFERRED'].includes(task.taskStatus)
        );
        setTasks(activeTasks);
      } catch (error) {
        console.error('Error loading tasks:', error);
      }
    };
    
    loadTasks();
    
    // Set up regular refresh
    const refreshInterval = setInterval(loadTasks, 5 * 60 * 1000); // Refresh every 5 minutes
    
    return () => clearInterval(refreshInterval);
  }, []);
  
  // Check for upcoming reminders
  useEffect(() => {
    const checkReminders = () => {
      const now = new Date();
      const remindersToShow = [];
      let nextCheck = null;
      
      // Check each task
      tasks.forEach(task => {
        const dueDate = new Date(task.dueDate);
        const warningOffset = task.warningOffset || 0;
        
        // Calculate reminder time
        const reminderTime = new Date(dueDate);
        reminderTime.setMinutes(reminderTime.getMinutes() - warningOffset);
        
        // Calculate time until reminder
        const timeUntilReminder = reminderTime - now;
        
        // If reminder is in the future and within the next hour, track it
        if (timeUntilReminder > 0 && timeUntilReminder <= 60 * 60 * 1000) {
          remindersToShow.push({
            ...task,
            reminderTime,
            timeUntilReminder
          });
          
          // Track the next check time
          if (nextCheck === null || timeUntilReminder < nextCheck) {
            nextCheck = timeUntilReminder;
          }
        }
        
        // If reminder is now (or in the last minute), show it
        if (timeUntilReminder <= 60 * 1000 && timeUntilReminder > -60 * 1000) {
          showReminder(task);
        }
      });
      
      setUpcomingReminders(remindersToShow);
      
      // Schedule next check
      if (nextCheck !== null) {
        // Check again just before the next reminder is due
        const checkTime = Math.max(nextCheck - 5000, 1000); // At least 1 second, 5 seconds before reminder
        setNextReminderCheck(setTimeout(checkReminders, checkTime));
      } else {
        // If no upcoming reminders, check again in 5 minutes
        setNextReminderCheck(setTimeout(checkReminders, 5 * 60 * 1000));
      }
    };
    
    // Clear any existing check timer
    if (nextReminderCheck !== null) {
      clearTimeout(nextReminderCheck);
    }
    
    // Initial check
    checkReminders();
    
    // Cleanup on unmount
    return () => {
      if (nextReminderCheck !== null) {
        clearTimeout(nextReminderCheck);
      }
    };
  }, [tasks]);
  
  // Show a reminder notification
  const showReminder = (task) => {
    // Check if browser notifications are supported
    if ('Notification' in window) {
      // Check notification permission
      if (Notification.permission === 'granted') {
        showNotification(task);
      } else if (Notification.permission !== 'denied') {
        // Request permission
        Notification.requestPermission().then(permission => {
          if (permission === 'granted') {
            showNotification(task);
          }
        });
      }
    }
    
    // Also show in-app reminder
    // This could be a modal, toast notification, or other UI element
    console.log(`REMINDER: Task "${task.taskTitle}" is due soon!`);
    
    // You could use a notification library like react-toastify
    // toast.info(`Task "${task.taskTitle}" is due soon!`);
  };
  
  // Show browser notification
  const showNotification = (task) => {
    const dueTime = new Date(task.dueDate).toLocaleTimeString([], {
      hour: '2-digit',
      minute: '2-digit'
    });
    
    const notification = new Notification(`Task Due Soon: ${task.taskTitle}`, {
      body: `Due at ${dueTime}`,
      icon: '/logo192.png' // Your app's icon
    });
    
    // Add click handler
    notification.onclick = () => {
      window.focus();
      notification.close();
      // Navigate to the task
      window.location.href = `/tasks/${task.taskId}`;
    };
  };
  
  return (
    <div className="task-reminders">
      <h2>Upcoming Reminders</h2>
      
      {upcomingReminders.length === 0 ? (
        <p>No upcoming reminders in the next hour.</p>
      ) : (
        <ul>
          {upcomingReminders.map(task => {
            // Format time until reminder
            const minutesUntil = Math.ceil(task.timeUntilReminder / (1000 * 60));
            
            return (
              <li key={task.taskId}>
                <strong>{task.taskTitle}</strong> - Due in {minutesUntil} minutes
              </li>
            );
          })}
        </ul>
      )}
      
      <div>
        <button onClick={() => showReminder(tasks[0])}>
          Test Notification
        </button>
        <p><small>This will display a test notification for the first task in your list.</small></p>
      </div>
      
      <h3>Enable Notifications</h3>
      <p>To receive reminder notifications, please enable notifications for this site.</p>
      <button 
        onClick={() => {
          Notification.requestPermission().then(permission => {
            console.log('Notification permission:', permission);
          });
        }}
      >
        Enable Notifications
      </button>
    </div>
  );
}

export default TaskReminders;
```

#### Advantages:

- No server-side infrastructure needed for reminders
- Immediate feedback for users
- Works even when offline (for previously loaded tasks)
- Can use both browser notifications and in-app reminders

#### Disadvantages:

- Only works while the application is open
- Depends on browser notification support
- Less reliable than server-side solution
- Only handles reminders for the current user

## 4. Push notification approach

For mobile and web applications that need reliable reminders, use a push notification service.

#### Implementation (Node.js with Firebase Cloud Messaging):

```javascript
// Node.js with Express and Firebase Cloud Messaging
const express = require('express');
const cron = require('node-cron');
const axios = require('axios');
const admin = require('firebase-admin');
const app = express();

// Initialize Firebase Admin SDK
admin.initializeApp({
  credential: admin.credential.cert({
    projectId: 'your-project-id',
    clientEmail: 'your-client-email',
    privateKey: 'your-private-key'
  })
});

// API client setup
const apiClient = axios.create({
  baseURL: 'http://localhost:3000',
  headers: {
    'Authorization': 'Bearer your-token-here',
    'Content-Type': 'application/json'
  }
});

// Database to store user FCM tokens
// In a real app, you would use a persistent database
const userTokens = {
  // userId: 'fcm-token'
};

// Register FCM token for a user
app.post('/users/:userId/fcm-token', express.json(), (req, res) => {
  const { userId } = req.params;
  const { token } = req.body;
  
  if (!token) {
    return res.status(400).json({ error: 'Token is required' });
  }
  
  userTokens[userId] = token;
  console.log(`Registered FCM token for user ${userId}`);
  
  res.json({ success: true });
});

// Check for due task reminders (runs every minute)
cron.schedule('* * * * *', async () => {
  try {
    await checkForDueTaskReminders();
  } catch (error) {
    console.error('Error checking for reminders:', error);
  }
});

async function checkForDueTaskReminders() {
  console.log('Checking for task reminders...');
  
  // Get all active tasks
  const response = await apiClient.get('/tasks');
  const tasks = response.data.tasks.filter(task => 
    ['NOT_STARTED', 'IN_PROGRESS', 'BLOCKED', 'DEFERRED'].includes(task.taskStatus)
  );
  
  // Current time
  const now = new Date();
  
  // Check each task for reminder time
  for (const task of tasks) {
    const dueDate = new Date(task.dueDate);
    const warningOffset = task.warningOffset || 0;
    
    // Calculate reminder time
    const reminderTime = new Date(dueDate);
    reminderTime.setMinutes(reminderTime.getMinutes() - warningOffset);
    
    // Calculate time window to avoid missing reminders between checks
    const reminderWindowStart = new Date(now);
    reminderWindowStart.setMinutes(now.getMinutes() - 1); // Include reminders from the last minute
    
    const reminderWindowEnd = new Date(now);
    reminderWindowEnd.setMinutes(now.getMinutes() + 1); // Include reminders for the next minute
    
    // Check if reminder time is within the current window
    if (reminderTime >= reminderWindowStart && reminderTime <= reminderWindowEnd) {
      // Time to send a reminder!
      await sendPushNotification(task);
    }
  }
}

async function sendPushNotification(task) {
  try {
    // Get user details
    const userResponse = await apiClient.get(`/users/${task.userId}`);
    const user = userResponse.data;
    
    // Get FCM token for the user
    const token = userTokens[task.userId];
    
    if (!token) {
      console.log(`No FCM token found for user ${task.userId}`);
      return;
    }
    
    console.log(`Sending push notification for task "${task.taskTitle}" to user ${task.userId}`);
    
    // Format due time
    const dueTime = new Date(task.dueDate).toLocaleTimeString([], {
      hour: '2-digit',
      minute: '2-digit'
    });
    
    // Send FCM message
    const message = {
      notification: {
        title: `Task Due Soon: ${task.taskTitle}`,
        body: `Your task "${task.taskTitle}" is due at ${dueTime}.`
      },
      data: {
        taskId: task.taskId.toString(),
        dueDate: task.dueDate,
        title: task.taskTitle,
        description: task.taskDescription || '',
        type: 'task_reminder'
      },
      token: token
    };
    
    const response = await admin.messaging().send(message);
    console.log(`Successfully sent notification for task ${task.taskId}:`, response);
    
    // Log reminder for audit purposes
    console.log(`Reminder sent for task ${task.taskId} to user ${task.userId} at ${new Date().toISOString()}`);
  } catch (error) {
    console.error(`Error sending push notification for task ${task.taskId}:`, error);
    throw error;
  }
}

app.listen(8000, () => {
  console.log('Reminder service running on port 8000');
});
```

#### Client-side (React Native example):

```jsx
// React Native component for FCM setup
import React, { useEffect } from 'react';
import { Alert, Platform } from 'react-native';
import messaging from '@react-native-firebase/messaging';
import AsyncStorage from '@react-native-async-storage/async-storage';
import axios from 'axios';

// API client setup
const apiClient = axios.create({
  baseURL: 'http://localhost:8000', // Your reminder service
  headers: {
    'Content-Type': 'application/json'
  }
});

function PushNotificationSetup({ userId }) {
  useEffect(() => {
    const setupPushNotifications = async () => {
      try {
        // Request permission (iOS only, Android grants by default)
        if (Platform.OS === 'ios') {
          const authStatus = await messaging().requestPermission();
          const enabled = 
            authStatus === messaging.AuthorizationStatus.AUTHORIZED ||
            authStatus === messaging.AuthorizationStatus.PROVISIONAL;
            
          if (!enabled) {
            Alert.alert(
              'Permissions required',
              'Please enable notifications to receive task reminders.',
              [{ text: 'OK' }]
            );
            return;
          }
        }
        
        // Get FCM token
        const token = await messaging().getToken();
        console.log('FCM Token:', token);
        
        // Check if token has changed
        const storedToken = await AsyncStorage.getItem('fcmToken');
        if (token !== storedToken) {
          // Register token with server
          await apiClient.post(`/users/${userId}/fcm-token`, { token });
          
          // Save token locally
          await AsyncStorage.setItem('fcmToken', token);
        }
        
        // Listen for token refresh
        const unsubscribe = messaging().onTokenRefresh(async newToken => {
          console.log('FCM Token refreshed:', newToken);
          
          // Register new token with server
          await apiClient.post(`/users/${userId}/fcm-token`, { token: newToken });
          
          // Save new token locally
          await AsyncStorage.setItem('fcmToken', newToken);
        });
        
        // Set up foreground notification handler
        const messageUnsubscribe = messaging().onMessage(async remoteMessage => {
          console.log('Foreground notification received:', remoteMessage);
          
          // Show in-app alert for foreground notifications
          if (remoteMessage.notification) {
            Alert.alert(
              remoteMessage.notification.title,
              remoteMessage.notification.body,
              [{ text: 'View', onPress: () => navigateToTask(remoteMessage.data.taskId) }, 
               { text: 'Dismiss' }]
            );
          }
        });
        
        // Clean up on unmount
        return () => {
          unsubscribe();
          messageUnsubscribe();
        };
      } catch (error) {
        console.error('Error setting up push notifications:', error);
      }
    };
    
    setupPushNotifications();
  }, [userId]);
  
  const navigateToTask = (taskId) => {
    // Navigation logic to go to the task detail screen
    console.log(`Navigate to task ${taskId}`);
    // For example: navigation.navigate('TaskDetail', { taskId });
  };
  
  // Component doesn't render anything
  return null;
}

export default PushNotificationSetup;
```

#### Advantages:

- Works even when the app is closed (background notifications)
- Reliable delivery mechanism
- Supports both mobile and web applications
- Can track delivery and open rates

#### Disadvantages:

- Requires a push notification service setup
- More complex implementation
- Users may disable notifications
- Potential costs for high-volume notifications

## Reminder tracking and management

For a complete reminder system, you may want to implement reminder tracking and management features:

### 1. Track sent reminders

Keep track of which reminders have been sent to avoid duplicates:

```javascript
// Example schema for a reminder tracking database
const reminderSchema = {
  taskId: Number,       // ID of the task
  userId: Number,       // ID of the user who received the reminder
  sentAt: Date,         // When the reminder was sent
  reminderType: String, // Type of reminder (e.g., 'warningOffset', 'dueDate', 'overdue')
  deliveryMethod: String, // How the reminder was sent (e.g., 'email', 'push', 'sms')
  delivered: Boolean,   // Whether the reminder was successfully delivered
  opened: Boolean,      // Whether the reminder was viewed/opened by the user
  openedAt: Date        // When the reminder was opened (if applicable)
};
```

### 2. Allow users to customize reminders

Let users set their own reminder preferences:

```javascript
// Example user preference schema
const userReminderPreferencesSchema = {
  userId: Number,         // ID of the user
  defaultWarningOffset: Number, // Default warning offset for new tasks (in minutes)
  reminderMethods: [String],  // Preferred methods ('email', 'push', 'sms', etc.)
  quietH      