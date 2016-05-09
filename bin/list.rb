#!/usr/bin/ruby
require "net/http"
require "json"
require_relative "../lib/circle_url"

if ARGV[0]
  url = CircleUrl.new(ARGV[0]).generate
  builds = JSON.parse(Net::HTTP.get(url))
  builds.each do |build|
    puts "#{build["build_num"]} #{build["branch"]}/#{build["committer_name"]} #{build["status"]}"
  end
else
  puts "You must provide a project name"
end
