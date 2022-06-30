FactoryBot.define do
  factory :book do
    sequence(:title) { |n| "MyString#{n}" }
    sinopsis { "MyText" }
    sequence(:release_date) { |n| "202#{n}-10-27" }
    author { nil }
    book_cover { Rack::Test::UploadedFile.new('app/assets/images/ruby_symbol.png', 'image/png') }
  end
end
