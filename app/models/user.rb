class User < ApplicationRecord
    has_secure_password
    has_many :websites
    has_many :invitations, through: :websites
    has_many :events, through: :websites
    has_many_attached :uploads
end
