require 'diary'

RSpec.describe Diary do
  it "constructs" do
    diary = Diary.new
  end

  context "initally" do
    it "has an empty list of entries" do
      diary = Diary.new
      expect(diary.all).to eq []
    end
  end

  it "has a word count of 0" do
    diary = Diary.new
    expect(diary.count_words_diary).to eq 0
  end

  it "has a reading time of 0" do
    diary = Diary.new
    expect(diary.reading_time_diary(2)).to eq 0
  end

  it "has a best reading time of nil" do
    diary = Diary.new
    expect(diary.find_best_entry_for_reading_time(200, 1)).to eq nil
  end
  
end