class Api::SearchResultController < ApplicationController
  def create
    res = SearchWord.where(name: params[:search])
    word = res[0]

    item = params["result"]
    puts item
    name = item["name"]
    price = item["price"]
    retailer_name = item['retailer']
    retailer_url = item['url']

    search_result = SearchResult.new({name: name, price: price, retailer_name: retailer_name, retailer_url: retailer_url, search_word_id: word.id})

    if(!search_result.save!)
      render json: ["Unable to add search result"], status: 500
    else
      @items = word.search_results
      render 'api/product_search/index'
    end
  end


  def destroy
    @result = SearchResult.find(params["id"])
    @result.destroy
    render json: ["Successfull Delete"], status: 200
  end
end
