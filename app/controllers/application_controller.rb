class ApplicationController < ActionController::Base
    protect_from_forgery
    helper_method :logged_in?, :current_user, :current_user_id, :format_time, :linked_username

    private
    def logged_in?
        !session[:user_id].nil?
    end

    def current_user
        if logged_in?
            if @user ||= User.find(session[:user_id])
                return @user
            else
                session.delete :user_id
            end
        end
        nil
    end

    def current_user_id
        if user = current_user
            user.id
        else
            nil
        end
    end

    def format_time(time)
        now = Time.now
        if time.year == now.year
            time.strftime("%b %d, %H:%M")
        else
            time.strftime("%b %d %Y, %H:%M")
        end
    end

    def linked_username(user, text = nil)
        text ||= user.name
        html = render_to_string (
            :inline => "<%= link_to(text, user_path(user.id)) %>",
            :layout => nil,
            :locals => {:text => text, :user => user}
        )
        html.html_safe
    end
end
