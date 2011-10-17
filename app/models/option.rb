class Option < ActiveRecord::Base
  belongs_to :option_array, inverse_of: :options
  has_many :variations, dependent: :destroy
  has_many :products, through: :variations
  has_and_belongs_to_many :orders

  # TODO: Avoid saving to database before destroying.
  after_save lambda { self.destroy if self.text.blank? }
  validates :option_array, presence: true

  def to_label
    text
  end
end
