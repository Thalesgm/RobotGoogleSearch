*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}  https://www.google.com/
${BROWSER}  chrome
${SEARCH_FIELD}  class=gLFyf.gsfi
#${SEARCH_BTN}  class=gNO89b
${RESULT_STATS}  id=result-stats
${THIRD_RESULT}  css=#rso > div:nth-child(2) > div > div > div > div.yuRUbf

#xpath=#//*[@id="rso"]/div[4]/div/div/div[1]
#/html/body/div[7]/div/div[9]/div[1]/div/div[2]/div[2]/div/div/div[3]/div/div/div[1]/a
#rso > div:nth-child(2) > div > div > div > div.yuRUbf
*** Keywords ***
Open the Browser
  Open Browser  url=${URL}  browser=${BROWSER}
  Maximize Browser Window

Run a search for "${Search_Text}"
  Click Element    ${SEARCH_FIELD}
  Input Text    ${SEARCH_FIELD}  ${Search_Text}
  Press Keys   ${SEARCH_FIELD}  ENTER

Check if search returned results
  Element Should Contain    ${RESULT_STATS}    Aproximadamente
  Element Should Contain    ${RESULT_STATS}    resultados

Click the third result and check if the correct page loads
  ${link_text} =  Get Text    css=#rso > div:nth-child(2) > div > div > div > div.yuRUbf > a > h3
  #css=#rso > div:nth-child(2) > div > div > div > div.yuRUbf > a > div > cite
  Click Element     ${THIRD_RESULT}
  Page Should Contain    ${link_text}

Close the Browser
  Close Browser
