require "spec"
require "../src/lighthouse-score"

describe LighthouseScore do
  describe "#check" do
    it "requires the GITHUB_EVENT_NAME to be set to deployment_status" do
      LighthouseScore.check.should eq 1
    end

    it "requires the LIGHTHOUSE_URL to be set" do
      ENV["GITHUB_EVENT_NAME"] = "deployment_status"
      LighthouseScore.check.should eq 1
    end

    it "requires the LIGHTHOUSE_SECRET to be set" do
      ENV["GITHUB_EVENT_NAME"] = "deployment_status"
      ENV["LIGHTHOUSE_URL"] = "foo"
      LighthouseScore.check.should eq 1
    end

    it "Sets the GITHUB_EVENT_PATH if it is not set" do
      ENV["GITHUB_EVENT_NAME"] = "deployment_status"
      ENV["LIGHTHOUSE_URL"] = "foo"
      ENV["LIGHTHOUSE_SECRET"] = "bar"
      LighthouseScore.check
      ENV["GITHUB_EVENT_PATH"].should eq "/github/workflow/event.json"
    end


    it "Return neutral if it is successfull deployment" do
      ENV["GITHUB_EVENT_NAME"] = "deployment_status"
      ENV["LIGHTHOUSE_URL"] = "foo"
      ENV["LIGHTHOUSE_SECRET"] = "bar"
      ENV["GITHUB_EVENT_PATH"] = "spec/event_fail.json"
      LighthouseScore.check
      LighthouseScore.check.should eq 78
    end

    it "Return fail if it is the url is not set" do
      ENV["GITHUB_EVENT_NAME"] = "deployment_status"
      ENV["LIGHTHOUSE_URL"] = "foo"
      ENV["LIGHTHOUSE_SECRET"] = "bar"
      ENV["GITHUB_EVENT_PATH"] = "spec/event_fail_url.json"
      LighthouseScore.check
      LighthouseScore.check.should eq 1
    end
  end
end
