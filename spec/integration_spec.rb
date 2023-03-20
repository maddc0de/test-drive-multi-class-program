require 'diary'
require 'diaryEntry'

RSpec.describe "Integration" do
  it "returns an instance of a diary entry" do
    diary = Diary.new
    entry_1 = DiaryEntry.new("Monday", "Hello " * 200)
    diary.add(entry_1)
    expect(diary.all).to eq [entry_1]
  end

  it "returns a list of multiple instance of diary entries" do
    diary = Diary.new
    entry_1 = DiaryEntry.new("Monday", "Hello " * 200)
    entry_2 = DiaryEntry.new("Tuesday", "World " * 200)
    diary.add(entry_1)
    diary.add(entry_2)
    expect(diary.all).to eq [entry_1, entry_2]
  end

  it "returns number of words in all diary entries" do
    diary = Diary.new
    entry_1 = DiaryEntry.new("Monday", "Hello " * 200)
    entry_2 = DiaryEntry.new("Tuesday", "World " * 200)
    diary.add(entry_1)
    diary.add(entry_2)
    expect(diary.count_words_diary).to eq 400
  end

end


# Diary.all returns list of all diary entries
# Diary.count_words returns number of all words in all diary entries
# diary.reading_time returns estimate reading time in minuters for all entries in diary

# diary.best_entry_reading_time Returns an instance of diary entry representing the entry that is closest to, but not over, the length that the user could read in the minutes they
# have available given their reading speed.