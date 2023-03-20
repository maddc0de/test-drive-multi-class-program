require 'diaryEntry'

RSpec.describe DiaryEntry do
  it "constructs" do
    entry_1 = DiaryEntry.new("Monday", "Hello " * 200)
    expect(entry_1.title).to eq "Monday"
    expect(entry_1.contents).to eq "Hello " * 200
  end

  it "returns number of words in contents" do
    entry = DiaryEntry.new("Monday", "Hello " * 200)
    expect(entry.count_words).to eq 200
  end
end