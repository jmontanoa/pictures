Given(/^I have an confirmation link into my email$/) do
    puts "I have my confirmationlink"
end

When(/^I click over confirmation link$/) do
    visit   "http://localhost:4567/link"
    # puts page.methods
    click_link "Confirmation"
end

Then(/^I should see the confirmation form$/) do 
	visit   "http://localhost:4567/enroll"
	expect(page).to have_content "Confirmation"
end

When(/^I enter my information$/) do
    fill_in "name", :with => "user"
    fill_in "last name", :with => "userl"
    fill_in "email", :with => "user@t.com"
    fill_in "password", :with => "mypassword"
    fill_in "confirm password", :with => "mypassword"
    click_button "enroll"
end

When(/^I navigate to the login page $/) do 
	visit   "http://localhost:4567/pics"
	
    expect(page).to have_content /pics/i
end

When(/^I enter my account credentials$/) do 
    fill_in "username", :with => "user"
    fill_in "password", :with => "pros123P"
    click_button "Login"
end
Then(/^I should see the Pics home page$/) do
    expect(page).to have_content "Pics"
end
