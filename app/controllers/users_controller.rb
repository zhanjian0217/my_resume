class UsersController < ApplicationController
  def sign_up
    @user = User.new
  end

  def sign_in
    # @user = User.find(params[:id])
  end



  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_path, notice: "會員註冊成功"
      else
        render :sign_up
      end
  end

  private
  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation)
  end

  def find_user
  end
end
