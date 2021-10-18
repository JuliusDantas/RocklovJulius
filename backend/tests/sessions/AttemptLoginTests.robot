*Settings*
Documentation    Sessions Attempt Login Tests

Resource         ${EXECDIR}/resources/Base.robot
Test Template    Attempt Login

*Test Cases*        json_file                   Status_code     message

Incorect password    incorect_password.json    401              Unauthorized
User not found       user_not_found.json       401              Unauthorized
Wrong email          wrong_email.json          412              wrong email
Empty email          empty_email.json          412              required email
Empty password       empty_password.json       412              required password
Without Email        without_email.json        412              required email       
Without Password     without_password.json     412              required password    


*Keywords*

Attempt Login
    [Arguments]    ${json_file}    ${status_code}    ${message}

    ${payload}          Get Json          sessions      ${json_file}
    ${response}         POST Login        ${payload}
    Status Should Be    ${status_code}    ${response}
    Should Be Equal     ${message}        ${response.json()}[error]