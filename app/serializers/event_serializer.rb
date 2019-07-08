class EventSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :date, :location, :attire, :website_id
  belongs_to :website
  has_many :invitations, through: :website
end