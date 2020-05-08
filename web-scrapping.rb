require 'watir'

browser = Watir::Browser.new

browser.goto 'https://www.oyorooms.com/search?location=Pune%2C%20Maharashtra%2C%20India&city=Pune&searchType=city&checkin=08%2F05%2F2020&checkout=09%2F05%2F2020&roomConfig%5B%5D=1&guests=1&rooms=1&filters%5Bcity_id%5D=11'

hotels = Array.new
browser.divs(class: 'listingHotelDescription').each do |hotel|
  hotelHash = Hash.new
  if !hotel.h3.text.nil?
    hotelHash['name'] = hotel.h3.text
  end
  hotelHash['price'] = hotel.span(class: 'listingPrice__finalPrice').text

  if !hotelHash.empty?
    hotels << hotelHash
  end
end

# puts status
puts hotels

browser.close