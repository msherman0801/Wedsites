class WebsitesController < ApplicationController

    def index
        @websites = Website.all
    end

    def show
        @website = id(Website)
    end

    def photo
    end

    def upload
    end
end
