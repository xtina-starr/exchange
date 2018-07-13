require 'rails_helper'

describe Api::GraphqlController, type: :request do
  describe 'set_payment mutation' do
    include_context 'GraphQL Client'
    let(:partner_id) { jwt_partner_ids.first }
    let(:user_id) { jwt_user_id }
    let(:credit_card_id) { 'cc-1' }
    let(:merchant_account_id) { 'ma1' }
    let(:order) { Fabricate(:order, partner_id: partner_id, user_id: user_id) }

    let(:mutation) do
      <<-GRAPHQL
        mutation($input: SetPaymentInput!) {
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
      GRAPHQL
    end

    let(:set_payment_input) do
      {
        input: {
          id: order.id.to_s,
          creditCardId: credit_card_id,
          merchantAccountId: merchant_account_id
        }
      }
    end
    context 'with user without permission to this order' do
      let(:user_id) { 'random-user-id-on-another-order' }
      it 'returns permission error' do
        response = client.execute(mutation, set_payment_input)
        expect(response.data.set_payment.errors).to include 'Not permitted'
        expect(order.reload.state).to eq Order::PENDING
      end
    end

    context 'with proper permission' do
      context 'with order in non-pending state' do
        before do
          order.update! state: Order::APPROVED
        end
        it 'returns error' do
          response = client.execute(mutation, set_payment_input)
          expect(response.data.set_payment.errors).to include 'Cannot set payment info on non-pending orders'
          expect(order.reload.state).to eq Order::APPROVED
        end
      end

      context 'without required args' do
        let(:merchant_account_id) { nil }
        let(:credit_card_id) { nil }
        it 'returns error for missing required params' do
          response = client.execute(mutation, set_payment_input)
          expect(response.data.set_payment.errors).to include 'Missing required arguments'
        end
      end

      it 'sets payments on the order' do
        response = client.execute(mutation, set_payment_input)
        expect(response.data.set_payment.order.id).to eq order.id.to_s
        expect(response.data.set_payment.order.state).to eq 'PENDING'
        expect(response.data.set_payment.errors).to match []
        expect(order.reload.credit_card_id).to eq credit_card_id
        expect(order.merchant_account_id).to eq merchant_account_id
        expect(order.state).to eq Order::PENDING
        expect(order.state_expires_at).to eq(order.state_updated_at + 2.days)
      end
    end
  end
end
