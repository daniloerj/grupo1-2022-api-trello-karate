Feature: Creaciones de tableros
  Background: configuracion de escenarios
    * url _url
    * configure headers = read('headersRequestBoard.js')
    * def dataDriven = read(_somePayloadJson+'boards-workflows.json')
    * def testType = 'regression'

  @smoke @regression
  Scenario Outline: crear tablero
    * def responseUsersTypicode = call read(_someReusableFeature+'some-reusable.feature')
    * print responseUsersTypicode

    * def functionJS = read('classpath:iterator.js')

    * print functionJS(responseUsersTypicode.response)

    * def apiTools = "POSTMAN|SOAPUI|KARATE|RESTASSURED"
    * def functionConvertStringToArray = function convertirCadenaArray(cadena){return cadena.split('|');}
    * def arrayApiTools = functionConvertStringToArray(apiTools)
    * print arrayApiTools

    * def jsonRequest =
    """
      {
        keyApi:'#(_key)',
        tokenApi:'#(_token)',
        nameBoard: <nameBoard>,
        defaultLabelsBoard: <defaultLabelsBoard>,
        defaultListsBoard: <defaultListsBoard>,
        descBoard:<descBoard>,
        statusCodeBoard: <statusCodeBoard>,
        responseTimeBoard: <responseTimeBoard>
      }
    """
    * def utiles = Java.type('Utilitarios')
    * print utiles.getToken() + ' cellphone: '+utiles.getNumberRandom()

    * def tagCreateBoard = (testType=='smoke')? '@createBoardWithoutSchemaValidated' : '@createBoard'
    * def responseCreateBoard = call read(_someReusableFeature+'boards-post.feature'+tagCreateBoard) jsonRequest
    * print responseCreateBoard
    * def boardId = responseCreateBoard.response.id

    * def responseGetBoard = call read(_someReusableFeature+'boards-get.feature@getBoardById') {nameBoard:#(jsonRequest.nameBoard)}

    * def responseDeleteBoard = call read(_someReusableFeature+'boards-delete.feature')

    Examples:
    |karate.jsonPath(dataDriven,"$[?(@.scenario=='crearTablero')]")|



  @regression
    Scenario Outline: Actualizar tablero

      * def requestPayload = read('payloadRequestBoard.js')

      * def responseCreateBoard = call read('boards-post.feature@createBoard')

      * def boardId = responseCreateBoard.response.id

      * requestPayload.name = 'danilo-trello-actualizado'

      * def responseUpdateBoard = call read('boards-put.feature')

      * def responseGetBoard = call read('boards-get.feature@getBoardById')

      * def responseDeleteBoard = call read('boards-delete.feature')

    Examples:
      |karate.jsonPath(dataDriven,"$[?(@.scenario=='actualizarTablero')]")|

  @regression
  Scenario Outline: Eliminar Tablero
        * def requestPayload = read('payloadRequestBoard.js')

        * def responseCreateBoard = call read('boards-post.feature@createBoard')

        * def boardId = responseCreateBoard.response.id

        * def responseDeleteBoard = call read('boards-delete.feature')

        * def responseGetBoard = call read('boards-get.feature@getBoardByIdNotFound')

    Examples:
      |karate.jsonPath(dataDriven,"$[?(@.scenario=='eliminarTablero')]")|