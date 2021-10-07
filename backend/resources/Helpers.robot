*Settings*
Documentation    KEs de ajuda
Library          OperatingSystem


*Keywords*
GET Json
    [Arguments]    ${route}    ${file_name}
    ${fixture}     Get File    ${EXECDIR}/resources/fixtures/${route}/${file_name}
    ${json}        Evaluate    json.loads($fixture)                                   json

    [Return]    ${json}

GET Token
    [Arguments]    ${email}     ${password} 

    &{payload}       Create Dictionary    email=${email}                      password=${password}
    ${response}      POST Login           ${payload} 
    ${user_token}    set Variable         ${response.json()}[user_token]

    [return]    ${user_token}
