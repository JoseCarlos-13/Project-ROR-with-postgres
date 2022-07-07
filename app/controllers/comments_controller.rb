class CommentsController < ApplicationController
  def index
    @comments = Comment.all

    render json: @comments,
           each_serializer: Comment::Index::CommentsSerializer,
           status: :ok
  end

  def show
    @comment = Comment.find(params[:id])

    render json: @comment,
           serializer: Comment::Show::CommentsSerializer,
           status: :ok
  end
end
