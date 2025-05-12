# Get All Users

Returns a paginated list of all users in the Task Management system.

**Endpoint:** `GET /users`

## Authentication

This endpoint requires authentication using a Bearer token.

```
Authorization: Bearer {token}
```

## Request

### Headers

| Header | Value | Description |
|--------|-------|-------------|
| Authorization | Bearer {token} | Authentication token |

### Query Parameters

| Parameter | Type | Required | Default | Description |
|-----------|------|----------|---------|-------------|
| `_page` | integer | No | 0 | Page number (zero-indexed) |
| `_perPage` | integer | No | 20 | Number of items per page (1-100) |
| `_sort` | string | No | | Field to sort by, prefix with `-` for descending order |

> **Note:** Sorting is possible on any user property. For example, use `firstName` for ascending order by first name, or `-lastName` for descending order by last name.

## Response

### Success Response (200 OK)

When the request is successful, the API returns HTTP status code `200 OK` with an array of user objects.

> **Note:** The response does not include pagination metadata like total count or total pages. To navigate through all users, increment the `_page` parameter until you receive an empty array.

#### Response Body

```json
{
  "users": [
    {
      "userId": 1,
      "firstName": "Ferdinand",
      "lastName": "Smith",
      "contactEmail": "f.smith@example.com"
    },
    {
      "userId": 2,
      "firstName": "Jill",
      "lastName": "Jones",
      "contactEmail": "j.jones@example.com"
    },
    {
      "userId": 3,
      "firstName": "Marty",
      "lastName": "Martinez",
      "contactEmail": "m.martinez@example.com"
    },
    {
      "userId": 4,
      "firstName": "Bill",
      "lastName": "Bailey",
      "contactEmail": "b.bailey@example.com"
    }
  ]
}
```

### Error Responses

This endpoint may return the following error responses:

- `400 Bad Request` - Invalid query parameters
- `401 Unauthorized` - Missing or invalid authentication
- `403 Forbidden` - Insufficient permissions
- `404 Not Found` - Resource not found
- `429 Too Many Requests` - Rate limit exceeded
- `500 Server Error` - Unexpected server error

For detailed information about these errors, refer to the [API Error Responses](error-responses.md) documentation.

## Example

### cURL

```bash
curl -X GET "https://localhost:3000/users?_page=0&_perPage=10&_sort=lastName" \
  -H "Authorization: Bearer your-token-here"
```

### JavaScript

```javascript
const getUsers = async (page = 0, perPage = 20, sort = 'lastName') => {
  try {
    const response = await fetch(
      `https://localhost:3000/users?_page=${page}&_perPage=${perPage}&_sort=${sort}`, 
      {
        method: 'GET',
        headers: {
          'Authorization': 'Bearer your-token-here'
        }
      }
    );
    
    if (!response.ok) {
      const errorData = await response.json();
      throw new Error(`Error ${response.status}: ${errorData.message}`);
    }
    
    const data = await response.json();
    console.log('Users:', data.users);
    return data.users;
  } catch (error) {
    console.error('Failed to fetch users:', error);
  }
};
```

### Python

```python
import requests

def get_users(page=0, per_page=20, sort="lastName"):
    url = "https://localhost:3000/users"
    params = {
        "_page": page,
        "_perPage": per_page,
        "_sort": sort
    }
    headers = {
        "Authorization": "Bearer your-token-here"
    }
    
    response = requests.get(url, params=params, headers=headers)
    
    if response.status_code == 200:
        data = response.json()
        print(f"Retrieved {len(data['users'])} users")
        return data['users']
    else:
        print(f"Error {response.status_code}: {response.json()}")
        return None
```

## Common Issues

1. **Empty Response**: If you receive an empty `users` array, you may have reached the end of the available data or specified a `_page` value that's too high.

2. **Slow Response Times**: When requesting a large number of users with a high `_perPage` value, the response time may increase. For better performance, use a reasonable page size (e.g., 20-50).

3. **Incorrect Sorting Order**: Double-check your `_sort` parameter syntax. To sort in descending order, you must add a hyphen prefix (e.g., `-lastName`).

4. **Inconsistent Results**: When paginating through results using multiple API calls, be aware that if the underlying data changes between requests, you might miss items or receive duplicates. Consider implementing a more robust strategy if data consistency is critical.

5. **Rate Limiting**: This endpoint is subject to rate limiting. If you're making many requests in quick succession, implement backoff logic using the `Retry-After` header.
