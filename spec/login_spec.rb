require 'spec_helper'
require_relative '../pages/login_page'
require_relative '../helpers/json_helper'

describe 'Login Functionality' do
  user_object = JsonHelper.read('../test_data/user_credentials.json')
  valid_user = user_object['valid_user']
  invalid_user = user_object['invalid_user']

  before(:all) do
    @driver = Selenium::WebDriver.for :chrome
    @login_page = LoginPage.new(@driver)
  end

  after(:all) do
    @driver.quit
  end

  it 'logs in with valid credentials should go to the inventory page' do
    @login_page.login(valid_user['username'], valid_user['password'])
    puts "Current URL: #{@driver.current_url}"
    expect(@driver.current_url).to include('inventory')
  end

  it 'logs in with invalid credentials should not go to the inventory page' do
    @login_page.login(invalid_user['username'], invalid_user['password'])
    puts "Current URL: #{@driver.current_url}"
    expect(@driver.current_url).not_to include('inventory')
  end
end