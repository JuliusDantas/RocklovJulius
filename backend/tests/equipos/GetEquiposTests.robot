*Settings*
Documentation    Get Equipos tests

Resource    ${EXECDIR}/resources/Base.robot


*Test Cases*
Get Unique
    # Dado que tenho um equipo cadastrado
    ${token}     Get token    jose@Jose.com.br    Jose@123
    ${equipo}    Get Json     equipos             piano.json

    Remove Equipo    ${equipo}[payload][name]

    ${result}    POST Equipo    ${equipo}    ${token}

    ${equipo_id}    Set Variable    ${result.json()}[_id]

    # Quando faço uma requisição GET para a rota equipos
    ${response}    GET Unique Equipo    ${token}    ${equipo_id}

    # Então o status cold deve ser 200
    Status Should be    200                             ${response}
    Should Be Equal     ${equipo}[payload][name]        ${response.json()}[name]
    Should Be Equal     ${equipo}[payload][category]    ${response.json()}[category]
    Should Be Equal     ${equipo}[payload][price]       ${response.json()}[price]


Equipo Not Found
    # Dado que tenho um equipo Não cadastrado
    ${equipo_id}    Get Mongo Id

    ${token}    Get token    jose@Jose.com.br    Jose@123

    # Quando faço uma requisição GET para a rota equipos
    ${response}    GET Unique Equipo    ${token}    ${equipo_id}

    # Então o status cold deve ser 404
    Status Should be    404    ${response}

Get Equipo List
    [tags]      List
    # Dado que tenho uma lista equipo cadastrado
    ${token}    Get token    maria@maria.com.br    maria@123
    ${list}     Get Json     equipos               list.json

    FOR    ${item}    IN    @{list}

    Remove Equipo    ${item}[payload][name]
    POST Equipo      ${item}                   ${token}

    END

    # Quando faço uma requisição GET para a rota equipos
    ${response}    GET List Equipos    ${token} 

    # Então o status cold deve ser 200
    Status Should be    200    ${response}

    # E preciso validar se retornou uma lista
    ${total}          Get Length      ${response.json()}
    Should be True    ${total} > 1

