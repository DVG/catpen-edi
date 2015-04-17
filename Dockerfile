FROM ruby:2.2.2

RUN apt-get update -qq && apt-get install -y build-essential

ENV APP_HOME /code
RUN mkdir $APP_HOME
WORKDIR $APP_HOME
RUN mkdir log
RUN touch log/edi.log
ADD Gemfile* $APP_HOME/

RUN bundle install

ADD config/catpen-services.yml $APP_HOME/config/
RUN mv config/catpen-services.yml config/services.yml

ADD . $APP_HOME/
