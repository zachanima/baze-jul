ActiveAdmin.register Task do
  menu parent: 'Administration'

  scope :all, default: true
  scope :pending
  scope :complete

  filter :title
  filter :text

  index do
    column :title
    column 'Status' do |task|
      status_tag task.status
    end
    column :created_at
    column :updated_at
    default_actions
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :text
      f.input :is_complete
    end
    f.buttons
  end
end
