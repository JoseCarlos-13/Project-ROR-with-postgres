class Comment::Index::CommentsSerializer < ActiveModel::Serializer
  attributes :id, :content, :customer_id
end
