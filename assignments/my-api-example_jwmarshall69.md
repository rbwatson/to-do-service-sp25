# Code examples

**Author:** Jimmie Marshall

## cURL example

Lists information on cats.

### cURL command

```shell
curl http://localhost:3000/cats/1 
```

### cURL response

```shell
{
    "Breed": "Main Coon",
    "Life Span": "9-15 years",
    "Coat": "Dense double coat",
    "Color": "black",
    "id": 1
  }
```

## Postman example

The following cURL example gets data for the 2024 Dodge TRX with the id of 2.

### Request

## Method

```shell
http://localhost:3000/dogs/1
```

### Postman response

```shell
{
    "Breed": "Belgian Malinois",
    "Life Span": "12-16 years",
    "Coat": "short double coat",
    "Color": "Mahogany with black mask",
    "id": 1
  }
```
