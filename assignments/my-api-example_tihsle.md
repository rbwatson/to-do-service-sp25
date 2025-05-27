# Code examples

**Author:** Thomas Ihsle

## cURL example

GET cats example

### cURL command

```shell
curl localhost:3000/cats
```

### cURL response

```shell
[
  {
    "Breed": "Persian",
    "Hunts": "indoors",
    "Hair": "long",
    "Color": "white",
    "id": 1
  }
]      
```

## Postman example

GET Dogs

### Request

**Method**:

```shell
http://localhost:3000/dogs
```

### Postman response

```shell
[
    {
        "Breed": "Labrador",
        "Color": "black",
        "Hair": "short",
        "Roams": "outside",
        "id": 1
    }
]
```
