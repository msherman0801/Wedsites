class DashboardController < ApplicationController
    before_action :require_login
    layout "dashboard"

    def index
        @active_site = current_website
        @websites = current_user.websites
        session[:website_id] = params[:id] if params[:id]
    end

    def create
        current_user.websites << (website = Website.create(params.permit(:key)))
        current_user.save
        session_save(2, website)
        current_website.uploads.attach(params.permit(uploads:[]))
        current_website.content = Content.create
        current_website.save
        redirect_to home_path
    end
end