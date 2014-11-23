=begin
require 'rubygems'
require 'active_record'
require 'uuid'

class StoreCredit < ActiveRecord::Base
  set_table_name "StoreCredit"
  set_primary_key  :ConsumerId
end

class StoreCreditEntry < ActiveRecord::Base
  set_table_name "StoreCreditEntry"
  set_primary_key  :Id
  acts_as_model

end

class Consumer < ActiveRecord::Base
  set_table_name "Consumer"
  set_primary_key :UserId

  acts_as_subclass :user, :UserId, :Id

  def self.find_by_email(email)
    user = User.find_by_email(email)
    unless user.nil?
      return Consumer.where(:UserId => user.Id).first
    end
  end

  def self.verify(email)
    c = Consumer.find_by_email(email)
    c.IsVerified=true
    c.save!
  end

  def credit(amount)
    storeCredit = StoreCredit.where(:ConsumerId => self.UserId)[0]

    storeCredit.Balance += BigDecimal.new(amount)
    storeCredit.TotalCredits += BigDecimal.new(amount)

    storeCredit.save!

    entry = StoreCreditEntry.new

    entry.StoreCreditId = storeCredit.ConsumerId
    entry.Amount = BigDecimal.new(amount)
    entry.Balance = storeCredit.Balance
    entry.Description = 'functional test'
    entry.SequenceNumber = 1
    entry.CreditType = 'Manual'

    entry.save!
  end
end

class Coupon < ActiveRecord::Base
  set_table_name "Coupon"
  set_primary_key :Code

  acts_as_soft_deletable
  
  def self.create_coupon(value, committed_value)
    coupon = Coupon.new

    coupon.Type = 0
    coupon.Code = Random.alphanumeric
    coupon.Value = value
    coupon.StartDate = Time.now.utc
    coupon.ExpireDate = DateTime.new(2020, 1, 1)
    coupon.MaxUsage = 0
    coupon.MaxUsagePerConsumer = 0
    coupon.IsLive = 1
    coupon.CommittedValue = committed_value

    coupon.save!

    return coupon
  end
end
=end
