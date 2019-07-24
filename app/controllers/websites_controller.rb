class WebsitesController < ApplicationController

    def index
        websites = Website.all.where(user_id: current_user.id)
        render json: {
            websites: websites.as_json(include: { content: {only: [:summary] }}),
            current_website: current_website}, status: :ok
    end

    def show
        @website = id(Website)
    end

    def create
        website = current_user.websites.create(website_params)

        session_save(2, website)
        current_website.content = Content.create

        respond_to do |f|
            f.html { redirect_to home_path }
            f.json { render json: website }
        end
    end

    def image
        @image = Website.find(6).uploads.find(12)
    end

    def update
    end

    def search
        invitations = id(Website).invitations
        @results = invitations.find_by(search_params)
        @website = id(Website)
        render 'websites/results'
    end

    def data
        if id(Website)
            @website = id(Website)
            render json: @website
        else
            redirect_to home_path
        end
    end


    private

    def website_params
        params.require(:website).permit(:key)
    end

    def search_params
        params.permit(:first_name, :last_name)
    end

end
