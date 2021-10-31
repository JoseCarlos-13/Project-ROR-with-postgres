FactoryBot.define do
  factory :book do
    title { "MyString" }
    sinopsis { "MyText" }
    release_date { "2021-10-27" }
    author { nil }
  end
end
