Feature: Login page
    User visits the login page in order to login to the page

    Scenario: The user should be able to see home page after entering my username and email

        Given I am on the login page
        When I enter "user" in the user_name 
        And I enter "user@mix.com" in the e_mail 
        Then I should see the home page