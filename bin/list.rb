#!/usr/bin/ruby
require "net/http"
require "json"
require_relative "../lib/circle_url"
require_relative "../lib/cog_helpers"
project = ENV["COG_ARGV_0"]

if project
  url = CircleUrl.new(project).list
  json = Net::HTTP.get(url)
  CogHelpers.output_json_with_template(json, "list")
else
  puts "You must provide a project name"
end
