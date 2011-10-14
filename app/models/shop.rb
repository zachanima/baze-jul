class Shop < ActiveRecord::Base
  has_many :customers, dependent: :destroy
  has_many :products, dependent: :destroy

  validates :title, presence: true
  validates :link, presence: true, uniqueness: true

  before_validation lambda { link.blank?? self.link = title.parameterize : nil }

  has_attached_file :logo, styles: { original: '300x50>', thumb: '90x15>' }

  # TODO: Define to_param to use link exclusively.
end
