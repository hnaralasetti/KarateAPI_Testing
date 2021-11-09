@BasicMethods
Feature: Basic request and response methods

  Scenario: GET method example
    Given url url 
    When method GET
    Then status 200

  Scenario Outline: GET method with field value verification
    Given url 'https://reqres.in/api/users/4'
    When method GET
    Then status <status>
    And print response
    And match response.data.last_name == <lastName>
    And assert response.data.id == <ID>
    
    Examples: 
      | status | lastName | ID |
      |    200 | "Holt"   |  4 |
      

  Scenario: POST method example with field value validation and dynamic parameter passing
    Given url 'https://reqres.in/api/users'
    And request '{"name": "xyz","job": "manager"}'
    When method POST
    Then status 201
    And print response
    And match response.id != null
    * def requestID = response.id
    * def secondResponseAsIs = read(dataDir + 'secondRequest.json')
    And print 'second request before dynamic values update', secondResponseAsIs
    * def secondResponseUpdated = read(dataDir + 'secondRequest.json')
    And secondResponseUpdated.data.id=requestID
    And print 'second request after dynamic values update', secondResponseUpdated
