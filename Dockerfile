FROM ruby:2.5.1

RUN mkdir -p /app
WORKDIR /app

RUN \
  apt-get update -y && apt-get install -y --no-install-recommends apt-utils \
  imagemagick \
  libxml2-dev \
  libxslt-dev \
  yarn \
  nano \
  curl

#Locales
RUN apt-get clean && apt-get update && apt-get install -y locales
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Node
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash
RUN apt-get install -y nodejs
RUN apt-get install -y build-essential
RUN npm install -g yarn

ADD Gemfile Gemfile.lock ./
CMD cp envexample .env
ENV RAILS_ENV production
ENV RACK_ENV production

ADD . ./
ENV BUNDLER_VERSION 2.0.1
RUN gem install bundler -v '2.0.1' && bundle install --jobs 20 --retry 5

RUN  RAILS_ENV=production bundle exec rake assets:precompile
