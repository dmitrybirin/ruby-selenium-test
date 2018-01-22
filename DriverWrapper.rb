require 'selenium-webdriver'

class DriverWrapper

    def initialize(name)
        @wait = Selenium::WebDriver::Wait.new(:timeout => 45, :interval => 1)
        @driver = Selenium::WebDriver.for :firefox if name.downcase == "firefox"
    end

    def go_to(url)
        @driver.navigate.to url
    end

    def switch_frame(element=nil)
        if !element.nil? 
            @driver.switch_to.frame element
        else 
            @driver.switch_to.default_content
        end
    end

    def get_one_element(css_selector)
        @wait.until { @driver.find_element :css, css_selector }
    end

    def get_one_element_by_link_text(link_text)
        @wait.until { @driver.find_element :partial_link_text, link_text }
    end
    
    def get_multiple_elements(css_selector)
        @wait.until {
            elements = @driver.find_elements :css, css_selector
            elements if elements.length > 0
        }
    end

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
                @driver.find_element :css, css_selector
                return true
            rescue Selenium::WebDriver::Error::NoSuchElementError
                return false
            end
        end
    end

    def filter_element_by_text(elements_array, text)
        elements_array.each do |element|
            if element.text == text
                return element
            end
        end
    end

end