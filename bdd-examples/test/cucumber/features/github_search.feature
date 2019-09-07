Feature: Github search for a library

Scenario: Search library within github
  Given I am on "https://www.github.com"
   When I fill in "Search GitHub" with the text "vavr"
    And I press intro key with my little finger
