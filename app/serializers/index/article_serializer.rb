class Index::ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :body
end
