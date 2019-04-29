class ApplicationController < ActionController::Base

    helper_method :current_user
    helper_method :current_website
    helper_method :session_save
    helper_method :logged_in?
    helper_method :redirect_to_dash
    helper_method :require_website


    def current_user
        User.find_by(id: session[:user_id])
    end

    def current_website
        Website.find_by(id: session[:website_id].to_i)
    end

    def logged_in?
        !!current_user
    end

    def session_save(type, object)
        if type == 1
            session[:user_id] = object.id
        elsif type == 2
            session[:website_id] = object.id
        end
    end

    def redirect_to_dash
        if logged_in?
            redirect_to home_path
        end
    end

    def require_login
        return head(:forbidden) unless current_user
    end

    def require_website
        redirect_to_dash if current_website.nil?
    end
    

end
