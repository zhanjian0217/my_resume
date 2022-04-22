require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user, password: "123456") }
  # before do 
  # end
  it "username 不能重複" do
    username = "QQQ"
    create(:user, username: username)     
    expect{ create(:user, username: username) }.to raise_error(ActiveRecord::RecordInvalid)
    # u.save
    # expect(u.errors.any?).to be true
  end

  it "使用者可以登入" do 
    user_data = { account: user.username, password: "123456" }
    expect(User.login(user_data)).not_to be nil
  end

  it "註冊時密碼會加密" do 
    expect(user.password).not_to eq "123456"
  end
end



