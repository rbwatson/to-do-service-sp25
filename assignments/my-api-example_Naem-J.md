# Code examples

**Author:** Jeff Naemura

## cURL example

The following cURL example gets data for the Tillamook ice cream flavor with the id of 3.

### cURL command

```shell
curl http://localhost:3000/ice_cream/3
```

### cURL response

```shell
{
  "Flavor": "Mint Chocolate Chip",
  "Collection": "N/A",
  "Calories": "240",
  "id": 3
}
```

## Postman example

The following Postman example gets data for the Tillamook cheese block with the ID of 2.

### Request

**Method**:

```shell
http://localhost:3000/cheese/2
```

### Postman response

```shell
{
    "Type": "Cheddar",
    "Sharpness": "Sharp",
    "Calories": "120",
    "id": 2
}
```
