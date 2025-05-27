# Code examples

**Author:** Julie Brodeur

## cURL example

Use cURL to get the bed with an ID of 1 from the furniture database.

### cURL command

```
curl http://localhost:3000/beds/1
```

### cURL response

```
{
    "Style": "midcentury modern",
    "Material": "walnut",
    "Size": "queen",
    "id": 1
}
```

## Postman example

Use GET to return the dresser with an ID of 2 from the furniture database.

### Request

**Method**: GET

```
http://localhost:3000/dressers/2
```

### Postman response

```
{
    "Style": "traditional",
    "Material": "maple",
    "Size": "four-drawer",
    "id": 2
}
```