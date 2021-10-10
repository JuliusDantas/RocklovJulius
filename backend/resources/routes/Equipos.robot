*Settings*
Documentation    Implementação de Rota / Equipos

Library    OperatingSystem

*Keywords*

POST Equipo
    [Arguments]    ${equipo}    ${token} 

    &{headers}    Create Dictionary    user_token=${token}

    ${bin_img}    Get Binary File    ${EXECDIR}/thumbnails/${equipo}[thumb]

    &{thumbnail}       Create Dictionary    thumbnail=${bin_img}

    ${response}    POST
    ...            ${base_url}/equipos
    ...            data=${equipo}[payload]
    ...            headers=${headers}
    ...            files=${thumbnail}      
    ...            expected_status=any

    [Return]    ${response}

GET Unique Equipo
    [Arguments]    ${token}     ${equipo_id}

    &{headers}    Create Dictionary    user_token=${token}

     ${response}    GET
    ...            ${base_url}/equipos/${equipo_id}
    ...            headers=${headers}
    ...            expected_status=any

    [Return]    ${response}

DELETE Unique Equipo
    [Arguments]    ${token}     ${equipo_id}

    &{headers}    Create Dictionary    user_token=${token}

     ${response}    DELETE
    ...            ${base_url}/equipos/${equipo_id}
    ...            headers=${headers}
    ...            expected_status=any

    [Return]    ${response}

GET List Equipos
    [Arguments]    ${token}

    &{headers}    Create Dictionary    user_token=${token}

     ${response}    GET
    ...            ${base_url}/equipos
    ...            headers=${headers}
    ...            expected_status=any

    [Return]    ${response}
