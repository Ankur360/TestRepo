path = File.expand_path(File.dirname(File.dirname(__FILE__))).split("pages").first
require path+"/support_helper.rb"

class LCubeHeader < SupportHelper

  def initialize(driver)
    @driver = driver
  end



  # Logout
  def liveCubeLogout
    #click on sign out image
    el= @driver.find_element(:css, "img.top-avatar-img")
    el.click
    signOut= @driver.find_element(:link, "Sign Out")
    signOut.click
    wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    wait.until { @driver.find_element(:link => "Sign Into Your Event").displayed? }
    signInto= @driver.find_element(:link, "Sign Into Your Event").text
    assert signInto.include? "Sign Into Your Event"

  end


end
