class Task < ActiveRecord::Base
  validates :title, presence: true

  scope :pending, where(is_complete: false)
  scope :complete, where(is_complete: true)

  def status
    is_complete ? 'complete' : 'pending'
  end
end
