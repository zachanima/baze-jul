class Shop < ActiveRecord::Base
  has_many :customers, dependent: :destroy
  has_many :products, dependent: :destroy

  validates :title, presence: true
  validates :link, presence: true, uniqueness: true
end
