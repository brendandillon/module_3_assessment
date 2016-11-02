require 'rails_helper'

RSpec.describe 'Items create API endpoint' do
  it 'creates an item' do
    '{"name":"mug", "description":"striped", "image_url":"http://google.com/mug"}'
    json_data = '{"item":{"name":"mug", "description":"striped", "image_url":"http://google.com/mug"}}'
    post '/api/v1/items', json_data, { 'CONTENT_TYPE' => 'application/json'}

    result = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(result).to eq({"id" => Item.last.id, "name" => "mug", "description" => "striped", "image_url" => "http://google.com/mug"})
  end
end
