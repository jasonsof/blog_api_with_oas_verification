# README

Example app for verifying an API implementation conforms to an OpenAPI specification.

- OpenAPI v3 schema spec is stored in `schemas/posts.json`
- Rspec as the test runner
- rack-test as the request client
- Committee gem to validate the response with custom assertions


Running the test:
```
rspec spec/api_specs/posts_spec.rb
```

The actual response does not match the schema so test should fail
