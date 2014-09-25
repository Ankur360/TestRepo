path = File.expand_path(File.dirname(File.dirname(__FILE__))).split("Scripts").first
require path+"/driver_helper.rb"
require "json"
require "selenium-webdriver"
require "rspec"

describe "Scenario test Forgot password functionality" do

  before(:each) do
    cc = ReadConfig.new()
    browserType = cc.getApplication('BrowseType')

     if browserType.eql?("ff")
      @driver = Selenium::WebDriver.for :firefox
    end
    @base_url = cc.getApplication('URLApp')
    @driver.manage.timeouts.implicit_wait = 30
    @verification_errors = []
    @driver.manage.window.maximize
    CreateLog.new().LogStartExecution("execution started of Test Class Forgot password")
  end

  after(:each) do
    header = Header.new(@driver)
    #header.logOut()
    @driver.quit
    CreateLog.new().LogEndExecution("execution end of Test Class Forgot password")
  end

  it "test verify the Forgot password functionality" do

    begin
      #open url
      @driver.get(@base_url + "/")
      CreateLog.new().Log("open application url")

      #object creation
      forgotpasswordpage = ForgotPasswordPage.new(@driver)

      #verify the functionality of forgot password
      emailAddress= "test360.301@gmail.com"
      forgotpasswordpage.verifyForgotPass(emailAddress)

      CreateLog.new().Log("login to the application")
    end
  end
end
