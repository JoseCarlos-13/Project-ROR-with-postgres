FactoryBot.define do
  factory :author do
    name { "MyString" }
    author_image { Rack::Test::UploadedFile.new('app/assets/images/ruby_symbol.png', 'image/png') }
  end
end
