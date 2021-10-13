# import Libriry robotframework-browser
pip uninstall robotframework-browser

# Teste Playwright
robot -d ./log/testePlaywright ./tests/testePlaywright.robot

# Login
robot -d ./log/login ./tests/Login.robot

# Login 2
robot -d ./log/login2 ./tests/Login2.robot

# Login Incorret
robot -d ./log/incorrectpassword -i inc_pass ./tests/Login.robot

# User Not Found
robot -d ./log/usernotfound -i inc_user ./tests/Login.robot

# Wrong Email
robot -d ./log/wrongemail -i wrong_email ./tests/Login.robot

# Empty Email
robot -d ./log/emptyemail -i empty_email ./tests/Login.robot

# Empty Password
robot -d ./log/emptypwd -i empty_pwd ./tests/Login.robot

# All validation Login
robot -d ./log/attemptlogin -i attempt_login ./tests/Login.robot

# Add New Equipo
robot -d ./log/createequipostests ./tests/CreateEquiposTests.robot

# Remove Equipo
robot -d ./log/removeequipostests ./tests/RemoveEquiposTests.robot