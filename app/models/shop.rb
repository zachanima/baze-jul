class Shop < ActiveRecord::Base
  LOCALES = { 'da' => 'Danish', 'en' => 'English' }
  has_many :customers, dependent: :destroy
  has_many :products, dependent: :destroy

  validates :title, presence: true
  validates :link, presence: true, uniqueness: true
  validates :locale, presence: true
  validates_inclusion_of :locale, in: LOCALES.each_key

  before_validation lambda { link.blank?? self.link = title.parameterize : nil }

  has_attached_file :logo, styles: { original: '300x50>', thumb: '90x15>' }

  # TODO: Define to_param to use link exclusively.
end
