require 'sinatra'
require 'thin'
require 'slim'
require 'better_errors'
require 'coffee_script'

Dir['./models/**/*.rb'].each{ |model| require model }

require './app'
