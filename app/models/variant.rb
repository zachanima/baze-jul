class Variant < ActiveRecord::Base
  belongs_to :product
  belongs_to :option_array
end
