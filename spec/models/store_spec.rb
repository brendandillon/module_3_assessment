require 'rails_helper'

RSpec.describe 'store' do
  let (:store) { Store.new(longName: 'name', city: 'denver', distance: '4', phone: '303-555-1234', storeType: 'big box') }

  it 'has a long name' do
    expect(store.long_name).to eq('name')
  end

  it 'has a city' do
    expect(store.city).to eq('denver')
  end

  it 'has a distance' do
    expect(store.distance).to eq("4")
  end

  it 'has a phone' do
    expect(store.phone).to eq('303-555-1234')
  end

  it 'has a store type' do
    expect(store.store_type).to eq('big box')
  end
end
