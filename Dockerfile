FROM elixir:latest-alpine as build-elixir
FROM node:10.9-alpine as build-node

RUN apt-get update 
RUN apt-get install -y postgresql-client
RUN apt-get install -y nodejs

RUN mkdir /app
COPY . /app
WORKDIR /app

RUN mix local.hex --force
RUN mix local.rebar --force
RUN mix deps.get
RUN mix do compile

CMD ["/app/entrypoint.sh"]

