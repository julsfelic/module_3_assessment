require "rails_helper"

RSpec.describe BestBuyService do
  context "#headphones" do
    it "should return 15 headphones" do
      VCR.use_cassette("best_buy_service#headphones") do
        service = BestBuyService.new

        response = service.headphones(name: "sennheiser")

        expect(response[:products].count).to eq 15
        expect(response[:products][0][:sku]).to eq 2602352
        expect(response[:products][0][:regularPrice]).to eq 229.99
        expect(response[:products][0][:active]).to eq true
      end
    end
  end
end