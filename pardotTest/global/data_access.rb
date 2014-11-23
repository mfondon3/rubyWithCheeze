=begin
require 'rubygems'
require 'active_record'  
require 'uuid'

ActiveRecord::Base.pluralize_table_names = false

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlserver',
  :mode => 'odbc',
  :dsn => 'ScoreBig',
  :username => 'sa',
  :password => 'sc0rebig!@#')

class ActiveRecord::Base
  def self.acts_as_subclass(subclass, fk, pk)
    belongs_to subclass, :foreign_key => fk, :primary_key => pk

    define_method("method_missing") do |sym, *args|
      unless self.respond_to?(sym)
        self.send(subclass.to_s).send(sym, *args)
      else
        super sym, *args
      end
    end
  end

  def set_id
    self.Id = UUID.new.generate
  end

  def set_created
    self.CreatedDateTime = Time.now.utc
    self.CreatedById = 'functional tests'
  end

  def set_modified
    self.ModifiedDateTime = Time.now.utc
    self.ModifiedById = 'functional tests'
  end

  def set_delete
    self.Deleted=0
  end

  def self.acts_as_entity
    before_create :set_id
  end

  def self.acts_as_model
    acts_as_entity

    before_create :set_created
    before_create :set_modified

    before_save :set_modified
  end

  def self.acts_as_soft_deletable
    acts_as_model

    before_create :set_delete
  end
end




class OfferHistory < ActiveRecord::Base
  set_table_name "OfferHistory"
  acts_as_model
end


class InitialOffer < ActiveRecord::Base
  set_table_name "InitialOffer"
  acts_as_model
end

class Notification < ActiveRecord::Base
  set_table_name "Notification"
  set_primary_key "Id"

  default_scope :conditions => {:Deleted => false}
end

class InventoryRestockNotification < ActiveRecord::Base
  set_table_name "InventoryRestockNotification"
  set_primary_key "NotificationId"

  acts_as_subclass :notification, :NotificationId, :Id

  def self.find_by_user_id_and_event_id(user_id, event_id)
    InventoryRestockNotification.all :joins => :notification, :conditions => {:notification => {:ConsumerId => user_id}, :EventId => event_id}
  end

  before_destroy { |record| record.notification.delete }
end


class SavedSearchNotification < ActiveRecord::Base
  set_table_name "SavedSearchNotification"
  set_primary_key "NotificationId"

  acts_as_subclass :notification, :NotificationId, :Id

  def self.find_by_user_id_and_search_phrase(user_id, search_phrase)
    SavedSearchNotification.all :joins => :notification, :conditions => {:notification => {:ConsumerId => user_id}, :SearchPhrase => search_phrase}
  end

  before_destroy { |record| record.notification.delete }
end

class Event < ActiveRecord::Base
  set_table_name "Event"
  set_primary_key :Id

  def self.find_by_id(id)
    Event.where(:Id => id).first
  end

  def self.find_by_vanityurl(vanityurl)
    Event.where(:VanityUrl => vanityurl).first
  end
end
=end
