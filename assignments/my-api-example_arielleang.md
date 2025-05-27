# Code examples

**Author:** Arielle Ang

## cURL example

**GET** example in cURL to retrieve a list of Harry Potter characters from the API example database.

### cURL command

```shell
curl http://localhost:3000/HarryPotterCharacters
```

### cURL response

```shell
{
    "Name": "Hermione Granger",
    "Sex": "female",
    "Magical Status": "witch",
    "Hogwarts House": "Gryffindor",
    "id": 1
}
```

## Postman example

**GET** example in Postman to retrieve a list of Game of Thrones characters from the API example database.

> **Base URL:** http://localhost:3000

### Request

**Method**:

```shell
{base_url}/GameofThronesCharacters
```

### Postman response

```shell
{
    "Name": "Tywin Lannister",
    "Sex": "male",
    "Position": "hand of the king",
    "Noble House": "House Lannister",
    "id": 1
}
```
