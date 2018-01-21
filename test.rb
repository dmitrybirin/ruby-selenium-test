require 'rubygems'
require 'selenium-webdriver'

# Input capabilities
# caps = Selenium::WebDriver::Firefox 
# caps[:browserName] = 'Chrome'

wait = Selenium::WebDriver::Wait.new(:timeout => 30, :interval => 0.1)


driver = Selenium::WebDriver.for :firefox
# 1. Open https://www.onliner.by/
driver.navigate.to "https://www.onliner.by"
# 2. Find and open `Canon EOS 1300D` camera
search_bar = driver.find_element :css, 'input.fast-search__input'
search_bar.send_keys "Canon EOS 1300D", :enter

puts "iframe not found" if !wait.until {
    element = driver.find_element :css, '.modal-iframe'
    element if element.displayed?
}

driver.switch_to.frame driver.find_element :css, '.modal-iframe'

search_results = wait.until {
    puts "waiting"
    elements = driver.find_elements :css, 'div.result__item .product__details a.product__title-link'
    elements if elements.length > 0
}

search_results.each do |element|
    puts element.text
end
#div.result__item product__details a.product__title-link
# 3. Check screen size and matrix size (both quantity-based and physical-based) and compare them with specified values (`3 ''`, `APS-C (1.6 crop)` and `18 Мп` accordingly)
# 4. Add item to cart
# 5. Open cart and check that specified item was added to cart



# element.send_keys "BrowserStack"
# element.submit
# puts driver.title
# driver.quit