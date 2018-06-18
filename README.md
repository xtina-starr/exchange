# Stress

Stress aspires to be responsible for the various types of e-commerce interactions available on the Artsy platform. It's currently a prototype, with legacy e-commerce still handled by Gravity. It uses Ruby, Rails, Postgresql, and exposes a [GraphQL](http://graphql-ruby.org/) API.

It's called "Stress" because financial transactions are serious stuff.

## Meta

* State: development
* Production: 
* Staging: 
* GitHub: https://github.com/artsy/stress/
* Point People: [@ashkan18][ashkan18]

## Setup

* Fork the project to your GitHub account

* Clone your fork:
  ```
  $ git clone git@github.com:your-github-username/radiation.git
  ```

* Install bundles:
  ```
  $ bundle install
  ```

## Tests

Once setup, you can run the tests like this:

```
$ bundle exec rspec
```

Note: the default rake task is setup to run tests and Rubocop.

## Starting Server


```
$ rails s
```

[ashkan18]: https://github.com/ashkan18
