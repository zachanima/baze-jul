class Option < ActiveRecord::Base
  belongs_to :option_array, inverse_of: :options
  has_many :variations, dependent: :destroy
  has_many :products, through: :variations

  validates :text, :option_array, presence: true

  def to_label
    text
  end
end
