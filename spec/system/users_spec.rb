require 'rails_helper'

RSpec.describe "Users", type: :system do
  context "ユーザー関連ページ" do
    it "ユーザー一覧ページが正常に表示される" do
      visit users_path
      expect(current_path).to eq users_path
    end
  end
end
