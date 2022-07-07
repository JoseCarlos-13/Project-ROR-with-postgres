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

  def destroy
    @comment = Comment.find(params[:id])

    @comment.destroy

    head :no_content
  end

  def update

  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
