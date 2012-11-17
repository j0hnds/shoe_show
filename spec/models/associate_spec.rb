require 'spec_helper'

describe Associate do

  context 'Validation' do

    it "should respond with errors when no attributes have been set" do
      associate = Associate.new

      associate.valid?.should be_false
      associate.should have(1).error_on(:first_name)
      associate.should have(1).error_on(:last_name)
      associate.should have(1).error_on(:room_id)
    end

    it "should report an error if the name fields are longer than 30 characters" do
      associate = Associate.new(:room_id => 1,
                                :first_name => '*'*41,
                                :last_name => '*'*41)

      associate.valid?.should be_false
      associate.should have(1).error_on(:first_name)
      associate.should have(1).error_on(:last_name)
    end

    it "should report no errors when the name fields are at their maximum size" do
      associate = Associate.new(:room_id => 1,
                                :first_name => '*'*40,
                                :last_name => '*'*40)

      associate.valid?.should be_true
    end

  end

end
