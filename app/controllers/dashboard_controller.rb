class DashboardController < ApplicationController
    before_action :require_login
    layout "dashboard"

    def index
        @website = Website.new
        @websites = current_user.websites
        session[:website_id] = params[:id] if params[:id]
    end

    def active_website
        if id(Website)
            session_save(2, id(Website))
            redirect_to '/dashboard/home'
        end
    end
    
end