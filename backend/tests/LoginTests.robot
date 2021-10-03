*Settings*
Documentation       Sessions route tests

Library             RequestsLibrary

*Variables*
${base_url}         https://rocklov-julius-api.herokuapp.com

*Test Cases*

User Login

    &{payload}      Create Dictionary
    ...             email=francisca@francisca.com.br
    ...             password=Francisca@123 

    ${response}     POST
    ...             ${base_url}/sessions
    ...             json=${payload}

    Status Should be        200     ${response}

    ${token}        Set Variable             ${response.json()}[user_token]

    Length Should be    ${token}        24