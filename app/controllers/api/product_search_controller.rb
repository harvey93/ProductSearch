class Api::ProductSearchController < ApplicationController

  def index
    @items = Sem3SearchService.new(params).execute
  end

end
