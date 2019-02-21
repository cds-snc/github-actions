require "spec"
require "../src/touched"

describe Touched do
  describe "#check" do
    it "requires the GITHUB_ACTION to be set to push" do
      Touched.check.should eq 1
    end

    it "requires the ARGV to be set" do
      ENV["GITHUB_ACTION"] = "push"
      Touched.check.should eq 1
    end

    it "Sets the GITHUB_EVENT_PATH if it is not set" do
      ENV["GITHUB_ACTION"] = "push"
      ARGV.replace ["test"]
      Touched.check
      ENV["GITHUB_EVENT_PATH"].should eq "/github/workflow/event.json"
    end

    it "parses out the touched filed from an event and returns 0 to indicate a file got touched" do
      ENV["GITHUB_ACTION"] = "push"
      ENV["GITHUB_EVENT_PATH"] = "spec/mock.js"
      ARGV.replace ["**jpg"]
      Touched.check.should eq 0
    end

    it "parses out the touched filed from an event and returns 78 is none got touched" do
      ENV["GITHUB_ACTION"] = "push"
      ENV["GITHUB_EVENT_PATH"] = "spec/mock.js"
      ARGV.replace ["foo"]
      Touched.check.should eq 78 
    end
  end
end
