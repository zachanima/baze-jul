ActiveAdmin.register Order do
  menu priority: 5

  scope :all, default: true

  filter :product
  
  index do
    column :shop
    column :customer
    column :product
    default_actions
  end
end
