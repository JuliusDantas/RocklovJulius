*Settings*
Documentation    Add Equipos tests

Resource    ${EXECDIR}/resources/Base.robot


*Test Cases*
Add New Equipos
    ${token}     Get token    jose@Jose.com.br    Jose@123
    ${equipo}    Get Json     equipos             fender.json

    Remove Equipo    ${equipo}[payload][name]

    ${response}         POST Equipo    ${equipo}      ${token}    
    Status Should be    200            ${response}
