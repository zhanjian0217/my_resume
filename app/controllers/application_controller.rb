class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :not_found 

  helper_method :user_signed_in?, :current_user #給view當小幫手用 或是從viewhelper include 進來


  private
  
    def authenticate_user 
      if not user_signed_in?
        redirect_to sign_in_users_path
      end
    end

    def user_signed_in?
      # session[:thankyou] != nil
      session[:thankyou].present?
    end

    def current_user
      User.find_by(id: session[:thankyou])
    end


    def not_found
      render file: "#{Rails.root}/public/not_found.html",
            status: 404,
            layout: false
    end
end
