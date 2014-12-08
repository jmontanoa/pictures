Given(/^Given I am into Image List page$/) do
    puts "I have the Image list"
end

When(/^When I click on delete link$/) do
    visit   "http://localhost:4567/image_list"
end

Then(/^I should not see the deleted image in the Image list page$/) do 
    expect(page).to_not have_content "Folder A"
end