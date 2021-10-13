*Settings*
Documentation    Consumir a API da Rocklov

Library    RequestsLibrary
Library    OperatingSystem


*Variable*
${base_url}    https://rocklov-julius-api.herokuapp.com

*Keywords*
Get Token Service
    [Arguments]    ${email}    ${password} 

    &{payload}     Create Dictionary                 email=${email}    password=${password}
    ${response}    POST 
    ...            ${base_url}/sessions
    ...            json=${payload}
                
    [return]       ${response.json()}[user_token]

POST Equipo Service
    [Arguments]    ${equipo}    ${token} 

    &{headers}      Create Dictionary    user_token=${token}
    ${bin_img}      Get Binary File      ${EXECDIR}/resources/thumbnails/${equipo}[thumbnail]
    &{thumbnail}    Create Dictionary    thumbnail=${bin_img}

    ${response}    POST
    ...            ${base_url}/equipos
    ...            data=${equipo}
    ...            headers=${headers}
    ...            files=${thumbnail}         
    ...            expected_status=any

    [Return]    ${response}