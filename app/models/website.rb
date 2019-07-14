class Website < ApplicationRecord
    belongs_to :user
    has_one :content
    has_many :invitations
    has_many :events
    has_many_attached :uploads

    def upload(params)
        self.update(params)
    end

    #The method below is to be used to create an array of blob url's for a specific website's uploads.
    # def upload_url
    #     self.uploads.map do |i|s
    #         Rails.application.routes.url_helpers.rails_blob_path(i, only_path: true)
    #     end
    # end
end