FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }

    factory :user_admin do
      role { 'admin' }
    end

    factory :user_normal do
      role { 'user' }
    end
  end
end
