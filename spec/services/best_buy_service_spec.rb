require 'rails_helper'

RSpec.describe 'Best Buy Service' do
  it 'can find stores' do
    VCR.use_cassette "stores#index" do
      best_buy = BestBuyService.new(80202)

      response = best_buy.find_stores

      expect(response).to have_key(:total)
      expect(response).to have_key(:stores)
    end
  end

  it 'can access each store' do
    VCR.use_cassette "stores#index" do
      best_buy = BestBuyService.new(80202)

      stores = best_buy.stores_near_zip

      expect(stores).to be_a(Array)
      expect(stores.count).to eq(15)
      expect(stores.first).to be_a(Store)
    end
  end

  it 'knows the total count of stores' do
    VCR.use_cassette "stores#index" do
      best_buy = BestBuyService.new(80202)

      total = best_buy.total

      expect(total).to eq(17)
    end
  end
end
