# Code examples

**Author:** Dave Jurgens

## cURL example
This cURL request pulls user information.

### cURL command

```shell
curl http://localhost:3000/users/3 
```

### cURL response

```shell
...
    {
    "last_name": "Martinez",
    "first_name": "Marty"
    "email": "m.martinez@example.com",
    "id": 3
    }
    ...
```

## Postman example

This Postman example is for a task. In this case, it's an oil change.

### Request

**Method**:

```shell
 {base_url}/tasks/3
```

### Postman response

```shell
 }
     "user_id": 2,
     "title": "Oil change",
     "description": "5K auto service"
     "due_date" : "2024-03-10T09: 00"
     "warning": "-60"
     "id": 3
 {
```
