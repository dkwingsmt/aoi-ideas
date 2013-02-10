class ApplicationController < ActionController::Base
    protect_from_forgery
    helper_method :logged_in?, :current_user

    private
    def logged_in?
        !session[:user_id].nil?
    end

    def current_user
        if logged_in?
            if @user ||= User.find(session[:user_id])
                return user
            else
                session.delete :user_id
            end
        end
        nil
    end
end
