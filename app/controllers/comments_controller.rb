class CommentsController < ApplicationController
  def index
    @comments = Comment.all

    render json: @comments,
           each_serializer: Comment::Index::CommentsSerializer,
           status: :ok
  end
end
