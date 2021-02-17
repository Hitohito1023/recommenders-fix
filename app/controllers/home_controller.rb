class HomeController < ApplicationController

  def start
  end

  def top
    #本番環境でrandの表記を変更（mysqlだとrand,sqliteだとRANDOM)
    rand = Rails.env.production? ?  "rand()" : "RANDOM()"
    @post_items = PostItem.order(rand).limit(10) #post_itemをランダムで取得
    @new_post_items = PostItem.order("id DESC").limit(10) #post_itemを新しい順に取得
    @users = User.order(rand).limit(10) #userをランダムで取得
  end

  def ranking
    @post_items = PostItem.includes(:favorited_users).sort { |a, b| b.favorited_users.size <=> a.favorited_users.size }
    @users = User.includes(:post_items).sort { |a, b| b.post_items.size <=> a.post_items.size }
    @user_followers = User.includes(:followers).sort { |a, b| b.followers.size <=> a.followers.size }
  end

end
