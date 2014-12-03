Feature: Create Folder
    As a user I should be able to create folders

    Scenario: Verify that the user is able to create folders
        Given I am into PICs main page
        When I click Create Folder link
        Then I should see the Create Folder page
        When I enter "Folder1" in the Folder Name field
        And I enter "My first folder" in the Description field
        And I click Create button
        Then I should see my folder in My folder page