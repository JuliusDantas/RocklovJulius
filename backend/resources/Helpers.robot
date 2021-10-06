*Settings*
Documentation    KEs de ajuda
Library          OperatingSystem


*Keywords*
GET Json
    [Arguments]    ${route}  ${file_name}
    ${fixture}     Get File        ${EXECDIR}/resources/fixtures/${route}/${file_name}
    ${json}        Evaluate        json.loads($fixture)                           json

    [Return]    ${json}