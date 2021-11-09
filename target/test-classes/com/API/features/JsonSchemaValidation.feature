@SchemaValidations
Feature: Json validation using built in karate methods

  Scenario: Example for built in karate json validation methods
    Given url 'https://reqres.in/api/users/2'
    When method GET
    Then status 200
    And match response == '#object'
    * def expectedSchema = read(dataDir + 'userDetailsSchema.json')
    And match response == expectedSchema
