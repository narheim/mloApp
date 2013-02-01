require 'spec_helper'

describe "User pages" do
  let(:base_title) { "m-lo app" }

  subject { page }

  describe "signup page" do
    before { visit signup_path }

    it { should have_selector('h1',    text: 'Sign Up') }
    it { should have_selector('title', :text => "#{base_title} | Sign Up") }
  end

  describe "signup" do

    before { visit signup_path }

    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end

      describe "after submitting empty form" do
        before { click_button submit }

        it { should have_selector('title', text: 'Sign Up') }
        it { should have_content('error') }
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end

      it "should show user profile" do
        click_button submit
        page.should have_selector 'title', text: "Example User"
      end

      describe "after saving the user" do
        it { should have_link('Sign out') }
      end

      describe "followed by signout" do
        before { click_link "Sign out" }
        it { should have_link('Sign in') }
      end
    end
  end

end