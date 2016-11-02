require 'rails_helper'

RSpec.describe 'Items index API endpoint' do
  it 'returns all items' do
    item1 = Item.create(name: "mug", description: "striped", image_url: "http://google.com/mug")
    item2 = Item.create(name: "table", description: "wooden", image_url: "http://flickr.com/table")

    get '/api/v1/items'

    result = JSON.parse(response)

    expect(result.status).to eq(200)
    expect(result.body).to eq([{"id" => item1.id, "name" => "mug", "description" => "striped", "image_url" => "http://google.com/mug"},
                               {"id" => item2.id, "name" => "table", "description" => "wooden", "image_url" => "http://flickr.com/table"}])
  end
end
