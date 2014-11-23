class BaseModule < BaseTestObject
  def initialize(parent_test_object, element_hash)
    @parent = parent_test_object
    super(element_hash)

  end

  attr_reader :parent


end