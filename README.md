# Desafio Supremo

Utilizando a nossa API, você deverá criar uma app que apresente o saldo e as movimentações financeiras de um usuário, uma tela com os detalhes da movimentação selecionada e a opção de compartilhamento do mesmo. O layout deverá ser semelhante ao apresentado neste README. Legal, certo?

Pense no desafio como uma oportunidade de mostrar todo o seu conhecimento. Faça-o com calma! Vamos avaliar como você lida com as seguintes situações:

- Consumo de APIs;

- Construção de Layout a partir de um modelo de tela;

- Persistência de dados (Ocultar saldo);

- Estruturação de layout;

- Lógicas de apresentação de variações de layout;

## Fluxo da aplicação.

Os pré-requisitos para Android são:

- Usar Kotlin na versão mais atual

- Use a code style guide oficial: Kotlin style guide | Android Developers

Os pré-requisitos para React Native são:

- Usar a versão mais recente do React Native React Native · Learn once, write anywhere

- Usar o style guide do AirBnB para React / Javascript GitHub - ronal2do/airbnb-react-styleguide

- Reforçar o style guide utilizando ESLint ou ferramenta similar GitHub - eslint/eslint: Find and fix problems in your JavaScript code.

- Utilizar functional components

Os pré-requisitos para iOS são:

- que o código seja feito em Swift, de preferência na versão mais atual, dando suporte a iOS 13.0.0+.

- que você siga nossa Code Style Guide

- Estruturar seu layout com ViewCode

Os pré-requisitos para Flutter são:

- WIP

Fora isso, sinta-se a vontade para:

- Usar ou não usar bibliotecas;

- Adotar a Pattern de visualização (MVC, MVVM … ) que você quiser.

A qualidade muito importante se você conseguir crie testes automatizados. Entretanto, sei que não é um tópico dominado por todos, por isso aceito desafios com todos os perfis e diferentes momentos de experiência e conhecimento técnico.

## Features

- Tratamento de erros e apresentação de: Error genérico, loading;

- Buscar saldo da rota myBalance;

- Ao tocar no ícone de olho do saldo, o mesmo deve ser escondido e apresentado conforme modelo de tela anexado.
  OBS: Esta flag deverá ser persistida.

- Buscar lista de itens do extrato da rota myStatement com paginação de 10 itens por request(scroll infinito);

- Ao tocar em um item do extrato deverá abrir uma tela de detalhes.

- A tela de detalhes deverá consumir a rota de myStatement/detail informando o id do item selecionado como parâmetro;

- Ao tocar no botão de compartilhar, deverá ser compartilhada a imagem da área de informações do comprovante abrindo a alert padrão da plataforma.
