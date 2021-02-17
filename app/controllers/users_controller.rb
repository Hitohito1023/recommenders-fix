class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :unsubscribe, :withdraw]
  before_action :ensure_correct_user, only: [:edit, :update, :unsubscribe, :withdraw]

  def index
    @users = User.only_valid.page(params[:page]).reverse_order
  end

  def show
    @user = User.find(params[:id])
    @favorites_count = 0
    @user.post_items.each do |post_item|
      @favorites_count += post_item.favorites.count
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: '会員情報の更新が完了しました。'
    else
      render :edit, alert: '会員情報の更新に失敗しました。'
    end
  end

  def unsubscribe
    @user = current_user
  end

  def withdraw
    @user = User.find(current_user.id)
    @user.post_items.delete_all
    @user.post_comments.delete_all
    @user.update(is_valid: "無効")
    reset_session
    redirect_to thanks_path, notice: 'ご利用ありがとうございました。'
  end

  def thanks
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :profile_image, :introduction)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user), alert: "権限がございません。"
    end
  end

end
