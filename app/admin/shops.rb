ActiveAdmin.register Shop do
  menu priority: 1

  scope :all, default: true

  filter :title
  filter :text

  index do
    column :title
    column :username_text
    column :password_text
    column 'Opens', sortable: :opens_on do |shop|
      if shop.opens_on > Date.today
        'In ' + distance_of_time_in_words_to_now(shop.opens_on)
      else
        distance_of_time_in_words_to_now(shop.opens_on).capitalize + ' ago'
      end
    end
    column 'Closes', sortable: :closes_on do |shop|
      if shop.closes_on > Date.today
        'In ' + distance_of_time_in_words_to_now(shop.closes_on)
      else
        distance_of_time_in_words_to_now(shop.closes_on).capitalize + ' ago'
      end
    end
    default_actions
  end

  form do |f|
    f.inputs do
      f.input :title
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
