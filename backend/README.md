# Comandos

## TesteGoogle
robot -d ./log/testegoogle ./tests/TesteGoogle.robot

## Executar todos os testes da suit
robot -d ./log/suittests ./tests

## UserLoginTests
robot -d ./log/logintests ./tests/sessions/UserLoginTest.robot

## AttemptLoginTests
robot -d ./log/atemptlogin  ./tests/sessions/AttemptLoginTests.robot

## SignUpTests
robot -d ./log/signtests  ./tests/signup/SignUpTests.robot

## AttemptSignupTests
robot -d ./log/attemptsignuptests  ./tests/signup/AttemptSignupTests.robot

## AddEquiposTests
robot -d ./log/addequipostests  ./tests/equipos/AddEquiposTests.robot

## GetEquiposTests
robot -d ./log/getequipostests  ./tests/equipos/GetEquiposTests.robot

## DeleteEquiposTests
robot -d ./log/deleteequipostests  ./tests/equipos/DeleteEquiposTests.robot

## GetEquiposTests List
robot -d ./log/getequipostestslist -i List  ./tests/equipos/GetEquiposTests.robot