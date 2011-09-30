class Shop < ActiveRecord::Base
  has_many :customers, dependent: :destroy

  validates_presence_of :name, :slug
  validates_uniqueness_of :slug
end
