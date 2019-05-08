class ContentsController < DashboardController
    before_action :require_website

    def index
        @content = current_website.content
    end

    def edit
        @content = current_website.content
    end

    def update
        current_website.content.update(content_params)
        current_website.save
        redirect_to edit_content_path(current_website.content)
    end

    private

    def content_params
        params.require(:content).permit(:spouse_one, :spouse_two, :summary, :about_us, :location, :contact_name, :contact_number, :date)
    end
end
