class Website < ApplicationRecord
    belongs_to :user
    has_one :content
    has_many :invitations
    has_many :events
    has_many_attached :uploads
end
