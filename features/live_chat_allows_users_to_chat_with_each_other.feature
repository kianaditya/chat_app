@javascript
Feature: LiveChat allows users to exchage messages
    As a user
    In order to chat with other users
    I want a live chat feature

    Background:
        Given the following users exist
            | email              |
            | user-1@random.com  |
            | user-2@random.com  |
            | thomas1@random.com |

    Scenario: Users can exchange messages
        Given I am logged in as "user-1@random.com"
        And I visit the site
        And I open a new window
        And I log in as "user-2@random.com"
        And I visit the site
        And I open a new window
        And I log in as "thomas1@random.com"
        And I visit the dashboard page
        And I click "Admin tools"
        And I click "Connections"
        And I click "Send message" button for "user-1@random.com"
        And I fill in "Welcome! How can we help?" in "Your message"
        And I click 'Send'
        And I switch to window 1
        And I wait 1 second
        And I click on the chat widget button
        Then I should see a message saying: "Welcome! How can we help?"
        But when I switch to window 2
        And I click on the chat widget button
        Then I should NOT see a message saying: "Welcome! How can we help?"
        # Extending the functionality to see old messages
        And I switch to window 1
        And all windows are closed
        And the date is "2018-05-10"
        And I log in as "user-1@random.com"
        And I visit the site
        And I open a new window
        And I log in as "thomas1@random.com"
        And I visit the dashboard page
        And I click "Admin tools"
        And I click "Connections"
        And I wait 1 second
        Then I should see "Welcome! How can we help?"