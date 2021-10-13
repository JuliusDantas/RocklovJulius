*Settings*
Documentation    Arquivo principal do projeto de automação

Library         Browser
Library         Collections
Library         libs/mongo.py

Resource        ${EXECDIR}/resources/actions/ActionLogin.robot
Resource        ${EXECDIR}/resources/actions/EquipoActions.robot
Resource        ${EXECDIR}/resources/actions/Components.robot
Resource        ${EXECDIR}/resources/Pages/LoginPage.robot
Resource        ${EXECDIR}/resources/Pages/DashPage.robot
Resource        ${EXECDIR}/resources/Helpers.robot
Resource        ${EXECDIR}/resources/services.robot

*Keywords*
Start Sessions
    New Browser    chromium                                    False    slowMo=00:00:02
    New Page       https://rocklov-julius-web.herokuapp.com
    

Finish Teste
    Take Screenshot

Take Screenshot And Logout
    Take Screenshot
    Do Logout

Take Screenshot And Go Back
    Take Screenshot
    Go Back

Login Session
    [Arguments]    ${email}    ${password}

    Start Sessions
    ActionLogin.Login With    ${email}     ${password}

