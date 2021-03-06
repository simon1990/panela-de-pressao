Feature: View unmoderated campaigns
  In order to choose a campaign to moderate
  As an admin
  I want to view the unmoderated campaigns

  @omniauth_test @javascript
  Scenario: I'm a logged in admin
    Given there is an unmoderated campaign called "Save the whales!"
    And I'm logged in as admin
    And I go to the campaigns page
    And I open my profile options
    When I click "Moderar campanhas"
    Then I should be in the unmoderated campaigns page
    And I should see "Save the whales!"
