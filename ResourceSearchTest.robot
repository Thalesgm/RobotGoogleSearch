*** Settings ***
Library  SeleniumLibrary
Library    String

*** Variables ***
#${URL}  https://www.google.com.br/
${BROWSER}  chrome
${SEARCH_FIELD}  class=gLFyf.gsfi
${RESULT_STATS}  id=result-stats
${THIRD_RESULT}  xpath=//*[@id="rso"]/div[3]/div/div/div/div[1]/a/h3
${RESULT_URL}  xpath=//*[@id="rso"]/div[3]/div/div/div/div[1]/a/div/cite
${LINK_TEXT}
${LINK_URL}


*** Keywords ***
Abrir o navegador
  Open Browser  browser=${BROWSER}
  #url=${URL}  browser=${BROWSER}
  Maximize Browser Window

Acessar o "${url}"
  Go To  ${url}
Realizar uma busca pelas palavras-chave "${Search_Text}"
  Click Element  ${SEARCH_FIELD}
  Input Text  ${SEARCH_FIELD}  ${Search_Text}
  Press Keys  ${SEARCH_FIELD}  ENTER

Checar se a busca retornou resultados
  Element Should Contain  ${RESULT_STATS}    Aproximadamente
  Element Should Contain  ${RESULT_STATS}    resultados

Acessar o terceiro resultado
  #Wait Until Element Is Visible  ${THIRD_RESULT}

  #Validação via Elemento Textual
  ${LINK_TEXT} =  Get Text    ${THIRD_RESULT}
  ${LINK_TEXT}  Remove String  ${LINK_TEXT}  ...

  #Validação via URL exibida como resultado.
  ${LINK_URL} =  Get Text  ${RESULT_URL}
  ${LINK_URL}  Remove String  ${LINK_URL}  ...
  ${LINK_URL} =  Replace String  ${LINK_URL}  ›  /
  ${LINK_URL} =  Replace String  ${LINK_URL}  ${SPACE}  ${EMPTY}

  Set Test Variable  ${LINK_TEXT}
  Set Test Variable  ${LINK_URL}
  Click Element  ${THIRD_RESULT}

Verificar se é mostrada a página esperada
  Page Should Contain  ${LINK_TEXT}
  ${URL_ATUAL} =  Get Location
  Should Contain  ${URL_ATUAL}  ${LINK_URL}

Verificar se a página mostrada contém "${TERM}"
  Page Should Contain  ${TERM}
Fechar o navegador
  Close Browser
