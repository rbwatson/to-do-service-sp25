# Code examples

**Author:** Lyle Zucker

## cURL example

Lists user information, including first and last name, email, and user ID.

### cURL command

```shell
curl http://localhost:3000/users
```

### cURL response

```shell
{
    "last_name": "Smith",
    "first_name": "Ferdinand",
    "email": "f.smith@example.com",
    "id": 1
  },
  {
    "last_name": "Jones",
    "first_name": "Jill",
    "email": "j.jones@example.com",
    "id": 2
  },
  {
    "last_name": "Martinez",
    "first_name": "Marty",
    "email": "m.martinez@example.com",
    "id": 3
  },
  {
    "last_name": "Bailey",
    "first_name": "Bill",
    "email": "b.bailey@example.com",
    "id": 4
  }
```

## Postman example

Add a task for Marty Martinez (User 3) to pick up the dry cleaning at 4 PM on May 9th with a 30 minute warning.

### Request

**Method**: POST

```shell
http://localhost:3000/tasks
```

### Request data

```shell
{
    "user_id": 3,
    "title": "Pick up dry cleaning",
    "description": "Go and pick up dry cleaning from store",
    "due_date": "2025-05-09T16:00",
    "warning": "-30"
}
```

### Postman response

```shell
{
    "user_id": 3,
    "title": "Pick up dry cleaning",
    "description": "Go and pick up dry cleaning from store",
    "due_date": "2025-05-09T16:00",
    "warning": "-30",
    "id": 7
}
```
