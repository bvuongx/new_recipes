require 'spec_helper'
  feature "Viewing ingredients" do
    before do
      textmate_2 = Factory(:recipe, :name => "TextMate 2")
      Factory(:ingredient,
              :recipe => textmate_2,
              :title => "Make it shiny!",
              :description => "Gradients! Starbursts! Oh my!")
      internet_explorer = Factory(:recipe, :name => "Internet Explorer")
      Factory(:ingredient,
              :recipe => internet_explorer,
              :title => "Standards compliance",
              :description => "Isn't a joke.")
      visit '/'
    end

    scenario "Viewing ingredients for a given recipe" do
      click_link "TextMate 2"
      page.should have_content("Make it shiny!")
      page.should_not have_content("Standards compliance")
      click_link "Make it shiny!"
        within("#ingredient h2") do
          page.should have_content("Make it shiny!")
        end
      page.should have_content("Gradients! Starbursts! Oh my!")
    end
  end
