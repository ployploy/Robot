*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported Selenium2Library.
Library           Selenium2Library
resource          ./keyword.robot

Suite Setup    Open Browser    ${SERVER}   Chrome
Test Setup    Go to    ${SERVER} 
Suite Teardown   Close All Browsers

*** Variables ***
${SERVER}         https://www.tarad.com/product/6787017?l-id=th_pc_top_body_history_prod_01
${BROWSER}        Chrome
${TITLE}          กระเป๋าสะพายหนังแท้ฝาหน้าครึ่งน้ำตาลเข้ม # 6787017
${USER NAME}      chonnikan.t@kkumail.com
${PASSWORD}       ploy1038
# ${TOTAL PRICE}    930.00
${FEE}            50.00
${HIGH PRICE}     34,320.00


*** Test Cases ***
Buy Product With NonMember Success
    Add to cart
    Checkout 
    Guest login
    Show payment page
    
 
# Buy Product With Member Success
#     # Open product detailsro
#     Add to cart
#     Checkout 
#     Login by member    ${USER NAME}     ${PASSWORD}
#     Show payment page


# Buy More With NonMember Success
#     # Open product details
#     Add to cart
#     Buymore
#     Select product 
#     Add to cart
#     Checkout
#     # Guest login
#     Show payment page

# Buy More With Member Success
#     # Open product details
#     Add to cart
#     Buymore
#     Select product 
#     Add to cart
#     Checkout
#     # Login by member    ${USER NAME}     ${PASSWORD}
#     Show payment page

# Buy Product Overpriced 30000 Bath
#     # Open product details
#     Select product over 1 piece
#     Add to cart
#     Payment by installment
#     # Guest login
#     Show payment page
#     Check not show payment by counter service
