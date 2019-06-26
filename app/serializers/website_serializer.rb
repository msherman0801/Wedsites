class WebsiteSerializer < ActiveModel::Serializer
  attributes :id, :name, :key
  belongs_to :user
  has_one :content
  has_many :invitations
  has_many :events
end
