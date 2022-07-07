FactoryBot.define do
  factory :comment do
    sequence(:customer) { |n| "#{n}" }
    sequence(:content) {|n| "MyStringlalala#{n}" }
  end
end
