Feature: solicitures utilitarios
  Scenario: obtener usuarios del api json place holder typicode
    Given url 'https://jsonplaceholder.typicode.com/users'
    When method get
    Then status 200