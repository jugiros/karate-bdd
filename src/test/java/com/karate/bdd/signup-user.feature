Feature: Signup Usuario

  Background:
    * url api.baseUrl
    * def requestPayload =
    """
    {
      "username": "#(username)", "password": "#(password)"
    }
    """
    * def errorResponse = read("error-message-post.json")

  #    Se debe modificar el usuario para poder crear un usuario nuevo
  Scenario Outline: Signup usuario nuevo
    Given path "signup"
    And request requestPayload
    And header Content-Type = "application/json"
    When method post
    Then status 200
    And match response == "#string"
    Examples:
      | username    | password |
      | rosendoleon | anVhbg== |

  Scenario Outline: Signup usuario existente
    Given path "signup"
    And request requestPayload
    And header Content-Type = "application/json"
    When method post
    Then status 200
    And match $ == errorResponse
    Examples:
      | username | password |
      | juan        | anVhbg==     |