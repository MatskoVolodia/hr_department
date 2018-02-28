FactoryBot.define do
  factory :post do
    title       { Faker::Friends.character }
    description { Faker::Friends.quote }

    association :user_groups, factory: :user_group
  end
end