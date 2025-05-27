# Code examples

**Author:** Cristina Lomeli

## cURL example

The example displays the coffee resource and properties and values of that resource. The example is a data set for a hot lattee with almond milk and cardamom syrup.

### cURL command

```curl http://localhost:3000/coffee
```

### cURL response

```[
  {
    "Drink": "latte",
    "Roast": "light",
    "Temp": "hot",
    "Milk": "almond",
    "Syrup": "cardamom",
    "id": "1"
  }
]%   
```

## Postman example

The example displays a Postman request to ```GET``` data from the pastries resource. The example returned a delicious chocolate croissant.

### Request

```GET```

**Method**:

```(http://localhost:3000/pastries)
```

### Postman response

```[
    {
        "Type": "croissant",
        "Dough": "puff",
        "Filling": "chocolate",
        "Bake": 350,
        "Size": "large",
        "id": "1"
    }
]
```
