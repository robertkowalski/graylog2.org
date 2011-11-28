require 'erb'
require 'uri'

require './helpers.rb'

[ '/', '/home' ].each do |route|
  get route do
    @title = "Free open source self-hosted log management and exception tracking"
    erb :home
  end
end

get '/about' do
  @title = "About"
  erb :about
end

get '/about/gelf' do
  @title = "About - GELF"
  erb :gelf
end

get '/support' do
  @title = "Support"
  erb :support
end

get '/download' do
  @title = "Download"
  erb :download
end

get '/contact' do
  @title = "Contact"
  erb :contact
end
