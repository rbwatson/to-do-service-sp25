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


