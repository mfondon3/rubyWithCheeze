require '../environment/base_hooks.rb'
Before do
  @browser = Watir::Browser.new :chrome
end