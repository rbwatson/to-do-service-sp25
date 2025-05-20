# Retrieve a list of users

This tutorial shows you how to use the To-Do Service API to retrieve a list of users using the `GET /users` operation.

## Prerequisites

Before you begin, make sure you have the following:

- The To-Do Service API running locally at `http://localhost:3000`
- A tool for making API requests, such as:
    - [cURL](https://curl.se/)
    - [Postman](https://www.postman.com/)
- At least one user already added to the service. For more information see the [Enroll a new user tutorial](./enroll-a-new-user.md)

## Retrieve a list of users

Retrieving users from the service requires that you use the `GET` method on the [`user`](../api/user.md) resource.

To retrieve a list of users:

1. Make sure your local service is running, or start it by using this command, if it's not.

    ```shell
    cd <your-github-workspace>/to-do-service/api
    json-server -w to-do-db-source.json
    ```

1. Open the Postman app on your desktop.
1. In the Postman app, create a new request with these values:
    - **METHOD**: GET
    - **URL**: `{{base_url}}/users`

1. In the Postman app, choose **Send** to make the request.
1. Watch for the response body, which should look something like this. Your list of users may vary depending on what's stored in your database.

    ```json
    [
        {
            "id": 1,
            "name": "Jane Doe",
            "email": "jane@example.com"
        },
        {
            "id": 2,
            "name": "John Smith",
            "email": "john@example.com"
        }
    ]
    ```

After doing this tutorial in Postman, you might like to repeat it in your favorite programming language. To do this, adapt the values from the tutorial to the syntax and arguments that the language uses to make REST API calls.

## What’s next

Now that you’ve retrieved users, you might want to:

- [Add a new task](docs/tutorials/add-a-new-task.md)