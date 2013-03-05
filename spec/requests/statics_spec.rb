require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the h1 'Smallboard'" do
      visit '/static/home'
      page.should have_selector('h1', :text => 'Smallboard')
    end
    
    it "should have the right title" do
      visit '/static/home'
        page.should have_selector('title',
                    :text => "Smallboard")
    end
  end
  
  describe "About" do
    
    it "should have the h1 'About Us'" do
      visit '/static/about'
      page.should have_selector('h1', :text => 'About')
    end

    it "should have the title 'About'" do
      visit '/static/about'
      page.should have_selector('title',
                    :text => "Smallboard | About")

    end
  end
end
