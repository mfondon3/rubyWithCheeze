require "../global/page/base_test_object.rb"
require "../global/page/base_html_element.rb"

Dir["../global/**/*.rb"].sort_by {|f| f.count("/")}.each do |file|
  require file
end

require "rubygems"
require "watir-webdriver"

case ENV['BROWSER']
when "ff"
  $driver = Selenium::WebDriver.for :firefox, :profile => "default"
when "ie"
  $driver = Selenium::WebDriver.for :ie
when "chrome"
  $driver = Selenium::WebDriver.for :chrome
end

$browser = Browser.new(Watir::Browser.new($driver))




Dir["features/pages/**/*.rb"].each do |file|
  if(file.include?("base"))
    require file
  end
end


Dir["../config/pages/**/*.rb"].each do |file|
  require File.expand_path(file)
end

Dir.chdir("../config/support") do
  $browser.load('page.yml')
end

Dir["features/pages/**/*.rb"].each do |file|
  require File.expand_path(file)
end

$browser.load(Dir.pwd + '/features/support/page.yml')

# unless system(ENV['IMPORT']) == true
#   raise "Unable to import stock data."
# end

$browser.goto(ENV['DOMAIN'])




def take_screenshot_if_failed(scenario)
  #if (scenario.failed?)
  #  scenario_name = scenario.to_sexp[3].gsub(/\ /, "_")
  #  time = Time.now.strftime("%Y-%m-%d-%H%M")
  #  screenshot_path = 'c:\\scorebig\\log\\' +  time + '-' + scenario_name + '.png'
  #  Win32::Screenshot::Take.of(:window, :title => /ScoreBig/).write(screenshot_path)
  #end
end

