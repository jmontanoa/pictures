Feature: The user confirms the confirmation Link
    User receives a confirmation link in order to see the Confirmation application

    Scenario: The user should be able to confirm her/his account recently created

        Given I am on confirm page
        And I have an confirmation link into my page
        When I click on confirmation link
        Then I should see the Enroll page