*** Settings ***
Library  SeleniumLibrary
Library    String

*** Variables ***
${URL}  https://www.google.com.br/
${BROWSER}  chrome
${SEARCH_FIELD}  class=gLFyf.gsfi
${RESULT_STATS}  id=result-stats
${THIRD_RESULT}  xpath=//*[@id="rso"]/div[3]/div/div/div/div[1]/a/h3
${LINK_TEXT}
${LINK_URL}

*** Keywords ***
Abrir o navegador
  Open Browser  url=${URL}  browser=${BROWSER}
  Maximize Browser Window

Realizar uma busca pelas palavras-chave "${Search_Text}"
  Click Element    ${SEARCH_FIELD}
  Input Text    ${SEARCH_FIELD}  ${Search_Text}
  Press Keys   ${SEARCH_FIELD}  ENTER

Checar se a busca retornou resultados
  Element Should Contain    ${RESULT_STATS}    Aproximadamente
  Element Should Contain    ${RESULT_STATS}    resultados

Acessar o terceiro resultado
  ${LINK_TEXT} =  Get Text    ${THIRD_RESULT}
  ${LINK_TEXT}  Remove String  ${LINK_TEXT}  ...
  Click Element     ${THIRD_RESULT}

Verificar se é mostrada a página esperada
  Page Should Contain    ${LINK_TEXT}

Fechar o navegador
  Close Browser
