---
layout: page
---

# Introduction to using Request Headers and Request Body in your API Documentation 

This document will help you to get started using Request Headers and Request Bodies in your documentation. This quick and easy start guide is designed for users just getting started on their API documentation.

## What is a Request Header?

A **Request Header** is sent by the client to provide information about a request or the client itself.  
Some examples include:<br>
* `Authorization`
* `Content-Type`
* `Accept` 
* `User-Agent`
<br> 

## What is a Request Body?

A **Request Body** is used in the POST, PUT, or PATCH methods to send data the server needs to process the 
request. A request body is often used to create or update resources on the server. 

### An Example of a Request Header

        ```
        
            - in: header
              name: Accept
              required: false
              schema:
               type: string
              description: |
                Specifies the data type expected in a response sent from the server.

                Valid values are:

                | Value | Meaning |
                | --- | --- |
                | application/json | JSON format for data returned in response. |
                | application/xml | XML format for data returned in response. |
              example: "application/xml"
        
        ```

### An Example of a Request Header

        ```
        
            grant_type:
              type: string
              description: |
                Specifies the literal `client_credentials`.
                
                Example: client_credentials
              example: "client_credentials"
        
        ```