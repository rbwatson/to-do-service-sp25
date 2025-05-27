---
layout: page
---

# Get tasks by user ID

Returns an array of [`task`](task.md) objects that contains only the user specified by the `user_id` parameter, if it exists.

## URL

```shell

{server_url}/tasks
```

## Query parameters

| Parameter name | Type | Description |
| -------------- | ------ | ------------ |
| `user_id` | integer | The ID number of the user the desired tasks belong to |

## Return body

```js
[
  {
    "user_id": 1,
    "title": "Grocery shopping",
    "description": "eggs, bacon, gummy bears",
    "due_date": "2025-02-20T17:00",
    "warning": "-10",
    "id": 1
  },
  {
    "user_id": 1,
    "title": "Piano recital",
    "description": "Daughter's first concert appearance",
    "due_date": "2025-04-02T15:00",
    "warning": "-30",
    "id": 2
  }
]
```

## Return status

| Status value | Return status | Description |
| ------------- | ----------- | ----------- |
| 200 | Success | Requested data returned successfully |
| 404 | Error | Specified user record not found |
|  ECONNREFUSED | N/A | Service is offline. Start the service and try again. |
