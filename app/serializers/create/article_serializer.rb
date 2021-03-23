class Create::ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :body
end
