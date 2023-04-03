# Desafio-DIO-Script-Provisionamento-Servidor-Web
Infraestrutura como código - Script de provisionamento de um servidor web (apache)

Para provisionar um servidor web Apache automaticamente, é possível utilizar ferramentas de infraestrutura como código, como o Terraform.

Segue no repositorio arquivo com nome (bash) um exemplo de script de provisionamento de um servidor web Apache utilizando o Terraform

Neste exemplo, o script cria uma instância EC2 na região US West 2 da AWS e configura o Apache no momento da inicialização da instância usando o script user_data.
Além disso, abre o acesso à porta 80 do servidor web no grupo de segurança criado.

Para utilizar este script, é necessário configurar as credenciais da AWS e instalar o Terraform em sua máquina. Com o Terraform instalado, basta executar o comando terraform apply na pasta onde o script foi salvo para criar a infraestrutura definida.
