require 'spec_helper'

feature 'Creating Recipes' do
  before do
    visit '/'
    click_link 'New Recipe'
  end

  scenario "can create a recipe" do
    fill_in 'Name', :with => 'TextMate 2'
    click_button 'Create Recipe'
    page.should have_content('Recipe has been created.')
    recipe = Recipe.find_by_name("TextMate 2")
    page.current_url.should == recipe_url(recipe)
    title = "Recipe"
    find("title").should have_content(title)
  end

  scenario "can not create a recipe without a name" do
    click_button 'Create Recipe'
    page.should have_content("Recipe has not been created.")
    page.should have_content("Name can't be blank")
  end
end
