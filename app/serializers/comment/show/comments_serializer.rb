class Comment::Show::CommentsSerializer < ActiveModel::Serializer
  attributes :id, :content, :customer_id
end
