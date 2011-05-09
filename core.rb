require 'erb'
require 'uri'

require './helpers.rb'

[ '/', '/home' ].each do |route|
  get route do
    erb :home
  end
end

get '/about' do
  erb :about
end

get '/about/gelf' do
  erb :gelf
end

get '/support' do
  erb :support
end

get '/download' do
  erb :download
end
