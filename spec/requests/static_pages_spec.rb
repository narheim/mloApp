require 'spec_helper'

describe "Static pages" do

  let(:base_title) { "m-lo app" }

  describe "Home page" do
    it "should have the content 'm-lo app'" do
      visit root_path
      page.should have_content('m-lo app')
    end

    it "should have the right title" do
      visit root_path
      page.should have_selector('title', :text => "#{base_title} | Home")
    end
  end

  describe "Help page" do
    it "should have the content 'Help'" do
      visit '/static_pages/help'
      page.should have_content('Help')
    end

    it "should have the right title" do
      visit '/static_pages/help'
      page.should have_selector('title', :text => "#{base_title} | Help")
    end
  end

  describe "About page" do
    it "should have the content 'About Us'" do
      visit '/static_pages/about'
      page.should have_content('About Us')
    end

    it "should have the right title" do
      visit '/static_pages/about'
      page.should have_selector('title', :text => "#{base_title} | About Us")
    end
  end

  describe "Contact page" do
    it "should have content 'Don\'t call us, we\'ll call you'"  do
      visit '/static_pages/contact'
      page.should have_content('Don\'t call us, we\'ll call you')
    end

    it "should have the title 'm-lo app'" do
      visit '/static_pages/contact'
      page.should have_selector('title', :text => "m-lo app")
    end

    it "should NOT have the title 'Contact'" do
      visit '/static_pages/contact'
      page.should_not have_selector('title', :text => "| Contact")
    end
  end

end