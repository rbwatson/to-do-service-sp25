# To-do list

## What's the to-do list?

This to-do list is a REST API that allows you to manage upcoming and ongoing tasks, along with reminders for high priority tasks.
By sharing this API with other people, such as friends or family members, you can also create a joint to-do list with shareable tasks and reminders.

## How does this all work?

Any user with access to the API can add a task to the cloud-hosted to-do list, including specific details such as the task assignee and when the task should be complete by. All users with access to the API can view this information
and freely edit the tasks as necessary, such as shifting a reminder's time or adding information to a task.

## Features

* [Adding tasks](https://github.com/UWC2-APIDOC/to-do-service-sp25/blob/e65c5feea84f93e4a1b8103e16f106639bb17299/docs/tutorials/add-a-new-task.md)
    * Modifying existing tasks
    * Setting reminders
* [Enrolling users](https://github.com/UWC2-APIDOC/to-do-service-sp25/blob/e65c5feea84f93e4a1b8103e16f106639bb17299/docs/tutorials/enroll-a-new-user.md)
    * Deleting existing users

## To-do list prerequisites

* A [GitHub account](https://github.com)
* A development system running a current version or a
long-term support, also known as `LTS`, version of the Windows, MacOS, or Linux operating system.
* The following software on your development system:
    * [Git, command line](https://docs.github.com/en/get-started/quickstart/set-up-git)
    * Optionally, [GitHub Desktop](https://desktop.github.com).
    * A fork of the [To-Do-Service repository](https://github.com/UWC2-APIDOC/to-do-service-sp25)
    * A current or `LTS` version of `node.js`
    * Version 0.17.4 or later of [json-server](https://www.npmjs.com/package/json-server)
    * A current copy of the database file. You can get this by syncing your fork.

For information about testing the API, see [Test your development system](https://github.com/UWC2-APIDOC/to-do-service-sp25/blob/main/docs/before-you-start-a-tutorial.md#test-your-development-system).

## Contributing to the API

You can submit a pull request for review to update the existing API documentation for the to-do list.
This can include bug fixes, code changes, proposing a new feature, or just maintaining out-of-date resources.
To contribute, follow the steps below:

1. Fork this repository to your GitHub account.
2. Confirm you can build a local copy of the documentation from your fork.
3. Install [Vale](https://vale.sh/) on your development or editing computer.
   To help you have a successful pull request experience, it's also helpful
   to add these extensions if you edit with the following assistants:
    * Markdownlint
    * Vale
4. A successful pull request:
    * Must not require more content in order for your pull request to work
    * Must help the end user of the product
    * Must have no lint or Vale errors
    * Must have no errors in any code examples
5. Test your changes locally from your feature branch before submission.

---

### More Information

This work is for the APIDOC 310 course at the University of Washington.

![Image of UW Campus in the spring](https://cdn.uconnectlabs.com/wp-content/uploads/sites/25/2021/01/UWCampus-Quad-1024x576.png)`
