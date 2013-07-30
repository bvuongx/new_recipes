require 'spec_helper'

feature "Viewing Recipes" do
  scenario "Listing all Recipes" do
    recipe = Factory.create(:recipe, :name => "TextMate 2")
    visit '/'
    click_link 'TextMate 2'
    page.current_url.should == recipe_url(recipe)
  end
end
