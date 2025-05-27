# Code examples

**Author:** Jeff Naemura

## cURL example

This cURL example returns data for user 2.

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

This Postman example returns data for task 4.

### Request

**Method**:

```shell
http://localhost:3000/tasks/4
```

### Postman response

```shell
{
    "user_id": 3,
    "title": "Get shots for dog",
    "description": "Annual vaccinations for poochy",
    "due_date": "2025-05-11T14:00",
    "warning": "-20",
    "id": 4
}
```
