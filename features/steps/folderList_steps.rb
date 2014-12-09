Given (/^I am on the Home page$/) do
    visit   "http://localhost:4567/MainPage"  
end
When(/^I click on My Folders link$/) do
    click_link "My Folder"
end
Then(/^I should see the Folder List page$/) do
    visit   "http://localhost:4567/folder_list"  
    page.should have_title('Folder List')
end