Feature: Update image
    The user should be able to update an image in the PICS application for an specify folder

    Scenario: The user should be able to update an image and select a folder wich will belong the image.

        Given I am on the Folder List page
        When I click on edit link
        Then I should see the upload_image form
        And I should see the Folder Name selected in the "Folder" list
        And I should see the image name in the upload_image form
        When I click on "Browse" buttom
        Then I should see the "File Upload" pop up
        When I click on "Libraries" in the left pane 
        And I click on "Pictures" link below Libraries link
        Then I should see the Pictures library pane
        When I select the "image_1.jpg" in the Pictures library pane
        And I click on "Open" button in the File Upload pop up
        Then I should see the image name in the upload_image form
        When I click on the "Upload" button in the edit_image form
        Then I should see the Main page
        