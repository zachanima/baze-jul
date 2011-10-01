class Customer < ActiveRecord::Base
  belongs_to :shop

  validates :name, :shop, presence: true
end
