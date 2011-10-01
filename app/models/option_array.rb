class OptionArray < ActiveRecord::Base
  validates :title, :text, presence: true
end
