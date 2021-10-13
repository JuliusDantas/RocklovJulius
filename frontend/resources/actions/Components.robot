*Settings*
Documentation       Shared Elements

*keywords*
Alert Text Should Be
    [Arguments]    ${expected_message}

    ${element}    Set Variable    css=.alert

    Wait For Elements State    ${element}    visible    2
    Get Text                   ${element}     equal      ${expected_message}    