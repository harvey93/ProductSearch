require 'rails_helper'

RSpec.describe SearchResult, :type => :model do
  it "Saves result to cache" do
    search_result = SearchResult.new({name: "testName", price: 0, retailer_name: "amazon", retailer_url: "amazon.com", search_word_id: 100})
    search_result.save!
    res = SearchResult.where(name: "testName")[0]
    expect(res).to eq(search_result)
  end


  it "Doesn't find non existent result" do
    res = SearchResult.where(name: SecureRandom.base64)
    expect(res).to be_empty
  end


  it "Delete word from cache" do
    search_result = SearchResult.new({name: "testName2", price: 0, retailer_name: "amazon", retailer_url: "amazon.com", search_word_id: 100})
    search_result.save!
    search_result.destroy
    res = SearchResult.where(name: "testName2")
    expect(res).to be_empty
  end


end
