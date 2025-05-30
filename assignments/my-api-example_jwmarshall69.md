# Code examples

**Author:** Jimmie Marshall

## cURL example

The following cURL example gets data for the 2024 Ford Raptor (R)  with the id of 1.

### cURL command

```shell
curl http://localhost:3000/turck/1 
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

### Request

## Method

```shell
HTTP://localhost:3000/truck/2
```

### Postman response

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
