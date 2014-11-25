Feature: Confirmation Form
    As a user I should be able to sign-in or sign-up to the application

    Scenario: As I user I should be able to confirm my account recently created

        Given I have an confirmation link into my email
        When I click over confirmation link
        Then I should see the confirmation form
        When I enter "user" in the username 
        And I enter "user1" in the lastname
        And I enter "user@t.com" in the email 
        And I enter "testing" in the password
        Then I should see the PICS home page