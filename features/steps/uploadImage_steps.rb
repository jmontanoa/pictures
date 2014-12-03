Given(/^I have an upload image link into my PICS$/) do
    puts "I have an image to upload"
end

When(/^I click on upload image link$/) do
	#upload_image,html
    visit   "http://localhost:4567/upload_image"
    # puts page.methods
    click_link "upload image"
end

Then(/^I should see the upload_image form$/) do 
    visit   "http://localhost:4567/upload_image"
    expect(page).to have_content "Upload Image"
end

When(/^I click "Browse" button in the upload_image form$/) do 
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
When(/^I click on an image in the Pictures library pane$/) do
    attach_file('Image', '/Libraries/Pictures/image.jpg')
    click_button "Open"
end
Then(/^I should see the image name in the upload_image form$/) do
    expect(page).to have_content "image.jpg"	 
end
When(/^I click on the "upload" button in the upload_image form$/) do
    click_button "Upload"
end
Then(/^I should see the  home page$/) do
    expect(page).to have_content "PICS"
end




