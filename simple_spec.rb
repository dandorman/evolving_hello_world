require File.join(File.dirname(__FILE__), '/lib/string_extensions')

module EvolvingHelloWorld
  describe StringExtensions do
    describe "#fitness" do
      it "squares the difference between the ordinal values of the characters in the string" do
        "a".fitness("e").should == 16
      end

      it "sums the differences" do
        "ap".fitness("eo").should == 16 + 1
      end
    end

    describe "#mutate" do
      it "changes one character by one ordinal value" do
        string = "hello"

        Random.should_receive(:rand).with(0...5).and_return(1)
        Random.should_receive(:rand).with(-1..1).and_return(-1)

        string.mutate.should == "hdllo"
      end
    end
  end
end
