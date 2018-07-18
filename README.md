# Exchange [![CircleCI](https://circleci.com/gh/artsy/exchange.svg?style=svg)](https://circleci.com/gh/artsy/exchange)

Exchange aspires to be responsible for the various types of e-commerce interactions available on the Artsy platform. It's currently a prototype, with legacy e-commerce still handled by Gravity. It uses Ruby, Rails, Postgresql, and exposes a [GraphQL](http://graphql-ruby.org/) API.

## Meta

* State: development
* Production:
* Staging: https://exchange-staging.artsy.net
* GitHub: https://github.com/artsy/exchange/
* Point People: [@ashkan18][ashkan18], [@williardx][williardx]

## Setup

* Fork the project to your GitHub account

* Clone your fork:
  ```
  $ git clone git@github.com:your-github-username/exchange.git
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

## Did You Change GraphQL Schema?
Metaphysics is the current consumer of Exchange GraphQL schema and keeps a copy of latest schema in https://github.com/artsy/metaphysics/tree/master/src/data, if you have changed Exchange GraphQL schema, make sure you also update the copy of this schema in Metaphysics. In order to do so follow these steps:
1) In exchange run
```shell
rake graphql:schema:idl
```
2) rename `schema.graphql` file generated ☝🏼 to `exchange.graphql`
```shell
mv schema.graphql exchange.graphql
```
3) copy file above to your local update Metaphysics under `src/data` and make a PR to Metaphysics with this change


## Talking to Exchange 🤑
In order to talk to Exchange GraphQL endpoint:
- Copy `.env.example` to `.env`
- Install `dotenv` by `gem install dotenv`
- Start local server `dotenv rails s`
- If you work at Artsy, get proper Gravity User Token following [this](https://github.com/artsy/gravity/blob/master/doc/ApiAuthentication.md#fetching-a-jwt-for-the-target-service).
- Install and run [GraphiQL](https://github.com/skevy/graphiql-app) app `brew cask install graphiql`
- In GraphiQL app, go to http://localhost:300/api/graphql, you should ge unauthorized error
- Edit HTTP Headers and add `Authorization` header and set it to `Bearer <token>` where `<token>` is your Gravity token generated few steps above.

## Order Lifecycle

Users create and submit orders. Partners then approve and finalize or reject the order.

### As a User

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
    "partnerId": "<partner id>",
    "currencyCode": "usd",
    "lineItems": [
      {
        "artworkId": "<id of your favorite artwork>",
        "priceCents": "<some affordable number>",
        "editionSetId": "<optional>"
      }
    ]
  }
}
```

#### Set Shipping on an order
```graphql
# set shipping order
mutation($input: SetShippingInput!) {
  setShipping(input: $input) {
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
    "fulfillmentType": "SHIP/PICKUP",
    "shippingAddresLine1": "",
    "shippingAddressLine2": "",
    "shippingCity": "",
    "shippingRegion": "",
    "shippingCountry": "",
    "shippingPostalCode": ""
  }
}
```

#### Set Payment on an order
```graphql
# set payment order
mutation($input: SetShippingInput!) {
  setPayment(input: $input) {
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
    "creditCardId": "<gravity credit card id>"
  }
}
```

#### Submit an Order
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

### As a Partner

Your user must have access to the partner that owns this order in order to perform these actions.

#### Approve an Order
```graphql
# approve order
mutation($input: ApproveOrderInput!) {
  approveOrder(input: $input) {
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
    "id": "<order id>"
  }
}
```


#### Finalize an Order
```graphql
# finalize order
mutation($input: FinalizeOrderInput!) {
  finalizeOrder(input: $input) {
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
    "id": "<order id>"
  }
}
```

#### Reject an Order
```graphql
# reject order
mutation($input: RejectOrderInput!) {
  rejectOrder(input: $input) {
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
    "id": "<order id>"
  }
}
```

[ashkan18]: https://github.com/ashkan18
[williardx]: https://github.com/williardx
