Feature: Delete image
    As a user I should be able to delete an image

    Scenario: As I user I should be able to delete an image

        Given I am in the Image List page
        When I click on delete link
        Then I should not see the image in the Image List form