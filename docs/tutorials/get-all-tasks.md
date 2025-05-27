---
layout: page
---

# Tutorial: Get all tasks

This tutorial shows how to use the ```GET``` method to retrieve the data for all tasks in the service.

>This tutorial takes about 15 minutes to complete.

## Before you begin

Ensure that you have completed the [Add a new task](./add-a-new-task.md) topic and that you have added tasks to your service.

## Get all tasks

Use the ```GET``` method to fetch all of your tasks in the service.

1. Start your local service by using the following command:

```bash
{
     cd <your-github-workspace>/to-do-service/api
 json-server -w to-do-db-source.json
}
```

1. Open the Postman app on your desktop.
1. Create a new request with the following values
   * **METHOD**: GET
   * **URL**: `{{base_url}}/tasks`
   * **Headers**:
        * `Content-Type: application/json`
1. In the Postman app, choose **Send** to make the request.
1. Watch for the response body.

>NOTE: The names should be the same as the ones used in your **Request body** and the response should include the ```user_id``` for each task. For example:

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

## Related resources

For details, refer to the [task resource](../api/task.md).
