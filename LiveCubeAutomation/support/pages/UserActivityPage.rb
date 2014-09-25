path = File.expand_path(File.dirname(File.dirname(__FILE__))).split("pages").first
require path+"/support_helper.rb"

class UserActivityPage < SupportHelper

  def initialize(driver)
    @driver = driver
  end

#Verify user activity at user>>activity section

  def verifyActivity()
    clickOnShowMe()
    clickOnActivity()
    verifyActivityTitle()
  end


  def clickOnShowMe()
    el= @driver.find_element(:css, "a.x-btn-show-me")
    el.click
    wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    wait.until { @driver.find_element(:link => "Activity Feed").displayed? }
  end

  def clickOnActivity()
    el= @driver.find_element(:link, "Activity Feed")
    el.click
    wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    wait.until { @driver.find_element(:id => "me-activity").displayed? }


  end

  def verifyActivityTitle()
    el= @driver.find_element(:xpath, "//div[@class='bubble-top']/h2")
    activityTitle= el.text
    puts "My activity tittle: #{activityTitle}"
    assert_equal "Activity", activityTitle, "Title should be shown activity"
  end








end




