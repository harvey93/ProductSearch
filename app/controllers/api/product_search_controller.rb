class Api::ProductSearchController < ApplicationController

  def index
    #@items = Sem3SearchService.new(params).execute
    res = SearchWord.where(name: params[:search])
    if res.empty?
      puts "Save to db and return"
      @items = []
    else
      word = res[0]
      puts "Get from cache"
      @items = word.search_results
    end
  end

end
