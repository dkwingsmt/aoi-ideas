class SystemController < ApplicationController
    def index_redirect
        if logged_in?
            render_unlogged_index
        else
            render_logged_index
        end
    end

    def login
    end

    def login_auth
    end

    def logout
        session.delete :user_id
        redirect_to :index_path
    end

    private
    def render_unlogged_index
        render 
    end

    def render_logged_index
    end
end
