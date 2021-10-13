*Settings*
Documentation    Equipo Actions


*Keywords*
Go To Equipos Form
    Click                      text=Criar anúncio
    # Check point
    Wait For Elements State    id=equipoForm         visible    2

Fill Equipo Form
    # Faço o upload da imagem equipamento
    [Arguments]    ${equipo_arg}
    ${promise}=    Promise To Upload File    ${EXECDIR}/resources/thumbnails/${equipo_arg}[thumbnail]
    Click          id=thumbnail
    Wait For       ${promise}

    # Preencho os campos do Formulário
    Fill Text            id=name        ${equipo_arg}[name]
    Select Options By    id=category    value       ${equipo_arg}[category]
    Fill Text            id=price       ${equipo_arg}[price]


Submit Equipo Form
    # Confirmo cadastramento do equipamento
    Click          text=Cadastrar

Equipo Should Be Visible
    [Arguments]    ${equipo_name}

    Wait For Elements State
    ...     css=tr >> text=${equipo_name}
    ...     visible
    ...     2
    ...     Equipo not visible

Equipo Not Visible
    [Arguments]    ${equipo_name}

    Wait For Elements State
    ...     css=tr >> text=${equipo_name}
    ...     detached
    ...     2
    ...     Equipo is visible

Alert Form Should Be
    [Arguments]    ${expected_message}

    ${element}    Set Variable    css=.alert-form >> text=${expected_message}

    Wait For Elements State    ${element}    visible    2
    # Get Text                   ${element}     equal      ${expected_message}

Get Text For Required Alerts
    [Arguments]    ${position}

    ${result}    Get Text    xpath=//span[@class="alert-form"][${position}]


    [return]    ${result}

Request Removal
    [Arguments]     ${equipo_name}

    Click       xpath=//td[text()="${equipo_name}"]/..//i[contains(@class,"delete-icon")]

Confirm Removal
    Click       xpath=//div[@class="react-confirm-alert"]//button[text()="Sim"]

Not Confirm Removal
    Click       xpath=//div[@class="react-confirm-alert"]//button[text()="Não"]