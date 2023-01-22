# PortabilisChallenger
Here i gonna do a rails 6 web app with an api RESTful for portabilis challenger.

## Usando o asdf para controle de versões.
Algumas referências para o uso caso necessário.

[Documentação](https://asdf-vm.com/guide/getting-started.html)

[Akita comentando](https://www.akitaonrails.com/2017/10/24/replacing-rvm-rbenv-nvm-etc-for-asdf)

Após ter todas as versões instaladas é necessário que faça:

* bundle install
* rails db:create
* rails db:migrate
* rails s

## Usuários
Para usar usuários previamentes criados pelo sistema, basta rodar apenas o _rails db:seed_ e acessar com as credenciais:

+ email: 'admin@example.com', password: '123456'
+ email: 'user@example.com', password: '123456'
+ email: 'inactiveuser@example.com', password: '123456' << é um usuário inativo.

## API
Para a api também foi construída um swagger então, caso haja dúvida de como usar recomendo acessa-lo após startar o servidor com rails s na rota _http://localhost:3000/api/swagger_ , mas as principais rotas são:

- _[GET]_    http://localhost:3000/api/v1/users
- _[POST]_   http://localhost:3000/api/v1/users
- _[PUT]_   http://localhost:3000/api/v1/users/:id
- _[DELETE]_ http://localhost:3000/api/v1/users/:id

Obs: O método GET ao ser receber algum parâmetro ele será validado para aparecer só aqueles cujo tem o parâmetro correspondente.

Obs2: Os status validos são: "active" e "inactive", active será default.

Obs3: As roles validas são: "user" e "admin", user será default.