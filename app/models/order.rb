class Order < ActiveRecord::Base
  belongs_to :customer
  belongs_to :product

  def shop
    customer.shop
  end
end
