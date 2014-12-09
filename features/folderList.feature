Feature: Show Folder list page
    User visits the Folder List page in order to see all created folders

    Scenario: The user should be able to see all created folders

        Given I am on the Home page
        When I click on My Folders link 
        Then I should see the Folder List page