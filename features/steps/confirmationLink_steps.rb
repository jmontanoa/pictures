Given(/^I have an confirmation link into my email$/) do
    puts "I have my confirmationlink"
end

When(/^I click over confirmation link$/) do
    visit   "http://localhost:4567/link"
    # 
    click_link "Confirmation"
end

Then(/^I should see the confirmation form$/) do 
	visit   "http://localhost:4567/enroll"
	expect(page).to have_content "Confirmation"
end