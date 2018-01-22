class BasePage
    def initialize(driver_wrapper)
        @driver_wrapper = driver_wrapper
        @frame_selector = nil
    end

    def with_frame
        if !@frame_selector.nil?
            el=  @driver_wrapper.get_one_element @frame_selector
            @driver_wrapper.switch_frame el
            yield
            @driver_wrapper.switch_frame
        else 
            raise "There is no frame selector for the #{self.class.name}"
        end
    end

    private :with_frame
end