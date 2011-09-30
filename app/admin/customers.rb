ActiveAdmin.register Customer do
  scope :all, default: true

  filter :shop
  filter :name
  filter :department

  index do
    column :shop
    column :name
    column :department
    default_actions
  end
end
