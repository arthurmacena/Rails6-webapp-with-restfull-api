# PortabilisChallenger
Here i gonna do a rails 6 web app with an api RESTful for portabilis challenger.

## Usando o asdf para controle de versões.
Algumas referências para o uso caso necessário.

[Documentação](https://asdf-vm.com/guide/getting-started.html)

[Akita comentando](https://www.akitaonrails.com/2017/10/24/replacing-rvm-rbenv-nvm-etc-for-asdf)

Para ter todas as versões necessárias instaladas e rodar o projeto podemos seguir os passos abaixo, na pasta base do projeto:

* asdf install
* bundle install
* rails db:create
* rails db:migrate
* yarn install
* foreman start

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

Obs2: Os status validos são: "active" e "inactive", "active" será default.

Obs3: As roles validas são: "user" e "admin", "user" será default.

## Email
Para receber o email é necessário que você tenha a gem mailcatcher, que pode ser instalada usando o comando:

_gem install mailcatcher_

após isso, dê o comando _mailcatcher_ no console que ele abrirá uma instância de um simulador de e-mail na sua porta host, acesse ela pelo navegador e ao criar um usuário você verá o e-mail de boas vindas.

## Envios assincronos
Para controlar os envios de e-mails de forma assincrona foi usado o sidekiq, que pode ser acessado após o comando _foreman start_ do sistema pelo link:

http://localhost:3000/sidekiq

## Testes
Para fazer os testes automatizados foi utilizado foi utilizado o rspec, para poder rodar os testes basta dar o comando _rspec_ na pasta root do projeto, após as configurações

## Frontend Clean
Para o frontend foi utilizado a biblioteca de CSS do bootstrap 5 junto ao adminlte 3, para obter views mais padronizadas.

## Exemplos de Requisições 

_Criar Usuário_:

[POST] localhost:3000/api/v1/users

envio:

{
	"email": "teste@example.com",
	"password": "123123",
	"role": "user",
	"status": "active"
}

retorno:

{
	"data": {
		"id": 35,
		"type": "user",
		"attributes": {
			"email": "teste@example.com",
			"status": "active",
			"created-at": "2023-01-24T00:39:59.302Z",
			"updated-at": "2023-01-24T00:39:59.302Z"
		}
	}
}

_Tornar Usuário Inativo_:

[PUT] localhost:3000/api/v1/users/35

envio:

{
	"status": "inactive"
}

retorno:

{
	"data": {
		"id": 35,
		"type": "user",
		"attributes": {
			"email": "teste@example.com",
			"status": "inactive",
			"created-at": "2023-01-24T00:39:59.302Z",
			"updated-at": "2023-01-24T00:40:50.267Z"
		}
	}
}