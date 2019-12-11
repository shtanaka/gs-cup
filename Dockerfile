FROM elixir:latest

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - \
 && apt-get install -y postgresql-client inotify-tools nodejs

RUN mkdir /app
COPY . /app
WORKDIR /app

RUN mix local.hex --force
RUN mix local.rebar --force
RUN mix deps.get
RUN mix do compile

CMD ["/app/entrypoint.sh"]

