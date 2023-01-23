# # frozen_string_literal: true

require 'sidekiq/web'

Sidekiq.configure_server do |config|
  config.redis = {
    password: ENV['REDIS_PASSWORD'],
    url: "#{ENV['REDIS_URL']}/#{ENV['REDIS_SIDEKIQ_DB']}"
  }
end

Sidekiq.configure_client do |config|
  config.redis = {
    password: ENV['REDIS_PASSWORD'],
    url: "#{ENV['REDIS_URL']}/#{ENV['REDIS_SIDEKIQ_DB']}"
  }
end
