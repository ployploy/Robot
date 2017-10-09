*** Settings ***
Library           Selenium2Library
resource          ./keyword.robot

Suite Setup    Open Browser    ${SERVER}   Chrome
Test Setup    Go to    ${SERVER} 
Suite Teardown   Close All Browsers


*** Test Cases ***
Buy Product By Installment
    Select product over 1 piece
    Add to cart
    Payment by installment
    Guest login
    Show payment page