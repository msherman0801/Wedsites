class DashboardController < ApplicationController
    before_action :require_login
    layout "dashboard"

    def index
        binding.pry
        @website = Website.new
        @websites = current_user.websites
        session[:website_id] = params[:id] if params[:id]
    end

    # def create
    #     current_user.websites << (website = Website.create(params.permit(:key, uploads: [])))
    #     current_user.save
    #     binding.pry
    #     session_save(2, website)
    #     current_website.content = Content.create
    #     current_website.save
    #     redirect_to home_path
    # end

    def layout
        
    end

    private

    def website_params

    end
end