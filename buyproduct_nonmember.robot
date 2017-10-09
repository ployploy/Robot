*** Settings ***
Library           Selenium2Library
resource          ./keyword.robot

Suite Setup    Open Browser    ${SERVER}   Chrome
Test Setup    Go to    ${SERVER} 
Suite Teardown   Close All Browsers


*** Test Cases ***
Buy Product With NonMember Success
    Add to cart
    Checkout 
    Guest login
    Show payment page
 