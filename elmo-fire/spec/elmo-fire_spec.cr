require "spec"
require "../src/elmo-fire"

describe ElmoFire do
  describe "#check" do
    it "requires the GITHUB_EVENT_NAME to be set to check_suite" do
      ElmoFire.check.should eq 1
    end

    it "requires the SLACK_WEBHOOK_URL to be set" do
        ENV["GITHUB_EVENT_NAME"] = "check_suite"
        ElmoFire.check.should eq 1
      end

    it "Sets the GITHUB_EVENT_PATH if it is not set" do
      ENV["GITHUB_EVENT_NAME"] = "check_suite"
      ENV["SLACK_WEBHOOK_URL"] = "foo"
      ElmoFire.check
      ENV["GITHUB_EVENT_PATH"].should eq "/github/workflow/event.json"
    end

    it "Sets the GITHUB_EVENT_PATH if it is not set" do
      ENV["GITHUB_EVENT_NAME"] = "check_suite"
      ENV["SLACK_WEBHOOK_URL"] = "foo"
      ElmoFire.check
      ENV["GITHUB_EVENT_PATH"].should eq "/github/workflow/event.json"
    end

    it "Return neutral if it is not a completed event" do
      ENV["GITHUB_EVENT_NAME"] = "check_suite"
      ENV["SLACK_WEBHOOK_URL"] = "foo"
      ENV["GITHUB_EVENT_PATH"] = "spec/event_not_completed.json"
      ElmoFire.check
      ElmoFire.check.should eq 78
    end

    it "Return fail if it is the conclusion is not success" do
      ENV["GITHUB_EVENT_NAME"] = "check_suite"
      ENV["SLACK_WEBHOOK_URL"] = "foo"
      ENV["GITHUB_EVENT_PATH"] = "spec/event_completed_failed.json"
      ElmoFire.check
      ElmoFire.check.should eq 1
    end

    it "Return pass if it is the conclusion is success" do
      ENV["GITHUB_EVENT_NAME"] = "check_suite"
      ENV["SLACK_WEBHOOK_URL"] = "foo"
      ENV["GITHUB_EVENT_PATH"] = "spec/event_completed_passed.json"
      ElmoFire.check
      ElmoFire.check.should eq 0
    end
  end
end
