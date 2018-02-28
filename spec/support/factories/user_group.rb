FactoryBot.define do
  factory :user_group do
    group_name { Faker::Simpsons.location }
  end
end