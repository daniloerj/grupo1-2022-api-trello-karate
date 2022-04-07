Feature: solicitudes de metodos put para el recurso board
  Background: configuracion
    * url _url
    * def autor = 'danilo'

    Scenario: actualizar un tablero
      Given path 'boards'
      And path boardId
      And params {key:#(_key),token:#(_token)}
      And request {name:'#(requestPayload.name)'}
      When method put
      Then status 200
      And assert responseTime < 5000