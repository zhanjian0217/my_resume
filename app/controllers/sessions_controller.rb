class SessionsController < ApplicationController
  def create
    #檢查密碼是否存在
    user = User.login(params[:user])
    if user 
      session[:thankyou] = user.id  #給他session
      redirect_to root_path, notice: "登入成功"
    else
      redirect_to sign_in_users_path, alert: "帳號密碼有誤"
    end
  end


  def destroy
    session[:thankyou] = nil
    redirect_to root_path, notice: "已登出"
  end
end


# Authorization ＃ 授權


# Authentication # 驗證