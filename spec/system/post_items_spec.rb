# frozen_string_literal: true
require 'rails_helper'

RSpec.describe "PostItemsコントローラーのテスト", type: :system do
  describe "投稿のテスト" do
    let(:user){ create(:user) }
    let!(:user2){ build(:user) }
    let!(:genre){ create(:genre) }
    let!(:post_item){ create(:post_item, user:user) }
    let!(:post_item2){ build(:post_item, user:user2) }
    before do
    	visit new_user_session_path
    	fill_in 'user[email]', with: user.email
    	fill_in 'user[password]', with: user.password
    	click_button 'ログイン'
    end
    describe "投稿画面のテスト" do
      before do
        visit new_post_item_path
      end
      context "動作の確認" do
        it "投稿に成功する" do
          fill_in 'post_item[name]', with: "aaa"
          fill_in 'post_item[introduction]', with: "aaaaaaaa"
          click_button '投稿'
          expect(current_path).to eq(post_items_complete_path)
        end
        it "投稿に失敗する" do
          click_button "投稿"
          expect(page).to have_content "エラー"
          expect(current_path).to eq(post_items_path)
        end
      end
    end

    describe "編集のテスト" do
      context "自分の投稿の編集画面への遷移" do
        it "遷移できる" do
          visit edit_post_item_path(post_item)
          expect(current_path).to eq('/post_items/' + post_item.id.to_s + '/edit')
        end
      end
      # context "他人の投稿の編集画面への遷移" do
      #   it "遷移できない" do
      #     visit edit_post_item_path(post_item2)
      #     expect(current_path).to eq('/post_items')
      #   end
      # end
      context "フォームの確認" do
        it "編集に成功する" do
          visit edit_post_item_path(post_item)
          click_button '保存'
          expect(page).to have_content "保存しました。"
          expect(current_path).to eq '/post_items/' + post_item.id.to_s
        end
        it "編集に失敗する" do
          visit edit_post_item_path(post_item)
          fill_in "post_item[name]", with: nil
          click_button '保存'
          expect(page).to have_content "エラー"
          expect(current_path).to eq '/post_items/' + post_item.id.to_s
        end
      end
    end

    describe '一覧画面のテスト' do
  	  before do
  		  visit post_items_path
  	  end
  	  context '表示の確認' do
  		  it '一覧と表示される' do
  			  expect(page).to have_content '一覧'
  		  end
    		# it '自分と他人のタイトルのリンク先が正しい' do
    		# 	expect(page).to have_link post_item.name, href: post_item_path(post_item)
    		# 	expect(page).to have_link post_item2.name, href: post_item_path(post_item2)
    		# end
  	  end
    end

    describe '詳細画面のテスト' do
    	context '自分・他人共通の投稿詳細画面の表示を確認' do
    		it '詳細と表示される' do
    			visit post_item_path(post_item)
    			expect(page).to have_content '詳細'
    		end
    		it '投稿のnameが表示される' do
    			visit post_item_path(post_item)
    			expect(page).to have_content post_item.name
    		end
    		it '投稿のintroductionが表示される' do
    			visit post_item_path(post_item)
    			expect(page).to have_content post_item.introduction
    		end
    	end
    	context '自分の投稿詳細画面の表示を確認' do
    		it '投稿の編集リンクが表示される' do
    			visit post_item_path post_item
    			expect(page).to have_link '編集', href: edit_post_item_path(post_item)
    		end
    	end
    # 	context '他人の投稿詳細画面の表示を確認' do
    # 		it '投稿の編集リンクが表示されない' do
    # 			visit post_item_path(post_item2)
    # 			expect(page).to have_no_link '編集', href: edit_post_item_path(post_item2)
    # 		end
    # 	end
    end

  end
end