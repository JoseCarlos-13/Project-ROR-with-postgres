FactoryBot.define do
  factory :comment do
    customer { nil }
    sequence(:content) {|n| "MyStringlalala#{n}" }
  end
end
