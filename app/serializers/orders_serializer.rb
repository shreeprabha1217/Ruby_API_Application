class OrdersSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :product_id, :product_quantity
end
