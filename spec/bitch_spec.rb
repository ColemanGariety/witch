require "bitch"

describe Bitch do
  describe ".yell" do
    it "should send a message" do
      Bitch.yell("message").should_not be_false
    end
    
    it "should not send a message" do
      Bitch.silence!
      Bitch.yell("message").should_not be_true
    end
  end
end