# Code examples

**Author:** Rachael Allen

## cURL example

**Get** request for all books

### cURL command

```shell
curl http://localhost:3000/books
```

### cURL response

```shell
[
  {
    "Title": "To Kill a Mockingbird",
    "Author": "Harper Lee",
    "Genre": "Fiction",
    "Pages": 281,
    "id": 1
  },
  {
    "Title": "Sapiens",
    "Author": "Yuval Noah Harari",
    "Genre": "Non-fiction",
    "Pages": 498,
    "id": 2
  },
  {
    "Title": "1984",
    "Author": "George Orwell",
    "Genre": "Dystopian",
    "Pages": 328,
    "id": 3
  }
]
```

## Postman example

This is a **GET** request for books with the ID 1.

### Request

**Method**:

```shell
GET {{base_url}}/books/1
```
The base URL is http://localhost:3000/

### Postman response

```shell
{
    "Title": "To Kill a Mockingbird",
    "Author": "Harper Lee",
    "Genre": "Fiction",
    "Pages": 281,
    "id": 1
}
```
