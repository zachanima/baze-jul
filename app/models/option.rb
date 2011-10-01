class Option < ActiveRecord::Base
  belongs_to :option_array, inverse_of: :options

  validates :text, :option_array, presence: true
end
