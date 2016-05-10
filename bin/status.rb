#!/usr/bin/ruby
require "net/http"
require "json"
require_relative "../lib/circle_url"
require_relative "../lib/cog_helpers"

project = ENV["COG_ARGV_0"]
branch = ENV["COG_ARGV_1"]

if project && branch
  url = CircleUrl.new(project, 100).list
  all_builds = JSON.parse(Net::HTTP.get(url))
  build = all_builds.find do |json|
    json["branch"] == branch
  end
  CogHelpers.output_json_with_template(JSON.generate(build), "status")
else
  puts "You must provide a project name and branch name"
end
