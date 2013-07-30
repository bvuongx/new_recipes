require 'spec_helper'

feature "Creating Ingredients" do
  before do
    Factory(:recipe, :name => "Internet Explorer")
    visit '/'
    click_link "Internet Explorer"
    click_link "New Ingredient"
  end

  scenario "Creating an ingredient" do
    fill_in "Title", :with => "Non-standards compliance"
    fill_in "Description", :with => "My pages are ugly!"
    click_button "Create Ingredient"
    page.should have_content("Ingredient has been created.")
  end


  scenario "Creating an ingredient without valid attributes fails" do
    click_button "Create Ingredient"
    page.should have_content("Ingredient has not been created.")
    page.should have_content("Title can't be blank")
    page.should have_content("Description can't be blank")
  end
end
