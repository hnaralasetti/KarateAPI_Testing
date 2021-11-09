@MultiDataJson
Feature: Validate multiple user details from single Json file

  Background: 
    * def expectedOutput = read(dataDir + 'multiDataJson.json')


  Scenario: Validate user2 details
    Given url 'https://reqres.in/api/users/2'
    When method GET
    Then status 200
    And match response == expectedOutput[0]
    
  Scenario: Validate user3 details
    Given url 'https://reqres.in/api/users/3'
    When method GET
    Then status 200
    And match response == expectedOutput[1]
