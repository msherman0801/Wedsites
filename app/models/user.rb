class User < ApplicationRecord
    has_secure_password
    has_many :websites
    has_many :invitations, through: :websites
    has_many :events, through: :websites

    validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :username, presence: true
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates(:password, { :length => { :in => 6..20 } })
    
end