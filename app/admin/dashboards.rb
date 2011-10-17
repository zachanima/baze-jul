ActiveAdmin::Dashboards.build do
  section 'Recent Orders', priority: 1 do
    table_for Order.order('created_at DESC').limit(10) do
      column :shop
      column :customer
      column :product
      column 'Placed' do |order|
        distance_of_time_as_sentence_to_now(order.created_at)
      end
    end
    strong { link_to 'View Orders', admin_orders_path }
  end

  section 'Customers in the last 10 minutes', priority: 2 do
    table_for Customer.where('current_sign_in_at >= ?', Time.now - 600) do
      column :shop
      column :name
    end
    strong { link_to 'View Customers', admin_customers_path }
  end

  section 'Pending Tasks' do
    table_for Task.pending.limit(10) do
      column 'State' do |task|
        status_tag task.status
      end
      column :title
      column 'Created' do |task|
        distance_of_time_as_sentence_to_now(task.created_at)
      end
    end
    strong { link_to 'View Pending Tasks', admin_tasks_path(scope: :pending) }
  end

  section 'Recently Completed Tasks' do
    table_for Task.complete.limit(10) do
      column 'State' do |task|
        status_tag task.status
      end
      column :title
      column 'Completed' do |task|
        distance_of_time_as_sentence_to_now(task.updated_at)
      end
    end
    strong do
      link_to 'View Completed Tasks', admin_tasks_path(scope: :complete)
    end
  end
end
