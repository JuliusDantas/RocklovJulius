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