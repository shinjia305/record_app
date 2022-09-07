require 'rails_helper'

RSpec.describe "Users", type: :system do

  describe "各種ページが表示されるかの確認" do
    it "一覧ページが表示される" do
      visit root_path
      expect(page).to have_http_status(:success)
    end
  
    xit "詳細ページが表示される" do
    end
  end

  describe "一覧ページから各ページへの遷移の確認" do
    xit "一覧ページの詳細ページへのリンクをクリックすると詳細ページが表示される" do
    end
  end

  describe "タスクのCRUD確認" do
    let(:user)  { FactoryBot.create(:user) }
    let(:admin) { FactoryBot.create(:admin) }

    it "タスクが編集できる" do
      visit new_admin_session_path
      login(admin)
      edit_user_path(user)
      click_on "編集"
      fill_in  "Name", with: "edit_#{user.name}"
      click_on "更新する"
      expect(page).to have_content "edit_#{user.name}"
    end
  end

  context "ユーザー関連ページ" do
    xit "ユーザー一覧ページが正常に表示される" do
      visit users_path
      expect(page).to have_current_path users_path, ignore_query: true
    end
  end
end
