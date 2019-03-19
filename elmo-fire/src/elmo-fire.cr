require "json"
require "http/client"

module ElmoFire
  extend self

  def check
    begin
      # Check if it is a check_suite event
      if ENV["GITHUB_EVENT_NAME"]? != "check_suite"
        puts "This is not a check_suite event"
        return 1
      end

      if !ENV["SLACK_WEBHOOK_URL"]?
        puts "Slack Webhook URL is missing."
        return 1
      end

      # Get path of event.json
      path = ENV["GITHUB_EVENT_PATH"] ||= "/github/workflow/event.json"

      # Read file and parse the JSOn
      event = File.read path
      event = JSON.parse(event)
      
      # Check if the check suite is complete
      if event["action"] != "completed"
        puts "This is not a completed check suite"
        return 78
      end

      if event["check_suite"]["conclusion"] != "success"
        payload =
          {
            "text": "@here: <" + event["check_suite"]["check_runs_url"].to_s + "|" + event["check_suite"]["head_branch"].to_s + " for " + event["repository"]["full_name"].to_s + " has failed>",
            "icon_emoji": ":elmo_fire:",
            "username":   "Elmo Fire",
          }
        HTTP::Client.post(ENV["SLACK_WEBHOOK_URL"], body: payload.to_json)
        return 1
      else
        return 0
      end
    rescue ex
      puts ex.message
      return 1
    end
  end
end
