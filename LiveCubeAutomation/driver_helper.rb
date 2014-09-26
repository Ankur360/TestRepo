require "selenium-webdriver"
path = File.expand_path(File.dirname(__FILE__))
Dir[path+"/support/**/*.rb"].each {|file| require file }
require "json"
require "selenium-webdriver"
require "rspec"

