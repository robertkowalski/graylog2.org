require 'erb'
require 'uri'
require 'gelf'

require './helpers.rb'

helpers do
  def log(what, fields = {})
    # heroku config:add GELF_HOST=foo.example.org GELF_PORT=12201
    n = GELF::Notifier.new(ENV['GELF_HOST'], ENV['GELF_PORT'])
    standard_fields = { :host => "graylog2.org", :facility => "heroku" }
    n.notify(what, standard_fields.merge(fields))
  rescue => e
    puts "Could not log: #{e}"
  end
end

after do
  message = "#{request.env['REQUEST_METHOD'].upcase} #{request.env['PATH_INFO']} [#{response.status}]"
  log(message,
    :_http_return_code => response.status,
    :_ip_address => request.env['REMOTE_ADDR'],
    :_full_uri => request.env['REQUEST_URI'],
    :_user_agent => request.env['HTTP_USER_AGENT']
  )
end

[ '/', '/home/?' ].each do |route|
  get route do
    @title = "Free open source self-hosted log management and exception tracking"
    erb :home
  end
end

get '/about/?' do
  @title = "About"
  erb :about
end

get '/about/gelf/?' do
  @title = "About - GELF"
  erb :gelf
end

get '/support/?' do
  @title = "Support"
  erb :support
end

get '/download/?' do
  @title = "Download"
  erb :download
end

get '/contact/?' do
  @title = "Contact"
  erb :contact
end

get '/ohai/0.9.6/?' do
  authorize!
  erb :ohai_096, :layout => false
end
