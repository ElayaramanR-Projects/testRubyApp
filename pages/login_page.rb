require_relative '../locators/login_locators'
require_relative '../helpers/config_helper'
require_relative '../helpers/Utilities'

class LoginPage
  include LoginLocators
  include Utilities

  def initialize(driver)
    @driver = driver
  end

  def login(username,password)
    @driver.get ConfigHelper.base_url
    wait_for_element(USER_NAME_FIELD).send_keys(username)
    wait_for_element(PASSWORD_FIELD).send_keys(password)
    wait_for_element(LOGIN_BUTTON).click
  end
end