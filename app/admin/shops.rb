ActiveAdmin.register Shop do
  index do
    column :name
    column :username_text
    column :password_text
    column :opens_on
    column :closes_on
    default_actions
  end
end
