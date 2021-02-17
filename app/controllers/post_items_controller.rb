class PostItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy, :complete]
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]


  def index
    @genres = Genre.all
    if params[:genre_id]
      @genre = @genres.find(params[:genre_id])
      all_post_items = @genre.post_items.page(params[:page]).reverse_order
    else
      all_post_items = PostItem.page(params[:page]).reverse_order
    end
    @post_items = all_post_items.page(params[:page]).reverse_order
    @all_post_items_count = all_post_items.count
  end

  def show
    @post_item = PostItem.find(params[:id])
    @post_comment = PostComment.new
    @post_comments = @post_item.post_comments.order(created_at: :desc).page(params[:page]).per(6)
    @user = @post_item.user
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @post_item = PostItem.new
    @genre = Genre.new
  end

  def create
    @post_item = PostItem.new(post_item_params)
    @post_item.user_id = current_user.id
    if @post_item.save
      redirect_to post_items_complete_path
    else
      @post_items = PostItem.all
      render 'new', alert: "投稿に失敗しました。"
    end
  end

  def edit
    @genres = Genre.all
    @post_item = PostItem.find(params[:id])
  end

  def update
    @post_item = PostItem.find(params[:id])
    if @post_item.update(post_item_params)
      redirect_to post_item_path(@post_item), notice: "変更を保存しました。"
    else
      render "edit", alert: "変更が保存できませんでした。"
    end
  end

  def destroy
    @post_item = PostItem.find(params[:id])
    @post_item.destroy
    redirect_to post_items_path, notice: "投稿を削除しました。"
  end

  def complete
    @genres = Genre.all
  end

  private

  def post_item_params
    params.require(:post_item).permit(:name, :introduction, :image, :genre_id)
  end

  def ensure_correct_user
    @post_item = PostItem.find(params[:id])
    unless @post_item.user == current_user
      redirect_to user_path(current_user), alert: "権限がございません。"
    end
  end

end
