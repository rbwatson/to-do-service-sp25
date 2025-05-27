 # Code examples

**Author:** Jimmie Marshall

## cURL example

The following cURL example gets data for the Belgian Malinois with the id of 2.

### cURL command

```shell
curl http://localhost:3000/dogs/2 
```

### cURL response

```shell
{ 
   "breed": "Belgian Malinois",
   "origin": "Belgium",
   "id": "2",
   "size": { 
      "height_in": { 
         "male": "24-26",
         "female": "22-24"
      },
      "weight_lbs": { 
         "male": "60-80",
         "female": "40-60"
      }
   },
   "lifespan_years": "12-14",
   "group": "Herding",
   "temperament": [ 
      "Energetic",
      "Intelligent",
      "Protective",
      "Loyal",
      "Alert"
   ]
}

```

## Postman example

The following cURL example gets data for the German Shepherds with the id of 4.

## Postman command

```shell
curl HTTP://localhost:3000/dogs/4
```

## Postman response

```shell
{ 
   "breed": "German Shepherd",
   "origin": "Germany",
   "id": "4",
   "size": { 
      "height_in": { 
         "male": "24-26",
         "female": "22-24"
      },
      "weight_lbs": { 
         "male": "65-90",
         "female": "50-70"
      }
   },
   "lifespan_years": "9-13",
   "group": "Herding",
   "temperament": [ 
      "Confident",
      "Courageous",
      "Obedient",
      "Loyal",
      "Watchful"
   ]
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
