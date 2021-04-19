class Show::ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :body
end
