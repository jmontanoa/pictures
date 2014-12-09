
When(/^I enter "([^"]*)" in the user_name$/) do |user_name|
        fill_in "name", :with => user_name
end
When(/^I enter "(.*?)" in the e_mail$/) do |e_mail|
        fill_in "email", :with => e_mail
        click_button "Sign In"
end
Then(/^I should see the home page$/) do
	visit "http://localhost:4567/MainPage"
    expect(page).to have_content "PICS"
end