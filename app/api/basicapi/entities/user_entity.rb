# frozen_string_literal: true

module Basicapi
  module Entities
    class UserEntity < Grape::Entity
      root 'data', 'data'
      expose :id
      expose :type
      expose :attributes do
        expose :email
        expose :status
        expose :created_at, as: 'created-at'
        expose :updated_at, as: 'updated-at'
      end

      private

      def type
        'user'
      end
    end
  end
end