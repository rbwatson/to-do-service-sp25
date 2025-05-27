# Code examples

**Author:** \<Tom Ihsle\>

## cURL example

GET User 2

### cURL command

```shell
curl http://localhost:3000/users/2
```

### cURL response

```shell
{
  "last_name": "Jones",
  "first_name": "Jill",
  "email": "j.jones@example.com",
  "id": 2
}
```

## Postman example

Get Task 3

### Request

**Method**:

```shell
http://localhost:3000/tasks/3
```

### Postman response

```shell
{
    "user_id": 2,
    "title": "Oil change",
    "description": "5K auto service",
    "due_date": "2025-03-10T09:00",
    "warning": "-60",
    "id": 3
}
```
