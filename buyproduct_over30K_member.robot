*** Settings ***
Library           Selenium2Library
resource          ./keyword.robot

Suite Setup    Open Browser    ${SERVER}   Chrome
Test Setup    Go to    ${SERVER} 
Suite Teardown   Close All Browsers


*** Test Cases ***
Buy Product Overpriced 30000 Bath
    Select product over 1 piece
    Add to cart
    Checkout
    Login by member    ${USER NAME}     ${PASSWORD}
    Show payment page
    Check not show payment by counter service