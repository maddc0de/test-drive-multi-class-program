class DiaryEntry
  def initialize(title, contents) # title, contents are strings
    @title = title
    @contents = contents
  end

  def title
    @title
  end

  def contents
    @contents
  end

  def count_words
    @contents.split.length
    # @contents.count(" ") + 1
  end

  def reading_time(wpm)
    fail "wpm must be a positive number." if wpm == 0
    (count_words / wpm.to_f).ceil
  end

  def reading_chunk(wpm, minutes) # `wpm` = words/minute , minutes` = num of minutes user has to read
    # Returns a string with a chunk of the contents that the user could read
    # in the given number of minutes.
    # If called again, `reading_chunk` should return the next chunk, skipping
    # what has already been read, until the contents is fully read.
    # The next call after that it should restart from the beginning.
  end
end