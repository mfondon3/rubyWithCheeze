class BaseTestObject

  def initialize(element_hash)
      @element_hash  = element_hash
  end

  attr_reader :element_hash

  def hash
    element_hash
  end

  def method_missing(name, *args)
    if(element_hash.nil?)
      raise "No elements have been defined for this test object."
    else

      if (element_hash.has_key?(name))
        e = element_hash.fetch(name)
        if(e.class == Hash)
          PageHelper.find(e)
        else
          e
        end
      else
         raise "The element '#{name}' has not be defined."
      end
    end


  end

end