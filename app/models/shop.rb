class Shop < ActiveRecord::Base
  has_many :customers, dependent: :destroy
  has_many :products, dependent: :destroy

  validates :name, :slug, presence: true
  validates_uniqueness_of :slug
end
