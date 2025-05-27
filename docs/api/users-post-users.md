# Post user

Adds a new user ID as a [`user`](user.md) resource.

## Request

### Method

```shell
POST
```

### URL

```shell
http://localhost:3000/users
```

## Parameters

| Parameter name | Type | Description |
| -------------- | ------ | ------------ |
| `id` | number | The record ID of the user to return |

## Request headers

None

## Request body

None

## Return body

```js
{
    "id": 5
}
```

## Return status

| Status value | Return status | Description |
| ------------- | ----------- | ----------- |
| 201 | Created | Created a new resource |
