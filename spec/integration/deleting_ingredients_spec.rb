require 'spec_helper'

feature 'Deleting ingredients' do
  let!(:recipe) { Factory(:recipe) }
  let!(:ingredient) { Factory(:ingredient, :recipe => recipe) }

  before do
    visit '/'
    click_link recipe.name
    click_link ingredient.title
  end

  scenario "Deleting an ingredient" do
    click_link "Delete Ingredient"
    page.should have_content("Ingredient has been deleted.")
    page.current_url.should == recipe_url(recipe)
  end
end
