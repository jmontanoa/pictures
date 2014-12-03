Given(/^Given I am into PICs main page$/) do
    puts "I have the main page PICS"
end

When(/^When I click Create Folder link$/) do
    visit   "http://localhost:4567/createfolder"

end

Then(/^I should see the Create Folder page$/) do 
    visit   "http://localhost:4567/enroll"
    expect(page).to have_content "PICS"
end

When(/^When I enter "Folder1" in the Folder Name field$/) do |foldername|
        fill_in "Folder1", :with => foldername
end
When(/^I enter "My first folder" in the Description field$/) do |description|
        fill_in "My first folder", :with => description
        click_button "Create"
end

Then(/^I should see my folder in My folder page$/) do
    expect(page).to have_content "PICS"
end
