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

  context "#headphones(name: 'sennheiser headphones white')" do
    it "should return 6 headphones" do
      VCR.use_cassette("best_buy_service#headphones_w_long_description") do
        service = BestBuyService.new

        response = service.headphones(name: "sennheiser headphones white")

        expect(response[:products].count).to eq 6
        expect(response[:products][0][:sku]).to eq 9068191
        expect(response[:products][0][:regularPrice]).to eq 44.95 
        expect(response[:products][0][:active]).to eq true
      end
    end
  end
end
