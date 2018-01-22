require_relative "DriverWrapper"
require_relative "pages/HomePage"

driver_wrapper = DriverWrapper.new "firefox"
driver_wrapper.go_to "https://www.onliner.by"

home_page = HomePage.new driver_wrapper
search_results_page = home_page.search_for "Canon EOS 1300D"
item_details_page = search_results_page.open "Canon EOS 1300D Body"
features = item_details_page.get_features
#asserts waits for cucumber
puts features["Размер экрана"]
puts features["Количество точек матрицы"]
puts features["Физический размер матрицы"]
item_details_page.add_to_cart
cart_page = item_details_page.go_to_cart
items = cart_page.get_items
#asserts waits for cucumber
puts items