# require 'semantics3'

class Sem3SearchService
  attr_reader :params

  def initialize(params)
    @params = params
    @key = ENV["SEM3_API_KEY"]
    @secret = ENV["SEM3_API_SECRET"]
  end

  def execute
    return [] unless params[:search]

    setup
    construct_query
    get_products
  end

  private

  def setup
    puts "Setup"
    puts @key
    puts @secret
    @sem3 = Semantics3::Products.new(@key, @secret)

  end

  def construct_query
    puts "QUERY"

    @sem3.products_field('search', params[:search])
  end

  def get_products
    puts "Products"

    Rails.logger.info('+++ Sem3 API: Getting products... +++')

    r = @sem3.get_products()

    if r['code'].eql?('OK')
      r['results']
    else
      if r['message']
        m = JSON.parse(r['message'])
        Rails.logger.debug("+++ Sem3 API Error: #{m['message']} Code: #{m['code']} +++")
      end

      []
    end
  end
end
