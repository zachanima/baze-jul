module ApplicationHelper
  def distance_of_date_as_sentence_to_now(date)
		return '' if date.nil?
    words = distance_of_time_in_words_to_now(date)
    date > Date.today ? "In #{words}" : "#{words.capitalize} ago"
  end

  def distance_of_time_as_sentence_to_now(time)
		return '' if time.nil?
    words = distance_of_time_in_words_to_now(time)
    time > Time.now ? "In #{words}" : "#{words.capitalize} ago"
  end
end
