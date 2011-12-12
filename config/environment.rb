# Load the rails application
require File.expand_path('../application', __FILE__)

require "espn_xml_reader"

PICKEM_ID = 1 # lazy way of setting what pickem round to use on the site

# Initialize the rails application
Bowlgame::Application.initialize!
