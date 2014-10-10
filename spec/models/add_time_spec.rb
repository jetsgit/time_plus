$:.unshift File.expand_path("../../lib", __FILE__)

require 'minitest/autorun'
require 'minitest/spec/expect'
require 'time_plus/increment_time'

### NOTE: There is a sentiment that testing private methods is not in general a good
###       practice or necessary since they are outside the API. Therefore, only a  
###       test for the 'parse_time' public method is being made here. This method
###       utilizes all the private methods, and thus the testing is Agile, KISS compliant.

describe "class AddTime " do
  describe "using valid input" do
    let(:hours) {10}
    let(:minutes) {40}
    let(:am_or_pm) {"AM"}
    let(:add_minutes) {150}
    let(:input_time) {" #{hours}:#{minutes} #{am_or_pm}"} 
    let(:add_time_obj) {IncrementTime::AddTime.new(input_time, add_minutes)}
    let(:result_time) {"1:10 pm"}
    
    it "returns a formatted date that has been incremented with correct time period" do
      expect(add_time_obj.parse_time).to_equal result_time
    end

  end
end
