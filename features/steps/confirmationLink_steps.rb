
When(/^I click on confirmation link$/) do 
    visit   "http://localhost:4567/confirm.html"
    # click_link "Confirmation"
    click_link Confirmation
end

Then(/^I should see the confirmation page$/) do 
	visit   "http://localhost:4567/enroll"
	expect(page).to have_content "Confirmation Form"
end