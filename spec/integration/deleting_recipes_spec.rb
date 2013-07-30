require 'spec_helper'

feature "Deleting recipes" do
  scenario "Deleting a recipe" do
    Factory(:recipe, :name => "TextMate 2")
    visit "/"

    click_link "TextMate 2"
    click_link "Delete Recipe"

    page.should have_content("Recipe has been deleted.")
    visit "/"
    page.should_not have_content("TextMate 2")
  end
end
