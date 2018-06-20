# Stress

Stress aspires to be responsible for the various types of e-commerce interactions available on the Artsy platform. It's currently a prototype, with legacy e-commerce still handled by Gravity. It uses Ruby, Rails, Postgresql, and exposes a [GraphQL](http://graphql-ruby.org/) API.

It's called "Stress" because financial transactions are serious stuff.

## Meta

* State: development
* Production: 
* Staging: https://stress-staging.artsy.net
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

## Starting Server
If this is your first time starting the app, make sure your database is setup first by running:
```shell
rails db:create
rails db:setup
```

```
$ rails s
```

## Stress Talking 😰 Or Talking to Stress 😀
In order to talk to Stress GraphQL endpoint:
- Copy `.env.example` to `.env`
- Install `dotenv` by `gem install dotenv`
- Start local server `dotenv rails s`
- If you work at Artsy, get proper Gravity User Token following [this](https://github.com/artsy/gravity/blob/master/doc/ApiAuthentication.md#fetching-a-jwt-for-the-target-service).
- Install and run [GraphiQL](https://github.com/skevy/graphiql-app) app `brew cask install graphiql`
- In GraphiQL app, go to http://localhost:300/api/graphql, you should ge unauthorized error
- Edit HTTP Headers and add `Authorization` header and set it to `Bearer <token>` where `<token>` is your Gravity token generated few steps above.

### Seed Some Data
Here are some useful queries mutation to get started

#### Create an order
```graphql
## create order
mutation($input: CreateOrderInput!) {
  createOrder(input: $input) {
    order {
      id
      userId
      partnerId
    }
    errors
  }
}
```
For input set following variables:
```json
{
  "input": {
    "userId": "<your user id>",
    "partnerId": "<partner id>",
    "currencyCode": "usd",
    "lineItems": [
      {
        "artworkId": "<id of your favorite artwork>",
        "priceCents": "<some affordable number>",
        "editionSetId": <optional>
      }
    ]
  }
}
```

##### Submit an Order
```graphql
# submit order
mutation($input: SubmitOrderInput!) {
  submitOrder(input: $input) {
    order {
      id
      userId
      partnerId
      state
    }
    errors
  }
}
```
For input:
```json
{
  "input": {
    "id": "<order id>",
    "creditCardId": "<credit card id>"
  }
}
```



[ashkan18]: https://github.com/ashkan18
