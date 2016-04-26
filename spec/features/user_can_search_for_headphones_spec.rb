require "rails_helper"

RSpec.feature "User can search for headphones" do
  context "when searching for sennheiser headphones" do
    scenario "they see 15 results" do
      VCR.use_cassette("user_search_headphones") do
        visit root_path

        fill_in "search", with: "sennheiser"
        click_on "search"

        expect(current_path).to eq("/search")

        results = all('li')

        expect(results.length).to eq 15

        # Finish expectations 
      end
    end
  end
end
