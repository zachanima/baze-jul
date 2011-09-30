ActiveAdmin.register Shop do
  scope :all, default: true

  filter :name

  index do
    column :name
    column :username_text
    column :password_text
    column :opens_on
    column :closes_on
    default_actions
  end

  form do |f|
    f.inputs 'Basic' do
      f.input :name
      f.input :slug, label: 'Link'
      f.input :text
    end
    f.inputs 'Advanced' do
      f.input :username_text
      f.input :password_text, as: :string
      f.input :opens_on
      f.input :closes_on
    end
    f.buttons
  end
end
