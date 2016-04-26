require "rails_helper"

RSpec.feature "User can search for headphones" do
  context "when searching for sennheiser headphones" do
    scenario "they see 15 results" do
      VCR.use_cassette("user_search_headphones") do
        visit root_path

        fill_in "search_name", with: "sennheiser"
        click_on "search"

        expect(current_path).to eq("/search")

        results = all('.results li')

        expect(results.length).to eq 15
        expect(results[0]).to have_content("2602352")
        expect(results[0]).to have_content("Sennheiser - Active Noise-Canceling Headphones - Black")
        expect(results[0]).to have_content("2.7")
        expect(results[0]).to have_content("From our expanded online assortment; TalkThrough function; NoiseGard Digital noise cancellation; 10mm drivers")
        expect(results[0]).to have_content("229.99")
        expect(results[0]).to have_css("img[src='http://img.bbystatic.com/BestBuy_US/images/products/2602/2602352_sa.jpg']")
      end
    end
  end

  context "when searching for sennheiser headphones white" do
    scenario "they see limited results" do
      VCR.use_cassette("user_search_headphones_with_color") do
        visit root_path

        fill_in "search_name", with: "sennheiser headphones white"
        click_on "search"

        expect(current_path).to eq("/search")

        results = all('.results li')

        expect(results.length).to eq 6
        expect(results[0]).to have_content("9068191")
        expect(results[0]).to have_content("Sennheiser - CX 1.00 Earbud Headphones - White")
        expect(results[0]).to have_content("5.0")
        expect(results[0]).to have_content("SENNHEISER CX 1.00 Earbud Headphones: Noise-blocking design; dynamic transducer principle; ultrasmall design; 3.5mm connector; 3.9' cable; includes 4 sizes of ear adapters")
        expect(results[0]).to have_content("44.95")
        expect(results[0]).to have_css("img[src='http://img.bbystatic.com/BestBuy_US/images/products/9068/9068191_sa.jpg']")
      end
    end
  end
end
