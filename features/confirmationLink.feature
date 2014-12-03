Feature: Confirmation Link
    As a user I should be able to receive a confirmation link to see the Confirmation application

    Scenario: As I user I should be able to confirm my account recently created

        Given I have an confirmation link into my email
        When I click over confirmation link
        Then I should see the Confirmation form
        
        