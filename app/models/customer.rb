class Customer < ActiveRecord::Base
  belongs_to :shop

  validates_presence_of :name, :shop
end
