*Settings*
Documentation    Seeds Users

Resource    ${EXECDIR}/resources/Base.robot

Suite Setup    Create Users


*keywords*
Create Users
    ${file}     Get File    ${EXECDIR}/resources/fixtures/users-seeds.json
    ${users}    Evaluate    json.loads($file)                                 json

    FOR                  ${user}     IN    @{users}
        Remove User By Email    ${user}[email]
        POST User Service       ${user}
    END