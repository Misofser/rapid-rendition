FROM --platform=linux/amd64 ruby:3.1.3

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

CMD rails db:migrate RAILS_ENV=development && rails server -b 0.0.0.0 -p 3000
