class Create::ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :author_id
end
