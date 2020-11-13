class Types::OrderEdgeType < GraphQL::Types::Relay::BaseEdge
  node_type(Types::OrderInterface)
end

class Types::OrderConnectionWithTotalCountType < GraphQL::PageCursorConnection
  edge_type(Types::OrderEdgeType)
end
