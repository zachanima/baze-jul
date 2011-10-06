ActiveAdmin.register Shop do
  menu priority: 1

  scope :all, default: true

  filter :title
  filter :text

  index do
    column :logo, sortable: :logo_file_name do |shop|
      image_tag shop.logo.url(:thumb) if shop.logo.exists?
    end
    column :title
    column :username_text
    column :password_text
    column 'Opens', sortable: :opens_on do |shop|
      distance_of_date_in_words_to_now_as_sentence(shop.opens_on)
    end
    column 'Closes', sortable: :closes_on do |shop|
      distance_of_date_in_words_to_now_as_sentence(shop.closes_on)
    end
    default_actions
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :link
      f.input :text
    end
    f.inputs 'Advanced' do
      f.input :username_text
      f.input :password_text, as: :string
      f.input :logo
      f.input :opens_on
      f.input :closes_on, hint: 'Closed at the start of this day'
    end
    f.buttons
  end
end
