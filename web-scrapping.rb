require 'watir'

browser = Watir::Browser.new

site_to_crawl = 'https://www.oyorooms.com/'
# site_to_crawl = 'https://www.oyorooms.com/search?location=Pune%2C%20Maharashtra%2C%20India&city=Pune&searchType=city&checkin=08%2F05%2F2020&checkout=09%2F05%2F2020&roomConfig%5B%5D=1&guests=1&rooms=1&filters%5Bcity_id%5D=11'
browser.goto site_to_crawl

browser.text_field(id: 'autoComplete__home').set 'Pune'
browser.div(class: 'geoSuggestionsList__container').divs.first.click
browser.button(class: 'searchButton--home').click

hotels = Array.new
browser.divs(class: 'listingHotelDescription').each do |hotel|
  hotelHash = Hash.new
  if !hotel.h3.text.nil?
    hotelHash['name'] = hotel.h3.text
    hotelHash['price'] = hotel.span(class: 'listingPrice__finalPrice').text
  end
  
  if !hotelHash.empty?
    hotels << hotelHash
  end
end

# puts status
puts hotels

browser.close