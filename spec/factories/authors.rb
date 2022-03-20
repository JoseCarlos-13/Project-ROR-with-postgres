FactoryBot.define do
  factory :author do
    name { "MyString" }

    after (:build) do |author|
      file_path = Rails.root.join('app', 'assets', 'images', 'ruby_symbol.png')
      file = fixture_file_upload(file_path, 'image/png')

      author.author_image.attach(file)
    end
  end
end
