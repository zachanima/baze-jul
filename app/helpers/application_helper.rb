module ApplicationHelper
  def distance_of_date_in_words_to_now_as_sentence(date)
    words = distance_of_time_in_words_to_now(date)
    date > Date.today ? "In #{words}" : "#{words.capitalize} ago"
  end
end
