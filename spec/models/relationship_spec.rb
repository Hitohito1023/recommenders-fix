require 'rails_helper'

RSpec.describe "Relationshipモデルのテスト", type: :model do

  describe "アソシエーションのテスト" do
    it "FollowerモデルとN:1となっているか" do
      expect(Relationship.reflect_on_association(:follower).macro).to eq :belongs_to
    end

    it "FollowedモデルとN:1となっているか" do
      expect(Relationship.reflect_on_association(:followed).macro).to eq :belongs_to
    end
  end

end