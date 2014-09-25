path = File.expand_path(File.dirname(File.dirname(__FILE__))).split("pages").first
require path+"/support_helper.rb"
#E:/Project/LiveCube/support_helper.rb
class AddJoinSessionPage < SupportHelper

  def initialize(driver)
    @driver = driver
  end

  def addsession()
    clickSchedule()
    clickSaveSchedule()
    clickEventFeed()
    clickJoinSession()
    clickSchdule()
    clickViewFullSchedule()
  end

  # Click Schedule menu header
  def clickSchedule
    el= @driver.find_element(:link, "Schedule")
    el.click

  end
  def clickSchdule
    el= @driver.find_element(:link, "Schedule")
    el.click

  end

  # Click SaveSchedule Button
  def clickSaveSchedule
      message= @driver.find_element(:xpath, "(//*[@id='schedule']/li/div[1]/div[2]/div[2]/div[1]/span)[1]").text
      t=@driver.find_element(:xpath, "(//*[@id='schedule']/li/div[1]/div[2]/div[2]/div[1]/span)[1]").text
      puts "My session is: #{t}"

     @driver.find_element(:xpath, "(//*[@id='schedule']/li[2]/div[1]/div[2]/div[3]/a[2]/span[2])[1]").click
    return message
  end

  # Click EventFeed Button
  def clickEventFeed
    el=@driver.find_element(:link, "Event Feed")
    el.click
  end


  # Click JoinSession Link
  def clickJoinSession
    el= @driver.find_element(:xpath, "(//*[@id='posts']/li/a/span[2])[1]")
    el.click

  end


  #Click ViewFullSchedule Button
  def clickViewFullSchedule
    el= @driver.find_element(:link, "View My Schedule")
    el.click
    e2 = clickSaveSchedule()
    assert e2.include? "Quality Test - @ Mentions"
    puts("Sucessfully Added to schedule")
  end
 end


















