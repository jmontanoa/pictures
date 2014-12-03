Feature: Upload image
    As a user I should be able to upload an image in the PICS application

    Scenario: As I user I should be able to upload an image inside a folder

        Given I have an upload image link into my PICS
        When I click on upload image link
        Then I should see the upload_image form
        When I click on "Browse" buttom
        Then I should see the File Upload pop up
        When I click on "Libraries" in the left pane 
        And I click on "Pictures" link below Libraries link
        Then I should see the Pictures library pane
        When I click on an "image" in the Pictures library pane
        And I click on "Open" button in the File Upload pop up
        Then I should see the image name in the upload_image form
        When I click on the "Upload" button in the upload_image form
        Then I should see the PICs form
        File