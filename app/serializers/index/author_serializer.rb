class Index::AuthorSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :articles, serializer: Index::ArticleSerializer
end
