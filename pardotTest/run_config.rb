require 'yaml.rb'

class RunConfig
  Sites = ['gmail', 'bofa', 'pardot', 'puppies']
  Domains = YAML::load( File.open('domain.yml'))
  Default_browser= 'chrome'
  Default_domain_nickname = 'local'
  Default_import_script = "c:\\scorebig\\code\\utils\\import-stock-data.bat"
  Default_send_report_flag = false;
end