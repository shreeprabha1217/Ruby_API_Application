class Order < ApplicationRecord
    belongs_to :user
    belongs_to :product
  
    after_create :calculate_total
  
    def calculate_total
      self.total = product.price * product_quantity.to_i
      save
    end
  end
  