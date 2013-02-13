class SystemController < ApplicationController
    def index_redirect
        if logged_in?
            render_logged_index
        else
            render_unlogged_index
        end
    end

    def login
    end

    def login_auth
        @email = params[:email]
        @password = params[:password]
        if params[:remember_me] == '1'
            @remember_me = true
        end

        if @user = User.authenticate(@email, @password)
            session[:user_id] = @user.id
            redirect_to index_path
        else
            @error = "Incorrect email address or password."
            render "login"
        end
    end

    def logout
        session.delete :user_id
        redirect_to login_path
    end

    private
    def render_unlogged_index
        render "unlogged_index"
    end

    def render_logged_index
        render "logged_index"
    end
end
