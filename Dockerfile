# This is the official Squib Docker image.
#
FROM ruby:3.2-slim
WORKDIR /usr/src/app

LABEL org.squib.url=http://squib.rocks \
      org.squib.github=https://github.com/andymeneely/squib

RUN apt-get update && \
    apt-get install -y \
    libgirepository1.0-dev \
    build-essential \
    ruby-dev \
    ruby \
    ruby-gdk-pixbuf2 \
    libgdk-pixbuf2.0-dev \
    librsvg2-dev \
    git \
    fonts-open-sans

# Build the current directory of Squib
COPY . /usr/src/app
RUN rm -f /usr/src/app/Gemfile.lock
RUN gem install bundler
RUN bundle install
# RUN bundle exec rake install

ENTRYPOINT [ "bash" ]

