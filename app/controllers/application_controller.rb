class ApplicationController < ActionController::Base
    protect_from_forgery
    helper_method :logged_in?, :current_user, :current_user_id, 
        :require_current_user, :format_time, :linked_username, 
        :title_icon

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

    def require_current_user
        unless logged_in?
            flash[:notice] = {
                :type => "error", 
                :msgs => "You must log in before you can proceed."
            }
            redirect_to error_path
        end
        return current_user
    end

    def format_time(time)
        now = Time.now
        if time.year == now.year
            time.strftime("%b %d, %H:%M")
        else
            time.strftime("%b %d %Y, %H:%M")
        end
    end

    def linked_username(user, text = nil, check_me = true)
        its_me = check_me && logged_in? && current_user.id == user.id
        text ||= its_me ? "me" : user.name
        html = render_to_string (
            :inline => "<%= link_to(text, user_path(user.id)) %>",
            :layout => nil,
            :locals => {:text => text, :user => user}
        )
        html.html_safe
    end

    def title_icon(category)
        case category
        when Entry::CATEGORY_PROBLEM
            "lightbulb-error.png"
        when Entry::CATEGORY_IDEA
            "lightbulb-success.png"
        when Entry::CATEGORY_ARTICLE
            "talk-info.png"
        end
    end

end
