require "rails_helper"

RSpec.describe "Companies", type: :feature do
  describe "viewing all companies" do
    it "shows all companies in the system" do
      FactoryBot.create(:company, name: "Company 1")
      FactoryBot.create(:company, name: "Company 2")

      visit companies_path

      expect(page).to have_content("Company 1")
      expect(page).to have_content("Company 2")
    end
  end

  describe "viewing a company" do
    it "shows the company's details" do
      FactoryBot.create(:company, name: "Company 1")

      visit companies_path

      click_link "Company 1"

      within "h1" do
        expect(page).to have_content "Company 1"
      end
    end
  end
end
