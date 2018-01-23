require_relative "BasePage"
require_relative "CartPage"

class ItemDetails < BasePage
    
    attr_accessor :features

    SEARCH_RESULTS_ROWS = "table.product-specs__table tr:not(.product-specs__table-title)"
    FEATURE_TITLE = "td:first-child"
    FEATURE_VALUE = "td:nth-child(2)"
    ADD_TO_CART_LINK_NAME = "В корзину"
    GO_TO_CART_LINK_NAME = "В корзине"

    def get_value_for_value_element(value_element)
        text = value_element.text
        if text == "" 
            if @driver_wrapper.is_elem_exist(".i-x", value_element)
                return false
            elsif @driver_wrapper.is_elem_exist(".i-tip", value_element)
                return true
            else 
                return nil
            end
        else  
            return text
        end
    end

    def get_features
        @features = Hash.new
        search_results = @driver_wrapper.get_multiple_elements SEARCH_RESULTS_ROWS
        search_results.each do |element|
            title_el = element.find_element :css, FEATURE_TITLE
            value_el = element.find_element :css, FEATURE_VALUE
            @features[title_el.text] = get_value_for_value_element value_el            
        end
        @features
    end

    def add_to_cart
        @driver_wrapper.get_one_element_by_link_text(ADD_TO_CART_LINK_NAME).click
    end

    def go_to_cart
        @driver_wrapper.get_one_element_by_link_text(GO_TO_CART_LINK_NAME).click
        CartPage.new @driver_wrapper
    end

    private :get_value_for_value_element

end