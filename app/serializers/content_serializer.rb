class ContentSerializer < ActiveModel::Serializer
  attributes :id, :spouse_one, :spouse_two, :about_us, :summary, :date, :location, :contact_name, :contact_number, :registry_name, :registry_url, :website_id
  belongs_to :website
end
