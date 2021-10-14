*Settings*
Documentation    Delete Equipos tests

Resource    ${EXECDIR}/resources/Base.robot


*Test Cases*
Delete Equipo
    # Dado que tenho um equipo cadastrado
    ${token}     Get token    jose@Jose.com.br    Jose@123
    ${equipo}    Get Json     equipos             violao.json

    Remove Equipo    ${equipo}[payload][name]

    ${result}    POST Equipo    ${equipo}    ${token}

    ${equipo_id}    Set Variable    ${result.json()}[_id]

    # Quando faço delete de um equipamento
    ${response}    DELETE Unique Equipo    ${token}    ${equipo_id}

    # Então o status cold deve ser 200
    Status Should be    204    ${response}

    # E equipo deletedo com sucesso o status cold deve ser 404
    ${response2}    GET Unique Equipo    ${token}    ${equipo_id}

    Status Should be    404    ${response2}


Delete Equipo Not Found
    # Dado que tenho um equipo Não cadastrado
    ${equipo_id}    Get Mongo Id

    ${token}    Get token    jose@Jose.com.br    Jose@123

    # Quando faço um delete para a rota equipos
    ${response}    DELETE Unique Equipo    ${token}    ${equipo_id}

    # Então o status cold deve ser 404
    Status Should be    204    ${response}