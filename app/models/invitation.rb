class Invitation < ApplicationRecord
    belongs_to :website
    has_many :events, through: :website
    
    validates :first_name, presence: true
    validates :last_name, presence: true

    def full_name
        "#{first_name} #{last_name}"
    end

    def self.website_invitations
        order('last_name ASC')
    end
end
