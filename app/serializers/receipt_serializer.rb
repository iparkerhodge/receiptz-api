class ReceiptSerializer < ActiveModel::Serializer
  attributes :id, :title, :accusee, :claims, :collection_date,
             :image_url, :user_id, :created_at
end
