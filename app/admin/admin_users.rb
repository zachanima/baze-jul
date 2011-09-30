ActiveAdmin.register AdminUser do
  menu parent: 'Administration'

  filter :email

  index do
    column :email
    column :sign_in_count
    default_actions
  end

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
    end
    f.buttons
  end
end
