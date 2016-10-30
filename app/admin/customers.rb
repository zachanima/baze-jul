require 'csv'

ActiveAdmin.register Customer do
  menu priority: 2

  scope :all, default: true

  filter :shop
  filter :department
  filter :name

  index do
    column :shop
    column :department
    column :name
    column :username
    column 'Password', :plaintext_password
    column :email
    default_actions
  end

  csv do
    column :shop do |customer|
      customer.shop.title
    end
    column :department
    column :name
    column :username
    column :email
    column 'Order' do |customer|
      order = customer.orders.last
      if order
        order.product.title + (order.options.count > 0 ? " (#{order.options.collect(&:text) * ', '})" : '')
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :shop
      f.input :department
      f.input :name
      f.input :username
      f.input :password
      f.input :email
    end
    f.buttons
  end

  collection_action :import_csv, method: :post do
    @customers = CSV.parse(params[:file].read)
    fields = @customers.first.collect { |f| f.underscore.to_sym }
    @customers = @customers.drop(1).collect do |c|
      customer = Hash.new
      fields.each_index do |i|
        customer[fields[i]] = c[i]
      end
      customer[:shop_id] = params[:user][:shop_id]
      Customer.create(customer)
    end
    redirect_to action: :index, notice: 'CSV imported successfully!'
  end

  sidebar :import_csv do
    form_tag import_csv_admin_customers_path, multipart: true do
      (collection_select :user, :shop_id, Shop.all, :id, :title) +
      (file_field_tag :file) +
      submit_tag
    end
  end
end
