# B[U]ILT-Slack-Bot

Welcome to B[U]ILT Slack Bot repository! Here you will find the current bot's code, anything we're currently working on, a description of our tech stack, and our best practices.

## Getting Started

 Here are some great resources to get started on development if you need or want it.
 
 1. [Slack API Documentation](https://docs.slack.dev)
 2. [AWS Lambda](https://aws.amazon.com/lambda/)
 2. [AWS API Gateway](https://aws.amazon.com/api-gateway/)
 3. [Creating a Slack Bot With AWS](https://medium.com/@maimitp9/create-slackbot-using-aws-api-gateway-and-lambda-42304fbd0f26)

## Our Tech Stack

 Our current tech stack includes the use of:

 1. AWS Lambda & API Gateway 
 2. Slack API
 3. Terraform
 4. Python

## Best Practices

 To ensure our repository has less conflicts and to ensure everyone can develop fluidly we will implement best practices on branching, code reviews, descriptive naming/messages, modular reusable code, and commits.

 Please read up on these best practices as well, [What are Git version control best practices?](https://about.gitlab.com/topics/version-control/version-control-best-practices/)

### Branching

 Feature branching is a great way for teams to split up work and ensure there are reduced merge conflicts. This also ensures that the scope of pull requests are focused and specific. 

 A branch should be named with a proper name as well to signal to others what the purpose of the banch is, who is working on the branch, and where a feature will be located. 

 For example a branch for a rotating photo carousel feature on an about page by Steven can take on the form:  ***stevenuru/about/rotating-carousel***

### Commits

 Commits to a branch should be done granularly with frequency. Commiting large changes to a codebase can make it difficult for reviewers to gather a sense of what's going on and can make it more difficult to spot errors in one's code merge.

 Branch merges to main should also be reviewed by another committee member to reduce the risk of errors and to maintain a clean codebase.

### Writing Code

 #### Modularity
 
 Code should be written with reusability and modularity in mind. Functions should be used when possible to decrease repetititve code and makes it easier for reviewers to read when done right. Files should also be split up based on the functionality/purpose of the file. 

 #### Comments

 Comments should be used when the code itself cannot communicate to others what is happening. We should strive to use descriptive (although short) comments when defining new functions. This helps ramp up learning whenever someone new is introduced to the codebase
