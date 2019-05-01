class ContentsController < DashboardController
    before_action :require_website

    def index
        @content = current_website.content
    end

    def edit
        @content = current_website.content
    end

    def update
        current_website.content.update(content_params(:spouse_one, :spouse_two, :summary, :about_us))
        current_website.save
        redirect_to edit_content_path(current_website.content)
    end

    private

    def content_params(*args)
        params.require(:content).permit(*args)
    end
end
