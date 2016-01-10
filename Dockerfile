FROM jtrim/heroku-phoenix

ARG MIX_ENV
ENV MIX_ENV ${MIX_ENV:-prod}

ADD mix.exs /app/user/
ADD mix.lock /app/user/
RUN mix deps.get

ADD package.json /app/user/
RUN npm install

ADD ./web/static /app/user/web/static/
ADD ./brunch-config.js /app/user/
RUN ./node_modules/brunch/bin/brunch build --production
RUN mix phoenix.digest

ADD . .

RUN mix compile

EXPOSE 4000 4001
CMD ["mix", "phoenix.server"]
