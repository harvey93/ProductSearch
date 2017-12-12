json.array! @items do |item|
  json.name item['name']
  json.price item['price']

  # json.retailer do
    json.retailer_name item['retailer_name']
    json.retailer_url item['retailer_url']
  # end
end
