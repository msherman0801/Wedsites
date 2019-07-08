class InvitationSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :attending, :role, :guests, :allergies, :website_id, :date_responded
  belongs_to :website
  has_many :events, through: :website
end