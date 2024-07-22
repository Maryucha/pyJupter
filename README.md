# Ambiente em Docker com Júpter e Python

Este repositório contém a configuração necessária para criar um ambiente de desenvolvimento utilizando Docker, com suporte ao Jupyter Notebook e Python. O objetivo é facilitar a criação de um ambiente consistente e reproduzível para desenvolvimento e análise de dados.

## Pré-requisitos

Certifique-se de ter o Docker e Docker Compose instalados em sua máquina. Você pode seguir as instruções nos links abaixo para instalar:

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Como Usar

### Clonando o Repositório

Primeiro, clone este repositório em sua máquina local:

    ```bash
        git clone https://github.com/seu-usuario/docker-jupyter-python.git
        cd docker-jupyter-python
    ```
### Construindo a Imagem Docker
Com o repositório clonado, construa a imagem Docker utilizando o Docker Compose:

    ```bash
     docker-compose build
    ```

### Iniciando o Contêiner
Inicie o contêiner com o seguinte comando:

    ```bash
        docker-compose up
    ```

### Acessando o Jupyter Notebook
Após iniciar o contêiner, você pode acessar o Jupyter Notebook no seu navegador através do seguinte endereço:

```bash
http://localhost:8888
```

Você precisará do token de autenticação gerado pelo Jupyter. Esse token será exibido no terminal onde você executou o comando docker-compose up.

## Estrutura do Projeto

```bash
        .
        ├── Dockerfile
        ├── docker-compose.yml
        ├── notebooks
        │   └── exemple.ipynb
        └── README.md
        └── requirements.txt
        └── .env

        Dockerfile: Define a imagem Docker personalizada.
        docker-compose.yml: Configurações do Docker Compose para orquestrar o contêiner.
        requirements.txt: Definição de libs que o ambiente pode precisar.
        .env: Arquivo de definição das váriaveis de ambiente.
        notebooks/: Diretório onde os notebooks Jupyter são armazenados.
        README.md: Este arquivo.
```
## Customização
Você pode modificar o arquivo Dockerfile para adicionar mais dependências ou mudar a versão do Python conforme necessário. Da mesma forma, você pode editar o docker-compose.yml para ajustar as configurações do contêiner.

 - Exemplo de Dockerfile

```bash
        FROM python:3.8-slim

        RUN pip install --upgrade pip
        RUN pip install jupyter

        WORKDIR /workspace

        CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]

```
- Exemplo de docker-compose.yml

```bash
        version: '3.8'

        services:
        jupyter:
            build: .
            ports:
            - "8888:8888"
            volumes:
            - ./notebooks:/workspace/notebooks
```

## Contribuições
Contribuições são bem-vindas! Sinta-se à vontade para abrir issues e pull requests com melhorias ou correções.

## Licença
Este projeto está licenciado sob a licença MIT - veja o arquivo LICENSE para mais detalhes.

----