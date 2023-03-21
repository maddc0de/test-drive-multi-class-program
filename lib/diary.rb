class Diary
  def initialize
    @entry_list = []
  end

  def add(entry) # entry is an instance of diaryEntry class
    @entry_list << entry
  end

  def all
    @entry_list
  end

  def count_words_diary
    total = 0
    @entry_list.each do |entry|
      total += entry.count_words
    end
    total    
    # @entry_list.sum(&:count_words)
  end

  def reading_time_diary(wpm)
    fail "wpm must be a positive number." if wpm == 0 
    (count_words_diary / wpm.to_f).ceil
  end

  def find_best_entry_for_reading_time(wpm, minutes) # `wpm` = words/minute , minutes` = num of minutes user has to read
    best_entry = nil
    closest_best_entry = 0

    # selects and returns a new array with readable entries
    readable_entries = @entry_list.select do |entry|
      entry.reading_time(wpm) <= minutes
    end
  
    readable_entries.each do |entry|
      if entry.count_words > closest_best_entry
        best_entry = entry
        closest_best_entry = entry.count_words
      end

    end
    best_entry
  end
end