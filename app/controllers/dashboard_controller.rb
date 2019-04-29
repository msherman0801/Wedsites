class DashboardController < ApplicationController
    before_action :require_login
    layout "dashboard"

    def index
        @active_site = current_website
        @websites = current_user.websites
        session[:website_id] = params[:id] if params[:id]
    end

    def create
        current_user.websites << (website = Website.create)
        current_user.save
        session_save(2, website)
        redirect_to home_path
    end

end