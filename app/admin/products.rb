ActiveAdmin.register Product do
  menu priority: 3

  scope :all, default: true

  filter :shop
  filter :title
  filter :brand
  filter :text

  index do
    column :shop, sortable: :shop_id
    column :title
    column :brand
    column :option_arrays do |product|
      product.option_arrays.collect(&:title) * ', '
    end
    column 'State' do |product|
      status_tag 'No image', :error unless product.image.exists?
    end
    column do |product|
      link_to 'Copy', copy_admin_product_path(product)
    end
    default_actions
  end

  form do |f|
    f.inputs do
      f.input :shop
      f.input :title
      f.input :brand
      f.input :text
      f.input :image
      f.input :option_arrays, as: :check_boxes
    end
    f.object.option_arrays.each do |option_array|
      f.inputs option_array.text do
        f.input :options, as: :check_boxes, collection: option_array.options
      end
    end
    f.buttons
  end

  member_action :copy do
    redirect_to edit_admin_product_path(Product.find(params[:id]).copy),
      notice: 'Product was successfully copied.'
  end
end
