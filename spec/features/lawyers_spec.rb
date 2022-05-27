require "rails_helper"

RSpec.describe "Lawyers", type: :feature do
  describe "viewing all lawyers" do
    it "shows all the lawyers in the system" do
      FactoryBot.create(
        :lawyer,
        name: "Lawyer 1",
        email: "lawyer_1@example.com",
      )

      FactoryBot.create(
        :lawyer,
        name: "Lawyer 2",
        email: "lawyer_2@example.com",
      )

      visit lawyers_path

      expect(page).to have_content("Lawyer 1")
      expect(page).to have_content("Lawyer 2")
    end
  end
end
