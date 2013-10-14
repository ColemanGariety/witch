require "kvetch"

describe Kvetch do
  describe ".yell" do
    it "should send a message" do
      Kvetch.yell("a problem you finna resolve").should_not be_false
    end

    it "should not send a message" do
      Kvetch.silence!
      Kvetch.yell("a problem you were finna resolve but got stupid n' gave up").should_not be_true
    end

    it "should not send a message after toggling silence" do
      Kvetch.unsilence!
      Kvetch.yell("a problem you finna resolve").should_not be_false
    end
  end

  describe ".silent?" do
    it "should let you know if Kvetch is silent" do
      Kvetch.silent?.should be_false
      Kvetch.silence!
      Kvetch.silent?.should be_true
    end
  end
end
