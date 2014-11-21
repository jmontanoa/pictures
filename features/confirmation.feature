Feature: Confirmation Form
    As a user I should be able to sign-in or sign-up to the application

    Scenario: As I user I should be able to confirm my account recently created

        Given I have an confirmation link into my email
        When I click over confirmation link
        Then I should see the confirmation form
        When I enter my information
        And I navigate to the login page 
      	And I enter my account credentials
        Then I should see the Pics home page