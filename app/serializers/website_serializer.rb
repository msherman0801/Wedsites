class WebsiteSerializer < ActiveModel::Serializer
  attributes :id, :name, :key, :object
  belongs_to :user
  has_one :content
  has_many :invitations
  has_many :events

  def images
    object.upload_url
  end
    
end
