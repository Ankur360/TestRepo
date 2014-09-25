path = File.expand_path(File.dirname(File.dirname(__FILE__))).split("pages").first
require path+"/support_helper.rb"

class ConversPage < SupportHelper

  def initialize(driver)
    @driver = driver
  end

  #Enter your post
  def providePost()
    enterPost()
    clickOnPost()
    #delete the post and verify that deleted post rewmoved
    deletePost()

  end

  #Enter the comments (post)
  def enterPost()
    el= @driver.find_element(:xpath, "//*[@id='session']/section[2]/div/div[1]/div/div[2]/textarea")
    el.clear
    el.send_keys "This is my fist post of automation"
  end

  #click on post button
  def clickOnPost()
    el= @driver.find_element(:link, "Post")
    el.click
    sleep(5)
  end


  def verifyCommentPosted()
    p=getSize
    r=p-1
    comment= @driver.find_elements(:xpath, "//*[@id='posts']/li["+r.to_s+"]/div[1]/div[2]/div[2]/p").text
  end


    def deletePost()
      #Refresh the page
      @driver.navigate.refresh
      @driver.get "https://qa.livecubestaging.com"
      wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds
      element = wait.until { @driver.find_element(:id => "posts") }

      #click on more link
      @driver.find_element(:xpath, "//*[@id='posts']/li[2]/div[2]/a").click
      sleep(5)
      #click on remove link at post
      @driver.find_element(:xpath, "//*[@id='posts']/li[2]/div[3]/div/a[4]/span[1]").click

      #click on 'Are you sure' delete this post
      sleep(5)
      el3= @driver.find_element(:link, "Yes, Delete this Post")
      el3.click

      #verify that commented post deleted and it is not shown
      commenetAfterDeletion= @driver.find_element(:xpath, "//*[@id='posts']/li[2]/div[1]/div[2]/div[2]/p").text
      assert_not_equal commenetAfterDeletion, "This is my fist post of automation"
      puts "after the assertion"

  end

  #remove the post and verify that post is removed
  def removePost()

  end

  def getSize
    row = @driver.find_elements(:xpath, "//*[@id='posts']/li").size
    row
  end

end




