require "application_system_test_case"

class BlogsTest < ApplicationSystemTestCase
   test "visiting the index" do
     user = login_user
     blog1 = FactoryBot.create :blog, user: user
     blog2 = FactoryBot.create :blog, user: user
     
     visit blogs_url
     
     assert_text blog1.author
     assert_text blog2.author
  
   assert_selector "h1", text: "Blogs"
  end
   test "visiting one" do
     user = login_user
     blog1 = FactoryBot.create :blog, user: user
     
     visit blogs_url
     click_link blog1.title
     
     assert_text blog1.author
     assert_text blog1.content
  end
  
   test "Create a blog" do
     user = login_user
     visit blogs_path
     
     click_on "New Post"
     fill_in "Title", with: "Hello world"
     fill_in "Author", with: user.name
     fill_in "Content", with: "testing"
     click_button "Create"
     
     assert_text "Blog "
   end
   test "Update a blog" do
     user = login_user
     blog = FactoryBot.create :blog, user: user
     visit blogs_path
     click_link blog.title
     click_link "Edit"
     fill_in "Title", with: "Hello world"
     click_button "Update"
     assert_text "been updated"
   end
   
   test "delete a blog" do
     user = login_user
     blog = FactoryBot.create :blog, user: user
     visit blogs_path
     click_link blog.title
     click_link "Delete"
     page.driver.browser.switch_to.alert.accept
     assert_text "delete"
     refute_selector "Title", text: blog.title
     
   end
end
