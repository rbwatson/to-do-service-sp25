 
 # Animals I Have Loved API Examples

**Author:** \Mette Wadleigh

## cURL example

The cURL GET command requests data on dog with id of 2. The response lists the dog's name, breed, a hallmark characteristic, and an id. 

The cURL POST command adds a record for a new dog, John. The response lists the name, breed,  hallmark characteristic, and an id. 

### cURL GET command

```shell
curl http://localhost:3000/dogs/2
```

### cURL GET response

```json

{
  "name": "Mordecai",
  "breed": "Basset Hound",
  "hallmark": "visited everybody",
  "id": 2
}
```

### cURL POST command

```shell
curl -d "name=John&breed=Human&hallmark=dog" -X POST http://localhost:3000/dogs
```

### cURL POST response

```json

{
  "name": "John",
  "breed": "Human",
  "hallmark": "dog",
  "id": 5
}
```


## Postman example

The GET request example in Postman queries the cats resource for id 1. This is the GET tasks by user_id request.

The response returned properties for id 1, which included the cat's name, breed, and hallmark characteristic.  

The POST request creates a new record for a cat with an id of 5.  The only data it added was the id, but I don't know how to add the other properties. When I clicked SEND, only the id 5 was listed. I was unable to add other properties to the body. Postman would not let me edit it. I could find no instructions on how to handle this.

I tried several more times to edit the body, accidently creating records 6 and 7, which I used the delete command to delete.

### GET Request

**Method**:

```shell
{base_url}//cats?id=1
```
Took one set of braces off to accomodate markdown.

### Postman response

```json
[
    {
        "name": "Big Orange Thing",
        "breed": "Orange Tabby",
        "hallmark": "just hangs",
        "id": 1
    }
]
```

### POST Request

**Method**:

```shell
{base_url}/cats
```
Took one set of braces off to accomodate markdown.

### Postman data

```json
{
    "id": 5
}
```
### Postman response

```json
{

    "id": 5

}
```

### DELETE Request

**Method**:

```shell
{base_url}/cats?id=6
```
Took one set of braces off to accomodate markdown.

### DELETE response

```json
{}
```