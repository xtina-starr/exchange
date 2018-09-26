class AdminNote < ApplicationRecord
  belongs_to :order
  TYPES = {
    case_opened_return: 'case_opened_return'.freeze,
    case_opened_cancellation: 'case_opened_cancellation'.freeze,
    mediation_contacted_buyer: 'mediation_contacted_buyer'.freeze,
    mediation_contacted_seller: 'mediation_contacted_seller'.freeze,
    case_agreement_reached: 'case_agreement_reached'.freeze,
    execution_contacted_buyer: 'execution_contacted_buyer'.freeze,
    execution_contacted_seller: 'execution_contacted_seller'.freeze,
    execution_initiated_refund: 'execution_initiated_refund'.freeze,
    case_closed: 'case_closed'.freeze,
  }.freeze
end
