***Settings***
Resource  ResourceSearchTest.robot

*** Test Cases ***
Test Case 01: Realizar Busca no Google
  Abrir o navegador
  Acessar o "https://www.google.com.br/"
  Realizar uma busca pelas palavras-chave "robot framework"
  Checar se a busca retornou resultados
  Acessar o terceiro resultado
  Verificar se é mostrada a página esperada
  Fechar o navegador
