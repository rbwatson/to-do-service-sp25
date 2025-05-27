
# Get user by user ID

## What you'll learn

In this topic, you'll learn how to call the To-Do Service API to get a user by their user ID.

This tutorial takes 25 minutes to complete.

## Before you begin

Complete the [Before you start a tutorial](../before-you-start-a-tutorial.md) to verify that you configured your development system to use the To-Do Service.

## Parameters

| Parameter      | Type         | Description |
| -------------- |------------| -----------|
| **id**  | Number    |   Returns the ID of the user|

## Steps

1. Open GitHub Desktop.

2. Open your fork of the To-Do-service repository in your development system's command line.

3. Start your local service:`json-server -w to-do-db-source.json`

4. Open the Postman desktop app.

5. Select **GET** from the method dropdown.

6. Call the service: `http://localhost:3000/users/{id}`

## Response

```js
{
    "last_name": "Jones",
    "first_name": "Jill",
    "email": "j.jones@example.com",
    "id": 2
}
```

## Related information

* [Enroll a new user](./enroll-a-new-user.md)
  
* [Add a new task](./enroll-a-new-user.md)
