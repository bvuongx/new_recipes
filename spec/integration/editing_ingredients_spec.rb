require 'spec_helper'

feature "Editing ingredients" do
  let!(:recipe) { Factory(:recipe) }
  let!(:ingredient) { Factory(:ingredient, :recipe => recipe) }

  before do
    visit '/'
    click_link recipe.name
    click_link ingredient.title
    click_link "Edit Ingredient"
  end

  scenario "Updating an ingredient" do
    fill_in "Title", :with => "Make it really shiny!"
    click_button "Update Ingredient"
    page.should have_content "Ingredient has been updated."
    within("#ingredient h2") do
      page.should have_content("Make it really shiny!")
    end
    page.should_not have_content ingredient.title
  end

  scenario "Updating a ingredient with invalid information" do
    fill_in "Title", :with => ""
    click_button "Update Ingredient"
    page.should have_content("Ingredient has not been updated.")
  end
end
