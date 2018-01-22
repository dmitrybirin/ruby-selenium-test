require 'rubygems'
require 'selenium-webdriver'

# Input capabilities
# caps = Selenium::WebDriver::Firefox 
# caps[:browserName] = 'Chrome'

def filter_element_by_text(elements_array, text)
    elements_array.each do |element|
        if element.text == text
            return element
        end
    end
end


wait = Selenium::WebDriver::Wait.new(:timeout => 30, :interval => 0.5)

driver = Selenium::WebDriver.for :firefox
# 1. Open https://www.onliner.by/
driver.navigate.to "https://www.onliner.by"
# 2. Find and open `Canon EOS 1300D` camera

item_name = "Canon EOS 1300D"
search_bar = driver.find_element :css, 'input.fast-search__input'
search_bar.send_keys item_name, :enter

puts "iframe not found" if !wait.until {
    element = driver.find_element :css, '.modal-iframe'
    element if element.displayed?
}

driver.switch_to.frame driver.find_element :css, '.modal-iframe'

search_results = wait.until {
    puts "waiting..."
    elements = driver.find_elements :css, "div.result__item .product__details a.product__title-link"
    elements if elements.length > 0
}


el = filter_element_by_text search_results, "Canon EOS 1300D Body"

el.click

driver.switch_to.default_content

search_results = wait.until {
    puts "waiting..."
    elements = driver.find_elements :css, "table.product-specs__table tr:not(.product-specs__table-title)"
    elements if elements.length > 0
}


def is_elem_exist(css_selector, element=nil)
    if element
        begin
            element.find_element :css, css_selector
            return true
        rescue Selenium::WebDriver::Error::NoSuchElementError
            return false
        end
    else 
        begin
            driver.find_element :css, css_selector
            return true
        rescue Selenium::WebDriver::Error::NoSuchElementError
            return false
        end
    end
end

def get_value_for_value_element(value_element)
    text = value_element.text
    if text == "" 
        if is_elem_exist(".i-x", value_element)
            return false
        elsif is_elem_exist(".i-tip", value_element)
            return true
        else 
            return nil
        end
    else 
        return text
    end
end

table = Hash.new

search_results.each do |element|
    title_el = element.find_element :css, "td:first-child"
    value_el = element.find_element :css, "td:nth-child(2)"
    table[title_el.text] = get_value_for_value_element(value_el)
end

# 3. Check screen size and matrix size (both quantity-based and physical-based) and compare them with specified values (`3 ''`, `APS-C (1.6 crop)` and `18 Мп` accordingly)
#asserts waits for cucumber
puts table["Размер экрана"]
puts table["Количество точек матрицы"]
puts table["Физический размер матрицы"]

# 4. Add item to cart
el = wait.until {
    driver.find_element :partial_link_text, "В корзину"
}
puts el.text
el.click
el = wait.until {
driver.find_element :partial_link_text, "В корзине"
}
puts el.text
el.click
# 5. Open cart and check that specified item was added to cart



wait.until { driver.find_element(:css, "div.cart-products") }
els = wait.until { 
    elements = driver.find_elements(:css, "div.cart-product")
    elements if elements.length > 0 
}
puts els.length
# puts el.text
el = wait.until { driver.find_element :css, "div.cart-product-title" }
puts el.text
el = wait.until { driver.find_element :css, "div.cart-product-add-box input" }
puts el.attribute "value"
driver.quit