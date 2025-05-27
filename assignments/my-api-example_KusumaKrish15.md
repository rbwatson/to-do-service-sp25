# Code examples

**Author:** Kusuma Krishnamurthy

## cURL GET example

Sedan

### cURL GET command

```shell
curl http://localhost:3000/sedan
```

### cURL GET response

```shell
[
  {
    "Model": "BMW 335i",
    "Engine": "3.0 L 6-cylinder",
    "Horesepower": "300 hp",
    "Transmission": "6-speed automatic, 6-speed manual",
    "id": 1
  }
]
```
## cURL GET example

SUV

### cURL GET command

```shell
curl http://localhost:3000/suv
```

### cURL GET response

```shell
[
  {
    "Model": "Tesla Model X",
    "Engine": "Electric",
    "Horesepower": "670 hp",
    "Transmission": "1-speed automatic",
    "id": 1
  }
]
```

## Postman example 1

Sedan

### GET command (Postman)

```shell
{base_url}/Sedan
```

### Postman response

```shell
[
    {
        "Model": "BMW 335i",
        "Engine": "3.0 L 6-cylinder",
        "Horesepower": "300 hp",
        "Transmission": "6-speed automatic, 6-speed manual",
        "id": 1
    }
]
```
## Postman example 2

SUV

### GET command (Postman)

```shell
{base_url}/SUV
```

### Postman response

```shell
[
    {
        "Model": "Tesla Model X",
        "Engine": "Electric",
        "Horesepower": "670 hp",
        "Transmission": "1-speed automatic",
        "id": 1
    }
]
```