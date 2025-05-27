---
layout: page
---

# Get user by last name

Returns an array of [user](user.md) objects that contain only the user specified by the `last_name` parameter, if it exists.

## URL

```shell

{server_url}/users/{last_name}
```

## Parameters

| Parameter name | Type | Description |
| -------------- | ------ | ------------ |
| `last_name` | string | The last name of the user to return |

## Request headers

None

## Request body

None

## Return body

```json
[
    {
        "last_name": "Jones",
        "first_name": "Jillio",
        "email": "jlo.jones@example.com",
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

## Related read operations

* [Get all users](users-get-all-users.md)
* [Get users by ID](users-get-user-by-id.md)
