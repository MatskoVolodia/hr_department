FactoryBot.define do
  factory :employee do
    email      { Faker::Internet.email }
    password   { '123123123'}
    first_name Faker::Name.first_name
    last_name  Faker::Name.last_name
  end
end