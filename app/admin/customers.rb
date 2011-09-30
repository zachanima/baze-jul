ActiveAdmin.register Customer do
  menu priority: 2

  scope :all, default: true

  filter :shop
  filter :department
  filter :name

  index do
    column :shop
    column :department
    column :name
    default_actions
  end
end
