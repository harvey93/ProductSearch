class Api::ProductSearchController < ApplicationController

  def index
    res = SearchWord.where(name: params[:search])
    if res.empty?
      # Get items from semantics3 api
      @items = Sem3SearchService.new(params).execute
      word = SearchWord.new({name: params[:search]})
      if word.save!
        #Cache items
        cache(word)
      else
        render json: ["Unable to save word to cache"], status: 500
      end
    else
      # Get items from cache
      word = res[0]
    end
    @items = word.search_results
  end

  def cache(word)
    @items.each do |item|
      name = item["name"]
      price = item["price"]
      retailer_name = item['sitedetails'].first['name']
      retailer_url = item['sitedetails'].first['url']
      search_result = SearchResult.new({name: name, price: price, retailer_name: retailer_name, retailer_url: retailer_url, search_word_id: word.id})
      if !search_result.save!
        render json: ["Unable to save word to cache"], status: 500
      end
    end
  end

end
