class ChargeSerializer < ActiveModel::Serializer
  attributes :id, :title, :accusee, :counts, :collection_date, :image_url
end
