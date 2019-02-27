@javascript
Feature: LiveChat allows users to exchage messages
    As a user
    In order to chat with other users
    I want a live chat feature

    Background:
        Given the following users exist
            | email             |
            | user-1@random.com |
            | user-2@random.com |
            | user-3@random.com |

        And I am logged in as "user-1@random.com"
        And I visit the site
        And I click on "user-2@random.com"

    Scenario: Users can exchange messages

        Given I fill in "Hello!" in "message_text"
        And I click on 'Send'
        And I open a new window
        And I log in as "user-2@random.com"
        And I visit the site
        And I click on "Chat with user-1@random.com"
        Then I should see "user-1@random.com says: Hello!"
        And I fill in "Hello there!" in "message_text"
        And I click on 'Send'
        And I switch to window 1
        And I should see "user-2@random.com says: Hello there!"

    Scenario: Other users cannot see the chat

        Given I open a new window
        And I log in as "user-3@random.com"
        And I visit the site
        Then I should not see "join"