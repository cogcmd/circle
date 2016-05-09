#!/usr/bin/ruby
require "net/http"
require "json"
require_relative "../lib/circle_url"

url = CircleUrl.new("flywheel").generate
builds = JSON.parse(Net::HTTP.get(url))
builds.each do |build|
  puts "#{build["build_num"]} #{build["branch"]}/#{build["committer_name"]} #{build["status"]}"
end
