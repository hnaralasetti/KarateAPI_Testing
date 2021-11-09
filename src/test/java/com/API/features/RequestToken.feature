@RequestToken
Feature: Request Token retrieve from a register endpoint

  Background: 
    * url 'https://reqres.in/api/register'

  Scenario: get request token for given username and password
  	* def params = 
  	"""
  		{
  				'email':'eve.holt@reqres.in',
  				'password':'pistoul'
  		}
  	"""
  	And form fields params
    When method POST
    Then status 200
    And print 'response ->',response
		* def accessToken = response.token
		Then print 'accessToken ->', accessToken