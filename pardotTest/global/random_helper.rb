require 'random_data'

class RandomHelper
  def self.qa_email
    Random.alphanumeric + "@qa.scorebiginc.com"
  end

  def self.qa_email_responsys
    "test%d@qa.scorebiginc.com" % Random.number(99999)
  end
end