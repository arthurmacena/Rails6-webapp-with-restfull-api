# frozen_string_literal: true

require 'grape-swagger'

module Basicapi
  class API < Grape::API
    version 'v1', using: :path
    format :json
    prefix :api

    # Api routes
    mount Basicapi::V1::UsersAPI

    add_swagger_documentation \
    info: {
      title: "RH comunication API",
      description: "RESTful API for users.",
      add_version: true,
    }
  end
end
