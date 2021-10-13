*Settings*
Documentation    Elementos da página Login2

*Variables*
${INPUT_EMAIL}      css=input#user_email
${INPUT_PASS}       id=user_password
${BUTTON_SIGNIN}    text="Entrar"
${DIV_ALERT}        .alert
${ELEMENT}          css=.alert

*Keywords*
Login With
    [Arguments]    ${email}    ${pass}

    Fill Text    ${INPUT_EMAIL}       ${email}
    Fill Text    ${INPUT_PASS}        ${pass}
    Click        ${BUTTON_SIGNIN} 

Alert Text Should Be
    [Arguments]    ${expected_message}

    Wait For Elements State    ${element}    visible    2
    Get Text                   ${element}    equal      ${expected_message}    

