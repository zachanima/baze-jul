ActiveAdmin.register Shop do
  menu priority: 1

  scope :all, default: true

  filter :title
  filter :text

  index do
    column :title
    column :username_text
    column :password_text
    column 'Open', sortable: :open_on do |shop|
      distance_of_date_in_words_to_now_as_sentence(shop.open_on)
    end
    column 'Close', sortable: :close_on do |shop|
      distance_of_date_in_words_to_now_as_sentence(shop.close_on)
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
      f.input :open_on
      f.input :close_on, hint: 'Closed on this day'
    end
    f.buttons
  end
end
