ActiveAdmin.register Product do
  menu priority: 3

  scope :all, default: true

  filter :shop
  filter :title
  filter :brand
  filter :text

  index do
    column :shop
    column :title
    column :brand
    default_actions
  end
end
