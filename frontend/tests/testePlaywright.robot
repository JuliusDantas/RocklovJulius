*** Settings ***
Library   Browser

*** Test Cases ***
Example Test
    New Browser     Chromium        False
    New Page    https://playwright.dev
    Take Screenshot
    Get Text    h1    contains    Playwright