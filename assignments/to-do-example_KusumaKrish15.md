# Code examples

**Author:** \<Kusuma Krishnamurthy\>

## cURL example

\<Get user name\>

### GET command (cURL)

```shell
curl http://localhost:3000/users/4
```

### GET response (cURL)

{
  "last_name": "Bailey",
  "first_name": "Bill",
  "email": "b.bailey@example.com",
  "id": 4
}%  

### POST command (cURL)

```shell
curl -d "last_name=Jones&first_name=Jill&email=j.jones@example.com" -X POST http://localhost:3000/users
```

### POST response (cURL)

{
  "last_name": "Jones",
  "first_name": "Jill",
  "email": "j.jones@example.com",
  "id": 6
}%  

# Postman code examples

## GET example using Postman
\<Get tasks\>

### Request

**Method**:

```shell
{base_url}/tasks
```

### GET response using Postman

```shell
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
    },
    {
        "user_id": 2,
        "title": "Oil change",
        "description": "5K auto service",
        "due_date": "2025-03-10T09:00",
        "warning": "-60",
        "id": 3
    },
    {
        "user_id": 3,
        "title": "Get shots for dog",
        "description": "Annual vaccinations for poochy",
        "due_date": "2025-05-11T14:00",
        "warning": "-20",
        "id": 4
    }
]
```
## POST example using Postman
\<Post tasks\>

### Request

**Method**:

```shell
{base_url}/tasks
```
#### POST data
```shell
{
    "task_title": "Get new tires",
    "task_description": "Get new tires for Hoppity",
    "task_due_date": "2025-03-11T14:00",
    "task_warning": "-60"
}
```

### POST response using Postman

```shell
{
    "task_title": "Get new tires",
    "task_description": "Get new tires for Hoppity",
    "task_due_date": "2025-03-11T14:00",
    "task_warning": "-60",
    "id": 5
}
```
