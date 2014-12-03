Feature: Upload image
    As a user I should be able to upload an image in the PICS application

    Scenario: As I user I should be able to upload an image inside a folder

        Given I have an upload image link into my PICS
        When I click on upload image link
        Then I should see the Browse pop up
        When I click on "Libraries" in the left pane 
        And I click on "Pictures" link inside Libraries
        Then I should see the Pictures library pane
        When I click on a "image" in the Pictures library pane
        And I click on "Open" button in the Browse pop up
        Then I should see the image uploaded inside a folder