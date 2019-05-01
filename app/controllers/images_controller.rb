class ImagesController < DashboardController

    def index
    end

    def new
        @images = current_website.uploads
        @website = current_website
    end

    def create
        current_website.update(params.permit(uploads: []))
        redirect_to images_upload_path
    end

    def destroy

    end
    

end