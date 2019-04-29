class Invitation < ApplicationRecord
    belongs_to :website
    has_many :users, through: :website
end
