require_relative "BasePage"
require_relative "ItemDetails"

class SearchResults < BasePage

    ITEM_LINKS = "div.result__item .product__details a.product__title-link"

    def initialize(driver_wrapper)
        super
        @frame_selector = ".modal-iframe"
    end
    
    def get_search_results
        
        with_frame {
            elements_array = @driver_wrapper.get_multiple_elements ITEM_LINKS
            @elements = elements_array.map { |element| element.text }
        }
        @elements
    end

    def open(item_name)
        with_frame {
            el = @driver_wrapper.get_one_element_by_link_text item_name
            el.click
        }
        ItemDetails.new @driver_wrapper
    end

end