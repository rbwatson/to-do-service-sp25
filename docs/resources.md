---
title: "API Resources"
description: "Detailed information about the core resources available in the Task Management API."
tags: ["resources", "overview"]
categories: ["resources"]
importance: 9
has_toc: false
ai-generated: true
ai-generated-by: "Claude 3.7 Sonnet"
ai-generated-date: "2025-05-13"
nav_order: "4"
layout: "default"
version: "v1.0.0"
lastUpdated: "2025-05-13"
---

# API Resources

The Task Management API provides access to resources that represent the core entities in the system. This section details these resources and their properties.

## In This Section

The Resources section covers the following topics:

| Resource | Description |
|----------|-------------|
| [User Resource](resources/user-resource.md) | Detailed information about the User resource |
| [Task Resource](resources/task-resource.md) | Detailed information about the Task resource |

## Resource Relationships

The main resources in the Task Management API are related in the following ways:

- **Users** can create and be assigned to **Tasks**
- **Tasks** can be assigned to one or more **Users**
- **Tasks** have a status and lifecycle that determines their progress

## Common Resource Properties

All resources in the API share some common properties:

- `id`: A unique identifier for the resource
- `createdAt`: Timestamp when the resource was created
- `updatedAt`: Timestamp when the resource was last updated

## Resource Collections

When retrieving multiple resources (e.g., all users or all tasks), the API returns a collection that includes:

- The resources themselves as an array
- Pagination information
- Metadata about the collection

## Next Steps

To learn more about the specific resources:

- Read about the [User Resource](resources/user-resource.md)
- Explore the [Task Resource](resources/task-resource.md)
- Check out the [API Reference](api-reference.md) for endpoint-specific details
- Review [Core Concepts](core-concepts.md) for fundamental API patterns


