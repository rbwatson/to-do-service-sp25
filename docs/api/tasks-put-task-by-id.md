---
layout: page
---

# Put task by ID

Updates a [task](task.md) object specified by the `id` parameter, if it exists.

## URL

```shell

{server_url}/tasks/{id}
```

## Parameters

| Parameter name | Type | Description |
| -------------- | ------ | ------------ |
| `user_id` | number | The ID of the user resource assigned to this task |
| `title` | string | The title or short description of the task |
| `description` | string | The long description of the task |
| `due_date` | string | The [`ISO 8601`](https://en.wikipedia.org/wiki/ISO_8601) format of the date and time the task is due |
| `warning` | number | The number of minutes relative to the `due_date` to alert the user of the task. This is normally a negative number to alert the user before the `due_date`. |
| `id` | number | The task's unique record ID |

## Request headers

`Content-Type: application/json`

## Request body

```js
[
    {
        "user_id": 1,
        "title": "Grocery shopping",
        "description": "eggs, bacon, gummy bears, milk",
        "due_date": "2025-02-20T17:00",
        "warning": "-10",
        "id": 1
    }
]
```

## Return body

```js
[
    {
        "user_id": 1,
        "title": "Grocery shopping",
        "description": "eggs, bacon, gummy bears, milk",
        "due_date": "2025-02-20T17:00",
        "warning": "-10",
        "id": 1
    }
]
```

## Return status

| Status value | Return status | Description |
| ------------- | ----------- | ----------- |
| 200 | Success | Requested data updated successfully |
| 404 | Error | Specified task record not found |
|  ECONNREFUSED | N/A | Service is offline. Start the service and try again. |
