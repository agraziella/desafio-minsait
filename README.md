
# Deploy de WordPress na AWS com Terraform e Docker
  

Este projeto demonstra como criar uma infraestrutura automatizada na AWS usando o Terraform e implantar o WordPress em um contêiner Docker.

## Estrutura do Projeto

```
desafio-minsait/
├── docker-compose.yml
├── dockerfile
├── main.tf
├── provider.tf
├── readme.md
└── setup-docker.sh
```
  

## Pré-requisitos
  

Antes de começar, certifique-se de ter o seguinte:  

1.  **Chaves de Acesso AWS**:
- Crie um usuário IAM na AWS e anote as chaves de acesso (Access Key ID e Secret Access Key).
- Configure as chaves de acesso localmente usando a AWS CLI (`aws configure`).  

2.  **AWS CLI configurado**:
- Configure suas credenciais da AWS com `aws configure`. 

3.  **Terraform instalado na sua máquina** 

4.  **Chave SSH**:

- Crie uma chave SSH válida para se conectar à instância EC2.

- Anote o nome da chave (por exemplo, `my-key-pair`).

  
  

## Como usar
  

1. **Clone este repositório**

	```bash```
	```git clone https://github.com/seu-usuario/desafio-minsait.git```
	```cd desafio-minsait ```

2. **Configure suas variáveis no arquivo** `main.tf`

- Entre aspas, substitua os valores de exemplo pelas suas configurações reais (*AMI, tipo de instância, região*)
- No campo *key_name*, subistitua o nome para o nome da sua chave SSH

3. *Configure suas variáveis no arquivo* `provider.tf`
- Entre aspas, substitua os valores de exemplo pelas suas configurações reais (*access_key, secret_key, region*)

4. **Construa uma imagem Docker**
- Execute o script de configuração Docker
```./setup-docker.sh```

5. **Inicialize o Terraform** 
- No terminal, no diretório do projeto, execute: ```terraform init ``` 

6. **Aplique a Configuração**
- Execute: ```terraform apply ```
- Confirme a aplicação das mudanças quando solicitado.

6. **Acesse a Instância EC2** 
- Após o Terraform criar a instância, use o IP público para acessar a instância com SSH.  Por exemplo: ```ssh -i ~/.ssh/id_rsa ubuntu@<INSTANCE_PUBLIC_IP> ```

7. **Configure o WordPress** 
- No navegador, acesse o IP público da sua instância para configurar o WordPress.   

  

## Referências  

- [Documentação do Terraform](https://developer.hashicorp.com/terraform/docs)

- [Documentação do AWS EC2](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EC2_GetStarted.html)

- [Documentação do Docker](https://docs.docker.com/reference/)