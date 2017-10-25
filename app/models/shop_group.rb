class ShopGroup < ActiveRecord::Base
	has_many :shops

  validates :title, presence: true
  validates :link, presence: true
end
