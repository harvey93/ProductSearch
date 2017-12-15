require 'rails_helper'

RSpec.describe "Results", :type => :request do
  before(:each) do
    word = SearchWord.new(name: "microsoft")
    word.save!
    post "/api/search_result", params: {result: {name: "addTest1", price: 1, retailer_name: "amazon", retailer_url: "amazon.com"}, search: "microsoft"}
  end

  it "Adds result to cache" do
    res = SearchResult.where(name: "addTest1")
    expect(res).to_not be_empty
  end

  it "Deletes result from cache" do
    res = SearchResult.where(name: "addTest1")[0]
    delete "/api/search_result/#{res.id}"
    res2 = SearchResult.where(name: "addTest1")
    expect(res2).to be_empty
  end

end
