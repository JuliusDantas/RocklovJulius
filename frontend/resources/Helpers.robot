*Settings*
Documentation    KEs de ajuda
Library          OperatingSystem


*Keywords*
GET Equipo
    [Arguments]    ${equipo}
    ${fixture}     Get File    ${EXECDIR}/resources/fixtures/equipos.json
    ${json}        Evaluate    json.loads($fixture)                                   json

    ${select_equipo}        Set Variable        ${json}[${equipo}]

    [Return]    ${select_equipo}