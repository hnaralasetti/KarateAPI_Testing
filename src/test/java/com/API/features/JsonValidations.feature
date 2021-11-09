@JsonValidations
Feature: validate response using json data

  Scenario: Validate the user details by passing expected JSON from feature file
    Given url 'https://reqres.in/api/users/2'
    When method GET
    Then status 200
    And match response == {"data":{"id":2,"email":"janet.weaver@reqres.in","first_name":"Janet","last_name":"Weaver","avatar":"https:\/\/reqres.in\/img\/faces\/2-image.jpg"},"support":{"url":"https:\/\/reqres.in\/#support-heading","text":"To keep ReqRes free, contributions towards server costs are appreciated!"}}

  Scenario: Validate the user details by passing expected JSON from an external JSON file
    Given url 'https://reqres.in/api/users/3'
    When method GET
    Then status 200
    * def expectedOutput = read(dataDir + 'result.json')
    And match response == expectedOutput
