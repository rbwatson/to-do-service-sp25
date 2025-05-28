# Code examples

**Author:** Jimmie Marshall

## cURL example

The following cURL example gets data for the 2024 Ford Raptor (R)  with the id of 1.

### cURL command

```shell
curl http://localhost:3000/ford/1 
```

### cURL response

```shell
{
  "make": "Ford",
  "model": "F-150 Raptor R",
  "year": 2024,
  "engine": "Supercharged V8",
  "horsepower": 700,
  "torque_lb_ft": 640,
  "id": 1
  }
```

## Postman example

The following cURL example gets data for the 2024 Dodge TRX with the id of 2.

## Postman command

```shell
curl HTTP://localhost:3000/dodge/2
```

## Postman response

```shell
{
  "make": "Ram",
  "model": "1500 TRX",
  "year": 2024,
  "engine": "Supercharged V8",
  "horsepower": 702,
  "torque_lb_ft": 650,
  "id": 2
}
```

### Request

**Method**:

```shell
<replace with the request used for this example>
```

### Postman response

```shell
<replace with the response>
```
