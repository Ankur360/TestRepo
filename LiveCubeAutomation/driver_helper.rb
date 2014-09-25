require "rubygems"
gem "minitest"
require 'minitest/autorun'
require "selenium-webdriver"
require "test/unit"
path = File.expand_path(File.dirname(__FILE__))
Dir[path+"/support/**/*.rb"].each {|file| require file }
require "json"
require "selenium-webdriver"
require "rspec"

class DriverHelper < Test::Unit::TestCase
    
    #function to set up testcase
	def setup	
		cc = ReadConfig.new()
		browserType = cc.getApplication('BrowseType')
		if browserType.eql?("ie")
			@driver = Selenium::WebDriver.for :ie 
		end
		
		if browserType.eql?("ff")
			@driver = Selenium::WebDriver.for :firefox 
		end
		@base_url = cc.getApplication('URL')
		@driver.manage.timeouts.implicit_wait = 30
		@verification_errors = []
	end
  
    #function to close browse
	def teardown	
		@driver.quit
		assert_equal [], @verification_errors
	end
  
    
end