# Code examples

**Author:** Jay Norrell

## cURL example

Create a user resource.

### cURL command

```shell
-X POST http://localhost:3000/users \
-H "Content-Type: application/json" \
-d "{\"last_name\": \"Surname\", \"first_name\": \"Linda\", \"email\": \"lsurname@lmpsb.gov\"}"
```

### cURL response

```shell
{
  "last_name": "Surname",
  "first_name": "Linda",
  "email": "lsurname@lmpsb.gov",
  "id": 5
}
```

## Postman example

Retrieve a user resource.

### Request

**Method**: GET

```shell
http://localhost:3000/users/4
```

### Postman response

```shell
{
    "last_name": "Bailey",
    "first_name": "Bill",
    "email": "b.bailey@example.com",
    "id": 4
}
```


