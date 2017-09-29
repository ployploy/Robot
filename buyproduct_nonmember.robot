*** Settings ***
Library           Selenium2Library
resource          ./keyword.robot

Suite Setup    Open Browser    ${SERVER}   Chrome
Test Setup    Go to    ${SERVER} 
Suite Teardown   Close All Browsers

*** Variables ***
${SERVER}         https://www.tarad.com/product/6787017?l-id=th_pc_top_body_history_prod_01
${BROWSER}        Chrome
${TITLE}          กระเป๋าสะพายหนังแท้ฝาหน้าครึ่งน้ำตาลเข้ม # 6787017

*** Test Cases ***
Buy Product With NonMember Success
    Add to cart
    Checkout 
    Guest login
    Show payment page