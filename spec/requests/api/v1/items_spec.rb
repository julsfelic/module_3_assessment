require "rails_helper"

RSpec.describe "GET /api/v1/items" do
  it "returns items w/ name, description & image_url" do
    item1 = create(:item)
    item2 = create(:item)

    get "/api/v1/items"

    json_items = JSON.parse(response.body)

    expect(response.status).to eq 200
    expect(json_items.count).to eq 2
    expect(json_items).to eq([
      {
        "name" => item1.name,
        "description" => item1.description,
        "image_url" => item1.image_url
      },
      {
        "name" => item2.name,
        "description" => item2.description,
        "image_url" => item2.image_url
      }
    ])
  end
end
