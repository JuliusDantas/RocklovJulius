*Settings*
Documentation    Signup Tests

Resource    ${EXECDIR}/resources/Base.robot


*Test Cases*
Add New User
    ${payload}              Get Json               signup    new_user.json
    Remove User By Email    ${payload["email"]}
    Log     ${payload["email"]}

    ${response}         POST User    ${payload}
    Status Should be    200          ${response}

Duplicated Email
    ${payload}              Get Json               signup    duplicated.json
    
    POST User    ${payload}
  
    ${response}         POST User    ${payload}
    Status Should be    409          ${response}




    