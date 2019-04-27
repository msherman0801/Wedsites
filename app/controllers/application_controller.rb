class ApplicationController < ActionController::Base

    helper_method :current_user
    helper_method :session_save
    helper_method :logged_in?
    helper_method :redirect_to_dash
    helper_method :session_id


    def current_user
        User.find_by(id: session[:user_id])
    end

    def logged_in?
        !!current_user
    end

    def session_save(user)
        session[:user_id] = user.id
    end

    def redirect_to_dash
        if logged_in?
            redirect_to '/dashboard'
        end
    end

    def session_id
        session[:user_id]
    end
    

end
