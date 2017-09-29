*** Keywords ***
Open product details
    Open Browser    ${SERVER}    ${BROWSER}

Select product over 1 piece
    Click Element  xpath=//select[@name="product_qty"]/option[@value=35]

Add to cart
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
    [Arguments]    ${USER NAME}    ${PASSWORD}
    Input Text    cart_username    ${USER NAME}
    Input Text     cart_password    ${PASSWORD}
    Click Button    xpath=//input[@class=\'btn btn-large btn-danger odp-member-login-btn'\]
    
Buymore
    Wait Until Element Is Visible    id=btn-cont
    Click Element    id=btn-cont

Payment by installment
    Click Element    id=btn-installment
    Wait Until Page Contains    ตะกร้าสินค้า

Select product
    Click Image    xpath=//img[@src=\'http://www.tarad.com/images/event_discount/tmail/281016/double2shop/double2shop_03.jpg'\]

Check show payment by counter service
    ${Total price}    Get Text    xpath=//td[@class=\'price product-total-price-6787017_0'\]
    Should Not Be Equal    ${HIGH PRICE}    ${Total price}
    # Should Not Contains    เคาน์เตอร์เซอร์วิส   
    Wait Until Page Contains    เคาน์เตอร์เซอร์วิส

Check not show payment by counter service  
    ${Total price}    Get Text    xpath=//td[@class=\'price product-total-price-6787017_0'\]
    Wait Until Page does NOT contain element    xpath=//span[@class=\'payment-txt'\]/alt[@span=เคาน์เตอร์เซอร์วิส]
   