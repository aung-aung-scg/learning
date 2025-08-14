# syntax=docker/dockerfile:1
ARG RUBY_VERSION=3.3.6
FROM ruby:$RUBY_VERSION-slim

WORKDIR /rails

# 1. Install system dependencies
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
      build-essential \
      libpq-dev \
      libvips \
      postgresql-client && \
    rm -rf /var/lib/apt/lists/*

# 2. Create a rails user
RUN useradd -m rails

# 3. Prepare bundler directory and permissions
RUN mkdir -p /usr/local/bundle && \
    chown -R rails:rails /usr/local/bundle

# 4. Set environment variables
ENV RAILS_ENV=production \
    BUNDLE_PATH="/usr/local/bundle" \
    BUNDLE_WITHOUT="test" \
    PATH="/rails/bin:$PATH"

# 5. Copy Gemfiles first
COPY Gemfile Gemfile.lock ./

# 6. Install the exact bundler version and clean install gems
RUN gem install bundler -v 2.6.8 --force && \
    bundle _2.6.8_ install --jobs 4 --retry 3 --clean

# 7. Copy the rest of the app and fix permissions
COPY . .
RUN chown -R rails:rails /rails

# 8. Switch to rails user
USER rails

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
