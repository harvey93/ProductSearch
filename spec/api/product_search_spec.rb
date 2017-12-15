require 'rails_helper'

RSpec.describe "Search", :type => :request do
  it "Returns empty cache if non searched word" do
    word = SearchWord.where(name: "apple")
    expect(word).to be_empty
  end

  it "Returns non empty cache after search" do
    get "/api/product_search?search=apple"
    word = SearchWord.where(name: "apple")
    expect(word).to_not be_empty
  end

end
