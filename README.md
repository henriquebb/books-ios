# Sobre

Estes documento README tem como objetivo fornecer as informações necessárias para realização do projeto **ioasys books**.

# 🏗 O que fazer?
Você deve fazer um fork deste repositório, criar o código e ao finalizar, enviar o link do seu repositório para a nossa equipe. Lembre-se, NÃO é necessário criar um Pull Request para isso, nós iremos avaliar e retornar por e-mail o resultado do seu teste.

# 🚨 Requisitos

Deve ser criado um aplicativo iOS utilizando Swift com as seguintes especificações:

- Seu projeto deverá ser construído utilizando o layout disponibilizado na descrição do teste.
- A integração com a API deve ser feita respeitando todos os contratos de OAuth.
- Login e acesso de Usuário já registrado

**Sinta-se a vontade para:**

- Escolher a arquitetura
- Usar ou não usar bibliotecas
- Estruturar seu layout com storyboards, xibs, view code (UIKit ou SwiftUI).

# 🕵🏻‍♂️ Itens a serem avaliados


Pense no desafio como uma oportunidade de mostrar todo o seu conhecimento. Independente de onde conseguiu chegar no teste, é importante disponibilizar sua implementação para analisarmos.

- Estrutura do projeto
- Consumo de APIs
- Lógica
- Estruturação de layout e fluxo de aplicação
- Utilização de código limpo e princípios SOLID
- Boas práticas da linguagem


# 🎁 Extra

Estes itens não são obrigatórios, porém desejados.

- Testes unitários
- Testes de UI
- Modularização

# 🖥 O que desenvolver?

Você deverá construir um projeto utilizando o layout proposto

- Login e acesso de Usuário já registrado
  - Para o login usamos padrões OAuth 2.0. Na resposta de sucesso do login a api retornará 3 custom headers (access-token, client, uid);
  - Para ter acesso as demais APIs precisamos enviar o 'authorization' no header para autorizar a requisição;
- Listagem de Livros
- Detalhamento do Livro

# 🔗 Links e Informações Importantes

## Layout

- Layout e recortes disponíveis no Figma
- https://www.figma.com/file/YXuqJUzNZcR7GveJfVWCKo/Desafio-Frontend-ioasys-books

## Integração com API

- A documentação da API está disponível a partir de uma página web (https://books.ioasys.com.br/api/docs/).

- **Documentação:** https://books.ioasys.com.br/api/docs/
- **Servidor:** https://books.ioasys.com.br/api/v1
- **Usuário de Teste:** desafio@ioasys.com.br
- **Senha de Teste:** 12341234