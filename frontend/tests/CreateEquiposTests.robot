*Settings*
Documentation    Equipos Testes

Resource    ${EXECDIR}/resources/Base.robot

Suite Setup      Login Session    ${EMAIL}    ${PASS}
Test Teardown    Finish Teste 

*Variables*
${EMAIL}    henrique@henrique.com
${PASS}     henrique@123

*Test Cases*
Add New Equipo
    [Tags]      add_equipo

    ${Equipo}        GET Equipo         violao
    Remove Equipo    ${Equipo}[name]

    Go To Equipos Form
    Fill Equipo Form            ${Equipo}
    Submit Equipo Form
    Equipo Should Be Visible    ${Equipo}[name]


Duplicated Equipo
    [Tags]    dup_equipo

    # Dado que o equipo fender ja foi cadastrado
    ${Equipo}    GET Equipo           fender
    ${token}     Get Token Service    ${EMAIL}    ${PASS}

    POST Equipo Service    ${Equipo}    ${token}

    # Quando faço o cadastro desse equipo
    Go To Equipos Form
    Fill Equipo Form      ${Equipo}
    Submit Equipo Form


    # Devo ver a mensagem de alerta "Anúncio já existe !"
    Components.Alert Text Should Be    Anúncio já existe :/

    # E sair da tela de cadastro
    [Teardown]    Take Screenshot And Go Back

Required Fields
    [Tags]    req_fields

    @{expected_alerts}      Create List    
    ...                     Adicione uma foto no seu anúncio.
    ...                     Informe a descrição do anúncio.
    ...                     Escolha uma categoria.
    ...                     Informe o valor da diária.

    @{got_alerts}         Create List

    # Dado que tenho um form de cadastramento de Equipo
    Go To Equipos Form

    # Quando confirmo o form sem preencher os campos
    Submit Equipo Form

    # Então devo receber a mensagem informando quais os campos são obrigatórios
    FOR               ${position}                     IN RANGE       1    5
    ${text}           Get Text For Required Alerts    ${position}
    Append To List    ${got_alerts}                   ${text}
    END

    # E comparar as mensagens apresentadas com a lista de mensagens esperadas
    Lists Should Be Equal    ${got_alerts}    ${expected_alerts}
