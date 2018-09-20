class Types::OrderConnectionSortEnum < Types::BaseEnum
  description 'Fields to sort by'
  graphql_name 'OrderConnectionSortEnum'

  value 'UPDATED_AT_ASC', 'Sort by the timestamp the order was last updated in ascending order'
  value 'UPDATED_AT_DESC', 'Sort by the timestamp the order was last updated in descending order'
  value 'STATE_UPDATED_AT_ASC', 'Sort by the timestamp the state of order was last updated in ascending order'
  value 'STATE_UPDATED_AT_DESC', 'Sort by the timestamp the state of order was last updated in descending order'
end
