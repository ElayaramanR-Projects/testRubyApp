require_relative '../locators/inventory_locators'
require_relative '../helpers/config_helper'
require_relative '../pages/login_page'
require_relative '../helpers/json_helper'


class InventoryPage
  include InventoryLocators
  include Utilities
  user_object = JsonHelper.read('../test_data/user_credentials.json')
  @valid_user = user_object['valid_user']

  def initialize(driver)
    @driver = driver
  end

  def add_to_cart_button
    wait_for_element(ADD_TO_CART_BUTTON).click
  end

  def open_sort_filter
    wait_for_element(InventoryLocators::SORT_DROPDOWN).click
  end

  def change_order_to_A_Z
    open_sort_filter
    wait_for_element(SORT_DROPDOWN).click
    wait_for_element(SORT_OPTION_1).click
  end

  def change_order_to_Z_A
    open_sort_filter
    wait_for_element(SORT_DROPDOWN).click
    wait_for_element(SORT_OPTION_2).click
  end

  def change_order_to_price_low_high
    open_sort_filter
    wait_for_element(SORT_DROPDOWN).click
    wait_for_element(SORT_OPTION_3).click
  end

  def change_order_to_price_high_low
    open_sort_filter
    wait_for_element(SORT_DROPDOWN).click
    wait_for_element(SORT_OPTION_4).click
  end

  def fill_Checkout_form(first_name, last_name, zip_code)
    wait_for_element(CHECKOUT_FIRST_NAME).send_keys(first_name)
    wait_for_element(CHECKOUT_LAST_NAME).send_keys(last_name)
    wait_for_element(CHECKOUT_ZIP_CODE).send_keys(zip_code)
  end
end