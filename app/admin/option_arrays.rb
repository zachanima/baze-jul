ActiveAdmin.register OptionArray do
  menu priority: 4

  scope :all, default: true

  filter :title
  filter :text

  index do
    column :title
    column :text
    default_actions
  end
end
