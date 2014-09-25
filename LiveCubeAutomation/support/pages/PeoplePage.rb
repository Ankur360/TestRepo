path = File.expand_path(File.dirname(File.dirname(__FILE__))).split("pages").first
require path+"/support_helper.rb"

class PeoplePage < SupportHelper

  def initialize(driver)
    @driver = driver
  end

  #verifies the attendees on people page
  def verifyAttendees()
    clickPeopleLink()
    verifyAttendeesDisplayed()

  end


  def clickOnPeopleTab()
    el= @driver.find_elements(:class, "icon-people3")
    @driver.find_element(:link, "New Survey").click
    el.click
    wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds
    element = wait.until { @driver.find_element(:id => "attendees") }
    #//*[@id='main-content']/nav/div[2]/div/a[3]
  end


  def clickPeopleLink()
    sleep(5)
    @driver.find_element(:xpath, "//*[@id='main-content']/nav/div[2]/div/a[3]").click
    wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    wait.until { @driver.find_element(:id => "attendees").displayed? }
  end

    def verifyAttendeesDisplayed()
    attendees= attendeesDisplayed()
    puts "My result are : #{attendees}"
    assert_equal attendees, true, "In people screen attendees should be shown"
    end


  def attendeesDisplayed()
      status= false
      begin
        @driver.find_element(:id, "attendees").displayed?
        status= true
      rescue Exception => e
        status= false
      end
      status
  end


 #At people screen verify that speaker is shown
  def verifySpeakers()
    clickPeopleLink()
    clickOnSpeakers()
    verifySpeakersDisplayed()
  end


  def clickOnSpeakers()
   el= @driver.find_element(:css, "a.x-btn-speakers")
   el.click
   wait = Selenium::WebDriver::Wait.new(:timeout => 10)
   wait.until { @driver.find_element(:css => "span.speaker-tag").displayed? }

  end



  def verifySpeakersDisplayed()
    speakers= speakersDisplayed()
    puts "My speakers result are : #{speakers}"
    assert_equal speakers, true, "In people>>speaker screen speakers should be shown"
  end


  def speakersDisplayed()
    status= false
    begin
      @driver.find_element(:css, "span.speaker-tag").displayed?
      status= true
    rescue Exception => e
      status= false
    end
    status
  end

end




