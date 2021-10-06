*Settings*
Documentation    User Login Test

Resource    ${EXECDIR}/resources/Base.robot



*Test Cases*

User Login

    ${payload}          Get Json        sessions    user_login.json
    ${response}         POST Login      ${payload}
    Status Should be    200             ${response}
    ${token}            Set Variable    ${response.json()}[user_token]
    Length Should be    ${token}        24