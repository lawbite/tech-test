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

    it "shows the associated lawyers" do
      company = FactoryBot.create(:company, :with_lawyer, name: "Company 1")

      visit company_path(company)

      within "li.associatedLawyer" do
        expect(page).to have_content "Lawyer 1"
      end
    end
  end

  describe "lawyer association for the company" do
    it "allow lawyers to be associated with the company" do
      FactoryBot.create(
        :lawyer,
        name: "Lawyer 1",
        email: "lawyer_1@example.com",
      )
      company = FactoryBot.create(:company, name: "Company 1")

      visit company_path(company)

      click_link "Manage Lawyers"
      check "Lawyer 1"
      click_button "Save"

      within "li.associatedLawyer" do
        expect(page).to have_content "Lawyer 1"
      end
    end

    it "only shows lawyers who are not yet associated with a company or already assocaite with this company" do
      FactoryBot.create(
        :lawyer,
        name: "Lawyer 1",
        email: "lawyer_1@example.com",
        company: FactoryBot.create(:company, name: "Company 1"),
      )
      FactoryBot.create(
        :lawyer,
        name: "Lawyer 2",
        email: "lawyer_2@example.com",
      )
      company2 = FactoryBot.create(:company, name: "Company 2")

      visit company_path(company2)

      click_link "Manage Lawyers"
      expect(page).not_to have_content("Lawyer 1")
      expect(page).to have_content("Lawyer 2")
    end
  end
end
