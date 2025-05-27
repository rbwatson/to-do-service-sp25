---
layout: page
---

# Delete user by ID

Deletes the user specified by the `{userId}` parameter.

## URL

```shell

{base_url}/delete/users/{userid}
```

## Parameters

| Parameter name | Type | Description |
| -------------- | ------ | ------------ |
| `userId` | number | The record `id` of the user to delete |

## Request headers

None

## Request body

None

## Return body

```js
{}
```

## Return status

| Status value | Return status | Description |
| ------------- | ----------- | ----------- |
| 200 | Success | Requested data returned successfully |
| 404 | Error | Specified user record not found |
|  ECONNREFUSED | N/A | Service is offline. Start the service and try again. |
