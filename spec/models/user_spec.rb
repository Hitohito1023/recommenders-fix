require 'rails_helper'

RSpec.describe "Userモデルのテスト", type: :model do

  describe "バリデーションのテスト" do
    it "名前、メールアドレス、パスワードがある場合、有効である" do
      user = FactoryBot.build(:user)
      expect(user).to be_valid
    end

    it "名前がない場合は、無効である" do
      user = FactoryBot.build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("が入力されていません。")
    end

    it "メールアドレスがない場合、無効である" do
      user = FactoryBot.build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("が入力されていません。")
    end

    it "メールアドレスが重複している場合、無効である" do
      user1 = FactoryBot.create(:user)
      user2 = FactoryBot.build(:user)
      user2.valid?
      expect(user2.errors[:email]).to include("は既に使用されています。")
    end

    it "パスワードがない場合、無効である" do
      user = FactoryBot.build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("が入力されていません。")
    end

    it "紹介文が101文字以上の場合、無効である" do
      user = FactoryBot.build(:user, introduction: "a" * 101)
      user.valid?
      expect(user.errors[:introduction]).to include("は100文字以下に設定して下さい。")
    end
  end

  describe "アソシエーションのテスト" do
    it "PostItemモデルと1:Nとなっているか" do
      expect(User.reflect_on_association(:post_items).macro).to eq :has_many
    end

    it "PostCommentモデルと1:Nとなっているか" do
      expect(User.reflect_on_association(:post_comments).macro).to eq :has_many
    end

    it "Favoritesモデルと1:Nとなっているか" do
      expect(User.reflect_on_association(:favorites).macro).to eq :has_many
    end

    it "Relationshipモデルと1:Nとなっているか" do
      expect(User.reflect_on_association(:relationships).macro).to eq :has_many
    end
  end

end