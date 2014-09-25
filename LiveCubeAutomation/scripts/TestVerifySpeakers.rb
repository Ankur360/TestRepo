path = File.expand_path(File.dirname(File.dirname(__FILE__))).split("Scripts").first
require path+"/driver_helper.rb"
require "json"
require "selenium-webdriver"
require "rspec"

describe "Test Scenerios create and delete post" do


  before(:each) do
    cc = ReadConfig.new()
    browserType = cc.getApplication('BrowseType')

    if browserType.eql?("ff")
      @driver = Selenium::WebDriver.for :firefox
    end
    @base_url = cc.getApplication('URL')
    @driver.manage.timeouts.implicit_wait = 30
    @verification_errors = []
    # @driver.manage.window.maximize
    CreateLog.new().LogStartExecution("execution started of Test Class create & delete post")
  end

  after(:each) do
    CreateLog.new().LogEndExecution("execution end of Test Class create and delete post")
  end

  it "create new site Verify 10 pages crawled, 130 total errors" do

    begin
      #open url
      @driver.get(@base_url + "/")
      CreateLog.new().Log("open application url")

      #object creation
      login = LoginTwitter.new(@driver)
      peoplePage= PeoplePage.new(@driver)

      #Login to the application
      login.loginToApplication("General")
      CreateLog.new().Log("login to the application")

      #click on people>>speakers tab and verify that attendees are shown there
      peoplePage.verifySpeakers()
      CreateLog.new().Log("login to the application")

      #


    end
  end
end
