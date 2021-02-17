require 'rails_helper'

RSpec.describe "Gnereモデルのテスト", type: :model do

  describe"バリデーションのテスト" do
    it "名前がない場合は、無効である" do
      genre = FactoryBot.build(:genre, name: nil)
      genre.valid?
      expect(genre.errors[:name]).to include("が入力されていません。")
    end
  end

  describe "アソシエーションのテスト" do
    it "PostItemモデルと1:Nとなっているか" do
      expect(Genre.reflect_on_association(:post_items).macro).to eq :has_many
    end
  end

end