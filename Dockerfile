FROM starefossen/ruby-node:2-8-slim
RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev
RUN mkdir /streak
WORKDIR /streak
COPY Gemfile Gemfile.lock /streak/
RUN bundle install 
COPY package.json yarn.lock /streak/
RUN yarn
COPY . /streak