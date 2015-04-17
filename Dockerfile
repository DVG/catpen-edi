FROM ruby:2.2.2

RUN apt-get update -qq && apt-get install -y build-essential

ENV APP_HOME /code
RUN mkdir $APP_HOME
WORKDIR $APP_HOME
RUN mkdir log
ADD Gemfile* $APP_HOME/

RUN bundle install

ADD . $APP_HOME/

CMD edi start
