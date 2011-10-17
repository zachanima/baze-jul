ActiveAdmin.register Order do
  menu priority: 5

  scope :all, default: true

  filter :product
  
  index do
    column :shop
    column :customer
    column :product
    column :options do |order|
      order.options.collect(&:text) * ', '
    end
    default_actions
  end
end
