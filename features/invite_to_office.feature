Feature: Invite to office for foods and drinks
  - We want to invite any customer within 100km of our Dublin office for some food and drinks on us.
  - Read the full list of customers and output the names and user ids of matching customers (within 100km).
  - Sorted by User ID (ascending).

  Background:
    Given the minimum distance to the office in km for the invitation is 100
    And the dublin office is on latitude "53.339428" and longitude "-6.257664"

  Scenario: Invite for food and drinks for customers within 100km
    Given I have the following customers:
      | User id | Name              | Latitude   | Longitude  |
      | 12      | Christina McArdle | 52.986375  | -6.043701  |
      | 39      | Lisa Ahearn       | 53.0033946 | -6.3877505 |
      | 1       | Alice Cahill      | 51.92893   | -10.27699  |
    When I prepare my invitation list
    Then I should see the following list for invitation:
      | user id | name              |
      | 12      | Christina McArdle |
      | 39      | Lisa Ahearn       |

  Scenario: No customers withing 100km for invitation
    Given I have a list with customers with distance more than 100km
    When I prepare my invitation list
    Then I should receive no customer
