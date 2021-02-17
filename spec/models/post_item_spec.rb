require 'rails_helper'

RSpec.describe "PostItemモデルのテスト", type: :model do

  describe "バリデーションのテスト" do
    it "名前がない場合、無効である" do
      post_item = FactoryBot.build(:post_item, name: nil)
      post_item.valid?
      expect(post_item.errors[:name]).to include("が入力されていません。")
    end

    it "紹介文がない場合、無効である" do
      post_item = FactoryBot.build(:post_item, introduction: nil)
      post_item.valid?
      expect(post_item.errors[:introduction]).to include("が入力されていません。")
    end

    it "紹介文が141文字以上の場合、無効である" do
      post_item = FactoryBot.build(:post_item, introduction: "a" * 141)
      post_item.valid?
      expect(post_item.errors[:introduction]).to include("は140文字以下に設定して下さい。")
    end

    it "カテゴリーがない場合、無効である" do
      post_item = FactoryBot.build(:post_item, genre_id: nil)
      post_item.valid?
      expect(post_item.errors[:genre_id]).to include("が入力されていません。")
    end
  end

  describe "アソシエーションのテスト" do
    it "UserモデルとN:1となっているか" do
      expect(PostItem.reflect_on_association(:user).macro).to eq :belongs_to
    end

    it "GenreモデルとN:1となっているか" do
      expect(PostItem.reflect_on_association(:genre).macro).to eq :belongs_to
    end

    it "PostCommentモデルと1:Nとなっているか" do
      expect(PostItem.reflect_on_association(:post_comments).macro).to eq :has_many
    end

    it "Favoritesモデルと1:Nとなっているか" do
      expect(PostItem.reflect_on_association(:favorites).macro).to eq :has_many
    end
  end

end