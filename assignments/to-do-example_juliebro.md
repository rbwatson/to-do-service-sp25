# Code examples

**Author:** Julie Brodeur

## cURL example

Use cURL to get the user with an ID of 1 from the to-do service database.

### cURL command

```shell
curl http://localhost:3000/users/1
```

### cURL response

```shell
{
  "last_name": "Smith",
  "first_name": "Ferdinand",
  "email": "f.smith@example.com",
  "id": 1
}
```

## Postman example

Use GET to return the task with an ID of 4 from the to-do service database.

### Request

**Method**: GET

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

