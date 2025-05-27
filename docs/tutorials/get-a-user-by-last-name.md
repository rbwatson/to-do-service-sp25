---
layout: page
---

# Tutorial: Get a user by last name

In this tutorial, you learn the operations to call to get a user by the `last_name` property in a [`user`](../api/user.md) resource.

This tutorial should take around 10 minutes to complete.

## Before you start

- Complete the [Before you start a tutorial](../before-you-start-a-tutorial.md) topic to ensure that you have the service installed on the development system you'll use for the tutorial.
- Enroll at least one user into the service, since you can't retrieve the details of a user if none exist.
  To add a user, follow the [Enroll a new user](../tutorials/enroll-a-new-user.md) tutorial.

## Get a user by last name

You need to use the `GET` method to retrieve the details of a [`user`](../api/user.md) resource in the service using the `last_name` property.

To get a user by last name:

1. Make sure your local service is running, or start it by using this command, if it's not.

    ```shell
    cd <your-github-workspace>/to-do-service/api
    json-server -w to-do-db-source.json
    ```

2. Open the Postman app on your desktop.
3. In the Postman app, create a new request with these values:
    - **HTTP METHOD**: GET
    - **API Endpoint**: `{{base_url}}/users`
    - **Headers**:
        - `Content-Type: application/json`
    - **Query Parameters**:
        You can change the value of the `last_name` property to the last name of the user whose details you want to retrieve.

        ```js
        {
            ?last_name=Martinez
        }
        ```

    The full request should look like:

    ```js
    {
        GET {base_url}/users?last_name=Martinez
    }
    ```

4. In the Postman app, choose **Send** to make the request.
5. Watch for the response body, which should return the `user` resource with the `last_name` property in your `GET` request.

    ```js
    {
        "last_name": "Martinez",
        "first_name": "Marty",
        "email": "m.martinez@example.com",
        "id": 3
    }
    ```

After doing this tutorial in Postman, you might like to repeat it in your favorite programming language. To do this, adapt the values from the tutorial to the properties and arguments that the language uses to make REST API calls.

## Next steps

Now that you know how to get a user by their last name, you can branch out by using other properties in the [`user`](../api/user.md) resource in your `GET` request to retrieve the details of a specific user.
To narrow down the number of `user` resources in your response, include more than one property in your request.

You can refine your `GET` requests by viewing the other read operations for the [`user`](../api/user.md) resource:

- [GET all users](../api/users-get-all-users.md)
- [GET users by ID](../api/users-get-user-by-id.md)
