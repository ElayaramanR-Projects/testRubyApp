require 'spec_helper'
require_relative '../pages/inventory_page'
require_relative '../pages/login_page'
require_relative '../helpers/json_helper'
require_relative '../locators/inventory_locators'
require_relative '../helpers/Utilities'

describe 'Inventory_spec' do
  include InventoryLocators
  include Utilities

  user_object = JsonHelper.read('../test_data/user_credentials.json')
  valid_user = user_object['valid_user']

  before(:all) do
    @driver = Selenium::WebDriver.for :chrome
    @inventory_page = InventoryPage.new(@driver)
    @login_page = LoginPage.new(@driver)
    @login_page.login(valid_user['username'], valid_user['password'])
    @driver.get ConfigHelper.home
  end

  after(:all) do
    @driver.quit
  end

  context 'when adding items to the cart' do
    it 'adds a single item to the cart' do
      @inventory_page.add_to_cart_button
      expect(wait_for_element(InventoryLocators::CART_BADGE).text).to eql('1')
      expect(wait_for_elements(InventoryLocators::REMOVE_BUTTON).length).to eql(1)
      expect(wait_for_elements(InventoryLocators::ADD_TO_CART_BUTTON).length).to eql(5)
      sleep 2
    end

    it 'changes the order' do
      expect(wait_for_element('.inventory_item_name').text).to eql('Sauce Labs Backpack')
      @inventory_page.open_sort_filter
      expect(wait_for_element(InventoryLocators::SORT_OPTION_2).text).to eql('Name (Z to A)')
      @inventory_page.change_order_to_Z_A
      expect(wait_for_element('.inventory_item_name').text).to eql('Test.allTheThings() T-Shirt (Red)')
      sleep 2
    end

    it 'open the cart' do
      wait_for_element(InventoryLocators::CART_BUTTON).click
      expect(wait_for_element('.cart_list').displayed?).to be true
      expect(@driver.current_url).to include('cart')
      sleep 2
    end

    it 'removes a single item from the cart' do
      wait_for_element(InventoryLocators::CART_REMOVE_BUTTON).click
      expect(wait_for_elements(InventoryLocators::CART_REMOVE_BUTTON).length).to eql(0)
      wait_for_element(InventoryLocators::BACK_TO_SHOPPING).click
      expect(wait_for_elements(InventoryLocators::REMOVE_BUTTON).length).to eql(0)
      sleep 2
    end

    it 'adds multiple items to the cart' do
      for range in 1..3
        @inventory_page.add_to_cart_button
      end
      expect(wait_for_element(InventoryLocators::CART_BADGE).text).to eql('3')
      expect(wait_for_elements(InventoryLocators::REMOVE_BUTTON).length).to eql(3)
      expect(wait_for_elements(InventoryLocators::ADD_TO_CART_BUTTON).length).to eql(3)
      sleep 2
    end

    it 'checkout the orders' do
      wait_for_element(InventoryLocators::CART_BUTTON).click
      expect(wait_for_element('.cart_list').displayed?).to be true
      expect(@driver.current_url).to include('cart')
      wait_for_element(InventoryLocators::CHECKOUT_BUTTON).click
      @inventory_page.fill_Checkout_form('John', 'Doe', '12345')
      wait_for_element(InventoryLocators::CHECKOUT_CONTINUE_BUTTON).click
      sleep 2
    end

    it 'completing the order' do
      wait_for_element(InventoryLocators::CHECKOUT_FINISH_BUTTON).click
      expect(@driver.current_url).to include('complete')
    end



  end

end