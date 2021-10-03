*Settings*
Documentation    Sessions route tests

Resource    ../resources/Base.robot



*Test Cases*

User Login

    ${payload}          Get Json        user_login.json
    ${response}         POST Login      ${payload}
    Status Should be    200             ${response}
    ${token}            Set Variable    ${response.json()}[user_token]
    Length Should be    ${token}        24

Incorect password

    ${payload}          Get Json        incorect_password.json 
    ${response}         POST Login      ${payload}
    Status Should Be    401             ${response}
    Should Be Equal     Unauthorized    ${response.json()}[error]

User not found

    ${payload}          Get Json        user_not_found.json
    ${response}         POST Login      ${payload}
    Status Should Be    401             ${response}
    Should Be Equal     Unauthorized    ${response.json()}[error]

Wrong email

    ${payload}          Get Json       wrong_email.json
    ${response}         POST Login     ${payload}
    Status Should Be    412            ${response}
    Should Be Equal     wrong email    ${response.json()}[error]

Empty email

    ${payload}          Get Json          empty_email.json 
    ${response}         POST Login        ${payload}
    Status Should Be    412               ${response}
    Should Be Equal     required email    ${response.json()}[error]

Empty password

    ${payload}          Get Json          empty_email.json
    ${response}         POST Login        ${payload}
    Status Should Be    412               ${response}
    Should Be Equal     required email    ${response.json()}[error]

Without Email

    ${payload}          Get Json          without_email.json
    ${response}         POST Login        ${payload}
    Status Should Be    412               ${response}
    Should Be Equal     required email    ${response.json()}[error]

Without Password

    ${payload}          Get Json             without_password.json
    ${response}         POST Login           ${payload}
    Status Should Be    412                  ${response}
    Should Be Equal     required password    ${response.json()}[error]