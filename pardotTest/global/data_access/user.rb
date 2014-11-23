=begin
require 'rubygems'
require 'active_record'

class User < ActiveRecord::Base
  set_table_name "User"
  set_primary_key :Id

  def self.find_by_email(email)
    User.where(:email => email).first
  end
end
=end
