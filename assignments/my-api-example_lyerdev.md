# Code examples

**Author:** Lyle Zucker

## cURL example

Lists all auto tools including their name, damage type, slot, and rarity.

### cURL command

```shell
curl http://localhost:3000/autos
```

### cURL response

```shell
  {
    "name": "CerberusPlus1",
    "damage": "Kinetic",
    "slot": "Kinetic",
    "rarity": "Exotic",
    "id": 1
  }
```

## Postman example

Delete the HC tool with an ID of "2".

### Request

**Method**: DELETE

```shell
http://localhost:3000/hcs/2
```

### Postman response

```shell
{}
```
