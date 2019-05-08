class ImagesController < DashboardController

    def index
        @images = current_website.uploads
    end

    def new
        @images = current_website.uploads
        @website = current_website
    end

    def create
        current_website.upload(image_params)
        redirect_to images_path
    end

    def show
        @image = id(current_website.uploads)
    end

    def destroy
        id(current_website.uploads).destroy
        redirect_to images_path
    end
    
    private

    def image_params
        params.require(:website).permit(uploads: [])
    end



end