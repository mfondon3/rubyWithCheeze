=begin
require 'net/imap'
require 'rubygems'
require 'tmail'
require 'net/smtp'

#reopening the TMail::Mail class -- kinda like extensions
class TMail::Mail
  def parse_account_verification_link
    match = /^http.*verifyaccount.*$/.match(body)

    unless match.nil?
      match.to_s
    end
  end

 def parse_referral_link
    match = /(https.*signup.*)\.$/.match(body)

    unless match.nil?
      match[1].to_s
    end
  end
end

class MailHelper
  #specific emails

  Subjects = YAML::load( File.open('../global/subject.yml'))

  #core functionality
  Username = "mail@qa.scorebiginc.com"
  Password = "scorebig"

  SleepTime = 10
  Retries = 10

  def self.wait_for_message(address, subject)
    Retries.times do
      messages = MailHelper.fetch_messages(address, subject)

      if messages.count > 0
        return messages[0]
      end
      sleep(SleepTime)
    end

    return nil
  end

  def self.fetch_messages(address, subject)
    imap = MailHelper.get_session

    imap.select("INBOX")

    params = []

    if address
      params.push("TO")
      params.push(address)
    end

    if subject
      params.push("SUBJECT")
      params.push(Subjects[subject])
    end

    uids = imap.search(params).take(10)

    messages = uids.map {|uid| TMail::Mail.parse(imap.fetch(uid, "RFC822")[0].attr['RFC822']) }
    
    imap.logout
    imap.disconnect

    return messages
  end

  def self.get_session
    imap = Net::IMAP.new('imap.gmail.com', 993, true, nil, false)
    imap.login(Username, Password)
    return imap
  end

end
=end
