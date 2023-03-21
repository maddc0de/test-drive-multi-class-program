require 'diaryEntry'

RSpec.describe DiaryEntry do
  it "constructs" do
    entry_1 = DiaryEntry.new("Monday", "Hello " * 200)
    expect(entry_1.title).to eq "Monday"
    expect(entry_1.contents).to eq "Hello " * 200
  end

  describe "count_words method" do
    it "returns zero if contents is empty" do
      entry = DiaryEntry.new("Monday", "")
      expect(entry.count_words).to eq 0
    end

    it "returns number of words in the contents" do
      entry = DiaryEntry.new("Monday", "Hello " * 200)
      expect(entry.count_words).to eq 200
    end
  end

  describe "reading_time method" do
    it "fails when wpm is zero" do
      entry = DiaryEntry.new("Monday", "hello")
      expect { entry.reading_time(0)}.to raise_error "wpm must be a positive number."
    end

    it "returns zero if contents is empty" do
      entry = DiaryEntry.new("Monday", "")
      expect(entry.reading_time(200)).to eq 0
    end

    it "returns the reading time for the contents" do
      entry = DiaryEntry.new("Monday", "Hello " * 350)
      expect(entry.reading_time(200)).to eq 2  # should round num up
    end
  end

  describe "reading_chunk method" do
    it "returns all contents when reading time is 1 minute" do
      text = "hello" * 60
      diary_entry = DiaryEntry.new("day 1", text)
      expect(diary_entry.reading_chunk(60, 1)).to eq text
    end
  
    it "returns the next 60 words when reading_chunk is called the 2nd time" do
      text = ("hello " * 60) + ("world " * 60)
      expected_result = "world " * 60
      diary_entry = DiaryEntry.new("day 1", text)
      result_1 = diary_entry.reading_chunk(60, 1)
      result_2 = diary_entry.reading_chunk(60, 1)
      expect(result_2).to eq expected_result.rstrip
    end
  
    it "returns the first 60 words when reading_chunk is called the 3rd time" do
      text = ("hello " * 60) + ("world " * 60)
      expected_result = "hello " * 60
      diary_entry = DiaryEntry.new("day 1", text)
      result_1 = diary_entry.reading_chunk(60, 1)
      result_2 = diary_entry.reading_chunk(60, 1)
      result_3 = diary_entry.reading_chunk(60, 1)
      expect(result_3).to eq expected_result.rstrip
    end
  
    it "returns the first 10 words when reading_chunk is called the 3rd time" do
      text = ("hello " * 60) + ("world " * 70)
      expected_result = "world " * 10
      diary_entry = DiaryEntry.new("day 1", text)
      result_1 = diary_entry.reading_chunk(60, 1)
      result_2 = diary_entry.reading_chunk(60, 1)
      result_3 = diary_entry.reading_chunk(60, 1)
      expect(result_3).to eq expected_result.rstrip
    end
  
    it "returns the first 60 hellos when reading_chunk is called the 4th time" do
      text = ("hello " * 60) + ("world " * 70)
      expected_result = "hello " * 60
      diary_entry = DiaryEntry.new("day 1", text)
      result_1 = diary_entry.reading_chunk(60, 1)
      result_2 = diary_entry.reading_chunk(60, 1)
      result_3 = diary_entry.reading_chunk(60, 1)
      result_4 = diary_entry.reading_chunk(60, 1)
      expect(result_4).to eq expected_result.rstrip
    end
  end

end