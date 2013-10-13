require "bitch"

describe Bitch do
  describe ".yell" do
    it "should send a message" do
      Bitch.yell("a problem you finna resolve").should_not be_false
    end

    it "should not send a message" do
      Bitch.silence!
      Bitch.yell("a problem you were finna resolve but got stupid n' gave up").should_not be_true
    end

    it "should not send a message after toggling silence" do
      Bitch.unsilence!
      Bitch.yell("a problem you finna resolve").should_not be_false
    end
  end

  describe ".silent?" do
    it "should let you know if Bitch is silent" do
      Bitch.silent?.should be_false
      Bitch.silence!
      Bitch.silent?.should be_true
    end
  end
end
