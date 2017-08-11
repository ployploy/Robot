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
${TOTAL PRICE}    930.00
${FEE}            50.00


*** Test Cases ***
# Buy product with non member success
#     Open product details
#     Add to cart
#     Checkout 
#     Guest login
#     Show payment page
 
# Buy product with member success
#     Open product details
#     Add to cart
#     Checkout 
#     Login by member
#     Show payment page


Buy more with non member success
    Open product details
    Add to cart
    Buymore
    Select product 
    Add to cart
    Checkout
    Guest login
    Show payment page

# Buy more with member success
#     Open product details
#     Add to cart
#     Buymore
#     Select product 
#     Add to cart
#     Checkout
#     Login by member
#     Show payment page

    

# Buy more success
#     Add to cart
#     Preorder by non member
#     Open Browser    ${SERVER}    ${BROWSER}
#     Title Should Be    ${TITLE}
#     Click Button    xpath=//input[@type=\"submit\" and @name=\"f_buy\"]
#     Wait Until Element Is Visible    xpath=//a[@class=\'normal_a'\]
#     Execute javascript    document.getElementsByClassName('left_colno-installment')[0].click()
#     Wait Until Element Is Visible    id=btn-cont
#     Click Element    id=btn-cont
    # Click Element   xpath=//a[@class=\'NewProductLink'\][1]

*** Keywords ***
Open product details
    Open Browser    ${SERVER}    ${BROWSER}

Add to cart
    # Title Should Be    ${TITLE}
    Click Button    xpath=//input[@type=\"submit\" and @name=\"f_buy\"]
    Wait Until Element Is Visible    xpath=//a[@class=\'normal_a'\]
    ${amount}    Get Text    xpath=//span[@class=\'black-title'\]
    ${price}    Get Text    xpath=//span[@class=\'header12_css'\]
    Log To Console    ${price}

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
    


# Checkout by non member
#     Execute javascript    document.getElementsByClassName('normal_a')[0].click()
#     Wait Until Page Contains    ตะกร้าสินค้า
#     Click Button    xpath=//button[@class=\'btn btn-large btn-order-nopoint'\]

# Checkout by Register
#     Execute javascript    document.getElementsByClassName('normal_a')[0].click()
#     Wait Until Page Contains    ตะกร้าสินค้า
#     Input Text    cart_username    ${USER NAME}
#     Input Text    cart_password    ${PASSWORD}
#     Click Button    xpath=//input[@class=\'btn btn-large btn-danger odp-member-login-btn'\]

# Payment
#     ${price}    Get Text    xpath=//span[@class=\'span-net-price'\]
#     Should Be Equal    ${price}    ${TOTAL PRICE}