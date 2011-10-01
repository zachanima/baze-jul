class Product < ActiveRecord::Base
  belongs_to :shop
  has_many :variants
  has_many :option_arrays, through: :variants
  has_many :variations
  has_many :options, through: :variations

  validates :title, :shop, presence: true
end
