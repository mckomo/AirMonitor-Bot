require 'rubygems'
require 'bundler/setup'
require 'dotenv/load'
require 'facebook/messenger'
require_relative 'bot'

run Facebook::Messenger::Server
