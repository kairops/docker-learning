Feature: Access to a section of Kairos home page and check some things

Scenario: Access to a section of Kairos home page and check some things
  Given I am on the home page of Kairos DS
   Then I should see the cookies message
   When I accept the cookies message
   Then The cookies message dissapear 
 #   And I access to the DevOps section
  # ToDo: the app should answer to this request
