require 'rails_helper'

RSpec.describe 'Items destroy API endpoint' do
  it 'deletes one item' do
    item1 = Item.create(name: "mug", description: "striped", image_url: "http://google.com/mug")
    item2 = Item.create(name: "table", description: "wooden", image_url: "http://flickr.com/table")

    delete "/api/v1/items/#{item1.id}"

    expect(response.status).to eq(204)
    expect(Item.find_by_id(item1.id)).to eq(nil)
  end
end
