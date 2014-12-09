
When(/^I click on confirmation link$/) do |confirmation_link|
    #visit   "http://localhost:4567/link"
    # click_link "Confirmation"
    click_link confirmation_link
end

Then(/^I should see the confirmation page$/) do 
	visit   "http://localhost:4567/enroll"
	expect(page).to have_content "Confirmation Form"
end