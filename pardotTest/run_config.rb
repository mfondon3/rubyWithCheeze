require 'yaml.rb'

class RunConfig
  Sites = ['pardot']
  Domains = YAML::load( File.open('domain.yml'))
  Default_browser= 'chrome'
  Default_domain_nickname = 'local'
  Default_import_script = "c:\\scorebig\\code\\utils\\import-stock-data.bat"
  Default_send_report_flag = false;
end