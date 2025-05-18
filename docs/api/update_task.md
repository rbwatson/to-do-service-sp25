# Update `Task` resource

Base Endpoint

```shell

{server_url}/tasks/{taskId}
```

The `PATCH /tasks/{taskId}` operation updates an existing task resource.
The `PATCH` operation updates only the fields specified in the request body.
To update a task in the service, the task must exist in the service.
Learn more about the [`task` resource](task.md).

## Path parameters

| Parameter | Type | Description |
| ---- | ---- | ----|
| `taskId` | number | The unique ID of the task to update |

## Request body

The request body should contain a JSON object with one or more of the following fields:

| Property | Type | Optional | Description |
| ---- | ---- | ---- | ----|
| `user_id` | number | Optional | The ID of the user resource assigned to this task. |
| `title` | string | Optional | The title or short description of the task. |
| `description` | string | Optional | The long description of the task. |
| `due_date` | string | Optional | The `ISO 8601` format of the date and time the task is due. |
| `warning` | number | Optional | The number of minutes relative to the `due_date` to alert the user of the task. This is normally a negative number to alert the user before the `due_date`. |

### Resource properties

**Sample `update task` resource**

```json

{
    "title": "Grocery shopping updated",
  "description": "eggs, bacon, gummy bears, milk"
}
```

## Response

A successful response returns the updated task resource.

### Sample response

```js
{
  "user_id": 1,
  "title": "Grocery shopping updated",
  "description": "eggs, bacon, gummy bears, milk",
  "due_date": "2025-02-20T17:00",
  "warning": "-10",
  "id": 1
}
```

### Response codes

 | Code | Description |
 | ---- | ---- | ----|
 | 200 | OK. The task was successfully updated. |
 | 400 | Bad Request. A malformed request. |
 | 404 | Not Found. The specified task doesn't exist. |

## Example usage

```bash
curl -X PATCH {server_url}/tasks/1 \
  -H "Content-Type: application/json" \
  -d '{
        "title": "Grocery shopping updated",
        "description": "eggs, bacon, gummy bears, milk"
      }'
```

This endpoint allows partial updates to an existing task resource.
This operation updates only the fields provided in the request body.
All other fields remain unchanged.
