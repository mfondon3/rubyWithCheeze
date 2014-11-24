require_relative 'run_config'


#Read in command line args
#--------------------
options = {}
site = nil
browser = RunConfig::Default_browser
cucumber_ops = Array.new
import_script = RunConfig::Default_import_script
send_report = RunConfig::Default_send_report_flag

def usage
  return "Usage: ruby run.rb [options] <site> [cucumber options]
 -r   Send report at exit.
 -i   Import bat file to use.
 -h   Print this.
 -b   Run tests using specified browser.
 -d   Run test using the specified domain nickname.
 -p   Use the specified profile.

Examples:

  Run all tests on all sites.
  \"ruby run.rb all\"

  Run the login profile of the consumer site.
  \"ruby run.rb -p login consumer\"

  Run featureas that have the @superadmin AND @inventory tags for the extranet.
  \"ruby run.rb extranet --tags @superadmin --tags @inventory\"

  Run featureas that have the @superadmin OR @inventory tags for the extranet.
  \"ruby run.rb extranet --tags @superadmin,@inventory\""
end

if(ARGV.size == 0)
  puts usage
  exit
end

if(ARGV.size == 1 && ARGV[0] == 'all')
  system('all.bat')
  exit
end

ARGV.each_with_index do |arg, index|
  case arg
    when '-h' || '--help' then
      puts usage
      exit
    when '-u' then
      options[:username] = ARGV[index + 1]
      ARGV.delete_at(index + 1)
    when '-p' then
      options[:password] = ARGV[index + 1]
      ARGV.delete_at(index + 1)
    when '-d'  then
      options[:domain] = ARGV[index + 1]
      ARGV.delete_at(index + 1)
    when '-b'  then
      options[:browser] = ARGV[index + 1]
      ARGV.delete_at(index + 1)
    else
      if(site.nil?)
        if(!RunConfig::Sites.include?(arg))
          puts "There are no functional tests for site \"#{arg}\""
          exit
        end
        site = arg
      else
        if(cucumber_ops.nil?)
          cucumber_ops = Array.new
        end
        cucumber_ops.push(arg)
      end
  end


end


def usage
  put "Usage: ruby run.rb [options] <site> [cucumber options]"
end

if options[:browser] == 'ie'
  browser = :ie
elsif options[:browser] == 'ff'
  browser = :ff
elsif options[:browser] == 'chrome'
  browser = :chrome
end

username = options[:username]
password = options[:password]

#--------------------

#domain = RunConfig::Domains.detect{ |i| puts puts i['nickname']==RunConfig::Default_domain_nickname && i['site']==site }#['domain']
#d = RunConfig::Domains.detect{ |i| i['nickname']==options[:domain] && i['site']==site }
case site
  when "gmail"
    domain = "www.gmail.com"
  when "bofa"
    domain = "www.bofa.com"
  else
    domain = nil
end

# if(!options[:domain].nil? && d.nil?)
#   puts "\"#{options[:domain]}\" is not a valid domain."
#   exit
# end

# if(!options[:domain].nil? && !d.nil?)
#   domain = d['domain']
# end

# if(!options[:import].nil?)
#   import_script = options[:import]
# end


# if(!options[:sendreport].nil?)
#   sendreport = options[:sendreport]
# end


Dir.chdir(site) do
  if(!options[:profile].nil?)
    #exit(system("rake default[#{browser},#{domain}]"))
  elsif(!cucumber_ops.empty?)
    exit(system("rake custom[#{browser},#{domain},#{username},#{password},#{cucumber_ops.join('_')}]"))
    #exit(system("rake custom[#{browser},#{username},#{password},#{cucumber_ops.join('_')}]"))
  else
    if(!site.nil?)
     # exit(system("rake all[#{browser},#{domain}]"))
    else
      puts "Something went wrong!"
    end
  end
end
