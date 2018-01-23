# require "rspec-expectations"
require_relative File.dirname(__FILE__) + "./../../DriverWrapper"
require_relative File.dirname(__FILE__) + "./../../pages/HomePage"


# 
# search_results_page = home_page
# item_details_page = search_results_page.open "Canon EOS 1300D Body"
# features = item_details_page.get_features
# #asserts waits for cucumber
# puts features["Размер экрана"]
# puts features["Количество точек матрицы"]
# puts features["Физический размер матрицы"]
# item_details_page.add_to_cart
# cart_page = item_details_page.go_to_cart
# items = cart_page.get_items
# #asserts waits for cucumber
# puts items

Before do |scenario|
    puts 'Executing scenario: ' + scenario.name
    @wait = Selenium::WebDriver::Wait.new(:timeout => 15, :interval => 0.5)
end
  
Given("a browser is {string}") do |browser_name|
    @driver_wrapper = DriverWrapper.new browser_name, @wait
end

When("I navigate to {string}") do |address|
    @driver_wrapper.go_to address
end

And("I search {string}") do |search_item|
    @search_resulst_page = HomePage.new(@driver_wrapper).search_for search_item
end

And("I open {string}") do |link|
    @item_details_page = @search_resulst_page.open link
    @features = @item_details_page.get_features
end

Then("firstly {string} is {string}") do |title, value|
    expect(@features[title]).to eq(value)
end

And("secondly {string} is {string}") do |title, value|
    expect(@features[title]).to eq(value)
end

And("{string} is {string}") do |title, value|
    expect(@features[title]).to eq(value)
end

When("I add the item to cart") do
    @item_details_page.add_to_cart
end

And("I go to the cart") do
    cart_page = @item_details_page.go_to_cart
    @items = cart_page.get_items
end

Then("{int} item in the cart") do |number_of_items|
    expect(@items.length).to eq(number_of_items)
end

Then("the item name is {string}") do |item_name|
    expect(@items[0]).to eq(item_name)
end

After do |scenario|
    @driver_wrapper.quit
end
