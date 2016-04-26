require "rails_helper"

RSpec.describe "GET /api/v1/items/1" do
  it "returns an item with name, description & image_url" do
    item = create(:item)

    get "/api/v1/items/#{item.id}"

    json_item = JSON.parse(response.body)

    expect(response.status).to eq 200
    expect(json_item).to eq({
      "name" => item.name,
      "description" => item.description,
      "image_url" => item.image_url
    })
  end
end
