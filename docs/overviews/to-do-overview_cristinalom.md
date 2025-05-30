# To-Do Service overview

Use the To-Do Service to post common tasks and receive reminders for those tasks.

## Get started

Before you can begin to perform common tasks with the **To-Do Service**, you must set up your development system. Review the [Before you start a tutorial](../before-you-start-a-tutorial.md) page to get started.

>\[!NOTE\]
>Preparation to start a tutorial takes approximately 20 minutes to complete.

## Order of tasks

To begin posting your tasks to the service, you must add your users to the service first.

1. [Enroll a new user](../tutorials/enroll-a-new-user.md)
2. [Add a new task](../tutorials/add-a-new-task.md)

## Coming soon

The following tasks for the **To-Do Service** are available soon:

- Change the due-date of a task
- Delete a task
- Get all tasks
- Get task by ```ID```
- Get task by ```user_ID```

## References by resource

### User resource

The [user resource](../api/user.md) contains information for all users of the service.

The following is an example of the user resource:

```json
{
    "last_name": "Smith",
    "first_name": "Ferdinand",
    "email": "f.smith@example.com",
    "id": 1
}
```

### Task resource

The [task resource](../api/task.md) contains information for all tasks in the service.

The following is an example of the task resource:

```json
{
    "user_id": 1,
    "title": "Grocery shopping",
    "description": "eggs, bacon, gummy bears",
    "due_date": "2025-02-20T17:00",
    "warning": "-10",
    "id": 1
}
```
