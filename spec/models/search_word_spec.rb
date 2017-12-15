require 'rails_helper'

RSpec.describe SearchWord, :type => :model do

  it "Saves word to cache" do
    word = SearchWord.new({name: "testWord"})
    word.save!
    res = SearchWord.where(name: "testWord")[0]
    expect(res).to eq(word)
  end

  it "Doesn't find non existent word" do
    res = SearchWord.where(name: SecureRandom.base64)
    expect(res).to be_empty
  end

end
