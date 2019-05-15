class Event < ApplicationRecord
    belongs_to :website
    has_many :invitations, through: :website
end
