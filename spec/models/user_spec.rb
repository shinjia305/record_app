require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザーに関するテスト' do
    it '有効なユーザーはデータベースに保存される' do
      user = User.new(name: '正しい名前')
      user.save
      expect(user).to be_valid
    end

    it '名前が入力されていないユーザーは保存されない' do
      user = User.new(name: '')
      user.save
      expect(user).not_to be_valid
    end
  end
end
