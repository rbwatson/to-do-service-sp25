# Code examples

**Author:** Allena Avila

## cURL example

Below is an example of using a cURL command to get a response with data on user #3. 

### cURL command

```shell
curl http://localhost:3000/users/3
```

### cURL response

```shell
{
  "last_name": "Martinez",
  "first_name": "Marty",
  "email": "m.martinez@example.com",
  "id": 3
}
```

## Postman example

Below is an example of using a Postman request to get a response with data on Fred Smithy.

### Request

**Method**:

```shell
curl -d "last_name=Smithy&first_name=Fred&email=f.Smithys@example.com" -X POST http://localhost:3000/users
```

### Postman response

```shell
{
  "last_name": "Smithy",
  "first_name": "Fred",
  "email": "f.Smithys@example.com",
  "id": 6
}
```
