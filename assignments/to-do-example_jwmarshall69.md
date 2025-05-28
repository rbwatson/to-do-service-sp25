# Code examples

**Author:** Jimmie Marshall

## cURL example

Lists user information, including first and last name, email, and user ID.

### cURL command

```shell
curl http://localhost:3000/users
```

### cURL response

``` shell
{
  "last_name": "Smith",
  "first_name": "Ferdinad",
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
  "last_name": "baile",
  "first_name": "Bill",
  "email": "b.bailey@example.com",
  "id": 4
}
```

## Postman example

Add a task for Marty Martinez (User 3) to pick up the groceries at 3:30 PM on May 28.

## Postman command

```shell
http://localhost:3000/tasks
```

## Postman response

```shell
{
  
 "user_id": 3,
 "title": "Pick up groceries",
 "description": "Pick up groceries from store",
 "date_time": "2025-05-28T15:30",
}
```

### Request

**Method**:

```shell
<replace with the request used for this example>
```

### Postman response

```shell
<replace with the response>
```
