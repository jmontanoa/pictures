Feature: Login page
    As a user I should be able to sign-in to the login page

    Scenario: As I user I should be able to see PICS home page after entering my username and email

        Given I have an username and email
        When I enter "user" in the username 
        And I enter "user@mix.com" in the email 
        Then I should see the PICS home page