Given(/^I have an confirmation link into my email$/) do
    puts "I have my confirmation"
end

When(/^I click over confirmation link$/) do
    visit   "http://localhost:4567/confirm"
    # puts page.methods
    click_link "Confirmation"
end

Then(/^I should see the confirmation form$/) do 
    visit   "http://localhost:4567/enroll"
    expect(page).to have_content "Confirmation"
end

When(/^I enter "([^"]*)" in the username$/) do |username|
        fill_in "name", :with => username
end
When(/^I enter "([^"]*)" in the lastname$/) do |lastname|
        fill_in "lastname", :with => lastname
end
When(/^I enter "(.*?)" in the email$/) do |email|
        fill_in "email", :with => email
end
When(/^I enter "(.*?)" in the password$/) do |password|
        fill_in "password", :with => password
        click_button "Enroll"
end

Then(/^I should see the  confirmation message page$/) do
    visit "http://localhost:4567/link.html"
    expect(page).to have_content "welcome"
end
