#!/usr/bin/ruby
require "net/http"
require "json"
require_relative "../lib/circle_url"

project = ARGV[0]
branch = ARGV[1]

if project && branch
  url = CircleUrl.new(project, 100).list
  all_builds = JSON.parse(Net::HTTP.get(url))
  build = all_builds.find do |json|
    json["branch"] == branch
  end

  puts "#{branch} - #{build["status"]} - #{build["stop_time"]}"
else
  puts "You must provide a project name and branch name"
end
