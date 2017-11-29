FROM starefossen/ruby-node:2-8-slim
RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev
RUN mkdir -p /streak 
WORKDIR /streak
COPY package.json yarn.lock /streak/
RUN yarn
COPY Gemfile Gemfile.lock /
#RUN bundle install 
COPY ./bundler_cache.sh /
RUN chmod +x /bundler_cache.sh
ENTRYPOINT ["/bundler_cache.sh"]
ENV BUNDLE_PATH=/bundle \
    BUNDLE_BIN=/bundle/bin \
    GEM_HOME=/bundle
ENV PATH="${BUNDLE_BIN}:${PATH}"
COPY . /streak