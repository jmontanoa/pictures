
When(/^I click on Change image link$/) do
	#upload_image,html
    visit   "http://localhost:4567/change_image"  
end
Then(/^I should see the change_image form$/) do |selected_folder|
    expect(page).to have_content "Upload a New Image"
    expect(page).to have_selector(selected_folder)
    expect(page).to have_content "image_1.jpg"     
end

When(/^I click "Browse" button in the change_image form$/) do 
        click_button "Browse"
end
Then(/^I should see the  File Upload pop up$/) do
    page.should have_title('File Upload')
end

When(/^I click on "Libraries" in the File Upload pop up$/) do
   	click_link "Libraries"
   	click_link "Pictures" 
end
Then(/^I should see the Pictures library in the File Upload pop up$/) do
    expect(page).to have_content "Pictures library"	
end

When(/^I select the image1.jpg in the Pictures library pane$/) do |image_n|
    attach_file('Image', '/Libraries/Pictures/#{image}')
    click_button "Open"
end
Then(/^I should see the image name in the change_image form$/) do |image_name_jpg|
    expect(page).to have_content image_name_jpg	 
end

When(/^I click on the "upload" button in the change_image form$/) do
    click_button "Upload"
end
Then(/^I should see the  home page$/) do
    visit "http://localhost:4567/MainPage"
    expect(page).to have_content "PICS"
end