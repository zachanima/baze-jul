ActiveAdmin.register Product do
  menu priority: 3

  scope :all, default: true

  filter :shop
  filter :title
  filter :brand
  filter :text

  index do
    column :shop
    column :title
    column :brand
    column :option_arrays do |product|
      product.option_arrays.collect(&:title) * ', '
    end
    default_actions
  end

  form do |f|
    f.inputs do
      f.input :shop
      f.input :title
      f.input :brand
      f.input :text
      f.input :option_arrays, as: :check_boxes
    end
    f.object.option_arrays.each do |option_array|
      f.inputs option_array.text do
        f.input :options, as: :check_boxes, collection: option_array.options
      end
    end
    f.buttons
  end
end
