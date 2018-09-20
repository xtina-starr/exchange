class Types::OrderConnectionSortEnum < Types::BaseEnum
  description 'Fields to sort by'
  graphql_name 'OrderConnectionSortEnum'

  value 'UPDATED_AT_ASC', 'Sort by timestamp order was last updated in ascending order'
  value 'UPDATED_AT_DESC', 'Sort by timestamp order was last updated in descending order'
  value 'STATE_UPDATED_AT_ASC', 'Sort by timestamp state of order was last updated in ascending order'
  value 'STATE_UPDATED_AT_DESC', 'Sort by timestamp state of order was last updated in descending order'
end
