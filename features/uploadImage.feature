Feature: Upload image
    The user should be able to upload an image in the PICS application

    Scenario: The user should be able to upload an image inside a folder and select a folder wich belong the image

        Given I am on the Home page
        When I click on upload image link
        Then I should see the upload_image page
        When I click on "Folder" list
        And I select a Folder Name from "Folder" list
        Then I should see the Folder Name in the "Folder" list
        When I click on "Browse" buttom
        Then I should see the "File Upload" pop up
        When I click on "Libraries" in the left pane 
        And I click on "Pictures" link below Libraries link
        Then I should see the Pictures library pane
        When I select the "image.jpg" in the Pictures library pane
        And I click on "Open" button in the File Upload pop up
        Then I should see the image name in the upload_image page
        When I click on the "Upload" button in the upload_image page
        Then I should see the Home page
        