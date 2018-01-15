$LOAD_PATH.unshift('.')

require 'rubygems'
require 'bundler/setup'
require 'dotenv/load'
require 'facebook/messenger'
require 'bot'

run Facebook::Messenger::Server
