#!/usr/bin/env ruby
# <bitbar.title>CaseBlocks Var</bitbar.title>
# <bitbar.version>v1.0</bitbar.version>
# <bitbar.author>Ijonas Kisselbach</bitbar.author>
# <bitbar.author.github>ijonas</bitbar.author.github>
# <bitbar.desc>Access to Last 10 Cases Viewed</bitbar.desc>
# <bitbar.image>http://www.hosted-somewhere/pluginimage</bitbar.image>
# <bitbar.dependencies>ruby</bitbar.dependencies>
# <bitbar.abouturl>https://github.com/ijonas/CaseBlocksBar</bitbar.abouturl>
require "open-uri"
require "json"

CASEBLOCKS_AUTH_TOKEN="xxxxxyyyyzzzz" # See you CaseBlocks profile screen

data = JSON.parse(URI.parse("https://login.caseblocks.com/home/data.json?auth_token=#{CASEBLOCKS_AUTH_TOKEN}").read)
lines = data['recent_cases'].map {|kase|

  ct_category = {
    'W' => 'case_types',
    'P' => 'people_types',
    'O' => 'organization_types'
  }[kase['case_type_category']]

  green = '#008000'
  orange = '#ffa500'
  red = '#cc3333'
  colour = {
    "Awaiting Customer Response" => green,
    "Completed" => green,
    "Started" => orange,
  }[ kase['current_state'] ]
  colour = colour.nil? ? red : colour

  href = "https://login.caseblocks.com/#/#{ct_category}/#{kase['case_type_id']}/case/#{kase['id']}/detail"
  %Q{#{kase['title']} | href=#{href} color=#{colour} length=40}
}
puts "CaseBlocks"
puts "---"
puts lines
