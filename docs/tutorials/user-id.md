---
layout: page
---

# Tutorial: How to use `PUT /users/{userId}`  

In this tutorial, you'll learn how to update a user Id.

Expect this tutorial to take about 15 minutes to complete.

## Before you start

Make sure you've completed the [Before you start a tutorial](../before-you-start-a-tutorial.md) topic on the development system you'll use for the tutorial.

## How to update the user Id

Let's understand what `PUT /users/{userId}` means. We can break it down into its separate parts and define it: 

- **`PUT`**: Is the HTTP method used for this endpoint. `PUT` is generally used to update an existing resource or create it if it does not exist.
- **`/users/{userId}`**: Is a URL path where `{userId}` is a placeholder for the unique identifier of the user. This identifies the specific user resource to be updated.


To update a user Id:

1. **Update**: If a user with the specified `userId` exists, the endpoint updates the user's details with the data provided in the request body.
2. **Create (Optional)**: Some implementations allow `PUT` to create the resource if it does not already exist

For example, let's say you send a `PUT` request to `/users/123` with a JSON body containing updated user details, the server will update the user with ID `123`.

### Request Example:
      
```http
PUT /users/123 HTTP/1.1
Content-Type: application/json

{
  "name": "John Doe",
  "email": "john.doe@example.com"
}
```

### Response:
- **200 OK**: If the user was successfully updated.
- **201 Created**: If the user was created (if allowed).
- **404 Not Found**: If the user does not exist and creation is not supported.

## In this tutorial:

You learned how to update a user Id.