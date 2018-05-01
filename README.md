# README

> Wonolo Coding Challege
> https://job-site-wonolo.herokuapp.com/wonolo/job_requests

### Introduction
> The theme of this challenge is that a company using Wonolo would incorporate this to view a list of approved Job Requests and the details of each job associated with it using Wonolo's API. The UI is simplistic with more focus on the backend.

### Code Organization

> ```lib/wonolo```
The authorization, connection and finally the request object to Wonolo's API is done in here.
The API token is obtained after authorization and lives in object memory till expiry.

> ```app/services/wonolo```
This folder contains the relevant classes and uses the request object to make API calls to Wonolo.
The controllers in turn use these service objects.


### Testing
> Rspec test cases for testing files under lib and service.

### Caching
> Uses low level caching for Job Request and Job objects per page.

### Moving forward
The following can be implemented to improve on this implementation
- Filtering on various fields.
- Use database to store the result by running sidekiq job with scheduler every few hours. Using a local database give more flexibily of what can be done with the data.
- Better UI with JS/JQuery situation
