class Option < ActiveRecord::Base
  belongs_to :option_array, inverse_of: :options
  has_many :variations
  has_many :products, through: :variations

  validates :text, :option_array, presence: true

  alias :to_label :text
end
