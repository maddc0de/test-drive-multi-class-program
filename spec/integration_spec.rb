require 'diary'
require 'diaryEntry'

RSpec.describe "Integration" do
  it "returns a list of diary entries" do
    diary = Diary.new
    entry_1 = DiaryEntry.new("Monday", "Hello " * 200)
    entry_2 = DiaryEntry.new("Tuesday", "World " * 200)
    diary.add(entry_1)
    diary.add(entry_2)
    expect(diary.all).to eq [entry_1, entry_2]
  end
  
  describe "word counting behaviour" do
    it "returns number of words in all diary entries contents" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("Monday", "Hello " * 200)
      entry_2 = DiaryEntry.new("Tuesday", "World " * 200)
      diary.add(entry_1)
      diary.add(entry_2)
      expect(diary.count_words_diary).to eq 400
    end
  end

  describe "reading time behaviour" do
    it "fails when wpm is 0" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("Monday", "Hello " * 300)
      diary.add(entry_1)
      expect {diary.reading_time_diary(0)}.to raise_error "wpm must be a positive number."
    end

    it "returns the total reading time for all entries when total number of words fits exactly" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("Monday", "Hello " * 300)
      entry_2 = DiaryEntry.new("Tuesday", "World " * 300)
      diary.add(entry_1)
      diary.add(entry_2)
      expect(diary.reading_time_diary(200)).to eq 3
    end

    it "returns the total reading time for all entries when total number of words falls over a minute" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("Monday", "Hello " * 200)
      entry_2 = DiaryEntry.new("Tuesday", "World " * 100)
      diary.add(entry_1)
      diary.add(entry_2)
      expect(diary.reading_time_diary(200)).to eq 2
    end

  end

  describe "best reading time behaviour" do
    it "returns entry when we just have one entry and it is exactly within readable time" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("Monday", "Hello " * 200)
      diary.add(entry_1)
      result = diary.find_best_entry_for_reading_time(200, 1)
      expect(result).to eq entry_1
    end

    it "returns longest entry that user can read within readable time when there is more than one entry given" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("Monday", "Hello " * 100)
      entry_2 = DiaryEntry.new("Monday", "Hello " * 300)
      best_entry = DiaryEntry.new("Monday", "Hello " * 150)
      diary.add(entry_1)
      diary.add(entry_2)
      diary.add(best_entry)
      expect(diary.find_best_entry_for_reading_time(200, 1)).to eq best_entry
    end


    context "where we just have one entry and it is unreadable within the time given" do
      it "returns nil" do
        diary = Diary.new
        entry_1 = DiaryEntry.new("Monday", "Hello " * 300)
        diary.add(entry_1)
        result = diary.find_best_entry_for_reading_time(200, 1)
        expect(result).to eq nil
      end
    end

  end

end



# diary.best_entry_reading_time Returns an instance of diary entry representing the entry that is closest to, but not over, the length that the user could read in the minutes they
# have available given their reading speed.