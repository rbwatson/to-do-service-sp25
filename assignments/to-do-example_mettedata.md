# Code examples

**Author:** \Mette Wadleigh

## cURL example

\ The cURL GET command requests data on user with id of 3. The reponse lists the first and last name, email address, and id assignment. 

The cURL POST command adds a record for Fred Smithy and includes an email address. The response lists the first and last name, email address, and id for the record. 

### cURL GET command

```shell
curl http://loalhost:3000/users/3
```

### cURL GET response

```json

{
  "last_name": "Martinez",
  "first_name": "Marty",
  "email": "m.martinez@example.com",
  "id": 3
}
```
### cURL POST command

```shell
curl -d "last_name=Smithy&first_name=Fred&email=f.smithy@example.com" -X POST http://localhost:3000/users
```

### cURL POST response

```json

{
  "last_name": "Smithy",
  "first_name": "Fred",
  "email": "f.smithy@example.com",
  "id": 5
}
```


## Postman example

The GET request example in Postman queries the tasks for user_id 1. This is the GET tasks by user_id request.
There was no GET tasks by ID endpoint in the imported To-Do mock service, as the service was shown in the instructor video.

The response returned 2 tasks for user_id 1, with a description, due date, warning, and task id also returned for each task. 

The POST request to add a task first returned the data required to add the task. Upon sending, the request turns a response that displays the data added.

### GET Request

**Method**:

```shell
{base_url}/tasks?user_id=1
```
Took one set of braces off to accomodate markdown.

### Postman response

```json
[
    {
        "user_id": 1,
        "title": "Grocery shopping",
        "description": "eggs, bacon, gummy bears",
        "due_date": "2025-02-20T17:00",
        "warning": "-10",
        "id": 1
    },
    {
        "user_id": 1,
        "title": "Piano recital",
        "description": "Daughter's first concert appearance",
        "due_date": "2025-04-02T15:00",
        "warning": "-30",
        "id": 2
    }
]
```

### POST Request

**Method**:

```shell
{base_url}/tasks
```
Took one set of braces off to accomodate markdown.

### Postman data

```json
{
    "task_title": "Get new tires",
    "task_description": "Get new tires for Hoppity",
    "task_due_date": "2025-03-11T14:00",
    "task_warning": "-60"
}
```
### Postman response

```json
{
    "task_title": "Get new tires",
    "task_description": "Get new tires for Hoppity",
    "task_due_date": "2025-03-11T14:00",
    "task_warning": "-60",
    "id": 5
}
```


### Postman Delete request

**Method**:

```shell
{base_url}/tasks/2
```
Took one set of braces off to accomodate markdown.

### Postman Delete response

```json
    {}
```
