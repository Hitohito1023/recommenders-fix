require 'rails_helper'

RSpec.describe "PostCommentモデルのテスト" do

  describe "バリデーションのテスト" do
    it "コメントがない場合、無効である" do
      post_comment = FactoryBot.build(:post_comment, comment: nil)
      post_comment.valid?
      expect(post_comment.errors[:comment]).to include("が入力されていません。")
    end

    it "コメントが101文字以上の場合、無効である" do
      post_comment = FactoryBot.build(:post_comment, comment: "a" * 101)
      post_comment.valid?
      expect(post_comment.errors[:comment]).to include("は100文字以下に設定して下さい。")
    end
  end

  describe "アソシエーションのテスト" do
    it "UserモデルとN:1となっているか" do
      expect(PostComment.reflect_on_association(:user).macro).to eq :belongs_to
    end

    it "GenreモデルとN:1となっているか" do
      expect(PostComment.reflect_on_association(:post_item).macro).to eq :belongs_to
    end
  end

end