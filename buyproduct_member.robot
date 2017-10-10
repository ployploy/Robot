*** Settings ***
Library           Selenium2Library
resource          ./keyword.robot

Suite Setup    Open Browser    ${SERVER}   Chrome
Test Setup    Go to    ${SERVER} 
Suite Teardown   Close All Browsers


*** Test Cases ***
Success, Member Buy Product 880 Baht Get 8 Reward Point
    Add to cart
    Checkout 
    Login by member    ${USER NAME}     ${PASSWORD}
    Show payment page
    Get reward point