ActiveAdmin::Dashboards.build do
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
  end
end
