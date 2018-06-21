class Types::OrderConnectionSortEnum < Types::BaseEnum
  description 'Fields to sort by'
  graphql_name 'OrderConnectionSortEnum'

  value 'UPDATED_AT_ASC', 'Sort by latest timestamp order was updated in ascending order'
  value 'UPDATED_AT_DESC', 'Sort by latest timestamp order was updated in descending order'
end
