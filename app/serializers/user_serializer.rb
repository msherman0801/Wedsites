class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :uid, :admin
  has_many :websites
  has_many :invitations, through: :websites
  has_many :events, through: :websites
end