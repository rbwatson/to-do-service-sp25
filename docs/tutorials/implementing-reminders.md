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

