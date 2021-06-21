***Settings***
Resource  ResourceSearchTest.robot

*** Test Cases ***
Test Case 01: Run a Google Search
  Abrir o navegador
  Realizar uma busca pelas palavras-chave "robot framework"
  Checar se a busca retornou resultados
  Acessar o terceiro resultado
  Verificar se é mostrada a página esperada
  Fechar o navegador
