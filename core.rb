require 'erb'
require 'uri'

require './helpers.rb'

[ '/', '/home' ].each do |route|
  get route do
    erb :home
  end
end

get '/product' do
  erb :product
end
