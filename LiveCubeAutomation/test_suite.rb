path = File.expand_path(File.dirname(__FILE__))
Dir[path+"/Scripts/*.rb"].each {|file| require file }


