Feature: solicitudes de metodos get del recurso boards
  Background: configuracion
    * url _url

    @getBoardById
    Scenario: Obtener un tablero por id
      Given path 'boards'
      And path boardId
      And params {key:#(_key),token:#(_token)}
      When method get
      Then status 200
      And assert responseTime < 5000
      And assert response.name == nameBoard

    @getBoardByIdNotFound
    Scenario: obtener tablero por id que no existe
      Given path 'boards'
      And path boardId
      And params {key:#(_key),token:#(_token)}
      When method get
      Then status 404
      And assert responseTime < 5000
      And assert response=='The requested resource was not found.'