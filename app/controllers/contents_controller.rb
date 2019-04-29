class ContentsController < DashboardController
    before_action :require_website
    
    def index

    end

    def create
        content = Content.create(content_params(:spouse_one, :spouse_two, :summary, :about_us))
        content.date
    end

    private

    def content_params(*args)
        params.require(:content).permit(*args)
    end
end
