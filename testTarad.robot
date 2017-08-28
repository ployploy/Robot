*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported Selenium2Library.
Library           Selenium2Library

Test Teardown   Close All Browsers

*** Variables ***
${SERVER}         https://www.tarad.com/product/6787017?l-id=th_pc_top_body_history_prod_01
${BROWSER}        Chrome
${TITLE}          กระเป๋าสะพายหนังแท้ฝาหน้าครึ่งน้ำตาลเข้ม # 6787017
${USER NAME}      chonnikan.t@kkumail.com
${PASSWORD}       ploy1038
# ${TOTAL PRICE}    930.00
${FEE}            50.00
${HIGH PRICE}     30,800.00


*** Test Cases ***
Buy product with non member success
    Open product details
    Add to cart
    Checkout 
    Guest login
    Show payment page
    
 
Buy product with member success
    Open product details
    Add to cart
    Checkout 
    Login by member
    Show payment page


Buy more with non member success
    Open product details
    Add to cart
    Buymore
    Select product 
    Add to cart
    Checkout
    Guest login
    Show payment page

Buy more with member success
    Open product details
    Add to cart
    Buymore
    Select product 
    Add to cart
    Checkout
    Login by member
    Show payment page

Buy product overpriced 30000 bath
    Open product details
    Select product over 1 piece
    Add to cart
    Checkout 
    Guest login
    Show payment page
    Check not show payment by counter service


*** Keywords ***
Open product details
    Open Browser    ${SERVER}    ${BROWSER}

Select product over 1 piece
    Click Element  xpath=//select[@name="product_qty"]/option[@value=35]

Add to cart
    # Title Should Be    ${TITLE}
    Click Button    xpath=//input[@type=\"submit\" and @name=\"f_buy\"]
    Wait Until Element Is Visible    xpath=//a[@class=\'normal_a'\]
    ${amount}    Get Text    xpath=//span[@class=\'black-title'\]
    ${price}    Get Text    xpath=//span[@class=\'header12_css'\]
    # Log To Console    ${price}

Checkout
    Click Element    id=btn-payment
    Wait Until Page Contains    ตะกร้าสินค้า

Guest login
   Click Button    xpath=//button[@class=\'btn btn-large btn-order-nopoint'\]
    

Show payment page
    ${Price}    Get Text    xpath=//td[@class=\'price cart-info-shipping-cost'\]
    Should Be Equal    ${price}    ${Price}

Login by member
    Input Text    cart_username    ${USER NAME}
    Input Text    cart_password    ${PASSWORD}
    Click Button    xpath=//input[@class=\'btn btn-large btn-danger odp-member-login-btn'\]
    
Buymore
    Wait Until Element Is Visible    id=btn-cont
    Click Element    id=btn-cont

Select product
    Click Image    xpath=//img[@src=\'http://www.tarad.com/images/event_discount/tmail/281016/double2shop/double2shop_03.jpg'\]

Check show payment by counter service
    ${Total price}    Get Text    xpath=//td[@class=\'price product-total-price-6787017_0'\]
    Should Not Be Equal    ${HIGH PRICE}    ${Total price}
    # Should Not Contains    เคาน์เตอร์เซอร์วิส   
    Wait Until Page Contains    เคาน์เตอร์เซอร์วิส

Check not show payment by counter service  
    ${Total price}    Get Text    xpath=//td[@class=\'price product-total-price-6787017_0'\]
    Should Be Equal    ${HIGH PRICE}    ${Total price}
    Wait Until Page does NOT contain element    xpath=//span[@class=\'payment-txt'\]/alt[@span=เคาน์เตอร์เซอร์วิส]
   