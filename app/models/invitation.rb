class Invitation < ApplicationRecord
    belongs_to :website
    has_many :users, through: :website
    validates :first_name, presence: true
    validates :last_name, presence: true
end
