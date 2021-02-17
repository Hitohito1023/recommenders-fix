class PostCommentsController < ApplicationController
  before_action :authenticate_user!


  def create
    @post_item = PostItem.find(params[:post_item_id])
    @post_comment = PostComment.new(post_comment_params)
    @post_comment.post_item_id = @post_item.id
    @post_comment.user_id = current_user.id
    @post_comments = @post_item.post_comments.order(created_at: :desc)
    @post_comment.save
    render :create
  end

  def destroy
    @post_item = PostItem.find(params[:post_item_id])
    @post_comments = @post_item.post_comments.order(created_at: :desc)
    post_comment = @post_item.post_comments.find(params[:id])
    post_comment.destroy
    render :destroy
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
