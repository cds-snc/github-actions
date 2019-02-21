require "json"

module Touched
  extend self

  def check
    begin
      # Check if it is a push event
      if ENV["GITHUB_ACTION"]? != "push"
        puts "This is not a push event"
        return 1
      end

      # Get pattern to match
      if !ARGV[0]?
        puts "Pattern missing"
        return 1
      end

      # Get pattern to match
      pattern = ARGV[0] ||= ""

      # Get path of event.json
      path = ENV["GITHUB_EVENT_PATH"] ||= "/github/workflow/event.json"
      
      # Read file and parse the JSOn
      event = File.read path
      event = JSON.parse(event)

      # Collates all the filenames to check against
      files = [] of JSON::Any 
      event["commits"].as_a.each do |commit|
        files.concat(commit["added"].as_a).concat(commit["modified"].as_a)
      end

      # Check if the pattern matches
      if files.any? { |file| File.match?(pattern, file.to_s)}
        return 0
      end

      return 78 
    rescue ex
      puts ex.message
      return 1
    end
  end
end
