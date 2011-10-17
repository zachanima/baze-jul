class Order < ActiveRecord::Base
  belongs_to :customer
  belongs_to :product
  has_and_belongs_to_many :options

  def shop
    customer.shop
  end
end
