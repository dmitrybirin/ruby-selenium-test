require_relative "BasePage"

class CartPage < BasePage

    ITEMS_TITLE = "div.cart-product-title" 

    def get_items
        elements = @driver_wrapper.get_multiple_elements ITEMS_TITLE
        elements.map { |element| element.text }
    end

end
