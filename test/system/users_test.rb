require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  test "signing up" do
     visit signup_path
     fill_in "Name", with: "Test Account"
     fill_in "Email", with: "hello@gmail.com"
     fill_in "Password", with: "secret"
     fill_in "Confirm Password", with: "secret"
     
     click_on "Sign Up"
  
   assert_text "Account create"
   assert_selector "nav", text: "Logout"
   refute_selector "nav", text: "Login"
  end
  
  test "signing up not working" do
   visit signup_path
   fill_in "Name", with: "Test Account"
   fill_in "Password", with: "secret"
   fill_in "Confirm Password", with: "secret"
   
   click_on "Sign Up"
  
   assert_text "Please"
   assert_selector "nav", text: "Log In"
   refute_selector "nav", text: "Logout"
  end
  
  test "login with user work" do
  user = FactoryBot.create :user, email: "hello@gmail.com", password: "secret"
    
   visit login_path
   fill_in "Email", with: "hello@gmail.com"
   fill_in "Password", with: "secret"
   
   click_on "Login"
  
   assert_text "You"
   assert_selector "nav", text: "Logout"
   refute_selector "nav", text: "Login"
  end
  
  test "logout" do
   user = login_user
   
   visit blogs_path
   
   click_link "Logout"
  
   assert_text "Logged out"
   assert_selector "nav", text: "Log In"
   refute_selector "nav", text: "Logout"
  end
  
  
  test "delete user" do
   user = login_user
   
   visit current_user_path
   
   click_link "Delete"
   
   page.driver.browser.switch_to.alert.accept
   
   assert_text "Delete user"
   assert_selector "nav", text: "Log In"
   refute_selector "nav", text: "Logout"
  end
 
  test "edit user" do
   user = login_user
   
   visit current_user_path
   
   click_link "Edit"
   
   visit edit_user_path(user)
   
   fill_in "Name", with: "Test Account 2"
   fill_in "Email", with: "hello2@gmail.com"
   
   click_button "Update"
   
   assert_text "Blog has been updated"
   assert_selector "nav", text: "Logout"
   refute_selector "nav", text: "Log In"
  end
  
  
  
  
  
  
end
