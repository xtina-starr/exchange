module QueryHelper
  CREATE_ORDER = %(
    mutation($input: CreateOrderWithArtworkInput!) {
      createOrderWithArtwork(input: $input) {
        orderOrError {
          ... on OrderWithMutationSuccess {
            order {
              id
            }
          }
          ... on OrderWithMutationFailure {
            error {
              code
              data
              type
            }
          }
        }
      }
    }
  ).freeze

  SET_SHIPPING = %(
    mutation($input: SetShippingInput!) {
      setShipping(input: $input) {
        orderOrError {
          ... on OrderWithMutationSuccess {
            order {
              id
              requestedFulfillment {
                __typename
                ... on Ship {
                  addressLine1
                }
                ... on Pickup {
                  fulfillmentType
                }
              }
            }
          }
          ... on OrderWithMutationFailure {
            error {
              code
              data
              type
            }
          }
        }
      }
    }
  ).freeze

  SET_CREDIT_CARD = %(
    mutation($input: SetPaymentInput!) {
      setPayment(input: $input) {
        orderOrError {
          ... on OrderWithMutationSuccess {
            order {
              id
            }
          }
          ... on OrderWithMutationFailure {
            error {
              code
              data
              type
            }
          }
        }
      }
    }
  ).freeze

  SUBMIT_ORDER = %(
    mutation($input: SubmitOrderInput!) {
      submitOrder(input: $input) {
        orderOrError {
          ... on OrderWithMutationSuccess {
            order {
              id
              state
            }
          }
          ... on OrderWithMutationFailure {
            error {
              code
              data
              type
            }
          }
        }
      }
    }
  ).freeze

  APPROVE_ORDER = %(
    mutation($input: ApproveOrderInput!) {
      approveOrder(input: $input) {
        orderOrError {
          ... on OrderWithMutationSuccess {
            order {
              id
              state
            }
          }
          ... on OrderWithMutationFailure {
            error {
              code
              data
              type
            }
          }
        }
      }
    }
  ).freeze

  FULFILL_ORDER = %(
    mutation($input: FulfillAtOnceInput!) {
      fulfillAtOnce(input: $input) {
        orderOrError {
          ... on OrderWithMutationSuccess {
            order {
              id
              state
              lineItems{
                edges{
                  node{
                    fulfillments{
                      edges{
                        node{
                          courier
                          trackingId
                          estimatedDelivery
                        }
                      }
                    }
                  }
                }
              }
            }
          }
          ... on OrderWithMutationFailure {
            error {
              code
              data
              type
            }
          }
        }
      }
    }
  ).freeze

  CREATE_OFFER_ORDER = %(
    mutation($input: CreateOfferOrderWithArtworkInput!) {
      createOfferOrderWithArtwork(input: $input) {
        orderOrError {
          ... on OrderWithMutationSuccess {
            order {
              id
              mode
              itemsTotalCents
              totalListPriceCents
              buyer {
                ... on Partner {
                  id
                }
              }
              seller {
                ... on User {
                  id
                }
              }
            }
          }
          ... on OrderWithMutationFailure {
            error {
              code
              data
              type
            }
          }
        }
      }
    }
  ).freeze

  ADD_OFFER_TO_ORDER = %(
    mutation($input: AddInitialOfferToOrderInput!) {
      addInitialOfferToOrder(input: $input) {
        orderOrError {
          ... on OrderWithMutationSuccess {
            order {
              id
              mode
              totalListPriceCents
              buyer {
                ... on Partner {
                  id
                }
              }
              seller {
                ... on User {
                  id
                }
              }
              ... on OfferOrder {
                offers {
                  edges {
                    node {
                      id
                      amountCents
                    }
                  }
                }
                lastOffer {
                  id
                  amountCents
                  from {
                    ... on User {
                      id
                    }
                  }
                  creatorId
                  respondsTo {
                    id
                  }
                }

                myLastOffer {
                  id
                  amountCents
                  buyerTotalCents
                  submittedAt
                  creatorId
                  note
                  from {
                    ... on User {
                      id
                    }
                  }
                  respondsTo {
                    id
                  }
                }
              }
            }
          }
          ... on OrderWithMutationFailure {
            error {
              code
              data
              type
            }
          }
        }
      }
    }
  ).freeze

  SUBMIT_PENDING_OFFER = %(
    mutation($input: SubmitPendingOfferInput!) {
      submitPendingOffer(input: $input) {
        orderOrError {
          ... on OrderWithMutationSuccess {
            order {
              id
              state
              ... on OfferOrder {
                lastOffer {
                  id
                  submittedAt
                }
              }
            }
          }
          ... on OrderWithMutationFailure {
            error {
              code
              data
              type
            }
          }
        }
      }
    }
  ).freeze

  SELLER_ACCEPT_OFFER = %(
    mutation($input: SellerAcceptOfferInput!) {
      sellerAcceptOffer(input: $input) {
        orderOrError {
          ... on OrderWithMutationSuccess {
            order {
              id
              state
            }
          }
          ... on OrderWithMutationFailure {
            error {
              code
              data
              type
            }
          }
        }
      }
    }
  ).freeze

  SUBMIT_ORDER_WITH_OFFER = %(
    mutation($input: SubmitOrderWithOfferInput!) {
      submitOrderWithOffer(input: $input) {
        orderOrError {
          ... on OrderWithMutationSuccess {
            order {
              id
              state
              ... on OfferOrder {
                lastOffer {
                  id
                  submittedAt
                }
              }
            }
          }
          ... on OrderWithMutationFailure {
            error {
              code
              data
              type
            }
          }
        }
      }
    }
  ).freeze

end
