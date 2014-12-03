Given(/^I have an username and email$/) do
    puts "I have my credentials"
end

When(/^I enter "([^"]*)" in the username$/) do |username|
        fill_in "name", :with => username
end
When(/^I enter "(.*?)" in the email$/) do |email|
        fill_in "email", :with => email
end
Then(/^I should see the  home page$/) do
    expect(page).to have_content "PICS"
end