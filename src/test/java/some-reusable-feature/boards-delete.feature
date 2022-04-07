Feature: solicitudes de metodo delete para el recurso board
  Background: configuración
    * url _url

  Scenario: eliminar un tablero
    Given path 'boards'
    And path boardId
    And params {key:#(_key),token:#(_token)}
    When method delete
    Then status 200
    And assert responseTime < 5000
    And match response == {_value:null}
    And assert responseStatus == 200
    And match responseHeaders['Content-Type'][0]  contains 'application/json'
