require 'rubygems'
require 'bundler'

Bundler.require

if ENV['REMOTE_SYSLOG_URI']
  require 'remote_syslog_logger'
  uri = URI.parse(ENV['REMOTE_SYSLOG_URI'])
  logger = RemoteSyslogLogger.new(uri.host, uri.port, 
    :local_hostname => "#{ENV['APP_NAME']}-#{ENV['PS']}")
  use Rack::CommonLogger, logger
end

require './core.rb'
run Sinatra::Application
