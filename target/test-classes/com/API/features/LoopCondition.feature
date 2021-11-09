@LoopCondition
Feature: Loops and Conditions

  
  Scenario: Example for loops and conditions
    Given url url
    When method GET
    Then status 200
    * def data = response.data
    Then print 'data->',data
    * def myFun =
      """
      function(arg){
      	for(i=0;i<arg.length;i++){
      		if(arg[i].id == 9){
      			return arg[i]
      		}
      	}
      }
      """
    * def userDetails = call myFun data
    * def javaFunctions = Java.type('com.API.Utility.JavaFunctions')
    * def result = javaFunctions.writeData(userDetails)
    Then print 'user Details ->', userDetails
