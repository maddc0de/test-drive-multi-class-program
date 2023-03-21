class DiaryEntry
  def initialize(title, contents) # title, contents are strings
    @title = title
    @contents = contents
    @contents_words = contents.split(" ")
    @counter = 0
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

  def reading_chunk(wpm, minutes) 
    string_to_return = @contents_words[@counter...@counter+(wpm * minutes)].join(" ")
    if @counter + (wpm * minutes) >= @contents_words.length
      @counter = 0
    else
      @counter += (wpm * minutes)
    end

      string_to_return

    # Returns a string with a chunk of the contents that the user could read
    # in the given number of minutes.
    # If called again, `reading_chunk` should return the next chunk, skipping
    # what has already been read, until the contents is fully read.
    # The next call after that it should restart from the beginning.
  end
end