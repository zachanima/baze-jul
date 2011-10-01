class Product < ActiveRecord::Base
  belongs_to :shop
  has_many :variants
  has_many :option_arrays, through: :variants

  validates :title, :shop, presence: true
end
