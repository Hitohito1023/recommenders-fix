require 'rails_helper'

RSpec.describe "Favoriteモデルのテスト", type: :model do

  describe "アソシエーションのテスト" do
    it "UserモデルとN:1となっているか" do
      expect(Favorite.reflect_on_association(:user).macro).to eq :belongs_to
    end

    it "GenreモデルとN:1となっているか" do
      expect(Favorite.reflect_on_association(:post_item).macro).to eq :belongs_to
    end
  end

end