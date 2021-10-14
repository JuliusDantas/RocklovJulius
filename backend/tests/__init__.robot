*Settings*
Documentation       Seeds

Resource        ${EXECDIR}/resources/Base.robot

Suite Setup     Create Users


*keywords*
Create Users
    ${users}        Get Json        signup      user_seeds.json

    FOR     ${users}        IN      @{users}
        POST User       ${users}
    END