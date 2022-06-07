FactoryBot.define do
  factory :operator do
    sequence(:name) { |n| "operator#{n}" }
    sequence(:email) { |n| "operator#{n}@gmail.com" }
  end
end
