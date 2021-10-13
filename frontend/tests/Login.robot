*Settings*
Documentation    Login Rocklov

Resource    ${EXECDIR}/resources/Base.robot

Suite Setup      Start Sessions
Test Teardown    Finish Teste      

*Test Cases*
User Login
    [Tags]    usr_login
    # Dado que tenho a página de Login do site Rocklov Julius


    # Preciso preencher o campo e-mail e senha para realizar o login
    ActionLogin.Login With    henrique@henrique.com    henrique@123

    # Então acesso o dashbord dos anuncios
    ActionLogin.User Should Be Logged In    css=.dashboard

    # E saio da página logada
    [Teardown]      Take Screenshot And Logout

Incorret Password
    [Tags]    inc_pass    attempt_login
    # Dado que tenho a página de Login do site Rocklov Julius


    # Preciso preencher o campo e-mail e senha para realizar o login, informando uma senha incorreta
    ActionLogin.Login With    henrique@henrique.com    heique@123

    # Então é retornada uma mensagem de alerta informando que a senha está incorreta
    Components.Alert Text Should Be    Usuário e/ou senha inválidos.

User Not Found
    [Tags]    inc_user    attempt_login
    # Dado que tenho a página de Login do site Rocklov Julius


    # Preciso preencher o campo e-mail e senha para realizar o login, informando uma senha incorreta
    ActionLogin.Login With    heique@henrique.com    henrique@123

    # Então é retornada uma mensagem de alerta informando que a senha está incorreta
    Components.Alert Text Should Be    Usuário e/ou senha inválidos.

Wrong Email
    [Tags]    wrong_email    attempt_login
    # Dado que tenho a página de Login do site Rocklov Julius


    # Preciso preencher o campo e-mail e senha para realizar o login, informando uma senha incorreta
    ActionLogin.Login With    henrique%%henrique.com    henrique@123

    # Então é retornada uma mensagem de alerta informando que a senha está incorreta
    Components.Alert Text Should Be    Oops. Informe um email válido!

Empty Email
    [Tags]    empty_email    attempt_login
    # Dado que tenho a página de Login do site Rocklov Julius


    # Preciso preencher o campo e-mail e senha para realizar o login, informando uma senha incorreta
    ActionLogin.Login With    ${EMPTY}    henrique@123

    # Então é retornada uma mensagem de alerta informando que a senha está incorreta
    Components.Alert Text Should Be    Oops. Informe um email válido!

Empty Password
    [Tags]    empty_pwd    attempt_login
    # Dado que tenho a página de Login do site Rocklov Julius


    # Preciso preencher o campo e-mail e senha para realizar o login, informando uma senha incorreta
    ActionLogin.Login With    henrique@henrique.com    ${EMPTY}

    # Então é retornada uma mensagem de alerta informando que a senha está incorreta
    Components.Alert Text Should Be    Oops. Informe sua senha secreta!