=begin
require 'rubygems'
require 'active_record'

class Referral < ActiveRecord::Base
  set_table_name "Referral"
  set_primary_key :Id

  def self.delete_by_referral_id(userid)
    referrals = Referral.where(:ReferredById => userid).all
    referrals.each { |item| item.delete }
  end
end
=end
