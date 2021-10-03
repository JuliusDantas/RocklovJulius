*Settings*
Documentation    KEs de ajuda
Library          OperatingSystem


*Keywords*
GET Json
    [Arguments]    ${file_name}
    ${fixture}     Get File        ${EXECDIR}/resources/fixtures/${file_name}
    ${json}        Evaluate        json.loads($fixture)                           json

    [Return]    ${json}