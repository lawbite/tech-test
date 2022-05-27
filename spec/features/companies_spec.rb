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
end
