FactoryBot.define do
  factory :book do
    sequence(:title) { |n| "MyString#{n}" }
    sinopsis { "MyText" }
    sequence(:release_date) { |n| "202#{n}-10-27" }
    author { nil }

    after(:build) do |book|
      image_path = Rails.root.join("app", "assets", "images", "ruby_symbol.png")
      image = fixture_file_upload(image_path, 'image/png')

      book.book_cover.attach(image)
    end
  end
end
