FROM ruby:3.2.2

RUN apt-get update -qq && apt-get install -y default-mysql-client

WORKDIR /search-demo

COPY Gemfile /search-demo/Gemfile
COPY Gemfile.lock /search-demo/Gemfile.lock

RUN bundle install

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
