require 'rails_helper'

RSpec.describe 'Items show API endpoint' do
  it 'returns one item' do
    item1 = Item.create(name: "mug", description: "striped", image_url: "http://google.com/mug")
    item2 = Item.create(name: "table", description: "wooden", image_url: "http://flickr.com/table")

    get "/api/v1/items/#{item1.id}"

    result = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(result).to eq({"id" => item1.id, "name" => "mug", "description" => "striped", "image_url" => "http://google.com/mug"})
  end
end
