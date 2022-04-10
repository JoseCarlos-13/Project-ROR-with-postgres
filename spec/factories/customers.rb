FactoryBot.define do
  factory :customer do
    name { "MyString" }
    age { 1 }
    sequence(:email) { |n| "MyString#{n}" }
  end
end
