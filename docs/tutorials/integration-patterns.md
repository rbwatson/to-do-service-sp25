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


