---
layout: page
---

# Tutorial: Get a task by an ID number

In this tutorial, you learn the operations to make a call to receive details of an existing task.

Expect this tutorial to take about 15 minutes to complete.

## Before you start

Make sure you've completed the [Before you start a tutorial](../before-you-start-a-tutorial.md) topic on the development system you'll use for the tutorial.

## Request the task

Adding a new task to the service requires that you use the `GET` method to receive the details of the [`task`](../api/task.md) resource in the service.

To receive details of a specified task:

1. Make sure your local service is running, or start it by using this command, if it's not.

    ```shell
    cd <your-github-workspace>/to-do-service/api
    json-server -w to-do-db-source.json
    ```

1. Open the Postman app on your desktop.
1. In the Postman app, create a new request with these values:
    * **METHOD**: GET
    * **URL**: `{{base_url}}/tasks/{taskId}`

1. In the Postman app, choose **Send** to make the request.
1. Watch for the response body, which should look something like this. Note that the id should be the same as you used in your **URL** as `{taskId}`.

    ```js
    {
        "user_id": 1,
        "title": "Piano recital",
        "description": "Daughter's first concert appearance",
        "due_date": "2025-04-02T15:00",
        "warning": "-30",
        "id": 2
    }
    ```

After doing this tutorial in Postman, you might like to repeat it in
your favorite programming language. To do this, adapt the values from
the tutorial to the properties and arguments that the language uses to
make REST API calls.
