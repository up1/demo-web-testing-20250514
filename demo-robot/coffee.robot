*** Settings ***
Library    SeleniumLibrary

*** VARIABLES ***
${URL}    https://seleniumbase.io/coffee

*** Test Cases ***
ลูกค้าทำการซื้อ espresso จำนวน 2 แก้ว
    เข้ามายังหน้า list ของกาแฟ
    ทำการเลือก espresso จำนวน 2 แก้ว
    ใน cart จะต้องมี espresso จำนวน 2 แก้ว ราคา 20.00
    ทำการ checkout

*** Keywords ***
ทำการ checkout
    Click Element    xpath=//*[@id="app"]/div[2]/div/div[1]/button
    Input Text    id=name   Somkiat
    Input Text    id=email   somkiat@xxx.com
    Click Element    id=submit-payment
    Wait Until Page Contains    Thanks

ใน cart จะต้องมี espresso จำนวน 2 แก้ว ราคา 20.00
    Click Element    xpath=//*[@id="app"]/ul/li[2]/a
    Wait Until Element Contains    xpath=//*[@id="app"]/div[2]/div/div[1]/button   
    ...    Total: $20.00

ทำการเลือก espresso จำนวน 2 แก้ว
    Click Element    xpath=//*[@data-test="Espresso"]
    Click Element    xpath=//*[@data-test="Espresso"]


เข้ามายังหน้า list ของกาแฟ
    Open Browser    ${URL}    chrome
    ...    options=add_experimental_option("detach", True)
    
    Maximize Browser Window