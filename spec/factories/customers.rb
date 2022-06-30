FactoryBot.define do
  factory :customer do
    sequence(:name) { |n| "MyString#{n}" }
    age { 1 }
    sequence(:email) { |n| "MyString#{n}@gmail.com" }
    customer_image { Rack::Test::UploadedFile.new('app/assets/images/ruby_symbol.png', 'image/png') }
  end
end
