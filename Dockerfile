## Imagem base onde os comandos serão executados
## neste caso uma imagem linux com o sdk dotnet instalado
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS base

## Criando e entrando em uma pasta para realizar a configuração
## Se este passo não fosse feito, a configuração ficaria na raiz do sistema
WORKDIR /app

## Copiando conteudo_aplicacao para workdir_imagem_base
COPY ./ ./
## COPY ./Dockerfile ./app/docker

RUN dotnet publish -c Release -o out

## Ambiente onde a aplicação irá ser executada
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS release

## Copiando da imagem base o conteúdo de out
## Adicionando na pasta raiz declarada anteriormente
## workdir /app
COPY --from=base /app/out .

## Sem o parâmetro -p, a porta estaria exposta apenas dentro do container
EXPOSE 8080
## Para definir a porta externa, rodar o comando
## docker run -p 8080:8080 -it imagename
## porta_externa:porta_interna

## Start aplicação ENTRYPOINT ou CMD
ENTRYPOINT ["dotnet", "fiap-githubactions-03.dll"]