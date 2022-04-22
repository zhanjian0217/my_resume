require 'rails_helper'

RSpec.feature "Vendors", type: :feature do
  # pending "add some scenarios (or delete) #{__FILE__}"
  scenario "Vendor_login" do
    vendor = create(:vendor, password: "123123")

    visit "/users/sign_in"
    
    fill_in "帳號", with: vendor.username
    fill_in "密碼", with: "123123"

    click_button "登入"

    expect(page).to have_text("登入成功")
    expect(page).not_to have_text("我的履歷")
  end
end
