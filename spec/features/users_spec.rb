require 'rails_helper'

feature "Users" do
  scenario "Sign up" do
    visit register_path
    fill_in "user_name", :with => Faker::Name.name
    fill_in "user_email", :with => Faker::Internet.email
    fill_in "user_password", :with => "pass"
    fill_in "user_password_confirmation", :with => "pass"
    click_button("Sign up")
    
    expect(page).to have_content("Account status: Waiting for activation")
    expect(page).to have_content("Please wait for activation.")
  end
  
  context "Not activated account" do
    scenario "Log in" do
      user = create_user
      raise user.inspect
      
      visit login_path
      
    end
  end
  
  context "Activated account" do
    scenario "Log in" do
      
    end
  end
end
