require 'spec_helper'

feature "Editing Recipes" do
  before do
    Factory(:recipe, :name => "TextMate 2")
    visit "/"

    click_link "TextMate 2"
    click_link "Edit Recipe"
  end

  scenario "Updating a recipe" do
    fill_in "Name", :with => "TextMate 2 beta"
    click_button "Update Recipe"
    page.should have_content("Recipe has been updated.")
  end

  scenario "Updating a recipe with invalid attributes is bad" do
    fill_in "Name", :with => ""
    click_button "Update Recipe"
    page.should have_content("Recipe has not been updated.")
  end
end

