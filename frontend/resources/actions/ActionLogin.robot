*Settings*
Documentation    Login Actions


*Keywords*
Login With

    [Arguments]    ${email}    ${pass}

    Fill Text    css=input#user_email    ${email}
    Fill Text    id=user_password        ${pass}
    Click        text="Entrar"

Do Logout
    Click       css=.do-Logout

User Should Be Logged In
    [Arguments]                ${elemente}
    Wait For Elements State    ${elemente}    visible    2    Login error
    # Wait For Elements State    text="Meus anúncios"    visible    2    Login error

Alert Text Should Be
    [Arguments]    ${expected_message}

    ${element}    Set Variable    css=.alert

    Wait For Elements State    ${element}    visible    2
    Get Text                   ${element}     equal      ${expected_message}    




