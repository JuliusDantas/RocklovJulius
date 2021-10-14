*Settings*
Documentation    Remove Equipos Testes

Resource    ${EXECDIR}/resources/Base.robot

Suite Setup      Run Keywords     Login Session              ${EMAIL}    ${PASS}
...              AND              Set Token Suite From LS
Test Teardown    Finish Teste 

*Variables*
${EMAIL}    henrique@henrique.com
${PASS}     henrique@123

*Test Cases*
Remove Equipo
    [Tags]       rem_equipo
    # Dado que tenho um equipo cadastrado
    ${Equipo}    GET Equipo    saxofone


    Remove Equipo    ${Equipo}[name]

    POST Equipo Service    ${Equipo}          ${TOKEN}
    Reload
    # Quando desejo remover o anúcnio do equipo
    Request Removal        ${Equipo}[name]

    # E confirmo que o equipo foi excluido
    Confirm Removal

    # Então o equipo excluido que foi excluido não deve ser exibido na lista
    Equipo Not Visible    ${Equipo}[name]

Remove Give Up
    [Tags]    rem_equipo

    # Dado que tenho um equipo cadastrado
    ${Equipo}    GET Equipo           conga
    ${token}     Get Token From LS

    Remove Equipo    ${Equipo}[name]

    POST Equipo Service    ${Equipo}    ${token}
    Reload

    # Quando desejo remover o anúcnio do equipo
    Request Removal    ${Equipo}[name]

    # E desisto da exclusão
    Not Confirm Removal

    # Então o equipo deve continuar ser exibido na lista
    Equipo Should Be Visible    ${Equipo}[name]