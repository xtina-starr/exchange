require 'rails_helper'
require 'webmock/rspec'
require 'support/gravity_helper'

describe GravityService, type: :services do
  let(:partner_id) { 'partner-1' }
  describe '#fetch_partner' do
    it 'calls the /partner endpoint' do
      allow(Adapters::GravityV1).to receive(:request).with("/partner/#{partner_id}/all")
      GravityService.fetch_partner(partner_id)
      expect(Adapters::GravityV1).to have_received(:request).with("/partner/#{partner_id}/all")
    end

    context 'with failed gravity call' do
      before do
        stub_request(:get, %r{partner\/#{partner_id}}).to_return(status: 404, body: { error: 'not found' }.to_json)
      end
      it 'raises OrderError' do
        expect do
          GravityService.fetch_partner(partner_id)
        end.to raise_error(Errors::OrderError, /Unable to find partner/)
      end
    end
  end

  describe '#get_merchant_account' do
    let(:partner_merchant_accounts) { [{ external_id: 'ma-1' }, { external_id: 'some_account' }] }
    it 'calls the /merchant_accounts Gravity endpoint' do
      allow(Adapters::GravityV1).to receive(:request).with("/merchant_accounts?partner_id=#{partner_id}").and_return(partner_merchant_accounts)
      GravityService.get_merchant_account(partner_id)
      expect(Adapters::GravityV1).to have_received(:request).with("/merchant_accounts?partner_id=#{partner_id}")
    end

    it "returns the first merchant account of the partner's merchant accounts" do
      allow(Adapters::GravityV1).to receive(:request).with("/merchant_accounts?partner_id=#{partner_id}").and_return(partner_merchant_accounts)
      result = GravityService.get_merchant_account(partner_id)
      expect(result).to be(partner_merchant_accounts.first)
    end

    it 'raises an error if the partner does not have a merchant account' do
      allow(Adapters::GravityV1).to receive(:request).with("/merchant_accounts?partner_id=#{partner_id}").and_return([])
      expect { GravityService.get_merchant_account(partner_id) }.to raise_error(Errors::OrderError)
    end

    context 'with failed gravity call' do
      before do
        stub_request(:get, /merchant_accounts\?partner_id=#{partner_id}/).to_return(status: 404, body: { error: 'not found' }.to_json)
      end
      it 'raises OrderError' do
        expect do
          GravityService.get_merchant_account(partner_id)
        end.to raise_error(Errors::OrderError, /Unable to find partner or merchant account/)
      end
    end
  end

  describe '#get_credit_card' do
    let(:credit_card_id) { 'cc-1' }
    let(:credit_card) { { external_id: 'card-1', customer_account: { external_id: 'cust-1' }, deactivated_at: nil } }
    it 'calls the /credit_card Gravity endpoint' do
      allow(Adapters::GravityV1).to receive(:request).with("/credit_card/#{credit_card_id}").and_return(credit_card)
      GravityService.get_credit_card(credit_card_id)
      expect(Adapters::GravityV1).to have_received(:request).with("/credit_card/#{credit_card_id}")
    end

    context 'with failed gravity call' do
      before do
        stub_request(:get, %r{credit_card\/#{credit_card_id}}).to_return(status: 404, body: { error: 'not found' }.to_json)
      end
      it 'raises OrderError' do
        expect do
          GravityService.get_credit_card(credit_card_id)
        end.to raise_error(Errors::OrderError, /Credit card not found/)
      end
    end
  end

  describe '#get_artwork' do
    let(:artwork_id) { 'some-id' }
    it 'calls the /artwork endpoint' do
      allow(Adapters::GravityV1).to receive(:request).with("/artwork/#{artwork_id}?include_deleted=false")
      GravityService.get_artwork(artwork_id)
      expect(Adapters::GravityV1).to have_received(:request).with("/artwork/#{artwork_id}?include_deleted=false")
    end
    context 'with failed gravity call' do
      it 'returns nil' do
        expect(Adapters::GravityV1).to receive(:request).and_raise(Adapters::GravityError, 'timeout')
        expect(GravityService.get_artwork(artwork_id)).to be_nil
      end
    end
  end
end
