# Code examples

**Author:** Allena Avila

## cURL example

You can use cURL to retrieve data with my Desserts REST API. 

### cURL command

```shell
curl http://localhost:3000/Cakes
```

### cURL response

```shell
{
    "Flavor": "strawberry",
    "Decoration": "American buttercream",
    "Occasion": "birthday",
    "id": 1
  },
  {
    "Flavor": "carrot",
    "Decoration": "Swiss meringue buttercream",
    "Occasion": "wedding",
    "id": 2
  }
```

## Postman example

You can also use Postman to retireve data with my Desserts REST API. 

### GET Request

**Method**:

```shell
http://localhost:3000/Cookies/2
```

### Postman response

```shell
{
    "Flavor": "chocolate",
    "Texture": "chewy",
    "Mix-in": "walnuts",
    "id": 2
}
```
