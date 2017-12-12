json.array! @items do |item|
  json.name item['name']
  json.price item['price']

  json.retailer do
    json.name item['sitedetails'].first['name']
    json.url item['sitedetails'].first['url']
  end
end
