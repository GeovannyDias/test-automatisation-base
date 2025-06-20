@REQ_HU-RET-000 @HU000 @marvel_characters_crud @marvel_characters_api @Agente2 @E2 @iniciativa_marvel
Feature: HU-RET-000 CRUD de personajes Marvel (microservicio para gestión de personajes)

  Background:
    * url 'http://bp-se-test-cabcd9b246a5.herokuapp.com'
    * def username = 'testuser'
    * def generarHeaders =
      """
      function() {
        return {
          "Content-Type": "application/json"
        };
      }
      """
    * def headers = generarHeaders()
    * headers headers
    * def personajeId = null

  @id:1 @obtenerPersonajes @exito200
  Scenario: T-API-HU-RET-000-CA01-Obtener todos los personajes exitosamente 200 - karate
    Given path username, 'api', 'characters'
    When method GET
    Then status 200
    * if (response.length > 0) karate.set('personajeId', response[0].id)
    # And match response == []
    # And match response.length >= 0

  @id:2 @obtenerPersonajePorId @exito200
  Scenario: T-API-HU-RET-000-CA02-Obtener personaje por ID exitosamente 200 - karate
    * def characterId = karate.get('personajeId')
    Given path username, 'api', 'characters', characterId
    When method GET
    Then status 200
    # And match response.id == 1
    # And match response.name == 'Iron Man'

  @id:3 @obtenerPersonajePorId @noEncontrado404
  Scenario: T-API-HU-RET-000-CA03-Obtener personaje por ID no existente 404 - karate
    * def characterId = 999
    Given path username, 'api', 'characters', characterId
    When method GET
    Then status 404
    # And match response.error == 'Character not found'
    # And match response != null

  @id:4 @crearPersonaje @exito201
  Scenario: T-API-HU-RET-000-CA04-Crear personaje exitosamente 201 - karate
    * def jsonData = read('classpath:data/marvel_characters_api/request_create_character.json')
    Given path username, 'api', 'characters'
    And request jsonData
    When method POST
    Then status 201
    * karate.set('personajeId', response.id)
    # And match response.name == jsonData.name
    # And match response.id != null

  @id:5 @crearPersonaje @nombreDuplicado400
  Scenario: T-API-HU-RET-000-CA05-Crear personaje con nombre duplicado 400 - karate
    * def jsonData = read('classpath:data/marvel_characters_api/request_create_character_duplicate.json')
    Given path username, 'api', 'characters'
    And request jsonData
    When method POST
    Then status 400
    # And match response.error == 'Character name already exists'
    # And match response != null

  @id:6 @crearPersonaje @faltanCampos400
  Scenario: T-API-HU-RET-000-CA06-Crear personaje con campos requeridos faltantes 400 - karate
    * def jsonData = read('classpath:data/marvel_characters_api/request_create_character_invalid.json')
    Given path username, 'api', 'characters'
    And request jsonData
    When method POST
    Then status 400
    # And match response.name == 'Name is required'
    # And match response.powers == 'Powers are required'

  # @id:7 @actualizarPersonaje @exito200
  # Scenario: T-API-HU-RET-000-CA07-Actualizar personaje exitosamente 200 - karate
  #   * def characterId = karate.get('personajeId')
  #   * def jsonData = read('classpath:data/marvel_characters_api/request_update_character.json')
  #   Given path username, 'api', 'characters', characterId
  #   And request jsonData
  #   When method PUT
  #   Then status 200
  #   # And match response.description == jsonData.description
  #   # And match response.id == characterId

  @id:8 @actualizarPersonaje @noEncontrado404
  Scenario: T-API-HU-RET-000-CA08-Actualizar personaje no existente 404 - karate
    * def characterId = 999
    * def jsonData = read('classpath:data/marvel_characters_api/request_update_character_not_found.json')
    Given path username, 'api', 'characters', characterId
    And request jsonData
    When method PUT
    Then status 404
    # And match response.error == 'Character not found'
    # And match response != null

  # @id:9 @eliminarPersonaje @exito204
  # Scenario: T-API-HU-RET-000-CA09-Eliminar personaje exitosamente 204 - karate
  #   * def characterId = karate.get('personajeId')
  #   Given path username, 'api', 'characters', characterId
  #   When method DELETE
  #   Then status 204
  #   # And match response == null
  #   # And match response == ''

  @id:10 @eliminarPersonaje @noEncontrado404
  Scenario: T-API-HU-RET-000-CA10-Eliminar personaje no existente 404 - karate
    * def characterId = 999
    Given path username, 'api', 'characters', characterId
    When method DELETE
    Then status 404
    # And match response.error == 'Character not found'
    # And match response != null





