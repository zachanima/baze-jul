class Customer < ActiveRecord::Base
  devise :database_authenticatable, :rememberable, :trackable,
    authentication_keys: [:username, :shop_id]

  belongs_to :shop
  has_many :orders, dependent: :destroy

  validates :name, :shop, :username, presence: true
  validates_uniqueness_of :username, scope: :shop_id

  before_create lambda { self.plaintext_password = self.password }
end
