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


