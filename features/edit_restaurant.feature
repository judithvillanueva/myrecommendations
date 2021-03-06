Feature: Edit Restaurant
  In order to keep updated my previous registers about restaurants
  As a user
  I want to edit a restaurant register I created

  Background: There are registered users and a restaurant by one of them
    Given Exists a user "user1" with password "password"
    And Exists a user "user2" with password "password"
    And Exists restaurant registered by "user1"
      | name            | city            | country         |
      | The Tavern      | London          | USA             |

  Scenario: Edit owned restaurant registry country
    Given I login as user "user1" with password "password"
    When I view the details for restaurant "The Tavern"
    And I edit the current restaurant
      | country         |
      | England         |
    Then I'm viewing the details page for restaurant by "user1"
      | name            | city            | country         |
      | The Tavern      | London          | England         |
    And There are 1 restaurants

  Scenario: Try to edit restaurant but not logged in
    Given I'm not logged in
    When I view the details for restaurant "The Tavern"
    Then There is no "edit" link available

  Scenario: Try to edit restaurant but not the owner
    Given I login as user "user2" with password "password"
    When I view the details for restaurant "The Tavern"
    Then There is no "edit" link available
