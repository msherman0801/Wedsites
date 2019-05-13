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
    

    def self.fb_login(auth)
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
            name = auth['info']['name'].split(' ')
            u.username = "#{name[0]+name[1]}"+"#{rand(+100000)}" if u.username.nil?
            u.password = "#{rand(+100000000000000)}"
            u.first_name = auth['info']['name'].split(' ')[0]
            u.last_name = auth['info']['name'].split(' ')[1]
            u.email = auth['info']['email']
            u.image = auth['info']['image']
        end
    end

end