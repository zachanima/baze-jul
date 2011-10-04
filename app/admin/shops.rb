ActiveAdmin.register Shop do
  menu priority: 1

  scope :all, default: true

  filter :title
  filter :text

  index do
    column :title
    column :username_text
    column :password_text
    column 'Opens', sortable: :open_on do |shop|
      if shop.open_on > Date.today
        'In ' + distance_of_time_in_words_to_now(shop.open_on)
      else
        distance_of_time_in_words_to_now(shop.open_on).capitalize + ' ago'
      end
    end
    column 'Closes', sortable: :close_on do |shop|
      if shop.close_on > Date.today
        'In ' + distance_of_time_in_words_to_now(shop.close_on)
      else
        distance_of_time_in_words_to_now(shop.close_on).capitalize + ' ago'
      end
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
      f.input :close_on, hint: 'Shop will close the following day'
    end
    f.buttons
  end
end
