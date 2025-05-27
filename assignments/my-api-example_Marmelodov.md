# Code examples

**Author:** Jay Norrell

## cURL example

Retrieve a Roman prose writer by its ID number.

### cURL command

```shell
curl http://localhost:3000/prose_writers/1
```

### cURL response

```shell
{
  "common_name": "Tacitus",
  "full_name": "Publius Cornelius Tacitus",
  "works": [
    "The Annals",
    "The Histories"
  ],
  "genres": [
    "History",
    "Ethnography",
    "Dialogue"
  ],
  "birth_year": 56,
  "death_year": 120,
  "id": 1
}
```

## Postman example

Create a resource for a Roman prose writer.

### Request

**Method**:

```shell
POST http://localhost:3000/prose_writers
```

**Payload**:


```shell
{        
    "common_name": "Caesar",
    "full_name": "Gaius Iulius Caesar",
    "works": [
        "de Bello Gallico"
        ],
    "genres": [
        "History",
        "Rhetoric"
        ],
    "birth_year": -100,
    "death_year": -44
}
```

### Postman response

```shell
{
    "common_name": "Caesar",
    "full_name": "Gaius Iulius Caesar",
    "works": [
        "de Bello Gallico"
    ],
    "genres": [
        "History",
        "Rhetoric"
    ],
    "birth_year": -100,
    "death_year": -44,
    "id": 7
}
```
