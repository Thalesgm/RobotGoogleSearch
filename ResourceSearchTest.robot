*** Settings ***
Library  SeleniumLibrary
Library    String

*** Variables ***
${URL}  https://www.google.com.br/
${BROWSER}  chrome
${SEARCH_FIELD}  class=gLFyf.gsfi
#${SEARCH_BTN}  class=gNO89b
${RESULT_STATS}  id=result-stats
${THIRD_RESULT}  css=#rso > div:nth-child(2) > div > div > div > div.yuRUbf > a > h3
${link_text}
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

Click the third result
  ${link_text} =  Get Text    ${THIRD_RESULT}
  ${link_text}  Remove String  ${link_text}  ...
  Click Element     ${THIRD_RESULT}

Check if the correct page loads
  Page Should Contain    ${link_text}

Close the Browser
  Close Browser
