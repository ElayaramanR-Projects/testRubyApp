require_relative '../locators/login_locators'

class LoginPage
  include LoginLocators

  def initialize(driver)
    @driver = driver
  end

  def login(username,password)
    @driver.find_element(:css, USER_NAME_FIELD).send_keys(username)
    @driver.find_element(:css, PASSWORD_FIELD).send_keys(password)
    @driver.find_element(:css, LOGIN_BUTTON).click
  end
end