Given(/^ I am into PICs main page$/) do
    puts "I have the main page PICS"
end

When(/^ I click Create Folder link$/) do
    visit   "http://localhost:4567/createfolder"

end

Then(/^I should see the Create Folder page$/) do 
    visit   "http://localhost:4567/createfolder"
    expect(page).to have_content "PICS"
end

When(/^ I enter "(.*?)" in the Folder Name field$/) do |value, foldername|
        fill_in foldername, :with => value
end
When(/^I enter "(.*?)" in the Description field$/) do |valuedesc, description|
        fill_in description, :with => valuedesc
        click_button "Create"
end

Then(/^I should see my folder in My folder page$/) do
    expect(page).to have_content "PICS"
end
