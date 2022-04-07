Feature: solicitudes a los metodos post del recurso boards
  Background: configuracion
    * url _url

  @createBoard
  Scenario: Crear tablero

    * def requestPayload =
    """
    {
        name:'#(nameBoard)',
        defaultLabels:#(defaultLabelsBoard),
        defaultLists:#(defaultListsBoard),
        desc:'#(descBoard)'
     }
    """

    * def rHeaders =
    """
    {
    "X-Dns-Prefetch-Control": [
      "off"
    ],
    "X-Frame-Options": [
      "DENY"
    ],
    "X-Download-Options": [
      "noopen"
    ]
    }
    """

    Given path 'boards'
    And params {key:#(keyApi),token:#(tokenApi)}
    And request requestPayload
    When method post
    Then assert responseStatus == statusCodeBoard
    And assert responseTime < responseTimeBoard
    And assert responseType == 'json'
    #And match response == jsonResponse
    And match responseHeaders contains rHeaders
    And match responseHeaders !contains {danilo:"daddsadsadsad"}
    And assert response.name == requestPayload.name


  @createBoardWithoutSchemaValidated
  Scenario: Crear tablero
    * def jsonResponse =
    """
    {
      name:"#string",
      id:"#string",
      closed:"#boolean"
    }
    """
    * def requestPayload =
    """
    {
        name:'#(nameBoard)',
        defaultLabels:#(defaultLabelsBoard),
        defaultLists:#(defaultListsBoard),
        desc:'#(descBoard)'
     }
    """

    Given path 'boards'
    And params {key:#(keyApi),token:#(tokenApi)}
    And request requestPayload
    When method post
    Then assert responseStatus == statusCodeBoard
    And assert responseTime < responseTimeBoard

