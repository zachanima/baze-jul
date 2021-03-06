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
    column 'Group', sortable: :shop_group_id do |shop|
			if shop.shop_group
				unless shop.shop_group_text.blank?
					"#{shop.shop_group_text} in #{shop.shop_group.title}"
				else
					shop.shop_group.title
				end
			end
		end
    column :username_text
    column :password_text
    column :locale, sortable: :locale do |shop|
      Shop::LOCALES[shop.locale]
    end
    column 'Opens', sortable: :opens_on do |shop|
      distance_of_date_as_sentence_to_now(shop.opens_on)
    end
    column 'Closes', sortable: :closes_on do |shop|
      distance_of_date_as_sentence_to_now(shop.closes_on)
    end
    default_actions
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :text
    end
    f.inputs 'Advanced' do
      f.input :link, required: false
      f.input :username_text
      f.input :password_text, as: :string
      f.input :logo
      f.input :locale, as: :select, collection: Shop::LOCALES.invert
      f.input :opens_on
      f.input :closes_on, hint: 'Closed at the start of this day'
			f.input :shop_group
			f.input :shop_group_text, hint: 'Shown under logo on shop group page'
    end
    f.buttons
  end
end
