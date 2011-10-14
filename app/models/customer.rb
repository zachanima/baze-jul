class Customer < ActiveRecord::Base
  devise :database_authenticatable, :rememberable, :trackable,
    authentication_keys: [:username, :shop_id]

  belongs_to :shop

  validates :name, :shop, :username, presence: true
  validates_uniqueness_of :username, scope: :shop_id

  # TODO: Avoid rewriting password on login.
  before_save lambda { self.plaintext_password = self.password }
end
