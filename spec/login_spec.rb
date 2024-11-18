require 'selenium-webdriver'
require 'rspec'
require_relative '../pages/login_page'

describe 'Login Functionality' do

  before(:each) do
    @drive= Selenium::WebDriver.for :chrome
    @login_page = LoginPage.new(@drive)
  end

  after(:each) do
    @drive.quit
  end

  it "login page with valid data" do
    @login_page.login('ss','ss')
  end

end
