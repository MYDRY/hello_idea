# coding: utf-8
require 'rexml/document'
require "json"
require "rubygems"
require "faraday"
require "faraday_middleware"

conn = Faraday::Connection.new(:url => 'https://www.google.com') do |builder|
  builder.request :url_encoded
  builder.response :logger
  builder.response :json, :content_type => /\bjson/
  builder.adapter Faraday.default_adapter
end

keyword = "東京"

response = conn.get do |req|
  req.url '/complete/search'
  req.params['hl'] = "en"
  req.params['q']  = keyword
  req.params['output'] = "toolbar"
  req.params['json'] = true
end

suggestions = []

puts "============================================================"
puts "keyword: " + keyword
suggestion_xml = REXML::Document.new(response.body)
suggestion_xml.elements['toplevel'].each do |elem|
  suggested_str = elem.elements['suggestion']['data'].tr!(keyword, '')
  suggestions << suggested_str unless suggested_str.empty?
end

suggestions.each {|str| p str}
puts "============================================================"

