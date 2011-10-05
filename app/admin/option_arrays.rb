ActiveAdmin.register OptionArray do
  menu priority: 4

  scope :all, default: true

  filter :title
  filter :text

  index do
    column :title
    column :text
    column :options do |option_array|
      option_array.options.collect(&:text) * ', '
    end
    default_actions
  end

  form do |f|
    f.inputs do
      f.input :title, hint: 'Not visible to customers'
      f.input :text
    end
    f.inputs 'Options' do
      f.semantic_fields_for :options do |option|
        option.input :text, required: false
      end
    end
    f.buttons
  end

  controller do
    def new
      @option_array = OptionArray.new
      5.times { @option_array.options.build }
    end
    def edit
      @option_array = OptionArray.find(params[:id])
      5.times { @option_array.options.build }
    end
  end
end
