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
    column :username
    default_actions
  end

  form do |f|
    f.inputs do
      f.input :shop
      f.input :department
      f.input :name
      f.input :username
      f.input :password
    end
    f.buttons
  end
end
