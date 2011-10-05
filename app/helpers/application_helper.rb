module ApplicationHelper
  def distance_of_date_in_words_to_now_as_sentence(date)
    if date > Date.today
      'In ' + distance_of_time_in_words_to_now(date)
    else
      distance_of_time_in_words_to_now(date).capitalize + ' ago'
    end
  end
end
