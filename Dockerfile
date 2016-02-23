FROM ruby:2.3.0

ENV HOME /srv/app
RUN mkdir $HOME
WORKDIR $HOME

ADD Gemfile* $HOME/
RUN bundle install --deployment

ADD Rakefile $HOME/
RUN rake

ADD . $HOME/

CMD ["libexec/web"]
