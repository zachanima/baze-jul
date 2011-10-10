class OptionArray < ActiveRecord::Base
  has_many :options, dependent: :destroy, inverse_of: :option_array
  has_many :variants, dependent: :destroy
  has_many :products, through: :variants

  accepts_nested_attributes_for :options, reject_if: :all_blank,
    allow_destroy: true

  validates :title, :text, presence: true
end
