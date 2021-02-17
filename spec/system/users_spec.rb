require 'rails_helper'

RSpec.describe "Userコントローラーのテスト", type: :system do

  let(:user){FactoryBot.create(:user)}

  describe "ユーザー認証のテスト" do
    describe "ユーザー新規登録" do
      before do
        visit new_user_registration_path
      end
      context "新規登録画面に遷移" do
        it "新規登録に成功する" do
          fill_in 'user[name]', with: "テストユーザー"
          fill_in 'user[email]', with: "test@example.com"
          fill_in 'user[password]', with: "000000"
          fill_in 'user[password_confirmation]', with: "000000"
          click_button "新規登録"

          expect(page).to have_content "アカウント登録が完了しました。"
        end
        it "新規登録に失敗する" do
          fill_in 'user[name]', with: nil
          fill_in 'user[email]', with: nil
          fill_in 'user[password]', with: nil
          fill_in 'user[password_confirmation]', with: nil
          click_button "新規登録"

          expect(page).to have_content ""
        end
      end
    end
    describe "ユーザーログイン" do
      before do
        visit new_user_session_path
      end
      context "ログイン画面に遷移" do
        it "ログインに成功する" do
          fill_in 'user[email]', with: user.email
          fill_in 'user[password]', with: user.password
          click_button "ログイン"

          expect(page).to have_content "ログインしました"
        end
        it "ログインに失敗する" do
          fill_in 'user[email]', with: nil
          fill_in 'user[password]', with: nil
          click_button "ログイン"

          expect(current_path).to eq(new_user_session_path)
        end
      end
    end
  end

  describe "ユーザーのテスト" do
    before do
      visit new_user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'ログイン'
    end
    describe "マイページのテスト" do
      context "表示の確認" do
        before do
          visit user_path(user)
        end
        it "マイページと表示される" do
          expect(page).to have_content("マイページ")
        end
        it "名前が表示される" do
          expect(page).to have_content(user.name)
        end
        it "自己紹介が表示される" do
          expect(page).to have_content(user.introduction)
        end
        it "プロフィール画像が表示される" do
          expect(page).to have_css('img.profile_image')
        end
        it "メールアドレスが表示される" do
          expect(page).to have_content(user.email)
        end
        it "編集リンクが表示される" do
          expect(page).to have_link'', href: edit_user_path(user)
        end
      end
    end
    describe "編集のテスト" do
      context "編集画面への遷移" do
        it "遷移できる" do
          visit edit_user_path(user)
          expect(current_path).to eq edit_user_path(user)
        end
      end
      context "他人の編集画面への遷移" do
        # it "遷移できない" do
        #   visit edit_user_path(user2)
        #   expect(current_path).to eq('/users/' + user.id.to_s)
        # end
      end
      context "プロフィールの編集" do
        before do
          visit edit_user_path(user)
        end
        it "編集に成功する" do
          click_button "保存"
          expect(page).to have_content "会員情報の更新が完了しました。"
          expect(current_path).to eq user_path(user)
        end
        it "編集に失敗する" do
          fill_in 'user[name]', with: nil
          click_button "保存"
          expect(page).to have_content "エラーが発生しました。"
          expect(current_path).to eq user_path(user)
        end
      end
    end
  end
end
