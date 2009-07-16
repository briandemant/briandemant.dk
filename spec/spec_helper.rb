require File.join(File.dirname(__FILE__), '..', 'iamneato.rb')
 
require 'rubygems'
require 'sinatra'
require 'spec'
require 'spec/autorun'
require 'spec/interop/test'
#require 'rspec_hpricot_matchers'
 
# set test environment
set :environment, :test
set :run, false
set :raise_errors, true
set :logging, false
 
 
#require 'rubygems'
#require 'spec'
#
#$LOAD_PATH.unshift(File.dirname(__FILE__))
#$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
#
#Spec::Runner.configure do |config|
#
#end