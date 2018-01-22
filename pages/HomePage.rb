require_relative "SearchResults" 
require_relative "BasePage"

class HomePage < BasePage

    SEARCH_INPUT = 'input.fast-search__input'

    def search_for(item_name)
        search_bar = @driver_wrapper.get_one_element SEARCH_INPUT
        search_bar.send_keys item_name, :enter
        SearchResults.new @driver_wrapper
    end 

end