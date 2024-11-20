module Utilities
  def find_element(locator)
    @driver.find_element(locator[:type], locator[:value])
  end
  def wait_for_element(css_selector)
    wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    wait.until {  @driver.find_element(:css, css_selector) }
  end
  def wait_for_elements(css_selector)
    wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    wait.until {  @driver.find_elements(:css, css_selector) }
  end
end