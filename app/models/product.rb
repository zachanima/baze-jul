class Product < ActiveRecord::Base
  belongs_to :shop

  validates :title, :shop, presence: true
end
