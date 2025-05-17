---
title: "Troubleshooting"
description: "Solutions to common issues encountered when using the Task Management API."
tags: ["troubleshooting", "errors"]
categories: ["support"]
importance: 5
parent: "Support & FAQ"
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "2025-05-13"
nav_order: "2"
layout: "default"
version: "v1.0.0"
lastUpdated: "2025-05-13"
---

# Troubleshooting

This guide helps you diagnose and resolve common issues when working with the Task Management API. If you encounter problems not covered here, please check our [FAQ](../support/faq.md) or contact our [support team](../support/support-resources.md).

## Authentication Issues

### Problem: "Unauthorized" or "Invalid API key" error

**Symptoms:**
- You receive a `401 Unauthorized` error response
- Error message mentions "Invalid API key" or "Missing authorization"

**Possible causes:**
1. Missing or incorrect API key in the `Authorization` header
2. Improperly formatted Authorization header
3. API key has been revoked or expired
4. Typos or extra spaces in the API key

**Solutions:**

1. **Check your Authorization header format:**
   - Ensure you're using the correct format: `Authorization: Bearer YOUR_API_KEY`
   - Make sure "Bearer" is included and spelled correctly
   - Check that there's a space between "Bearer" and your API key

2. **Verify your API key:**
   - Log in to your account dashboard to verify the API key is active
   - If in doubt, generate a new API key and update your application
   - Make sure you're not using a revoked or expired key

3. **Check for typos or whitespace:**
   ```javascript
   // Incorrect - has extra whitespace
   const apiKey = "  YOUR_API_KEY  ";
   
   // Correct - trim whitespace
   const apiKey = "YOUR_API_KEY".trim();
   ```

4. **Debug the request headers:**
   ```javascript
   // Log the Authorization header (but hide most of the key)
   const authHeader = `Bearer ${apiKey}`;
   console.log(
     "Authorization header:",
     `Bearer ${apiKey.substring(0, 3)}...${apiKey.substring(apiKey.length - 3)}`
   );
   ```

### Problem: "Forbidden" or "Permission denied" error

**Symptoms:**
- You receive a `403 Forbidden` error response
- Error message mentions "Permission denied" or similar

**Possible causes:**
1. Your user account doesn't have permission for the operation
2. You're trying to access or modify a resource owned by another user
3. Your API key has restricted permissions

**Solutions:**

1. **Check your user role:**
   - `admin` users have full access to all resources
   - `manager` users have some limitations on user management
   - `member` users can only access their own resources

2. **Verify resource ownership:**
   - Make sure you're only trying to access resources you own or have been assigned to
   - Check if you're using the correct resource IDs

3. **Check API key permissions:**
   - Some API keys might have restricted scopes
   - If possible, generate a new API key with the necessary permissions

## Resource Not Found Errors

### Problem: "Resource not found" error

**Symptoms:**
- You receive a `404 Not Found` error response
- Error message mentions a specific resource ID that wasn't found

**Possible causes:**
1. The resource ID doesn't exist
2. The resource has been deleted
3. There's a typo in the resource ID
4. You're using the wrong endpoint

**Solutions:**

1. **Check the resource ID:**
   - Verify that the ID exists and is spelled correctly
   - If you're storing IDs, make sure they're updated when resources change

2. **Verify the resource still exists:**
   - Resources might have been deleted by another user or process
   - Try listing all resources of that type to see what's available

3. **Use error handling for missing resources:**
   ```javascript
   async function getTaskSafely(taskId) {
     try {
       const response = await fetch(`/tasks/${taskId}`, {
         headers: { 'Authorization': `Bearer ${apiKey}` }
       });
       
       if (response.status === 404) {
         console.log(`Task ${taskId} not found`);
         return null;
       }
       
       if (!response.ok) {
         throw new Error(`API error: ${response.status}`);
       }
       
       return await response.json();
     } catch (error) {
       console.error('Error fetching task:', error);
       throw error;
     }
   }
   ```

## Validation Errors

### Problem: Validation errors when creating or updating resources

**Symptoms:**
- You receive a `422 Unprocessable Entity` error response
- Error message mentions "validation error" and provides details

**Possible causes:**
1. Missing required fields
2. Invalid field values (wrong format, out of range, etc.)
3. Unique constraint violations (e.g., duplicate email)

**Solutions:**

1. **Check the error details:**
   The API provides specific validation errors in the response:
   ```json
   {
     "error": {
       "code": "validation_error",
       "message": "The request contains invalid data",
       "details": {
         "title": "Title is required",
         "dueDate": "Due date must be in the future"
       }
     }
   }
   ```

2. **Validate data before sending:**
   ```javascript
   function validateTask(task) {
     const errors = {};
     
     if (!task.title) {
       errors.title = "Title is required";
     }
     
     if (task.dueDate) {
       const dueDate = new Date(task.dueDate);
       if (isNaN(dueDate.getTime())) {
         errors.dueDate = "Invalid date format";
       } else if (dueDate <= new Date()) {
         errors.dueDate = "Due date must be in the future";
       }
     }
     
     return Object.keys(errors).length ? errors : null;
   }
   
   // Usage
   const task = {
     title: "",
     dueDate: "2020-01-01"
   };
   
   const errors = validateTask(task);
   if (errors) {
     console.error("Validation errors:", errors);
     // Handle errors instead of sending the request
   } else {
     // Proceed with API request
   }
   ```

3. **Check for duplicate values:**
   Before creating a user, you might want to check if the email is already in use:
   ```javascript
   async function isEmailInUse(email) {
     try {
       const response = await fetch(`/users?email=${encodeURIComponent(email)}`, {
         headers: { 'Authorization': `Bearer ${apiKey}` }
       });
       
       if (!response.ok) {
         throw new Error(`API error: ${response.status}`);
       }
       
       const result = await response.json();
       return result.data.length > 0;
     } catch (error) {
       console.error('Error checking email:', error);
       return false;
     }
   }
   ```

### Problem: Invalid status transition errors

**Symptoms:**
- You receive a `422 Unprocessable Entity` error
- Error message mentions "invalid status transition"

**Possible causes:**
1. Attempting to change a task's status to a value that's not allowed for the current status
2. Trying to change the status of a task that's in a terminal state (e.g., CANCELED)

**Solutions:**

1. **Follow the task status lifecycle:**
   The API enforces a specific task status workflow:
   - From `TODO`: Can transition to `IN_PROGRESS` or `CANCELED`
   - From `IN_PROGRESS`: Can transition to `REVIEW` or `CANCELED`
   - From `REVIEW`: Can transition to `DONE`, `IN_PROGRESS`, or `CANCELED`
   - From `DONE`: Can transition to `CANCELED`
   - From `CANCELED`: Cannot transition to any other status

2. **Check current status before updating:**
   ```javascript
   async function updateTaskStatus(taskId, newStatus) {
     // First, get the current task
     const task = await getTask(taskId);
     
     // Define valid transitions
     const validTransitions = {
       TODO: ['IN_PROGRESS', 'CANCELED'],
       IN_PROGRESS: ['REVIEW', 'CANCELED'],
       REVIEW: ['DONE', 'IN_PROGRESS', 'CANCELED'],
       DONE: ['CANCELED'],
       CANCELED: []
     };
     
     // Check if the transition is valid
     if (!validTransitions[task.status].includes(newStatus)) {
       console.error(
         `Invalid status transition from ${task.status} to ${newStatus}. ` +
         `Valid transitions are: ${validTransitions[task.status].join(', ')}`
       );
       return null;
     }
     
     // Proceed with the update
     return updateTask(taskId, { status: newStatus });
   }
   ```

## Rate Limiting Issues

### Problem: "Rate limit exceeded" errors

**Symptoms:**
- You receive a `429 Too Many Requests` error
- Error message mentions "rate limit exceeded"

**Possible causes:**
1. Sending too many requests in a short period
2. Multiple applications sharing the same API key
3. Inefficient code making redundant API calls

**Solutions:**

1. **Implement exponential backoff:**
   ```javascript
   async function fetchWithBackoff(url, options, maxRetries = 3) {
     let retries = 0;
     
     while (true) {
       try {
         const response = await fetch(url, options);
         
         if (response.status === 429) {
           // Get retry time from header or use exponential backoff
           const retryAfter = response.headers.get('Retry-After') || 
             Math.pow(2, retries);
           console.log(`Rate limited, waiting ${retryAfter} seconds...`);
           await new Promise(resolve => setTimeout(resolve, retryAfter * 1000));
           retries++;
           continue;
         }
         
         return response;
       } catch (error) {
         if (retries >= maxRetries) {
           throw error;
         }
         
         retries++;
         // Add exponential delay with jitter
         const delay = Math.pow(2, retries) * 1000 + Math.random() * 1000;
         await new Promise(resolve => setTimeout(resolve, delay));
       }
     }
   }
   ```

2. **Optimize API usage:**
   - Cache responses when appropriate
   - Batch operations instead of making many separate requests
   - Use filtering on the server side instead of fetching all data
   - Implement pagination correctly

3. **Monitor your rate limit status:**
   The API includes rate limit information in response headers:
   ```
   X-RateLimit-Limit: 60
   X-RateLimit-Remaining: 45
   X-RateLimit-Reset: 1620000000
   ```
   You can track these values to avoid hitting limits:
   ```javascript
   function handleRateLimits(response) {
     const limit = response.headers.get('X-RateLimit-Limit');
     const remaining = response.headers.get('X-RateLimit-Remaining');
     const reset = response.headers.get('X-RateLimit-Reset');
     
     if (remaining && parseInt(remaining) < 10) {
       console.warn(
         `Warning: Only ${remaining} requests remaining out of ${limit}. ` +
         `Limit resets at ${new Date(reset * 1000).toLocaleTimeString()}`
       );
     }
   }
   ```

## Network and Timeout Issues

### Problem: API requests timeout or fail with network errors

**Symptoms:**
- Requests hang for a long time before failing
- You get network-related errors (connection refused, timeout, etc.)
- Intermittent failures, especially on mobile networks

**Possible causes:**
1. Poor network connectivity
2. Server-side issues
3. Request timeout configuration too short
4. Large request or response payloads

**Solutions:**

1. **Implement request timeouts:**
   ```javascript
   async function fetchWithTimeout(url, options, timeout = 10000) {
     const controller = new AbortController();
     const id = setTimeout(() => controller.abort(), timeout);
     
     try {
       const response = await fetch(url, {
         ...options,
         signal: controller.signal
       });
       clearTimeout(id);
       return response;
     } catch (error) {
       clearTimeout(id);
       if (error.name === 'AbortError') {
         throw new Error(`Request timed out after ${timeout}ms`);
       }
       throw error;
     }
   }
   ```

2. **Add retry logic for transient failures:**
   ```javascript
   async function fetchWithRetry(url, options, maxRetries = 3) {
     let lastError;
     
     for (let i = 0; i < maxRetries; i++) {
       try {
         return await fetch(url, options);
       } catch (error) {
         lastError = error;
         
         // Only retry on network errors, not HTTP errors
         if (!error.message.includes('network')) {
           throw error;
         }
         
         // Add delay before retrying
         const delay = Math.pow(2, i) * 1000;
         console.log(`Network error, retrying in ${delay}ms...`);
         await new Promise(resolve => setTimeout(resolve, delay));
       }
     }
     
     throw lastError;
   }
   ```

3. **Optimize request/response size:**
   - Use pagination with reasonable page sizes
   - Apply server-side filtering to reduce response size
   - Consider compressing large payloads

## Debugging and Monitoring

### How to debug API requests

1. **Log request details:**
   ```javascript
   async function debugApiRequest(method, url, data) {
     console.log(`${method} ${url}`);
     if (data) {
       console.log('Request body:', JSON.stringify(data, null, 2));
     }
     
     try {
       const response = await fetch(url, {
         method,
         headers: {
           'Authorization': `Bearer ${apiKey}`,
           'Content-Type': 'application/json'
         },
         body: data ? JSON.stringify(data) : undefined
       });
       
       const responseBody = await response.text();
       let responseData;
       try {
         responseData = JSON.parse(responseBody);
       } catch {
         responseData = responseBody;
       }
       
       console.log(`Response (${response.status}):`, responseData);
       
       if (!response.ok) {
         throw new Error(`API error: ${response.status}`);
       }
       
       return responseData;
     } catch (error) {
       console.error('API request failed:', error);
       throw error;
     }
   }
   ```

2. **Use browser developer tools:**
   - Check the Network tab to see request details
   - Look for failed requests in red
   - Examine request and response headers
   - Check for CORS errors in the Console tab

3. **Use API testing tools:**
   - Postman, Insomnia, or similar tools can help debug API requests
   - These tools allow saving and sharing request configurations
   - They provide detailed response information and timing data

### Monitoring API usage

1. **Track API calls and errors:**
   ```javascript
   class ApiMetrics {
     constructor() {
       this.metrics = {
         totalRequests: 0,
         successfulRequests: 0,
         failedRequests: 0,
         rateLimitHits: 0,
         endpoints: {}
       };
     }
     
     recordRequest(endpoint, statusCode, duration) {
       this.metrics.totalRequests++;
       
       if (statusCode >= 200 && statusCode < 300) {
         this.metrics.successfulRequests++;
       } else {
         this.metrics.failedRequests++;
         if (statusCode === 429) {
           this.metrics.rateLimitHits++;
         }
       }
       
       if (!this.metrics.endpoints[endpoint]) {
         this.metrics.endpoints[endpoint] = {
           count: 0,
           errors: 0,
           totalDuration: 0
         };
       }
       
       this.metrics.endpoints[endpoint].count++;
       if (statusCode >= 400) {
         this.metrics.endpoints[endpoint].errors++;
       }
       this.metrics.endpoints[endpoint].totalDuration += duration;
     }
     
     getAverageResponseTime(endpoint) {
       const data = this.metrics.endpoints[endpoint];
       if (!data || data.count === 0) return 0;
       return data.totalDuration / data.count;
     }
     
     getErrorRate(endpoint) {
       const data = this.metrics.endpoints[endpoint];
       if (!data || data.count === 0) return 0;
       return (data.errors / data.count) * 100;
     }
     
     getMetrics() {
       return {
         ...this.metrics,
         successRate: this.metrics.totalRequests ? 
           (this.metrics.successfulRequests / this.metrics.totalRequests) * 100 : 0
       };
     }
   }
   
   // Usage
   const apiMetrics = new ApiMetrics();
   
   async function trackedFetch(endpoint, options) {
     const start = Date.now();
     let statusCode;
     
     try {
       const response = await fetch(`https://api.taskmanagement.example.com/v1${endpoint}`, {
         ...options,
         headers: {
           'Authorization': `Bearer ${apiKey}`,
           'Content-Type': 'application/json',
           ...options?.headers
         }
       });
       
       statusCode = response.status;
       return response;
     } finally {
       const duration = Date.now() - start;
       apiMetrics.recordRequest(endpoint, statusCode, duration);
     }
   }
   ```

2. **Set up alerts for error thresholds:**
   ```javascript
   function checkApiHealth() {
     const metrics = apiMetrics.getMetrics();
     
     // Alert if error rate exceeds 10%
     if (metrics.totalRequests > 10 && 
         metrics.failedRequests / metrics.totalRequests > 0.1) {
       sendAlert(
         `High API error rate: ${(metrics.failedRequests / metrics.totalRequests * 100).toFixed(1)}%`
       );
     }
     
     // Alert on rate limit hits
     if (metrics.rateLimitHits > 0) {
       sendAlert(`Rate limit hit ${metrics.rateLimitHits} times`);
     }
     
     // Check slow endpoints
     for (const [endpoint, data] of Object.entries(metrics.endpoints)) {
       const avgTime = data.totalDuration / data.count;
       if (data.count > 5 && avgTime > 1000) {
         sendAlert(`Slow endpoint: ${endpoint} averaging ${avgTime.toFixed(0)}ms`);
       }
     }
   }
   ```

## Common HTTP Status Code Issues

### 400 Bad Request

**Possible causes:**
- Malformed JSON in request body
- Missing required parameters
- Invalid parameters

**Solutions:**
- Validate your JSON before sending
- Check that all required parameters are included
- Verify parameter types and formats

### 401 Unauthorized

**Possible causes:**
- Missing or invalid API key
- Expired API key
- Malformed Authorization header

**Solutions:**
- Check your API key is valid and active
- Make sure your Authorization header uses the correct format
- Regenerate your API key if necessary

### 403 Forbidden

**Possible causes:**
- Insufficient permissions
- Attempting to access resources owned by another user
- Account restrictions

**Solutions:**
- Check your account permissions and role
- Only access resources you own or have permission to access
- Upgrade your account if you need additional permissions

### 404 Not Found

**Possible causes:**
- Resource doesn't exist
- Resource has been deleted
- Typo in resource ID
- Wrong API endpoint URL

**Solutions:**
- Verify the resource ID is correct
- Check if the resource still exists
- Double-check the API endpoint URL

### 409 Conflict

**Possible causes:**
- Duplicate unique values (e.g., email address)
- Concurrent update conflicts
- Resource state doesn't allow the operation

**Solutions:**
- Check for existing resources before creating new ones
- Implement proper concurrency handling
- Verify the current state of resources before updating

### 422 Unprocessable Entity

**Possible causes:**
- Validation errors on input data
- Invalid status transitions
- Business logic violations

**Solutions:**
- Validate input data before sending
- Check allowed status transitions
- Review business rules and constraints

### 429 Too Many Requests

**Possible causes:**
- Exceeding rate limits
- Too many concurrent requests
- Inefficient API usage

**Solutions:**
- Implement rate limit handling
- Add retry logic with backoff
- Optimize your API usage

### 500 Internal Server Error

**Possible causes:**
- Server-side issue
- Unexpected error in processing your request
- API bug

**Solutions:**
- Retry the request after a delay
- Check API status page for known issues
- Report the error if it persists

## Still Having Issues?

If you're still experiencing problems after trying these solutions:

1. **Check API status**: Visit our [status page](https://status.taskmanagement.example.com) to see if there are any ongoing issues.

2. **Get detailed logs**: Enable detailed logging in your application to gather more information about the issue.

3. **Contact support**: Reach out to our [support team](../support/support-resources.md) with:
   - A description of the issue
   - Steps to reproduce the problem
   - Any error messages or codes
   - Your client code (if possible)
   - Timestamps of when the issue occurred


