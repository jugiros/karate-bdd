Feature: Login Usuario

  Background:
    * url api.baseUrl
    * def requestPayload =
    """
    {
      "username": "#(username)", "password": "#(password)"
    }
    """
    * def errorResponse = read("error-message-post.json")

  Scenario Outline: Login credenciales correctas
    Given path "login"
    And request requestPayload
    And header Content-Type = "application/json"
    When method post
    Then status 200
    And match response == "#string"
    Examples:
      | username | password |
      | juan     | anVhbg== |

  Scenario Outline: Login credenciales incorrectas
    Given path "login"
    And request requestPayload
    And header Content-Type = "application/json"
    When method post
    Then status 200
    And match $ == errorResponse
    Examples:
      | username | password |
      | Juan     | juan     |