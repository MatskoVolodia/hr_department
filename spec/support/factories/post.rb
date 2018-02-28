FactoryBot.define do
  factory :post do
    title   { Faker::Friends.character }
    content { Faker::Friends.quote }
  end
end