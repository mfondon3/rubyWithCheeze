class FalseClass

  def assert_true
    false.should == true
  end

  def assert_false
    false.should == false
  end
end